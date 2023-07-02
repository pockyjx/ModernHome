package com.modernhome.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.modernhome.domain.LineShutdownVO;
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
	public List<LineVO> getLineList() throws Exception {
		return dao.getLineList();
	}
	
	// 라인조회 + 검색
	@Override
	public List<LineVO> getLineListSearch(LineVO lvo) throws Exception {
		return dao.getLineListSearch(lvo);
	}

	// 라인등록
	@Override
	public void regLine(LineVO lvo) throws Exception {
		dao.regLine(lvo);
		
	}
	
	// 라인수정
	@Override
	public void updateLine(LineVO lvo) throws Exception {
		dao.updateLine(lvo);
		
	}
	

	// 라인삭제
	@Override
	public void deleteLine(int line_id) throws Exception {
		dao.deleteLine(line_id);
		
	}
	
	// 라인 수정 정보 저장
	@Override
	public void regLineShutdown(LineShutdownVO lsvo) throws Exception {
		dao.regLineShutdown(lsvo);
	}


} // LineServiceImpl