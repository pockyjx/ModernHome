package com.modernhome.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.modernhome.domain.WijoinVO;
import com.modernhome.persistence.WorkPrfrmDAO;

@Service
public class WorkPrfrmServiceImpl implements WorkPrfrmService {
	
	// 의존성 주입
	@Autowired
	private WorkPrfrmDAO dao;

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
	
}