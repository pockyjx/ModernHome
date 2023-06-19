package com.modernhome.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.modernhome.domain.LineVO;
import com.modernhome.persistence.LineDAO;

@Service
public class LineServiceImpl implements LineService {
	
	// 의존성 주입
	@Inject
	private LineDAO dao;

	// 라인조회
	@Override
	public List<LineVO> lineList() {
		return dao.lineList();
	}

	// 라인조회 + 검색
	@Override
	public List<LineVO> lineListSearch(LineVO lvo) {
		return dao.lineListSearch(lvo);
	}

	// 라인등록
	@Override
	public void regLine(LineVO lvo) {
		dao.regLine(lvo);
		
	}

	// 라인삭제
	@Override
	public void deleteLine(int emp_id) {
		dao.deleteLine(emp_id);
		
	}


} // LineServiceImpl