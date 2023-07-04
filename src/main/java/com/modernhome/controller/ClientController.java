package com.modernhome.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.modernhome.domain.ClientVO;
import com.modernhome.domain.OutOrderJoinVO;
import com.modernhome.domain.OutOrderResultVO;
import com.modernhome.domain.OutOrderVO;
import com.modernhome.domain.PageMaker;
import com.modernhome.domain.PageVO;
import com.modernhome.domain.ProductReleaseVO;
import com.modernhome.domain.ProductVO;
import com.modernhome.domain.ShipmentJoinVO;
import com.modernhome.domain.ShipmentVO;
import com.modernhome.service.ClientService;
import com.modernhome.service.ItemService;
import com.modernhome.service.OutOrderService;
import com.modernhome.service.ReleaseService;
import com.modernhome.service.ShipmentService;

@Controller
@RequestMapping(value = "/client/*")
public class ClientController {
	
	ClientVO cvo = null;
	OutOrderVO ovo = null;
	ShipmentVO svo = null;

	private static final Logger logger = LoggerFactory.getLogger(ClientController.class);
	
	@Inject
	private ClientService cService;
	
	@Autowired
	private ReleaseService rService;
	
	@Autowired
	private OutOrderService oService;
	
	@Autowired
	private ShipmentService sService;
	
	@Inject
	private ItemService iService;
	
	
	
	
	// http://localhost:8088/client/clientList
	// 거래처조회
	@RequestMapping(value = "/clientList", method = RequestMethod.GET)
	public void clientListGET(Model model, ClientVO cvo, PageVO pvo) throws Exception {
		logger.debug("\"getClientListGET() 호출\"");
		
		PageMaker pm = new PageMaker();
		List<ClientVO> clientList;
		
		// 검색어가 하나라도 있으면 if문 실행, 아닐경우 else문 실행
		if(cvo.getClt_name() != null || cvo.getClt_rep() != null || cvo.getClt_sort() != null) {
			logger.debug("검색어 O, 검색된 데이터만 출력" + cvo);
			// 서비스 -> 회원목록 가져오기
			clientList = cService.getClientList(cvo, pvo);
			model.addAttribute("clientList", clientList);
			// 페이징 정보 전달
						pm.setPageVO(pvo);
						pm.setTotalCount(cService.getCltSearchCnt(cvo));
						model.addAttribute("pm", pm);
			// Model 객체에 저장
			model.addAttribute("cvo", cvo);
		}else {

			logger.debug("검색어 X, 전체 데이터 출력 " + cvo);
			// 서비스 -> 회원목록 가져오기
			clientList = cService.getClientList(pvo);
			
			// Model 객체에 저장
			model.addAttribute("clientList", clientList);
			
			pm.setPageVO(pvo);
			pm.setTotalCount(cService.getTotalCntClt());
			
			model.addAttribute("pm", pm);
		}
		
	}// 거래처등록
	
	
	// 거래처등록, 거래처 업데이트
	@RequestMapping(value = "/regClient", method = RequestMethod.POST)
	public String regClientPOST(ClientVO cvo) throws Exception{
		
		if(cvo.getClt_num() == null) {
			logger.debug("regEmployeePOST() 호출(거래처 등록)");
			
			logger.debug("cvo : " + cvo);
			
			cService.regClient(cvo);
			
			
		}else {
			logger.debug("regClientPOST() 호출(거래처 업데이트)");
			
			logger.debug("cvo : " + cvo);
			
			cService.updateClient(cvo);
		}
		
		return "redirect:/client/clientList";
	}
	
	// 거래처삭제
		@RequestMapping(value = "/deleteClient")
		public String deleteClient(@RequestParam(value = "selectedCltId", required = false) String[] selectedCltIds) throws Exception {
			
			logger.debug("deleteClient() 호출(사원삭제)");
			if(selectedCltIds != null) {
			    for (String clt_num : selectedCltIds) {
			    	cService.deleteClient(clt_num);
			    }
			}
		    
		    return "redirect:/client/clientList";
		}
	
	
	
	
	
	
	
	// ----------------------------- 수주 ------------------------------------
	// http://localhost:8088/client/outOrderList

