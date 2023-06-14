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

	@Override
	public List<LineVO> getLineList() {
		return dao.getLineList();
	}
	
}