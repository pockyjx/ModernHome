package com.modernhome.persistence;

import java.util.List;

import com.modernhome.domain.PageVO;
import com.modernhome.domain.WijoinVO;
import com.modernhome.domain.WorkInstrVO;

public interface InstructDAO {
	
	// 작업지시 목록 조회
	public List<WijoinVO> getInstrList(PageVO vo) throws Exception;
	
	// 작업지시서 조회
	public List<WijoinVO> getInstr(WijoinVO wjvo) throws Exception;
	
	// 작업지시서 - 원재료 조회
	public List<WijoinVO> getInstrReq(WorkInstrVO wivo) throws Exception;
	
	// 작업지시 목록 조회
	public List<WijoinVO> getInstrList(String work_state, String pro_num, String startDate, String endDate, PageVO vo) throws Exception;
	
	// 작업지시서를 작성하지 않은 수주 번호 출력
	public List<WijoinVO> getBeforeInstr() throws Exception;
	
	// 작업지시서를 작성하지 않은 수주번호와 관련된 작업지시서 내용 출력
	public List<WijoinVO> getBeforeInstrReq(WijoinVO wjvo) throws Exception;
	
	// 작업지시번호 자동 생성
	public List<WijoinVO> createIdNum() throws Exception;
	
	// 작업지시 추가
	public void addInstr(WijoinVO vo) throws Exception;
	
	// 작업지시 추가
	public void modifyInstr(WijoinVO vo) throws Exception;
	
	// 작업지시 삭제
	public void deleteInstr(int work_id) throws Exception;
	
	// 작업지시 상태가 완료라면 품질검사 등록
	public void addQC(WijoinVO vo) throws Exception;
	
	// 작업지시 총 개수
	public int getWiTotalCnt() throws Exception;
	
	// 작업지시 검색 개수
	public int getWiSearchCnt(String work_state, String pro_num, String startDate, String endDate, PageVO vo) throws Exception;
	
}