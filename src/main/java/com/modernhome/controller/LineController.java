package com.modernhome.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.modernhome.domain.LineShutdownVO;
import com.modernhome.domain.LineVO;
import com.modernhome.domain.PageMaker;
import com.modernhome.domain.PageVO;
import com.modernhome.service.LineService;

@Controller
@RequestMapping(value = "/production")
public class LineController {
	
	LineVO lvo = null;
	
	private static final Logger logger = LoggerFactory.getLogger(LineController.class);
	
	// 의존성 주입
	@Inject
	private LineService lineService;
	
	// 라인 목록 조회(GET) - /production/line/lineList
	// http://localhost:8088/production/line/lineList
	@RequestMapping(value = "/line/lineList", method = RequestMethod.GET)
	public void lineListGET(Model model, LineVO lvo) throws Exception{ 
		logger.debug("lineListGET() 호출");
		logger.debug("/line/lineList.jsp 페이지 이동");
		
		
		// 검색어가 하나라도 있으면 if문 실행, 아닐경우 else문 실행
		if(lvo.getLine_num()!= null || lvo.getLine_name() != null || lvo.getUse_yn() != null) {
			logger.debug("검색어 O, 검색된 데이터만 출력" + lvo);
			
			// 서비스 -> 라인목록 가져오기
			List<LineVO> lineList = lineService.getLineListSearch(lvo);
			
			// Model 객체에 저장
			model.addAttribute("lineList",lineList);
			
			// 검색 정보 전달
			model.addAttribute("livo",lvo);
			
		}else {
			
			logger.debug("검색어 X, 전체 데이터 출력 " + lvo);
			
			// 서비스 -> 라인목록 가져오기
			List<LineVO> lineList = lineService.getLineList();
			
			// Model 객체에 저장
			model.addAttribute("lineList",lineList);
			
		}

	}
	
	// 라인 등록 + 수정
	@RequestMapping(value = "/line/regLine", method = RequestMethod.POST)
	public String regLinePOST(LineVO lvo) throws Exception {
		
		if(lvo.getLine_num() == "") {
			logger.debug("regLinePOST() 호출 - 라인등록");
			logger.debug("lvo : "+lvo);
			
			lineService.regLine(lvo);
		} /*
			 * else { logger.debug("regLinePOST() 호출 - 라인수정"); logger.debug("lvo : "+lvo);
			 * 
			 * lineService.updateLine(lvo); }
			 */
		
		return "redirect:/production/line/lineList";
	}
	
	// 라인 삭제
	@RequestMapping(value = "/line/deleteLine")
	public String deleteLine(@RequestParam(value = "selectedLineId", required = false) Integer[] selectedLineIds) throws Exception {
		
		if(selectedLineIds != null) {
			for(Integer line_id : selectedLineIds) {
				lineService.deleteLine(line_id);
			
			}
		}
		
		return "redirect:/production/line/lineList";
	}
	
	// 라인 수정 팝업
	@RequestMapping(value = "/line/modifyPopup", method = RequestMethod.GET)
	public void modifyPopupGET() throws Exception {
		
		logger.debug("modifyPopupGET() 호출 - 라인 수정 GET");
	}
	
	// 라인 수정 팝업
	@RequestMapping(value = "/line/modifyPopup", method = RequestMethod.POST)
	public void modifyPopupPOST(LineVO lvo, @ModelAttribute("ls_rsns") String ls_rsns, @ModelAttribute("ls_yn") String ls_yn) throws Exception {
		
		logger.debug("modifyPopupPOST() 호출 - 라인 수정 처리");
		logger.debug("line_id : " + lvo.getLine_id() + ", use_yn : " + lvo.getUse_yn() + ", emp_id : " + lvo.getEmp_id());
		if(lvo.getUse_yn().equals("Y")) {
			lvo.setUse_yn("N");
		} else {
			lvo.setUse_yn("Y");
		}
		lineService.updateLine(lvo);
		
		LineShutdownVO lsvo = new LineShutdownVO();
		lsvo.setLine_id(lvo.getLine_id());
		lsvo.setLs_rsns(ls_rsns);
		lsvo.setLs_yn(ls_yn);
		lsvo.setEmp_id(lvo.getEmp_id());
		lineService.regLineShutdown(lsvo);
		
		logger.debug("라인 수정 정보 저장");
	}
	
	// 라인 수정 팝업
	@RequestMapping(value = "/line/lsPopup")
	public void getLsListPopupGET(Model model, @ModelAttribute("line_id") Integer line_id) throws Exception {
		
		logger.debug("getLsListPopupGET() 호출 - 라인 중지 내역 리스트");

		// 라인 가동중지 내역
		List<LineShutdownVO> lsList = lineService.getListLineShutdown(line_id);
		model.addAttribute("lsList", lsList);
	}
	
} // Controller