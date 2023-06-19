package com.modernhome.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.modernhome.domain.WijoinVO;
import com.modernhome.domain.WorkInstrVO;
import com.modernhome.persistence.WorkInstrDAO;

@Service
public class WorkInstrServiceImpl implements WorkInstrService {
	
	// 의존성 주입
	@Autowired
	private WorkInstrDAO dao;
	
	@Override
	public List<WorkInstrVO> getInstr(WorkInstrVO wivo) throws Exception {
		return dao.getInstr(wivo);
	}

	@Override
	public List<WorkInstrVO> getInstrList() throws Exception {
		return dao.getInstrList();
	}

	@Override
	public List<WijoinVO> getInstrReq(WorkInstrVO wivo) throws Exception {
		return dao.getInstrReq(wivo);
	}

	@Override
	public List<WorkInstrVO> getInstrList(WijoinVO wjvo) throws Exception {
		return dao.getInstrList(wjvo);
	}

}
