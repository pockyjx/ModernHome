package com.modernhome.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.modernhome.domain.PageMaker;
import com.modernhome.domain.PageVO;
import com.modernhome.domain.WijoinVO;
import com.modernhome.service.DefectiveService;

@Controller
@RequestMapping(value = "/production/defective")
public class DefectiveController {
	
	private static final Logger logger = LoggerFactory.getLogger(DefectiveController.class);
	
	// ===========================================
	
	
	// 의존성 주입
	@Autowired
	private DefectiveService dfService;
	
	
	// ===========================================
	
	
	// http://localhost:8088/production/defective/list
	// 불량 목록 출력 (+ 검색)
	@RequestMapping(value = "/list")
	public void getDefList(Model model, WijoinVO wjvo, PageVO pvo, 
			@ModelAttribute(value = "df_type") String df_type, @ModelAttribute(value = "nameSearch") String nameSearch, 
			@ModelAttribute(value = "line_num") String line_num) throws Exception {
		logger.debug("getDefList() 호출");
		
		PageMaker pm = new PageMaker();
		
		// 불량 목록
		List<WijoinVO> dfList = null;
		
		if(df_type != null || nameSearch != null || line_num != null) {
			logger.debug("검색어 O");
			
			// ===============임시로 전체 출력
			dfList = dfService.getDefList(pvo);
			
			// 페이징 정보 전달
			pm.setPageVO(pvo);
			pm.setTotalCount(dfService.getDfTotalCnt());
			// ===============임시로 전체 출력
		} else {
			logger.debug("검색어 X. 전체 출력");
			dfList = dfService.getDefList(pvo);
			
			// 페이징 정보 전달
			pm.setPageVO(pvo);
			pm.setTotalCount(dfService.getDfTotalCnt());
		}
		
		// 불량코드 자동 생성
		String dfNum = dfService.creatDefNum();
		
		// 정보 전달
		model.addAttribute("dfList", dfList);
		model.addAttribute("dfNum", dfNum);
		model.addAttribute("pm", pm);
	}
	
	
	// ===========================================
	
	
	// 불량 등록 & 수정
	
	
	// ===========================================
	
	
	// 불량 삭제	
	
}