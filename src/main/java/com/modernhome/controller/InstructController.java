package com.modernhome.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.modernhome.domain.LineVO;
import com.modernhome.domain.PageMaker;
import com.modernhome.domain.PageVO;
import com.modernhome.domain.WijoinVO;
import com.modernhome.domain.WorkInstrVO;
import com.modernhome.service.LineService;
import com.modernhome.service.InstructService;

@Controller
@RequestMapping(value = "/production")
public class InstructController {
	
	private static final Logger logger = LoggerFactory.getLogger(InstructController.class);
	
	// ===========================================
	
	
	// 의존성 주입
	@Inject
	private LineService lineService;
	@Inject
	private InstructService wiService;
	
	
	// ===========================================
	
	
	// http://localhost:8088/production/instruct/list
	// 작업지시 리스트 출력(GET) - /production/instruct/list
	@RequestMapping(value = "/instruct/list", method = RequestMethod.GET)
	public void getInstrList(Model model, PageVO pvo, 
			@ModelAttribute(value = "work_state") String work_state, @ModelAttribute(value = "pro_num") String pro_num, 
			@ModelAttribute(value = "startDate") String startDate, @ModelAttribute(value = "endDate") String endDate) 
					throws Exception {
		logger.debug("getInstrList() 호출");
		
		// 작업지시 목록 출력 메서드 (서비스 -> DAO)
		List<WijoinVO> instrList = null;
		PageMaker pm = new PageMaker();
		
		// 검색어가 하나라도 있으면 if문 실행, 아닐경우 else문 실행
		if(work_state != null || pro_num != null || !startDate.isEmpty() || !endDate.isEmpty()) {
			logger.debug("검색어 O, 검색된 데이터만 출력");
			instrList = wiService.getInstrList(work_state, pro_num, startDate, endDate, pvo);
			
			// 페이징 정보 전달
			pm.setPageVO(pvo);
			pm.setTotalCount(wiService.getWiSearchCnt(work_state, pro_num, startDate, endDate, pvo));
		}else {
			logger.debug("검색어 X, 전체 데이터 출력 ");
			instrList = wiService.getInstrList(pvo);
			
			// 페이징 정보 전달
			pm.setPageVO(pvo);
			pm.setTotalCount(wiService.getWiTotalCnt());
		}
		logger.debug("instrList : {}", instrList);
		
		// 연결된 뷰페이지에 전달
		model.addAttribute("instrList", instrList);
		model.addAttribute("pm", pm);
		
		// 페이지 이동
		logger.debug("/production/instruct/list.jsp 뷰페이지로 이동");
	}
	
	
	// http://localhost:8088/production/instruct/add.jsp
	// 작업지시서 작성(GET) - /production/instruct/add
	@RequestMapping(value = "/instruct/add", method = RequestMethod.GET)
	public void addInstrGET(WijoinVO wjvo, Model model)
			throws Exception {
		logger.debug("addInstrGET() 호출");
//		logger.debug("################oo_num : " + wjvo.getOo_num());
//		logger.debug("################line_num : " + wjvo.getLine_num());
		
		// 지시번호를 자동으로 부여
		List<WijoinVO> idnum = wiService.createIdNum();
		logger.debug("################idnum : " + idnum);
		
		// 해당 수주번호에 해당하는 소요량
		List<WijoinVO> reqList = wiService.getBeforeInstrReq(wjvo);
		logger.debug("reqList : {}", reqList);
		
		// 연결된 뷰페이지에 전달
		model.addAttribute("idnum", idnum);
		model.addAttribute("reqList", reqList);
		
		logger.debug("/production/instruct/add 뷰페이지 이동");
	}
	
	// 작업지시서 관련 팝업(GET) - /production/instruct/addPopup
	@RequestMapping(value = "/instruct/addPopup")
	public String addInstrPop(Model model, @ModelAttribute("txt") String txt) throws Exception {
		logger.debug("addInstrPop() 호출");
		
		// 작업지시서를 작성하지 않은 수주번호 출력
		List<WijoinVO> onumList = wiService.getBeforeInstr();
		List<LineVO> liList = lineService.lineList();
		
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
			model.addAttribute("liList", liList);
			
			return "/production/instruct/addPopupli2";
		}

