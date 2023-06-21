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
	
	
	// 품질현황 추가(GET) - /quality/check/add
	
	// 품질현황 추가 처리(POST) - /quality/check/add
	
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
			logger.debug("검색어 O, 검색된 데이터만 출력");
			
			model.addAttribute("qualityList",qualityList);
		}else {
			
			logger.debug("검색어 X, 전체 데이터 출력");
			List<WijoinVO> qualityList = qService.getQualityList();
			model.addAttribute("qualityList",qualityList);
		}
		
	}// getQualityList
	
	
	
	// ===========================================
	
	
	// 불량 추가(GET) - /quality/defective/add
	
	// 불량 추가 처리(POST) - /quality/defective/add
	
	
	// 불량 리스트 조회(GET) - /quality/defective/list
	
	
	// 불량 수정(GET) - /quality/defective/modify
	
	// 불량 수정 처리(POST) - /quality/defective/modify
	
	
	// 불량 삭제(GET) - /quality/defective/delete
	
	// 불량 삭제 처리(POST) - /quality/defective/delete
	
}