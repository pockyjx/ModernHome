package com.modernhome.service;

import java.util.List;

import com.modernhome.domain.WorkInstrVO;

public interface WorkInstrService {
	
	// 작업지시서 조회
	public WorkInstrVO getInstr(int workId) throws Exception;
	
	// 작업지시 목록 조회
	public List<WorkInstrVO> getInstrList() throws Exception;
	
}