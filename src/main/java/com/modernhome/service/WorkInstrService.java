package com.modernhome.service;

import java.util.List;

import com.modernhome.domain.WijoinVO;
import com.modernhome.domain.WorkInstrVO;

public interface WorkInstrService {
	
	// 작업지시 목록 조회
	public List<WijoinVO> getInstrList() throws Exception;
	
	// 작업지시서 조회
	public List<WijoinVO> getInstr(WorkInstrVO wivo) throws Exception;
	
	// 작업지시서 - 원재료 출력
	public List<WijoinVO> getInstrReq(WorkInstrVO wivo) throws Exception;
	
	// 작업지시 목록 조회 + 검색
	public List<WijoinVO> getInstrList(String work_state, String pro_num, String startDate, String endDate) throws Exception;
	
}