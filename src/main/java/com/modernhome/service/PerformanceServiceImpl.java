package com.modernhome.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.modernhome.domain.PageVO;
import com.modernhome.domain.WijoinVO;
import com.modernhome.persistence.PerformanceDAO;

@Service
public class PerformanceServiceImpl implements PerformanceService {
	
	// 의존성 주입
	@Autowired
	private PerformanceDAO dao;

	@Override
	public List<WijoinVO> getqcEndInstr() throws Exception {
		return dao.getqcEndInstr();
	}

	@Override
	public List<WijoinVO> getPrfrmList(PageVO vo) throws Exception {
		return dao.getPrfrmList(vo);
	}

	@Override
	public String createPrfrmNum() throws Exception {
		return dao.createPrfrmNum();
	}

	@Override
	public void addPrfrm(WijoinVO vo) throws Exception {
		dao.addPrfrm(vo);
	}

	@Override
	public void deletePrfrm(int prfrm_id) throws Exception {
		dao.deletePrfrm(prfrm_id);
	}

	@Override
	public List<WijoinVO> getPrfrmList(String gb_yn, String work_num, String startdate, String endDate, PageVO vo) throws Exception {
		return dao.getPrfrmList(gb_yn, work_num, startdate, endDate, vo);
	}

	@Override
	public void addPS(WijoinVO vo) throws Exception {
		dao.addPS(vo);
	}

	@Override
	public int getWpTotalCnt() throws Exception {
		return dao.getWpTotalCnt();
	}

	@Override
	public int getWpSearchCnt(String gb_yn, String work_num, String startdate, String endDate, PageVO vo) throws Exception {
		return dao.getWpSearchCnt(gb_yn, work_num, startdate, endDate, vo);
	}

	@Override
	public void modifyOoState(int prfrm_id) throws Exception {
		dao.modifyOoState(prfrm_id);
	}
	
}