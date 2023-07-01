package com.modernhome.service;

import java.util.List;

import com.modernhome.domain.LineVO;
import com.modernhome.domain.PageVO;

public interface LineService {
	
	// 라인 목록 출력 (페이징)
	public List<LineVO> getLineList() throws Exception;
	
	// 라인조회 + 검색 (페이징)
	public List<LineVO> getLineListSearch(LineVO lvo) throws Exception;
	
	// 라인등록
	public void regLine(LineVO lvo);
	
	// 라인수정
	public void updateLine(LineVO lvo);
	
	// 라인삭제
	public void deleteLine(int line_id);
	

	
} // LineService