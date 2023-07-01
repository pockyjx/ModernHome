package com.modernhome.persistence;

import java.util.List;

import com.modernhome.domain.LineVO;
import com.modernhome.domain.PageVO;

public interface LineDAO {
	
	// 라인 목록 조회 (페이징)
	public List<LineVO> getLineList(PageVO pvo) throws Exception;
	
	// 라인 개수
	public int getTotalCntLine() throws Exception;
	
	// 라인조회 + 검색 (페이징)
	public List<LineVO> getLineListSearch(LineVO lvo, PageVO pvo) throws Exception;
	
	// 라인 검색 결과 개수(페이징)
	public int getLineSearchCnt(LineVO lvo) throws Exception;
	
	// 라인 등록
	public void regLine(LineVO lvo);
	
	// 라인수정
	public void updateLine(LineVO lvo);
	
	// 라인 삭제
	public void deleteLine(int line_id);
	
}