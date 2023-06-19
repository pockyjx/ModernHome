package com.modernhome.persistence;

import java.util.List;

import com.modernhome.domain.LineVO;

public interface LineDAO {
	
	// 라인 목록 조회
	public List<LineVO> lineList();
	
	// 라인조회 + 검색
	public List<LineVO> lineListSearch(LineVO lvo);
	
	// 라인 등록
	public void regLine(LineVO lvo);
	
	// 라인 삭제
	public void deleteLine(int emp_id);
	
}