package com.modernhome.persistence;

import com.modernhome.domain.LineVO;

public interface LineDAO {
	
	// 라인 생성
	public void addLine(LineVO vo);
	
}