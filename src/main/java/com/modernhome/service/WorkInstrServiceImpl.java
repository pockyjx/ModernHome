package com.modernhome.service;

import java.util.List;

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
	public WorkInstrVO getInstr(int workId) throws Exception {
		return dao.getInstr(workId);
	}

	@Override
	public List<WorkInstrVO> getInstrList() throws Exception {
		return dao.getInstrList();
	}

}
