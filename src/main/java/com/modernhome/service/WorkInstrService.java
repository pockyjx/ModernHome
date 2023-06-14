package com.modernhome.service;

import com.modernhome.domain.WorkInstrVO;

public interface WorkInstrService {
	
	// 작업지시서 조회
	public WorkInstrVO getInstr(int workId);
	
}