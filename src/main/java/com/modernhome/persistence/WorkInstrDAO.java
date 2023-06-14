package com.modernhome.persistence;

import java.util.List;

import com.modernhome.domain.WorkInstrVO;

public interface WorkInstrDAO {
	
	// 작업지시서 조회
	public WorkInstrVO getInstr(int workId);
	
	// 작업지시 목록 조회
	public List<WorkInstrVO> getInstrList();
	
}