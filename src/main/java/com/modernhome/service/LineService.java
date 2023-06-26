package com.modernhome.service;

import java.util.List;

import com.modernhome.domain.LineVO;

public interface LineService {
	
	// 라인 목록 출력
	public List<LineVO> lineList();
	
	// 라인조회 + 검색
	public List<LineVO> lineListSearch(LineVO lvo);
	
	// 라인등록
	public void regLine(LineVO lvo);
	
	// 라인수정
	public void updateLine(LineVO lvo);
	
	// 라인삭제
	public void deleteLine(int line_id);
	

	
}