	// 수주관리 - 리스트 + 검색
	@RequestMapping(value = "/outOrderList", method = RequestMethod.GET)
	public void outOrderListGET(Model model, OutOrderJoinVO ovo, PageVO pvo) throws Exception {
		logger.debug("outOrderListGET() 호출");
		
		List<OutOrderJoinVO> outOrderList;
		PageMaker pm = new PageMaker();
		
		
		// 검색어가 하나라도 있으면 if문 실행, 아닐경우 else문 실행
		if(ovo.getOo_start_date_1() != null || ovo.getOo_start_date_2() != null || ovo.getOo_end_date_1() != null
				|| ovo.getOo_end_date_2() != null || ovo.getClt_name() != null || ovo.getEmp_name() != null) {
			
			logger.debug("검색어O, 검색된 데이터만 출력"+ovo);
			// 서비스 -> 수주목록 가져오기
			outOrderList = oService.outOrderListSearch(ovo, pvo);
			
			// 페이징 정보 전달
			pm.setPageVO(pvo);
			pm.setTotalCount(oService.ooSearchCnt(ovo));
			
			// Model 객체에 저장
			model.addAttribute("outOrderList", outOrderList);
			model.addAttribute("pm", pm);
			
			// 검색정보 전달
			model.addAttribute("ovo", ovo);
			
		}else {
			logger.debug("검색어 X, 전체 데이터 출력"+ovo);
			// 서비스 수주목록 가져오기
			outOrderList = oService.outOrderList(pvo);
			logger.debug("outOrderList : " + outOrderList);
			
			// 페이징 정보
			pm.setPageVO(pvo);
			pm.setTotalCount(oService.outOrderCnt());

			// Model 객체에 저장
			model.addAttribute("outOrderList", outOrderList);
			model.addAttribute("pm", pm);
			
		}
		  
	} // 수주관리
	
	
	
	
	// 수주 등록, 수정
	@RequestMapping(value = "/regOutOrder")
	public String regOutOrder(OutOrderVO ovo) throws Exception{
		
		if(ovo.getOo_num() == null) {
			logger.debug("ovo : " + ovo);
			
			logger.debug("regOutOrder() - 수주 등록");
			oService.regOutOrder(ovo);
			
		}else {
			logger.debug("regOutOrder() - 수주 수정");
			logger.debug("ovo : " + ovo);
			
			oService.updateOutOrder(ovo);
		}
		
		return "redirect:/client/outOrderList";
	}
	
	
	// 수주 삭제
	@RequestMapping(value = "/deleteOutOrder")
	public String deleteOutOrder(@RequestParam(value = "selected", required = false) String[] selected) throws Exception{
		
		logger.debug("deleteOutOrder() 호출 (수주 삭제)");
		if(selected != null) {
			for(String oo_num : selected) {
				oService.deleteOutOrder(oo_num);
			}
		}
		
		return "redirect:/client/outOrderList";
	}
	
	
	
	
	// 수주 실적(월별 수주 건수, 월별 수주 금액)
	// http://localhost:8088/client/outOrderResult
	@RequestMapping(value = "/outOrderResult")
	public void outOrderResult(Model model) throws Exception {
		
		logger.debug("outOrderResult()호출 (수주 실적)");
		
		
		List<OutOrderResultVO> monthlyOrderResult = oService.monthlyOrderResult();
		
		logger.debug("월별 수주 실적 : " + monthlyOrderResult);
		
		// ObjectMapper를 사용하여 List<OutOrderResultVO>를 JSON 문자열로 변환
		ObjectMapper objectMapper = new ObjectMapper();
		String monthlyOrderResultJson = objectMapper.writeValueAsString(monthlyOrderResult);
		
		// 모델 객체에 추가
		model.addAttribute("monthlyOrderResult", monthlyOrderResultJson);
		
	}
	
	
	
	
	
	
	
	
	
	
	// ----------------------------- 출하 ------------------------------------
		// http://localhost:8088/client/shipmentList
		// 출하관리
		@RequestMapping(value = "/shipmentList", method = RequestMethod.GET)
		public void shipmentListGET(Model model, ShipmentJoinVO svo, PageVO pvo) throws Exception {
			logger.debug("shipmentListGET() 호출");
			
			List<ShipmentJoinVO> shipmentList;
			PageMaker pm = new PageMaker();
			// 검색어가 하나라도 있으면 if문 실행, 아닐경우 else문 실행
			if(svo.getStartDate() != null || svo.getEndDate() != null || svo.getClt_id() != null || svo.getEmp_id() != null) {
				logger.debug("검색어O, 검색된 데이터만 출력"+svo);
				// 서비스 -> 출하목록 가져오기
				shipmentList = sService.shipmentListSearch(svo, pvo);
				// 페이징 정보 전달
				pm.setPageVO(pvo);
				pm.setTotalCount(sService.shpSearchCnt(svo));
				// Model 객체에 저장
				model.addAttribute("shipmentList", shipmentList);
				model.addAttribute("pm", pm);
				// 검색정보 전달
				model.addAttribute("svo", svo);
			}else {
				logger.debug("검색어 X, 전체 데이터 출력"+svo);
				// 서비스 출하목록 가져오기
				shipmentList = sService.shipmentList(pvo);
				logger.debug("shipmentList : " + shipmentList);
				// 페이징 정보
				pm.setPageVO(pvo);
				pm.setTotalCount(sService.shipmentCnt());
				// Model 객체에 저장	
				model.addAttribute("shipmentList", shipmentList);
				model.addAttribute("pm", pm);
			}
		}
		
