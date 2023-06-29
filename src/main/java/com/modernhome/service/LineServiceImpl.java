package com.modernhome.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.modernhome.domain.LineVO;
import com.modernhome.domain.PageVO;
import com.modernhome.persistence.LineDAO;

@Service
public class LineServiceImpl implements LineService {
	
	// 의존성 주입
	@Inject
	private LineDAO dao;

	// 라인조회 (페이징)
	@Override
	public List<LineVO> lineList(PageVO pvo) throws Exception {
		return dao.lineList(pvo);
	}
	
	// 라인 개수
	@Override
	public int getTotalCntMate() throws Exception {
		return dao.getTotalCntMate();
	}


	// 라인조회 + 검색
	@Override
	public List<LineVO> lineListSearch(LineVO lvo, PageVO pvo) throws Exception {
		return dao.lineListSearch(lvo,pvo);
	}
	
	// 라인 검색 결과 개수
	@Override
	public int getLineSearchCnt(LineVO lvo) throws Exception {
		return dao.getLineSearchCnt(lvo);
	}

	// 라인등록
	@Override
	public void regLine(LineVO lvo) {
		dao.regLine(lvo);
		
	}
	
	// 라인수정
	@Override
	public void updateLine(LineVO lvo) {
		dao.updateLine(lvo);
		
	}
	

	// 라인삭제
	@Override
	public void deleteLine(int line_id) {
		dao.deleteLine(line_id);
		
	}


} // LineServiceImpl