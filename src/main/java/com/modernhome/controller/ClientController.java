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
import com.modernhome.domain.OutOrderVO;
import com.modernhome.service.ClientService;
import com.modernhome.service.OutOrderService;

@Controller
@RequestMapping(value = "/client/*")
public class ClientController {
	
	ClientVO cvo = null;
	OutOrderVO ovo = null;

	// http://localhost:8088/client/clientList
	private static final Logger logger = LoggerFactory.getLogger(ClientController.class);
	
	@Inject
	private ClientService cService;
	
	@Autowired
	private OutOrderService oService;
	
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
		
	}
	
	// http://localhost:8088/client/outOrderList
	  @RequestMapping(value = "/outOrderList", method = RequestMethod.GET)
	  public void outOrderGET(Model model, @ModelAttribute("startDate") String startDate, 
	    		@ModelAttribute("endDate") String endDate, OutOrderVO ovo) throws Exception {
		  logger.debug("outOrderListGET() 호출");
		  // 검색어가 하나라도 있으면 if문 실행, 아닐경우 else문 실행
		  if(ovo.getOo_start_date() != null || ovo.getOo_end_date() != null || ovo.getClt_id() != null || ovo.getEmp_id() != null) {
			  logger.debug("검색어O, 검색된 데이터만 출력"+ovo);
			  // 서비스 -> 수주목록 가져오기
			  List<OutOrderVO> outOrderList = oService.outOrderListSearch(ovo);
			  // Model 객체에 저장
			  model.addAttribute("outOrderList", outOrderList);
		  }else {
			  logger.debug("검색어 X, 전체 데이터 출력"+ovo);
			  // 서비스 수주목록 가져오기
			  List<OutOrderVO> outOrderList = oService.outOrderList();
			  // Model 객체에 저장
			  model.addAttribute("outOrderList", outOrderList);
		  }
		  
		  
		  
	  }
}
 