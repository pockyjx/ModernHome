package com.modernhome.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.modernhome.domain.WijoinVO;
import com.modernhome.service.WorkPrfrmService;

@Controller
@RequestMapping(value = "/production/performance")
public class WorkPrfrmController {
	
	private static final Logger logger = LoggerFactory.getLogger(WorkPrfrmController.class);
	
	// ===========================================
	
	
	// 의존성 주입
	@Autowired
	private WorkPrfrmService wpService;
	
	
	// ===========================================
	
	
	// 생산실적 목록 출력 (+ 검색)
	@RequestMapping(value = "/performance")
	public void getPrfrmList() throws Exception {
		logger.debug("getPrfrmList() 호출");
		
		// 작업지시 목록 가져오기 -> 뷰페이지에서 작업상태가 '완료'인 애들만 출력
		List<WijoinVO> 
	}
	
	
	// ===========================================
	
	
	// 생산실적 추가 & 수정
	
	
	// ===========================================
	
	
	// 생산실적 삭제
	
}