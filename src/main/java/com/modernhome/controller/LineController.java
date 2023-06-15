package com.modernhome.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.modernhome.domain.LineVO;
import com.modernhome.service.LineService;

@Controller
@RequestMapping(value = "/production")
public class LineController {
	
	private static final Logger logger = LoggerFactory.getLogger(LineController.class);
	
	// ===========================================
	
	
	// 의존성 주입
	@Inject
	private LineService lineService;
	
	
	// ===========================================
	
	
	// 라인 추가(GET) - /production/line/add
	
	// 라인 추가 처리(POST) - /production/line/add
	
	
	// http://localhost:8088/production/line/lineList
	// 라인 목록 조회(GET) - /production/line/lineList
	@RequestMapping(value = "/line/lineList", method = RequestMethod.GET)
	public void getLineList(Model model) {
		logger.debug("getLineList() 호출");
		
		// 서비스 -> 라인목록 가져오기
		List<LineVO> lineList = lineService.getLineList();
		// Model 객체에 저장
		model.addAttribute("lineList", lineList);

		
	}
	
}