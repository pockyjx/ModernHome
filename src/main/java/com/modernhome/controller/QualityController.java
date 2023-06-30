package com.modernhome.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.modernhome.domain.PageMaker;
import com.modernhome.domain.PageVO;
import com.modernhome.domain.WijoinVO;
import com.modernhome.service.QualityService;

@Controller
@RequestMapping(value = "/production")
public class QualityController {
	
	private static final Logger logger = LoggerFactory.getLogger(QualityController.class);

	// ===========================================
	
	// 의존성 주입
	@Autowired
	private QualityService qService;
	
	// =========================================== 
		
	// http://localhost:8088/production/quality/qualitylist
	// 품질현황(완제품) 리스트 출력(GET) - /quality/qualitylist
	@RequestMapping(value = "/quality/qualitylist", method = RequestMethod.GET)  
	public void qualityGET(Model model, 
			@ModelAttribute(value = "qc_num") String qc_num, 
			@ModelAttribute(value = "startDate") String startDate, 
			@ModelAttribute(value = "endDate") String endDate, 
			@ModelAttribute(value = "qc_yn") String qc_yn,
			PageVO pvo) throws Exception {
		logger.debug(" qualityGET() 호출 ");
		
		PageMaker pm = new PageMaker();
		
		
		if(!qc_num.isEmpty() || !startDate.isEmpty() || !endDate.isEmpty() || !qc_yn.isEmpty()) {
			
			List<WijoinVO> qualityList = qService.getQualitySearch(qc_num, startDate, endDate ,qc_yn,pvo);

			logger.debug("검색어 O, 검색된 데이터만 출력");
			
			model.addAttribute("qualityList",qualityList);
			
			// 페이징 정보 전달
			pm.setPageVO(pvo);
			pm.setTotalCount(qService.getQualitySearchCnt(qc_num, startDate, endDate ,qc_yn));
			model.addAttribute("pm", pm);
			
			// 검색 정보 전달
			model.addAttribute("qc_num",qc_num);
			model.addAttribute("startDate",startDate);
			model.addAttribute("endDate",endDate);
			model.addAttribute("qc_yn",qc_yn);

		}else {
			
			logger.debug("검색어 X, 전체 데이터 출력");
			List<WijoinVO> qualityList = qService.getQualityList(pvo);
			model.addAttribute("qualityList",qualityList);
			
			pm.setPageVO(pvo);
			pm.setTotalCount(qService.getTotalCntQc());
	
			
			model.addAttribute("pm",pm);
	
		}
		
	}// QualityList
	
	// 품질 업데이트
	@RequestMapping(value="/quality/updateQuality", method = RequestMethod.POST)
	public String updateQualityPOST(WijoinVO wvo) throws Exception {
		
		logger.debug("updateQualityPOST() 호출(품질업데이트)");
		
		logger.debug("wvo : " + wvo);
		
		qService.updateQuality(wvo);

		return "redirect:/production/quality/qualitylist";
		
	}// updateQuality
	
	
	// ===========================================
	
	// http://localhost:8088/production/quality/materialQualityList
	// 품질현황(자재) 리스트 출력(GET) - /quality/materialQualityList
	@RequestMapping(value = "/quality/materialQualityList", method = RequestMethod.GET)
	public void materialQualityGET(Model model,
			@ModelAttribute(value = "qc_num") String qc_num,
			@ModelAttribute(value = "startDate") String startDate,
			@ModelAttribute(value = "endDate") String endDate,
			@ModelAttribute(value = "qc_yn") String qc_yn,
			PageVO pvo) throws Exception{
		logger.debug(" materialQualityGET() 호출 ");
		
		PageMaker pm = new PageMaker();
		
		// 검색어가 하나라도 있으면 if문 실행, 아닐 경우 else
		if(!qc_num.isEmpty() || !startDate.isEmpty() || !endDate.isEmpty() || !qc_yn.isEmpty()) {
			
			List<WijoinVO> materialQualityList = qService.getMaterialQualitySearch(qc_num, startDate, endDate, qc_yn, pvo);
			
			logger.debug("검색어 O, 검색된 데이터만 출력");
			
			model.addAttribute("materialQualityList",materialQualityList);
			
			// 페이징 정보 전달
			pm.setPageVO(pvo);
			pm.setTotalCount(qService.getMaterialQualitySearchCnt(qc_num, startDate, endDate, qc_yn));
			model.addAttribute("pm",pm);
			
			// 검색 정보 전달
			model.addAttribute("qc_num",qc_num);
			model.addAttribute("startDate",startDate);
			model.addAttribute("endDate",endDate);
			model.addAttribute("qc_yn",qc_yn);
			
			
		}else {
			
			logger.debug("검색어 X, 전체 데이터 출력");
			
			List<WijoinVO> materialQualityList = qService.getMaterialQualityList(pvo);
			
			model.addAttribute("materialQualityList",materialQualityList);
			
			
			pm.setPageVO(pvo);
			pm.setTotalCount(qService.getTotalCntMT());
			
			model.addAttribute("pm", pm);
		}
	}
	

	@RequestMapping(value = "/quality/updateMaterialQuality", method = RequestMethod.POST)
	public String updateMaterialQualityPOST(WijoinVO wvo) throws Exception{
		
		logger.debug("updateMaterialQualityPOST() 호출(품질업데이트)");
		
		logger.debug("wvo : " + wvo);
		
		qService.updateMaterialQuality(wvo);
		
		return "redirect:/production/quality/materialQualityList";
		
	}
	

	
	
	
	
} // Controller