package com.modernhome.service;

import java.util.List;

import com.modernhome.domain.RequirementVO;

public interface RequirmentService {
	
	// 소요량 목록 조회
	public List<RequirementVO> getListAll() throws Exception;
	
	// 소요량 검색 결과
	public List<RequirementVO> getReqSearch(String option, 
								String search) throws Exception;

}
