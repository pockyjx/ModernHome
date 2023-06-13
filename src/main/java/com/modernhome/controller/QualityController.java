package com.modernhome.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/quality/*")
public class QualityController {
	
	private static final Logger logger = LoggerFactory.getLogger(QualityController.class);

	// ===========================================
	
	
	// 의존성 주입
	
	
	// ===========================================
	
	
	// 품질현황 추가(GET) - /quality/check/add
	
	// 품질현황 추가 처리(POST) - /quality/check/add
	
	
	// 품질현황 리스트 출력(GET) - /quality/check/list
	
	
	// ===========================================
	
	
	// 불량 추가(GET) - /quality/defective/add
	
	// 불량 추가 처리(POST) - /quality/defective/add
	
	
	// 불량 리스트 조회(GET) - /quality/defective/list
	
	
	// 불량 수정(GET) - /quality/defective/modify
	
	// 불량 수정 처리(POST) - /quality/defective/modify
	
	
	// 불량 삭제(GET) - /quality/defective/delete
	
	// 불량 삭제 처리(POST) - /quality/defective/delete
	
}