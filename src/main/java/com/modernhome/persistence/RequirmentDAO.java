package com.modernhome.persistence;

import java.util.List;
import java.util.Map;

import com.modernhome.domain.RequirementVO;

public interface RequirmentDAO {

	// 소요량 조회
	public List<RequirementVO> getRequirements();
	
	// 소요량 검색 결과
	public List<RequirementVO> getReqSearch(String option, String search);
}