		// 출하 등록
		@RequestMapping(value = "/regShipment")
		public String regShipment(ShipmentVO svo) throws Exception{
			
			
		if(svo.getShp_num() == null) {	
			logger.debug("svo : " + svo);
			logger.debug("출하등록");
			sService.regShipment(svo);
		}else {
			logger.debug("regShipment() - 출하 수정");
			logger.debug("svo : " + svo);
			
			sService.updateShipment(svo);
		}
			return "redirect:/client/shipmentList";
		}
		
		// 출하 삭제
		@RequestMapping(value = "/deleteShipment")
		public String deleteShipment(@RequestParam(value = "selected", required = false) String[] selected) throws Exception{
			
			logger.debug("deleteShipment() 호출 (출하 삭제)");
			if(selected != null) {
				for(String shp_num : selected) {
					sService.deleteShipment(shp_num);
				}
			}
			
			return "redirect:/client/shipmentList";
		}
		
		
	
		
	
		
		
		
		
	// 수주, 출하 등록시 팝업 -------------------------------------------------------------------
	// http://localhost:8088/client/popUpProduct
	@RequestMapping(value = "/addPopup", method = RequestMethod.GET )
	public String popUpGET(Model model, @ModelAttribute("txt") String txt, PageVO pvo, ProductReleaseVO ppvo,
			ClientVO cvo, ProductVO prvo) throws Exception {
		logger.debug("popUpGET() 호출!");
		
		PageMaker pm = new PageMaker();
		// - 수주 등록시 팝업
		if(txt.equals("pro")) { // 완제품 목록 팝업
			
			
			List<ProductVO> popUpPro;
			
			if(prvo.getPro_name() != null) { // 완제품 팝업창에서 검색했을 때
				
				logger.debug("완제품 팝업(검색) 호출!");
				popUpPro = iService.getProductList(prvo, pvo); // 기존 페이징 적용된 검색 메서드 사용!
				model.addAttribute("popUpPro", popUpPro);
				
				// 페이징 정보 추가
				pm.setPageVO(pvo);
				pm.setTotalCount(iService.getProSearchCnt(prvo));
				model.addAttribute("pm", pm);
				
				model.addAttribute("productVO", prvo);
				
				
				
			}else { // 완제품 팝업 처음 실행했을 때
				
				logger.debug("완제품 팝업 호출!");
				popUpPro = iService.getProListPage(pvo); // 기존 페이징 적용된 검색 메서드 사용!
				model.addAttribute("popUpPro", popUpPro);
				
				// 페이징 정보 추가
				pm.setPageVO(pvo);
				pm.setTotalCount(iService.getTotalCntPro());
				
				model.addAttribute("pm", pm);
				
			}
			
			return "/client/popUpProduct";
			
			/////////////////////////// 여기까지 완제품 팝업 페이징
		
			
		
		}else if(txt.equals("clt")) { // 거래처 목록 팝업
			
			
			List<ClientVO> popUpClt;
			
//			if(cvo.getClt_name() != null) { // 거래처 팝업창에서 검색했을 때

				logger.debug("거래처 팝업(검색) 호출!");
				popUpClt = cService.ooCltList(cvo, pvo);
				model.addAttribute("popUpClt", popUpClt);
				
        		// 페이징 정보 추가
				pm.setPageVO(pvo);
				pm.setTotalCount(cService.ooCltCnt(cvo));
				model.addAttribute("pm", pm);
				
				model.addAttribute("clientVO", cvo);
        		
//			}else {
//				logger.debug("거래처 팝업 호출");
//				popUpClt = cService.ooCltList(cvo, pvo);
//				model.addAttribute("popUpClt", popUpClt);
//				
//				// 페이징 정보 추가
//				pm.setPageVO(pvo);
//				pm.setTotalCount(cService.getTotalCntClt());
//				model.addAttribute("pm", pm);
//			}
			
			return "/client/popUpClient";
		}
		// - 수주 등록시 팝업
		

		// 출하등록할때 팝업
				else if(txt.equals("clt2")) { // 출고 목록 팝업2
					List<ProductReleaseVO> popUpClt2;
					
						logger.debug("출고 검색 팝업 호출");
						popUpClt2 = rService.shpPrList(ppvo, pvo);
					
					model.addAttribute("popUpClt2", popUpClt2);
					
					pm.setPageVO(pvo);
					pm.setTotalCount(rService.shpPrCnt(ppvo));
					model.addAttribute("pm", pm);
					
					model.addAttribute("ProductReleaseVO", ppvo);
					
				
				return "/client/popUpClient2";
				
			}
			return "/client/clientList";
	}
	
	// BOM (수주계약서)
	// http://localhost:8088/info/req/BOM
	@RequestMapping(value = "/client/outOrderContract", method = RequestMethod.GET)
	public void outOrderContract(@RequestParam(value = "oo_num") String oo_num, Model model) throws Exception {
		logger.debug("outOrderContract 호출!");
		
		OutOrderJoinVO contractList = oService.outOrderContract(oo_num);
		model.addAttribute("contractList", contractList);
		
	}
	
	
	
}
 