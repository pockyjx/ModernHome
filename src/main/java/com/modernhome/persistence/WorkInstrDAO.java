package com.modernhome.persistence;

import com.modernhome.domain.WorkInstrVO;

public interface WorkInstrDAO {
	
	// 작업지시 조회
	public WorkInstrVO getInstr(int workId);
	
}