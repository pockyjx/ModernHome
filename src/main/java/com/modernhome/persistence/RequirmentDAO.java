package com.modernhome.persistence;

import java.util.List;
import java.util.Map;

import com.modernhome.domain.RequirementVO;

public interface RequirmentDAO {

	// 소요량 조회
	public List<RequirementVO> getRequirements();
	
}
