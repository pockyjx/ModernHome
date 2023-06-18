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

import com.modernhome.domain.InorderVO;
import com.modernhome.domain.ReceiveVO;
import com.modernhome.service.ReceiveService;

@Controller
@RequestMapping(value = "/wms/*")
public class ReceiveController {
	
	ReceiveController rvo = null;
	
	private static final Logger logger = LoggerFactory.getLogger(ReceiveController.class);
	
	// 의존성 주입
	@Autowired
	private ReceiveService rService;
	
	// 입고 조회
	// http://localhost:8088/wms/receive/receivelist
	@RequestMapping(value = "/receive/receivelist",method = RequestMethod.GET)
    public void receiveGET(Model model, 
    		@ModelAttribute("startDate") java.util.Date startDate, 
    		@ModelAttribute("endDate") java.util.Date endDate,
    		@ModelAttribute("ma_name") String ma_name,
    		@ModelAttribute("io_num") String io_num) throws Exception {
    	logger.debug(" receiveGET() 호출 ");
    	
    	List<ReceiveVO> receiveList;
    	
    	logger.debug(ma_name);
    	logger.debug(io_num);
    	
    	if(startDate != null || endDate != null || ma_name != null || io_num != null) {
    		receiveList = rService.getReceiveSearch(startDate, endDate, ma_name, io_num);
    		model.addAttribute("receiveList", receiveList);
    	}else {
    		receiveList = rService.getReceiveList();
    		model.addAttribute("receiveList", receiveList);
    	}
    }
	
	
	
	
	
	
}
