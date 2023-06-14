package com.modernhome.persistence;

import java.util.List;

import com.modernhome.domain.LineVO;

public interface LineDAO {
	
	// 라인 목록 조회
	public List<LineVO> getLineList();
	
}