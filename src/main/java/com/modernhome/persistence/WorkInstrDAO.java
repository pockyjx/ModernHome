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
	
	// 작업지시 목록 조회
	public List<WijoinVO> getInstrList(String work_state, String pro_num, String startDate, String endDate) throws Exception;
	
	// 작업지시서를 작성하지 않은 수주 번호 출력
	public List<WijoinVO> getBeforeInstr() throws Exception;
	
	// 작업지시서를 작성하지 않은 수주번호와 관련된 작업지시서 내용 출력
	public List<WijoinVO> getBeforeInstrReq(String oo_num) throws Exception;
	
	// 작업지시번호 자동 생성
	public List<WijoinVO> createIdNum() throws Exception;
	
	// 작업지시 추가
	public void addInstr(WijoinVO vo) throws Exception;
	
	// 작업지시 추가
	public void modifyInstr(WijoinVO vo) throws Exception;
	
	// 작업지시 삭제
	public void deleteInstr(int work_id) throws Exception;
	
}