		logger.debug("add 뷰페이지로 다시 이동");
		return "/production/instruct/add";
	}
	
	// 작업지시서 작성 처리(POST) - /production/instruct/add
	@RequestMapping(value = "/instruct/add", method = RequestMethod.POST)
	public String addInstrPOST(WijoinVO vo) throws Exception {
		logger.debug("addInstrPOST() 호출");
		 
		logger.debug("@@@@@@@@@@@@@@@@@vo : {}", vo);
		wiService.addInstr(vo);
		
		return "redirect:/production/instruct/list";
	}
	
	// http://localhost:8088/production/instruct/info?work_id=
	// 작업지시 상세보기 출력(GET) - /production/instruct/info
	@RequestMapping(value = "/instruct/info", method = RequestMethod.GET)
	public void getInstr(Model model, WorkInstrVO wivo, WijoinVO wjvo) throws Exception {
		logger.debug("getInstr() 호출");
		
		// 작업지시 아이디에 해당하는 작업지시 조회 (서비스 -> DAO)
		List<WijoinVO> wiList = wiService.getInstr(wjvo);
		List<WijoinVO> reqList = wiService.getInstrReq(wivo);
		logger.debug("wiList : {}", wiList);
		logger.debug("reqList : {}", reqList);
		
		// 연결된 뷰페이지에 전달
		model.addAttribute("wiList", wiList);
		model.addAttribute("reqList", reqList);
		
		// 페이지 이동
		logger.debug("/production/instruct/info 뷰페이지로 이동");
	}
	
	
	// 작업지시 수정(GET) - /production/instruct/modify
	@RequestMapping(value = "/instruct/modify", method = RequestMethod.GET)
	public void modifyInstrGET(Model model, WorkInstrVO wivo, WijoinVO wjvo) throws Exception {
		logger.debug("modifyInstrGET() 호출");
		
		// 전달 받은 값 확인 (work_id)
		logger.debug("##################work_id : " + wivo.getWork_id());
		logger.debug("##################line_num & line_id : " + wjvo.getLine_num() + " & " + wjvo.getLine_id());
		
		// 작업지시 아이디에 해당하는 작업지시 조회 (서비스 -> DAO)
		List<WijoinVO> wiList = wiService.getInstr(wjvo);
		List<WijoinVO> reqList = wiService.getInstrReq(wivo);
		logger.debug("wiList : {}", wiList);
		logger.debug("reqList : {}", reqList);
		
		// 연결된 뷰페이지에 전달
		model.addAttribute("wiList", wiList);
		model.addAttribute("reqList", reqList);
		
		// 페이지 이동
		logger.debug("/production/instruct/modify 뷰페이지로 이동");
	}
	
	// 작업지시 수정 처리(POST) - /production/instruct/modify
	@RequestMapping(value = "/instruct/modify", method = RequestMethod.POST)
	public String modifyInstrPOST(WijoinVO vo) throws Exception {
		logger.debug("modifyInstrPOST() 호출");
		
		// 라인코드 끝의 ',' 제거
		vo.setLine_num(vo.getLine_num().substring(0, 6));
//		logger.debug("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@수정 vo-line_num : " + vo.getLine_num());
		
		wiService.modifyInstr(vo);
		// 업데이트 시, 작업지시 상태가 '완료'라면 품질검사 등록 실행
		if(vo.getWork_state().equals("완료")) {
			wiService.addQC(vo);
		}
		
		return "redirect:/production/instruct/list";
	}
	
	
	// 작업지시 삭제 - /production/instruct/delete
	@RequestMapping(value = "/instruct/delete")
	public String deleteInstr(@ModelAttribute("work_id") int work_id) throws Exception {
		logger.debug("deleteInstr() 호출");
		
		wiService.deleteInstr(work_id);
		
		// 페이지 이동
		return "redirect:/production/instruct/list";
	}
	
}