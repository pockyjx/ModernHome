package com.modernhome.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.modernhome.domain.WijoinVO;
import com.modernhome.service.PerformanceService;

@Controller
@RequestMapping(value = "/production/performance")
public class PerformanceController {
	
	private static final Logger logger = LoggerFactory.getLogger(PerformanceController.class);
	
	// ===========================================
	
	
	// 의존성 주입
	@Autowired
	private PerformanceService wpService;
	
	
	// ===========================================
	
	
	// http://localhost:8088/production/performance/list
	// 생산실적 목록 출력 (+ 검색)
	@RequestMapping(value = "/list")
	public void getPrfrmList(Model model, WijoinVO wjvo, 
			@ModelAttribute(value = "gb_yn") String gb_yn, @ModelAttribute(value = "work_num") String work_num, 
			@ModelAttribute(value = "startDate") String startDate, @ModelAttribute(value = "endDate") String endDate) 
					throws Exception {
		logger.debug("getPrfrmList() 호출");
		
		// 작업지시 목록 출력 -> 작업상태가 '완료'인 목록
		List<WijoinVO> qiList = wpService.getqcEndInstr();
		
		// 생산실적 목록
		List<WijoinVO> wpList = null;
		if(gb_yn != null || work_num != null || !startDate.isEmpty() || !endDate.isEmpty()) {
			logger.debug("검색어 O, 검색된 데이터만 출력");
			wpList = wpService.getPrfrmList(gb_yn, work_num, startDate, endDate);
		} else {
			logger.debug("검색어 X, 전체 데이터 출력");
			wpList = wpService.getPrfrmList();
		}
		
		// 생산실적번호 자동 생성
		String prfrmNum =  wpService.createPrfrmNum();
		
		// 연결된 뷰페이지에 전달
		model.addAttribute("qiList", qiList);
		model.addAttribute("wpList", wpList);
		model.addAttribute("prfrmNum", prfrmNum);
	}
	
	
	// ===========================================
	
	
	// 생산실적 추가 & 수정
	@RequestMapping(value = "/regPrfrm")
	public String regPrfrmInfo(WijoinVO vo) throws Exception {
		logger.debug("regPrfrmInfo() 호출");
		logger.debug("@@@@@@@@@@@@@@@@@@@@@@@@@@@ vo : {}", vo);
		
		if(vo.getPrfrm_id() == null) {
			logger.debug("생산실적 등록");
			wpService.addPrfrm(vo);
			
			// 생산실적 첫 등록 시, 해당 생산실적에서 나온 완제품 수량을 재고에 추가
			wpService.addPS(vo);
			logger.debug("생산량을 완제품 재고에 추가함");
		} else {
			logger.debug("생산실적 수정");
			wpService.modifyPrfrm(vo);
		}
		
		return "redirect:/production/performance/list";
	}
	
	
	// ===========================================
	
	
	// 생산실적 삭제
	@RequestMapping(value = "/delPrfrm")
	public String delPrfrmInfo(Model model, WijoinVO vo) throws Exception {
		logger.debug("delPrfrmInfo() 호출");
		
		wpService.deletePrfrm(vo);
		
		// 생산실적 삭제 시 재고에 반영한 실적수량 차감 -> 로직 생각해보기
		wpService.addPS(vo);
		
		return "redirect:/production/performance/list";
	}
	
}