package com.modernhome.controller;

import java.util.List;

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
import com.modernhome.domain.InorderVO;
import com.modernhome.domain.MaterialVO;
import com.modernhome.domain.ReceiveVO;
import com.modernhome.service.ClientService;
import com.modernhome.service.InorderService;
import com.modernhome.service.ReceiveService;

@Controller
@RequestMapping(value = "/wms/*")
public class ReceiveController {
	
	
	private static final Logger logger = LoggerFactory.getLogger(ReceiveController.class);
	
	// 의존성 주입
	@Autowired
	private ReceiveService rService;
	
	@Autowired
    private InorderService ioService;
	
	@Autowired
	private ClientService cService;
	
	// 입고 조회
	// http://localhost:8088/wms/receive/receivelist
	@RequestMapping(value = "/receive/receivelist",method = RequestMethod.GET)
    public void receiveGET(Model model, 
    		@ModelAttribute(value = "startDate") String startDate, 
    		@ModelAttribute(value = "endDate") String endDate,
    		@ModelAttribute(value = "ma_name") String ma_name,
    		@ModelAttribute(value = "io_num") String io_num)
    				throws Exception {
    	logger.debug(" receiveGET() 호출 ");

    	
		if (!startDate.isEmpty() || !endDate.isEmpty() || !ma_name.isEmpty() || !io_num.isEmpty()) {
    		
			List<ReceiveVO> receiveList = rService.getReceiveSearch(startDate, endDate, ma_name, io_num);
    		logger.debug("검색어O, 검색된 데이터만 출력");
    		
    		model.addAttribute("receiveList", receiveList);
    	}else {
    		
    		logger.debug("검색어X, 전체 데이터 출력");
    		List<ReceiveVO> receiveList = rService.getReceiveList();
    		model.addAttribute("receiveList", receiveList);
    	}
    }
	
	
	// 입고 등록 시 팝업
    // http://localhost:8088/wms/receive/popUpReceive
    @RequestMapping(value = "/receive/addPopup", method = RequestMethod.GET )
	public String popUpGET(Model model, @ModelAttribute("txt") String txt) throws Exception {
		logger.debug("popUpReceiveGET() 호출!");
		
		if(txt.equals("io")) { // 발주 목록 팝업
			List<InorderVO> popUpIo = ioService.getInorderList();
			model.addAttribute("popUpIo", popUpIo);
			
			return "/wms/receive/popUpInorder";
			
		}else if(txt.equals("clt")) { // 거래처 목록 팝업
			List<ClientVO> popUpClt = cService.clientList();
			model.addAttribute("popUpClt", popUpClt);
			
			return "/wms/receive/popUpClt";
		}
		
			return "/wms/receive/receivelist";
    }		
		
    
    
    // 입고 등록 + 수정
    @RequestMapping(value = "/wms/regReceive", method = RequestMethod.POST)
    public String regReceivePOST(ReceiveVO rvo) throws Exception {
    		
    	if(rvo.getRec_num() == "") {
    		logger.debug("regReceivePOST() 호출-입고등록");
    		logger.debug("rvo : " + rvo);
    		
    		rService.regReceive(rvo);
    	}else {
    		logger.debug("regReceivePOST() 호출-입고수정");
			logger.debug("rvo : " + rvo);
			
			rService.updateReceive(rvo);
    	}	
    		
    		return "redirect:/wms/receive/receivelist";
    }
    
    // 입고 삭제
    @RequestMapping(value = "/wms/deleteReceive")
    public String deleteReceive(@RequestParam(value = "selectedRecId", required = false) Integer[] selectedRecIds) {
    	
    	if(selectedRecIds != null) {
		    for (Integer rec_id : selectedRecIds) {
		    	rService.deleteReceive(rec_id);
		    }
		}
	    
	    return "redirect:/wms/receive/receivelist";
    }
	
	
	
	
	
}