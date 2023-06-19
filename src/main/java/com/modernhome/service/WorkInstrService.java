package com.modernhome.service;

import java.util.List;

import com.modernhome.domain.WorkInstrVO;

public interface WorkInstrService {
	
	// 작업지시 목록 조회
	public List<WorkInstrVO> getInstrList() throws Exception;
	
	// 작업지시서 조회
	public List<WorkInstrVO> getInstr(Integer work_id) throws Exception;
	
	// 작업지시서 - 원재료 출력
	public List<WorkInstrVO> getInstrReq(WorkInstrVO wivo) throws Exception;
	
}