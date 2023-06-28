package com.modernhome.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.modernhome.domain.PageVO;
import com.modernhome.domain.WijoinVO;
import com.modernhome.persistence.DefectiveDAO;

@Service
public class DefectiveServiceImpl implements DefectiveService {
	
	private static final Logger logger = LoggerFactory.getLogger(DefectiveServiceImpl.class);
	
	// 의존성 주입
	@Autowired
	private DefectiveDAO dao;

	@Override
	public List<WijoinVO> getDefList(PageVO vo) throws Exception {
		logger.debug("defectiveServiceImpl - getDefList() 출력");
		return dao.getDefList(vo);
	}

	@Override
	public int getDfTotalCnt() throws Exception {
		logger.debug("defectiveServiceImpl - getDdfTotalCnt() 출력");
		return dao.getDfTotalCnt();
	}

	@Override
	public String creatDefNum() throws Exception {
		logger.debug("defectiveServiceImpl - creatDefNum() 출력");
		return dao.creatDefNum();
	}
	
}