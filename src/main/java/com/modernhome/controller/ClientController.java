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

import com.modernhome.domain.ClientVO;
import com.modernhome.domain.OutOrderJoinVO;
import com.modernhome.domain.OutOrderVO;
import com.modernhome.domain.ProductVO;
import com.modernhome.domain.ShipmentJoinVO;
import com.modernhome.domain.ShipmentVO;
import com.modernhome.service.ClientService;
import com.modernhome.service.ItemService;
import com.modernhome.service.OutOrderService;
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
	private OutOrderService oService;
	
	@Autowired
	private ShipmentService sService;
	
	@Inject
	private ItemService iService;
	
	
	
	
	// http://localhost:8088/client/clientList
	// 거래처조회
	@RequestMapping(value = "/clientList", method = RequestMethod.GET)
	public void clientListGET(Model model, ClientVO cvo) throws Exception {
		logger.debug("\"clientListGET() 호출\"");
		
		// 검색어가 하나라도 있으면 if문 실행, 아닐경우 else문 실행
		if(cvo.getClt_name() != null || cvo.getClt_rep() != null || cvo.getClt_sort() != null) {
			logger.debug("검색어 O, 검색된 데이터만 출력" + cvo);
			// 서비스 -> 회원목록 가져오기
			List<ClientVO> clientList = cService.clientListSearch(cvo);
			// Model 객체에 저장
			model.addAttribute("clientList", clientList);
		}else {

			logger.debug("검색어 X, 전체 데이터 출력 " + cvo);
			// 서비스 -> 회원목록 가져오기
			List<ClientVO> clientList = cService.clientList();
			
			// Model 객체에 저장
			model.addAttribute("clientList", clientList);
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
	public void outOrderListGET(Model model, OutOrderJoinVO ovo) throws Exception {
		logger.debug("outOrderListGET() 호출");
		
		
		// 검색어가 하나라도 있으면 if문 실행, 아닐경우 else문 실행
		if(ovo.getOo_start_date_1() != null || ovo.getOo_start_date_2() != null || ovo.getOo_end_date_1() != null
				|| ovo.getOo_end_date_2() != null || ovo.getClt_name() != null || ovo.getEmp_name() != null) {
		logger.debug("검색어O, 검색된 데이터만 출력"+ovo);
		// 서비스 -> 수주목록 가져오기
		List<OutOrderJoinVO> outOrderList = oService.outOrderListSearch(ovo);
		// Model 객체에 저장
		model.addAttribute("outOrderList", outOrderList);
		}else {
			logger.debug("검색어 X, 전체 데이터 출력"+ovo);
			// 서비스 수주목록 가져오기
			List<OutOrderJoinVO> outOrderList = oService.outOrderList();
			logger.debug("outOrderList : " + outOrderList);

			// Model 객체에 저장
			model.addAttribute("outOrderList", outOrderList);
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
	
	
	
	
	// ----------------------------- 출하 ------------------------------------
		// http://localhost:8088/client/shipmentList
		// 출하관리
		@RequestMapping(value = "/shipmentList", method = RequestMethod.GET)
		public void shipmentListGET(Model model, ShipmentJoinVO svo) throws Exception {
			logger.debug("shipmentListGET() 호출");
			// 검색어가 하나라도 있으면 if문 실행, 아닐경우 else문 실행
			if(svo.getStartDate() != null || svo.getEndDate() != null || svo.getClt_id() != null || svo.getEmp_id() != null) {
				logger.debug("검색어O, 검색된 데이터만 출력"+svo);
				// 서비스 -> 출하목록 가져오기
				List<ShipmentJoinVO> shipmentList = sService.shipmentListSearch(svo);
				// Model 객체에 저장
				model.addAttribute("shipmentList", shipmentList);
			}else {
				logger.debug("검색어 X, 전체 데이터 출력"+svo);
				// 서비스 출하목록 가져오기
				List<ShipmentJoinVO> shipmeList = sService.shipmentList();
				// Model 객체에 저장
				model.addAttribute("shipmentList", shipmeList);
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
	public String popUpGET(Model model, @ModelAttribute("txt") String txt) throws Exception {
		logger.debug("popUpGET() 호출!");
		
		// - 수주 등록시 팝업
		if(txt.equals("pro")) { // 완제품 목록 팝업
			logger.debug("client컨트롤러 - popUpproduct 호출");
			List<ProductVO> popUpPro = iService.getProductList();
			model.addAttribute("popUpPro", popUpPro);
			
			return "/client/popUpProduct";
			
		}else if(txt.equals("clt")) { // 거래처 목록 팝업
			List<ClientVO> popUpClt = cService.clientList();
			model.addAttribute("popUpClt", popUpClt);
			
			return "/client/popUpClient";
		}
		// - 수주 등록시 팝업
		
		// 출하등록할때 팝업
		else if(txt.equals("clt2")) { // 거래처 목록 팝업2
			List<ClientVO> popUpClt2 = cService.clientList();
			model.addAttribute("popUpClt2", popUpClt2);
			
			return "/client/popUpClient2";
		}
		
		return "/client/clientList";
		
	}
	
	
	
}
 