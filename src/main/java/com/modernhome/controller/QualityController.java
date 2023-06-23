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
	// 품질현황 리스트 출력(GET) - /quality/qualitylist
	@RequestMapping(value = "/quality/qualitylist", method = RequestMethod.GET)
	public void qualityGET(Model model, 
			@ModelAttribute(value = "qc_num") String qc_num, 
			@ModelAttribute(value = "startDate") String startDate, 
			@ModelAttribute(value = "endDate") String endDate, 
			@ModelAttribute(value = "qc_yn") String qc_yn) 
					throws Exception {
		logger.debug(" qualityGET() 호출 ");
		
		
		if(!qc_num.isEmpty() || !startDate.isEmpty() || !endDate.isEmpty() || !qc_yn.isEmpty()) {
			
			List<WijoinVO> qualityList = qService.getQualitySearch(qc_num, startDate, endDate ,qc_yn);
			List<WijoinVO> materialQualityList = qService.getMaterialQualitySearch(qc_num, startDate, endDate ,qc_yn);
			logger.debug("검색어 O, 검색된 데이터만 출력");
			
			model.addAttribute("qualityList",qualityList);
			model.addAttribute("materialQualityList",materialQualityList);
		}else {
			
			logger.debug("검색어 X, 전체 데이터 출력");
			List<WijoinVO> qualityList = qService.getQualityList();
			List<WijoinVO> materialQualityList = qService.getMaterialQualityList();
			
			model.addAttribute("qualityList",qualityList);
			model.addAttribute("materialQualityList",materialQualityList);
		}
		
	}// QualityList
	
	// 품질등록, 품질 업데이트
	@RequestMapping(value="/quality/updateQuality", method = RequestMethod.POST)
	public String updateQualityPOST(WijoinVO wvo) throws Exception {
		
		logger.debug("updateQualityPOST() 호출(품질업데이트)");
		
		logger.debug("wvo : " + wvo);
		
		qService.updateQuality(wvo);
		qService.updateMaterialQuality(wvo);

			
		return "redirect:/production/quality/qualitylist";
		
	}// updateQuality
	
	
	// ===========================================
//@RequestMapping(value = "/quality/materialQualitylist", method = RequestMethod.GET)
//	public void materialQualityGET(Model model,
//			@ModelAttribute(value = "qc_num") String qc_num,
//			@ModelAttribute(value = "startDate") String startDate,
//			@ModelAttribute(value = "endDate") String endDate,
//			@ModelAttribute(value = "qc_yn") String qc_yn)
//					throws Exception{
//		logger.debug(" materialQualityGET() 호출 ");
//		
//		if(!qc_num.isEmpty() || !startDate.isEmpty() || !endDate.isEmpty() || !qc_yn.isEmpty()) {
//			
//			logger.debug("검색어 O, 검색된 데이터만 출력");
//			
//		}else {
//			
//			logger.debug("검색어 X, 전체 데이터 출력");
//		}
//	}

	

	
	
	
	
} // Controller