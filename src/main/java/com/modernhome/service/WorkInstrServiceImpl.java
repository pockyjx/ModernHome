package com.modernhome.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.modernhome.domain.WorkInstrVO;
import com.modernhome.persistence.WorkInstrDAO;

@Service
public class WorkInstrServiceImpl implements WorkInstrService {
	
	// 의존성 주입
	@Inject
	private WorkInstrDAO dao;
	
	@Override
	public WorkInstrVO getInstr(int workId) {
		return dao.getInstr(workId);
	}

}
