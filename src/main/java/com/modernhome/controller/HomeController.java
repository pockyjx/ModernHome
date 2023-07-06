package com.modernhome.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.modernhome.domain.DefectiveVO;
import com.modernhome.domain.InorderVO;
import com.modernhome.domain.LineVO;
import com.modernhome.domain.OutOrderResultVO;
import com.modernhome.domain.QualityCheckingVO;
import com.modernhome.service.DefectiveService;
import com.modernhome.service.InorderService;
import com.modernhome.service.LineService;
import com.modernhome.service.OutOrderService;
import com.modernhome.service.QualityService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	// 객체주입
	@Autowired
	private OutOrderService oService;
	
	@Autowired
	private InorderService ioService;
	
	@Autowired
	private DefectiveService dfService;
	
	@Autowired
	private LineService lService;
	
	@Autowired
	private QualityService qService;
	
	
	
	// http://localhost:8088/
	@RequestMapping(value = "/")
	public String root(Model model) throws Exception{
		logger.debug(" C : root() 호출! ");
		
		ObjectMapper objectMapper;
		
		
		// 수주 그래프
		List<OutOrderResultVO> monthlyOrderResult = oService.monthlyOrderResult();
//		logger.debug("월별 수주 실적 : " + monthlyOrderResult);
		
		
		// ObjectMapper를 사용하여 List<OutOrderResultVO>를 JSON 문자열로 변환
		objectMapper = new ObjectMapper();
		String monthlyOrderResultJson = objectMapper.writeValueAsString(monthlyOrderResult);
		
		// 모델 객체에 추가
		model.addAttribute("monthlyOrderResult", monthlyOrderResultJson);
		
		
		
		// 발주 그래프
		List<InorderVO> monthlyIOResult = ioService.monthlyIOResult();
//		logger.debug("월별 발주 : " + monthlyIOResult);
		
		objectMapper = new ObjectMapper();
		String monthlyIOResultJson = objectMapper.writeValueAsString(monthlyIOResult);
		
		model.addAttribute("monthlyIOResult", monthlyIOResultJson);
		
		
		
		
		// 품질 - 불량 그래프
		DefectiveVO dfCnt = dfService.dfCnt();
//		logger.debug("불량률 " + dfCnt);
		
		objectMapper = new ObjectMapper();
		String dfCntJson = objectMapper.writeValueAsString(dfCnt);
		
		
		// 파싱해서 사용하려면 해야함
		model.addAttribute("dfCnt", dfCntJson);
		
		
		
		
		
		// 평균 고장 건수(라인)
		List<LineVO> shutdownCnt = lService.shutdownCnt();
//		logger.debug("평균고장건수 : " + shutdownCnt);
		
		objectMapper = new ObjectMapper();
		String shutdownCntJson = objectMapper.writeValueAsString(shutdownCnt);
		
		model.addAttribute("shutdownCnt", shutdownCntJson);
		
		
		
		
		
		
		// 고장률
		List<QualityCheckingVO> dfRate = qService.dfRate();
//		logger.debug("dfRate : " + dfRate);
		
		objectMapper = new ObjectMapper();
		String dfRateJson = objectMapper.writeValueAsString(dfRate);
		
		model.addAttribute("dfRate", dfRateJson);
		
		
		
		return "main";
	}
	
}
