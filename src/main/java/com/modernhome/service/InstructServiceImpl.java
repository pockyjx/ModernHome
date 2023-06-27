package com.modernhome.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.modernhome.domain.PageVO;
import com.modernhome.domain.WijoinVO;
import com.modernhome.domain.WorkInstrVO;
import com.modernhome.persistence.InstructDAO;

@Service
public class InstructServiceImpl implements InstructService {
	
	// 의존성 주입
	@Inject
	private InstructDAO dao;
	
	@Override
	public List<WijoinVO> getInstr(WijoinVO wjvo) throws Exception {
		return dao.getInstr(wjvo);
	}

	@Override
	public List<WijoinVO> getInstrList(PageVO vo) throws Exception {
		return dao.getInstrList(vo);
	}

	@Override
	public List<WijoinVO> getInstrReq(WorkInstrVO wivo) throws Exception {
		return dao.getInstrReq(wivo);
	}

	@Override
	public List<WijoinVO> getInstrList(String work_state, String pro_num, String startDate, String endDate, PageVO vo) throws Exception {
		return dao.getInstrList(work_state, pro_num, startDate, endDate, vo);
	}

	@Override
	public List<WijoinVO> getBeforeInstr() throws Exception {
		return dao.getBeforeInstr();
	}

	@Override
	public List<WijoinVO> getBeforeInstrReq(WijoinVO wjvo) throws Exception {
		return dao.getBeforeInstrReq(wjvo);
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

	@Override
	public void addQC(WijoinVO vo) throws Exception {
		dao.addQC(vo);
	}

	@Override
	public int getWiTotalCnt() throws Exception {
		return dao.getWiTotalCnt();
	}

	@Override
	public int getWiSearchCnt(String work_state, String pro_num, String startDate, String endDate, PageVO vo) throws Exception {
		return dao.getWiSearchCnt(work_state, pro_num, startDate, endDate, vo);
	}

}
