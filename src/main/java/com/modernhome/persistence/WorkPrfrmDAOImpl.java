package com.modernhome.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.modernhome.domain.WijoinVO;

@Repository
public class WorkPrfrmDAOImpl implements WorkPrfrmDAO {
	
	// 로거
	private static final Logger logger = LoggerFactory.getLogger(WorkPrfrmDAOImpl.class);

	// 네임스페이스
	private static final String NAMESPACE = "com.modernhome.mapper.WorkPrfrmMapper";
	
	// 의존성 주입
	@Autowired
	private SqlSession sqlSession;

	@Override
	
	public List<WijoinVO> getqcEndInstr() throws Exception {
		logger.debug("WP DAOImpl_getqcEndInstr() 실행");
		return sqlSession.selectList(NAMESPACE + ".getqcEndInstr");
	}

	@Override
	public List<WijoinVO> getPrfrmList() throws Exception {
		logger.debug("WP DAOImpl_getPrfrmList() 실행");
		return sqlSession.selectList(NAMESPACE + ".getPrfrmList");
	}

	@Override
	public List<WijoinVO> createPrfrmNum() throws Exception {
		logger.debug("WP DAOImpl_createPrfrmNum() 실행");
		return sqlSession.selectList(NAMESPACE + ".createPrfrmNum");
	}
	
}