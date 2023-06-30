package com.modernhome.service;

import java.util.List;

import com.modernhome.domain.LineVO;
import com.modernhome.domain.PageVO;

public interface LineService {
	
	// 라인 목록 출력 (페이징)
	public List<LineVO> getLineList(PageVO pvo) throws Exception;
	
	// 라인 개수 (페이징)
	public int getTotalCntLine() throws Exception;
	
	// 라인조회 + 검색 (페이징)
	public List<LineVO> getLineListSearch(LineVO lvo, PageVO pvo) throws Exception;
	
	// 검색 결과 개수(페이징)
	public int getLineSearchCnt(LineVO lvo) throws Exception;
	
	// 라인등록
	public void regLine(LineVO lvo);
	
	// 라인수정
	public void updateLine(LineVO lvo);
	
	// 라인삭제
	public void deleteLine(int line_id);
	

	
}