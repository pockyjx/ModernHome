package com.modernhome.service;

import java.util.List;

import com.modernhome.domain.WijoinVO;

public interface QualityService {
	
	// 품질현황 목록 조회
	public List<WijoinVO> getQualityList() throws Exception;
	
	// 품질현황 목록 조회 + 검색
	public List<WijoinVO> getQualitySearch(String qc_num, String startDate, String endDate, String qc_yn) throws Exception;
	
}
