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

import com.modernhome.domain.ClientVO;
import com.modernhome.domain.EmployeeVO;
import com.modernhome.domain.MaterialVO;

import com.modernhome.domain.OutOrderJoinVO;
import com.modernhome.domain.OutOrderVO;
import com.modernhome.domain.ProductVO;
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
	public String regEmployeePOST(ClientVO cvo) throws Exception{
		
		if(cvo.getClt_num() == null) {
			logger.debug("regEmployeePOST() 호출(사원 등록)");
			
			logger.debug("cvo : " + cvo);
			
//			cService.regEmployee(evo);
		}//else {
//			logger.debug("regEmployePOST() 호출(사원 업데이트)");
//			
//			logger.debug("evo : " + evo);
//			
//			cService.updateEmployee(evo);
//		}
		
		return "";
	}
	
	
	
	
	
	
	
	
	// ----------------------------- 수주 ------------------------------------
	// http://localhost:8088/client/outOrderList

	// 수주관리 - 리스트 + 검색
	@RequestMapping(value = "/outOrderList", method = RequestMethod.GET)
	public void outOrderListGET(Model model, OutOrderJoinVO ovo) throws Exception {
		logger.debug("outOrderListGET() 호출");
		// 검색어가 하나라도 있으면 if문 실행, 아닐경우 else문 실행
		if(ovo.getOo_start_date() != null || ovo.getOo_end_date() != null || ovo.getClt_name() != null || ovo.getEmp_name() != null) {
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
	
	
	// 수주 등록시 팝업
	// http://localhost:8088/client/popUpProduct
	@RequestMapping(value = "/addPopup", method = RequestMethod.GET )
	public String popUpGET(Model model, @ModelAttribute("txt") String txt) throws Exception {
		logger.debug("popUpProductGET() 호출!");
		
		if(txt.equals("pro")) { // 완제품 목록 팝업
			logger.debug("client컨트롤러 - popUpproduct 호출");
			List<ProductVO> popUpPro = iService.getProductList();
			model.addAttribute("popUpPro", popUpPro);
			
			return "/client/popUpProduct";
			
		}else if(txt.equals("clt")) { // 자재 목록 팝업
			List<ClientVO> popUpClt = cService.clientList();
			model.addAttribute("popUpClt", popUpClt);
			
			return "/client/popUpClient";
		}
		
		return "/client/clientList";
		
	}
	
	
	// 수주 등록
	@RequestMapping(value = "/regOutOrder")
	public String regOutOrder(OutOrderVO ovo) throws Exception{
		
		logger.debug("ovo : " + ovo);
		
		oService.regOutOrder(ovo);
		
		return "redirect:/client/outOrderList";
	}
	
	
	
	
	
	
	
	// ----------------------------- 출하 ------------------------------------
	// http://localhost:8088/client/shipmentList
	// 출하관리
	@RequestMapping(value = "/shipmentList", method = RequestMethod.GET)
	public void shipmentListGET(Model model, @ModelAttribute("startDate") String startDate, 
			@ModelAttribute("endDate") String endDate, ShipmentVO svo) throws Exception {
		logger.debug("shipmentListGET() 호출");
		// 검색어가 하나라도 있으면 if문 실행, 아닐경우 else문 실행
		if(svo.getShp_date() != null || svo.getClt_id() != null || svo.getEmp_id() != null) {
			logger.debug("검색어O, 검색된 데이터만 출력"+svo);
			// 서비스 -> 출하목록 가져오기
			List<ShipmentVO> shipmentList = sService.shipmentListSearch(svo);
			// Model 객체에 저장
			model.addAttribute("shipmentList", shipmentList);
		}else {
			logger.debug("검색어 X, 전체 데이터 출력"+svo);
			// 서비스 출하목록 가져오기
			List<ShipmentVO> shipmeList = sService.shipmentList();
			// Model 객체에 저장
			model.addAttribute("shipmentList", shipmeList);
		}
	}	
	
	
	
	
}
 