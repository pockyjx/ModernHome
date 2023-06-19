package com.modernhome.persistence;

import java.util.List;

import com.modernhome.domain.WijoinVO;
import com.modernhome.domain.WorkInstrVO;

public interface WorkInstrDAO {
	
	// 작업지시 목록 조회
	public List<WijoinVO> getInstrList() throws Exception;
	
	// 작업지시서 조회
	public List<WijoinVO> getInstr(WorkInstrVO wivo) throws Exception;
	
	// 작업지시서 - 원재료 조회
	public List<WijoinVO> getInstrReq(WorkInstrVO wivo) throws Exception;
	
	// 작업지시 추가
	public void addInstr(WorkInstrVO vo) throws Exception;
	
	// 작업지시 목록 조회
	public List<WijoinVO> getInstrList(String work_state, String pro_num, String startDate, String endDate) throws Exception;
	
}