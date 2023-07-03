package com.modernhome.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.modernhome.domain.MaterialReleaseVO;
import com.modernhome.domain.PageMaker;
import com.modernhome.domain.PageVO;
import com.modernhome.domain.ProductReleaseVO;
import com.modernhome.domain.WijoinVO;
import com.modernhome.service.InstructService;
import com.modernhome.service.ReleaseService;

@Controller
@RequestMapping(value = "/release/*")
public class ReleaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReleaseController.class);
	
	@Autowired
	ReleaseService rService;
	
	@Autowired
	InstructService iService;
	
	// http://localhost:8088/release/materialRelease
	@RequestMapping(value = "/materialRelease")
	public void materialRelease(Model model,
			@ModelAttribute(value = "startDate") String startDate, 
    		@ModelAttribute(value = "endDate") String endDate,
    		@ModelAttribute(value = "ma_nameSearch") String ma_name,
    		@ModelAttribute(value = "mr_numSearch") String mr_num, 
    		PageVO vo
			) throws Exception {
		
		List<MaterialReleaseVO> releaseList;
		PageMaker pm = new PageMaker();
		
		if (!startDate.isEmpty() || !endDate.isEmpty() || !ma_name.isEmpty() || !mr_num.isEmpty()) {
			
			releaseList = rService.getMaterialReleaseList(startDate, endDate, ma_name, mr_num, vo);
			model.addAttribute("mtReleaseList", releaseList);
			
			// 페이징 정보 전달
    		pm.setPageVO(vo);
    		pm.setTotalCount(rService.getMrSearchCnt(startDate, endDate, ma_name, mr_num));
    		model.addAttribute("pm", pm);
    		
    		// 검색 정보 전달
    		model.addAttribute("startDate", startDate);
    		model.addAttribute("endDate", endDate);
    		model.addAttribute("ma_name", ma_name);
    		model.addAttribute("mr_num", mr_num);
			
		}else {
			releaseList = rService.getMaterialReleaseList(vo);
			model.addAttribute("mtReleaseList", releaseList);
			
			// 페이징 정보 전달
    		pm.setPageVO(vo);
    		pm.setTotalCount(rService.getMrSearchCnt(startDate, endDate, ma_name, mr_num));
    		model.addAttribute("pm", pm);
    		
		}
	}
	
	@RequestMapping(value = "/regMTRelease", method = RequestMethod.POST)
	public String regMTReleasePOST(MaterialReleaseVO vo) throws Exception {
		logger.debug("regMTReleasePOST() 호출!");
		
		logger.debug("제품 출고 정보 등록!");
		logger.debug(vo+"");
		rService.regMaterialRelease(vo);
		
		return "redirect:/release/materialRelease";
	}

	@RequestMapping(value = "/delMTRelease")
	public String delMTRelease(@RequestParam(value = "selectedId", required = false) Integer[] selectedIds) throws Exception {
		logger.debug("delMTRelease() 호출!");
		logger.debug(selectedIds+"");
		
		if(selectedIds != null) {
			for(Integer mr_id : selectedIds) {
				rService.delMaterialRelease(mr_id);
			}
		}
		
		return "redirect:/release/materialRelease";
	}
	
	@RequestMapping(value = "/addPopup", method = RequestMethod.GET )
	public String popUpGET(Model model, @ModelAttribute("txt") String txt, @RequestParam(value="mapro_id", required = false) Integer mapro_id) throws Exception {
		logger.debug("popUpProductGET() 호출!");
		
		if(txt.equals("pro")) {
			model.addAttribute("list", rService.getOutorderInfo());
		}else if(txt.equals("ps")) {
			model.addAttribute("vo", rService.getProductStock(mapro_id));
		}else if(txt.equals("ma")) {
			model.addAttribute("list", rService.getWorkInstrInfo());
		}else if(txt.equals("ms")) {
			model.addAttribute("vo", rService.getMaterialStock(mapro_id));
		}
		return "/release/popUpRelease";		
	}
	
	// http://localhost:8088/release/productRelease
	@RequestMapping(value = "/productRelease")
	public void productRelease(Model model,
			@ModelAttribute(value = "startDate") String startDate, 
    		@ModelAttribute(value = "endDate") String endDate,
    		@ModelAttribute(value = "pr_numSearch") String pr_numSearch,
    		@ModelAttribute(value = "pro_nameSearch") String pro_nameSearch, 
    		PageVO vo
			) throws Exception {
		
		List<ProductReleaseVO> releaseList;
		PageMaker pm = new PageMaker();
		
		if (!startDate.isEmpty() || !endDate.isEmpty() || !pr_numSearch.isEmpty() || !pro_nameSearch.isEmpty()) {
			
			releaseList = rService.getProductReleaseList(startDate, endDate, pro_nameSearch, pr_numSearch, vo);
			model.addAttribute("prReleaseList", releaseList);
			
			// 페이징 정보 전달
    		pm.setPageVO(vo);
    		pm.setTotalCount(rService.getPrSearchCnt(startDate, endDate, pro_nameSearch, pr_numSearch));
    		model.addAttribute("pm", pm);
    		
    		// 검색 정보 전달
    		model.addAttribute("startDate", startDate);
    		model.addAttribute("endDate", endDate);
    		model.addAttribute("pro_nameSearch", pro_nameSearch);
    		model.addAttribute("pr_numSearch", pr_numSearch);

    		
		}else {
			releaseList = rService.getProductReleaseList(vo);
			model.addAttribute("prReleaseList", releaseList);
			
			// 페이징 정보 전달
    		pm.setPageVO(vo);
    		pm.setTotalCount(rService.getTotalCntPr());
    		model.addAttribute("pm", pm);
			
		}
			
			
		
	}
	
	@RequestMapping(value = "/regPRRelease")
	public String regPRReleasePOST(ProductReleaseVO vo) throws Exception {
		logger.debug("regPRReleasePOST() 호출!");
		logger.debug("제품 출고 정보 등록!");
		logger.debug(vo+"");
		rService.regProductRelease(vo);
		
		return "redirect:/release/productRelease";
	}
	
	// 자재 삭제
	@RequestMapping(value = "/delPRRelease")
	public String deletePRReleasePOST(@RequestParam(value = "selectedId", required = false) Integer[] selectedIds) throws Exception {
		logger.debug("deletePRReleasePOST() 호출!");
		logger.debug(selectedIds+"");
		
		if(selectedIds != null) {
			for(Integer pr_id : selectedIds) {
				rService.delProductRelease(pr_id);
			}
		}
		
		return "redirect:/release/productRelease";
	}
	
	// 출고 처리
	@RequestMapping(value = "/acceptRelease")
	public String acceptRelease(
			@RequestParam(value = "txt", required = false)String txt,
			@RequestParam(value = "release_id", required = false)Integer release_id,
			@RequestParam(value = "mapro_id", required = false)Integer mapro_id,
			@RequestParam(value = "release_cnt", required = false)Integer release_cnt, 
			@RequestParam(value = "work_id", required = false) Integer work_id
			) throws Exception {
		logger.debug(release_id+"");
		if(txt.equals("mr")) {
			logger.debug(" C: 자재 출고 처리!");
			rService.acceptMR(release_id, mapro_id, release_cnt);
			
			WijoinVO wvo = new WijoinVO();
			wvo.setWork_id(work_id);
			iService.modifyInstrMrState(wvo);
			
			return "redirect:/release/materialRelease";
			
		}else if(txt.equals("pr")) {
			logger.debug(" C: 제품 출고 처리!");
			rService.acceptPR(release_id, mapro_id, release_cnt);
			return "redirect:/release/productRelease";
		}
		return "/";
	}
	
	// 출고 대기
	@RequestMapping(value = "/waitingRelease", method = RequestMethod.GET)
	public String waitingRelease(
			@RequestParam(value = "txt", required = false) String txt, 
			@RequestParam(value = "rel_id", required = false) Integer rel_id) throws Exception {
		
		if(txt.equals("mr")) {
			logger.debug("자재 출고 대기 처리!");
			rService.waitingMR(rel_id);
			return "redirect:/release/materialRelease";
		}else if(txt.equals("pr")) {
			logger.debug("완제품 출고 대기 처리!");
			rService.waitingPR(rel_id);
			return "redirect:/release/productRelease";
		}
		
		return "/";
		
	}
	
}
