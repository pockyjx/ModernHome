package com.modernhome.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	
	// http://localhost:8088/production/performance/list
	// 생산실적 목록 출력 (+ 검색)
	@RequestMapping(value = "/list")
	public void getPrfrmList(Model model, WijoinVO wjvo) throws Exception {
		logger.debug("getPrfrmList() 호출");
		
		// 작업지시 목록 출력 -> 뷰페이지에서 작업상태가 '완료'인 목록
		List<WijoinVO> qiList = wpService.getqcEndInstr();
		
		// 생산실적 목록 출력
		List<WijoinVO> wpList = wpService.getPrfrmList();
		
		// url에 work_id가 있다면 해당 작업지시서에 대한 생산실적 추가
		if(wjvo.getWork_id() != null) {
			// 생산실적번호 자동 생성
			String prfrm_num =  wpService.createPrfrmNum();
			model.addAttribute("prfrm_num", prfrm_num);
		}
		
		// 연결된 뷰페이지에 전달
		model.addAttribute("qiList", qiList);
		model.addAttribute("wpList", wpList);
	}
	
	
	// ===========================================
	
	
	// 생산실적 추가 & 수정
	
	
	// ===========================================
	
	
	// 생산실적 삭제
	
}