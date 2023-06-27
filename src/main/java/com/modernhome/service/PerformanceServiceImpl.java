package com.modernhome.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public List<WijoinVO> getPrfrmList() throws Exception {
		return dao.getPrfrmList();
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
	public void modifyPrfrm(WijoinVO vo) throws Exception {
		dao.modifyPrfrm(vo);
	}

	@Override
	public void deletePrfrm(WijoinVO vo) throws Exception {
		dao.deletePrfrm(vo);
	}

	@Override
	public List<WijoinVO> getPrfrmList(String gb_yn, String work_num, String startdate, String endDate) throws Exception {
		return dao.getPrfrmList(gb_yn, work_num, startdate, endDate);
	}

	@Override
	public void addPS(WijoinVO vo) throws Exception {
		dao.addPS(vo);
	}
	
}