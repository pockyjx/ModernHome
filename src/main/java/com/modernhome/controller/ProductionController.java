package com.modernhome.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.modernhome.service.LineService;

@Controller
@RequestMapping(value = "/production")
public class ProductionController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProductionController.class);
	
	// ===========================================
	
	
	// 의존성 주입
//	@Inject
//	private LineService lineService;
	
	
	// ===========================================
	
	
	// 라인 추가(GET) - /production/line/add
	
	// 라인 추가 처리(POST) - /production/line/add
	
	
	// http://localhost:8088/production/line/lineList
	// 라인 목록 조회(GET) - /production/line/lineList
	@RequestMapping(value = "/line/lineList", method = RequestMethod.GET)
	public void getLineList() {
		logger.debug("getLineList() 호출");
	}
	
	
	// ===========================================
	
	
	// 작업지시서 작성(GET) - /production/instruct/add
	
	// 작업지시서 작성 처리(POST) - /production/instruct/add
	
	
	// 작업지시 리스트 출력(GET) - /production/instruct/list
	
	// 작업지시 상세보기 출력(GET) - /production/instruct/info
	
	
	// 작업지시 수정(GET) - /production/instruct/modify
	
	// 작업지시 수정 처리(POST) - /production/instruct/modify
	
	
	// 작업지시 삭제(GET) - /production/instruct/delete
	
	// 작업지시 삭제 처리(POST) - /production/instruct/delete
	
	
	// ===========================================
	
	
	// 생산관리 등록(GET) - /production/output/add
	
	// 생산관리 등록 처리(POST) - /production/output/add
	
	
	// 생산관리 목록 조회(GET) - /production/output/list

	
	// 생산관리 수정(GET) - /production/output/modify
	
	// 생산관리 수정 처리(POST) - /production/output/modify
	
	
	// 생산관리 삭제(GET) - /production/output/delete
	
	// 생산관리 삭제 처리(POST) - /production/output/delete
	
}