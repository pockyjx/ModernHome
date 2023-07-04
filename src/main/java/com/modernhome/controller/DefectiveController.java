package com.modernhome.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
			dfList = dfService.getDefList(df_type, nameSearch, line_num, pvo);
			
			// 페이징 정보 전달
			pm.setPageVO(pvo);
			pm.setTotalCount(dfService.getDfTotalCnt());
		} else {
			logger.debug("검색어 X. 전체 출력");
			dfList = dfService.getDefList(pvo);
			
			// 페이징 정보 전달
			pm.setPageVO(pvo);
			pm.setTotalCount(dfService.getDfTotalCnt());
		}
		
		// 불량코드 자동 생성
		List<WijoinVO> dfNum = dfService.creatDefNum();
		
		// 정보 전달
		model.addAttribute("dfList", dfList);
		model.addAttribute("dfNum", dfNum);
		model.addAttribute("pm", pm);
	}
	
	
	// ===========================================
	
	
	// 팝업창
	@RequestMapping(value = "/addPopup")
	public String getAddPopup(Model model) throws Exception {
		logger.debug("addPopup() 호출");
		
		// 품질검사 상태가 '완료'이면서 불량이 아직 등록되지 않은 작업지시 목록
		List<WijoinVO> wiList = dfService.getQcFinInstr();
		
		// 품질검사 상태가 '완료'이면서 불량이 아직 등록되지 않은 입고 목록
		List<WijoinVO> recList = dfService.getQcFinRec();
		
		// 정보 전달
		model.addAttribute("wiList", wiList);
		model.addAttribute("recList", recList);
		
		return "/production/defective/addPopup";
	}
	
	
	// ===========================================
	
	
	// 불량 등록 & 수정
	@RequestMapping(value = "/regDef")
	public String addDefective(WijoinVO vo) throws Exception {
		logger.debug("regDefective() 호출");
		logger.debug("#############################vo : {}", vo);
		
		if(vo.getDf_num() != null) {
			// 불량 등록
			dfService.addDefective(vo);
			// 불량 개수가 1개 이상인 자재(입고) -> 자재 입고수량 차감
			dfService.modifyRec(vo);
		} else {
			dfService.modifyDefective(vo);
			dfService.modifyRec(vo);
		}
		
		return "redirect:/production/defective/list";
	}
	
	
	// ===========================================
	
	
	// 불량 삭제
	@RequestMapping(value = "/delDef")
	public String delDefective(@RequestParam(value = "df_id", required = false) Integer[] df_id) throws Exception {
		logger.debug("delDefective() 호출");
		
		if(df_id != null) {
			for(int dfId : df_id) {
				dfService.delDefective(dfId);
			}
		}
		
		return "redirect:/production/defective/list";
	}
	
	
	// ===========================================
	
	
	// 수리 & 폐기 처리
	@RequestMapping(value = "/reAndDis", method = RequestMethod.GET)
	public void repairAndDiscardGET(WijoinVO vo, @ModelAttribute("rd") String rd) throws Exception {
		logger.debug("repairAndDiscardGET() 호출");
	}
	
	// 수리 & 폐기 처리
	@RequestMapping(value = "/reAndDis", method = RequestMethod.POST)
	public void repairAndDiscardPOST(WijoinVO vo, @ModelAttribute("rd") String rd) throws Exception {
		logger.debug("repairAndDiscardPOST() 호출");
		
		if(rd.equals("repair")) {
			// 수리한 완제품을 재고에 반영
			logger.debug("############수리############df_id : " + vo.getDf_id() + ", #################df_cnt : " + vo.getDf_cnt() + ", ###########emp_id : " + vo.getEmp_id());
			
			dfService.modifyReAndDis(vo);
			dfService.modifyDefective2(vo);
		} else {
			// 폐기한 완제품을 재고에서 삭제
			int discardCnt = vo.getDf_cnt() * -1;
			vo.setDf_cnt(discardCnt);
			logger.debug("############수리############df_id : " + vo.getDf_id() + ", #################df_cnt : " + vo.getDf_cnt() + ", ###########emp_id : " + vo.getEmp_id());
			
			dfService.modifyReAndDis(vo);
			dfService.modifyDefective2(vo);
		}
	}
	
}

