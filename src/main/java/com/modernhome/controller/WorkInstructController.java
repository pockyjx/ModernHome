package com.modernhome.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.modernhome.domain.WijoinVO;
import com.modernhome.domain.WorkInstrVO;
import com.modernhome.service.WorkInstrService;

@Controller
@RequestMapping(value = "/production")
public class WorkInstructController {
	
	private static final Logger logger = LoggerFactory.getLogger(WorkInstructController.class);
	
	// ===========================================
	
	
	// 의존성 주입
	@Inject
	private WorkInstrService wiService;
	
	
	// ===========================================
	
	// http://localhost:8088/production/instruct/add.jsp
	// 작업지시서 작성(GET) - /production/instruct/add
	@RequestMapping(value = "/instruct/add", method = RequestMethod.GET)
	public void addInstrGET(@ModelAttribute("oo_num") String oo_num, WijoinVO wjvo, Model model) throws Exception {
		logger.debug("addInstrGET() 호출");
		
		// 해당 수주번호에 해당하는 소요량
		List<WijoinVO> reqList = wiService.getBeforeInstrReq(wjvo.getOo_num());
		logger.debug("reqList : {}", reqList);
		
		// 연결된 뷰페이지에 전달
		model.addAttribute("reqList", reqList);
		
		logger.debug("/production/instruct/add 뷰페이지 이동");
	}
	
	// 작업지시서 관련 팝업(GET) - /production/instruct/addPopup
	@RequestMapping(value = "/instruct/addPopup")
	public String addInstrPop(Model model, @ModelAttribute("txt") String txt) throws Exception {
		logger.debug("addInstrPop() 호출");
		
		// 작업지시서를 작성하지 않은 수주번호 출력
		List<WijoinVO> onumList = wiService.getBeforeInstr();
		
		if(txt.equals("oo")) {
			logger.debug("txt : " + txt);
			logger.debug("addPopupoo 페이지 이동");
			
			// 연결된 뷰페이지에 전달
			model.addAttribute("onumList", onumList);
			
			return "/production/instruct/addPopupoo";
		}
		
		if(txt.equals("li")) {
			logger.debug("txt : " + txt);
			logger.debug("addPopupli 페이지 이동");
			
			// 연결된 뷰페이지에 전달
			model.addAttribute("onumList", onumList);
			
			return "/production/instruct/addPopupli";
		}
		
		if(txt.equals("clt")) {
			logger.debug("txt : " + txt);
			logger.debug("addPopupclt 페이지 이동");
			
			// 연결된 뷰페이지에 전달
			model.addAttribute("onumList", onumList);
			
			return "/production/instruct/addPopupclt";
		}

		logger.debug("add 뷰페이지로 다시 이동");
		return "/production/instruct/add";
	}
	
	// 작업지시서 작성 처리(POST) - /production/instruct/add
	@RequestMapping(value = "/instruct/add", method = RequestMethod.POST)
	public void addInstrPOST(WijoinVO vo) throws Exception {
		logger.debug("addInstrPOST() 호출");
		
		logger.debug("@@@@@@@@@@@@@@@@@vo : {}", vo);
		
//		return "redirect:/production/instruct/list";
	}
	
	
	// http://localhost:8088/production/instruct/list
	// 작업지시 리스트 출력(GET) - /production/instruct/list
	@RequestMapping(value = "/instruct/list", method = RequestMethod.GET)
	public void getInstrList(Model model, 
			@ModelAttribute("work_state") String work_state, @ModelAttribute("pro_num") String pro_num, 
			@ModelAttribute(value = "startDate") String startDate, @ModelAttribute(value = "endDate") String endDate) 
			throws Exception {
		logger.debug("getInstrList() 호출");
		
		// 검색어가 하나라도 있으면 if문 실행, 아닐경우 else문 실행
		if(work_state != null || pro_num != null || !startDate.isEmpty() || !endDate.isEmpty()) {
			logger.debug("검색어 O, 검색된 데이터만 출력");
			
			// 작업지시 목록 출력 메서드 (서비스 -> DAO)
			List<WijoinVO> instrList = wiService.getInstrList(work_state, pro_num, startDate, endDate);
			logger.debug("instrList : {}", instrList);
			
			// 연결된 뷰페이지에 전달
			model.addAttribute("instrList", instrList);
		}else {
			logger.debug("검색어 X, 전체 데이터 출력 ");
			
			// 작업지시 목록 출력 메서드 (서비스 -> DAO)
			List<WijoinVO> instrList = wiService.getInstrList();
			logger.debug("instrList : {}", instrList);
			
			// 연결된 뷰페이지에 전달
			model.addAttribute("instrList", instrList);
		}
		
		// 페이지 이동
		logger.debug("/production/instruct/list.jsp 뷰페이지로 이동");
	}
	
	// http://localhost:8088/production/instruct/info?work_id=
	// 작업지시 상세보기 출력(GET) - /production/instruct/info
	@RequestMapping(value = "/instruct/info", method = RequestMethod.GET)
	public void getInstr(Model model, WorkInstrVO wivo) throws Exception {
		logger.debug("getInstr() 호출");
		
		// 작업지시 아이디에 해당하는 작업지시 조회 (서비스 -> DAO)
		List<WijoinVO> wiList = wiService.getInstr(wivo);
		List<WijoinVO> reqList = wiService.getInstrReq(wivo);
		logger.debug("wiList : {}", wiList);
		logger.debug("reqList : {}", reqList);
		
		// 연결된 뷰페이지에 전달
		model.addAttribute("wiList", wiList);
		model.addAttribute("reqList", reqList);
		
		// 페이지 이동
		logger.debug("/production/instruct/info.jsp 뷰페이지로 이동");
	}
	
	
	// 작업지시 수정(GET) - /production/instruct/modify
	
	// 작업지시 수정 처리(POST) - /production/instruct/modify
	
	
	// 작업지시 삭제(GET) - /production/instruct/delete
	
	// 작업지시 삭제 처리(POST) - /production/instruct/delete
	
}