package com.modernhome.service;

import java.util.List;

import com.modernhome.domain.WireqVO;
import com.modernhome.domain.WorkInstrVO;

public interface WorkInstrService {
	
	// 작업지시 목록 조회
	public List<WorkInstrVO> getInstrList() throws Exception;
	
	// 작업지시서 조회
	public List<WorkInstrVO> getInstr(WorkInstrVO wivo) throws Exception;
	
	// 작업지시서 - 원재료 출력
	public List<WireqVO> getInstrReq(WorkInstrVO wivo) throws Exception;
	
}