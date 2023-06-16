package com.modernhome.persistence;

import java.util.List;

import com.modernhome.domain.WorkInstrVO;

public interface WorkInstrDAO {
	
	// 작업지시서 조회
	public List<WorkInstrVO> getInstr(int work_id) throws Exception;
	
	// 작업지시 목록 조회
	public List<WorkInstrVO> getInstrList() throws Exception;
	
	// 작업지시 추가
	public void addInstr(WorkInstrVO vo) throws Exception;
	
}