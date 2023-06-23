package com.modernhome.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.modernhome.domain.WijoinVO;
import com.modernhome.domain.WorkInstrVO;
import com.modernhome.persistence.WorkInstrDAO;

@Service
public class WorkInstrServiceImpl implements WorkInstrService {
	
	// 의존성 주입
	@Inject
	private WorkInstrDAO dao;
	
	@Override
	public List<WijoinVO> getInstr(WorkInstrVO wivo) throws Exception {
		return dao.getInstr(wivo);
	}

	@Override
	public List<WijoinVO> getInstrList() throws Exception {
		return dao.getInstrList();
	}

	@Override
	public List<WijoinVO> getInstrReq(WorkInstrVO wivo) throws Exception {
		return dao.getInstrReq(wivo);
	}

	@Override
	public List<WijoinVO> getInstrList(String work_state, String pro_num, String startDate, String endDate) throws Exception {
		return dao.getInstrList(work_state, pro_num, startDate, endDate);
	}

	@Override
	public List<WijoinVO> getBeforeInstr() throws Exception {
		return dao.getBeforeInstr();
	}

	@Override
	public List<WijoinVO> getBeforeInstrReq(String oo_num) throws Exception {
		return dao.getBeforeInstrReq(oo_num);
	}

	@Override
	public List<WijoinVO> createIdNum() throws Exception {
		return dao.createIdNum();
	}

	@Override
	public void addInstr(WijoinVO vo) throws Exception {
		dao.addInstr(vo);
	}

	@Override
	public void modifyInstr(WijoinVO vo) throws Exception {
		dao.modifyInstr(vo);
	}

	@Override
	public void deleteInstr(int work_id) throws Exception {
		dao.deleteInstr(work_id);
	}

}
