package com.modernhome.persistence;

import java.util.List;

import com.modernhome.domain.LineShutdownVO;
import com.modernhome.domain.LineVO;
import com.modernhome.domain.PageVO;

public interface LineDAO {

	// 라인 목록 조회 (페이징)
	public List<LineVO> getLineList() throws Exception;
	
	// 라인조회 + 검색 (페이징)
	public List<LineVO> getLineListSearch(LineVO lvo) throws Exception;
	
	// 라인 등록
	public void regLine(LineVO lvo) throws Exception;
	
	// 라인수정
	public void updateLine(LineVO lvo) throws Exception;
	
	// 라인 삭제
	public void deleteLine(int line_id) throws Exception;
	
	// 라인 수정 정보 저장
	public void regLineShutdown(LineShutdownVO lsvo) throws Exception;
	
	// 특정 라인의 수정 이력 출력
	public List<LineShutdownVO> getListLineShutdown(Integer line_id) throws Exception;
	
} // LineDAO