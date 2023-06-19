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

import com.modernhome.domain.ReceiveVO;
import com.modernhome.service.ReceiveService;

@Controller
@RequestMapping(value = "/wms/*")
public class ReceiveController {
	
	
	private static final Logger logger = LoggerFactory.getLogger(ReceiveController.class);
	
	// 의존성 주입
	@Autowired
	private ReceiveService rService;
	
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
	
	
}