package com.modernhome.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.modernhome.domain.PageVO;
import com.modernhome.domain.WijoinVO;

@Repository
public class DefectiveDAOImpl implements DefectiveDAO {
	
	// 로거
	private static final Logger logger = LoggerFactory.getLogger(DefectiveDAOImpl.class);
	
	// 네임 스페이스
	private static final String NAMESPACE = "com.modernhome.mapper.DefectiveMapper";
	
	// 의존성 주입
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<WijoinVO> getDefList(PageVO vo) throws Exception {
		logger.debug("defeciveDAOImpl - getDefList() 실행");
		return sqlSession.selectList(NAMESPACE + ".getList", vo);
	}

	@Override
	public int getDfTotalCnt() throws Exception {
		logger.debug("defeciveDAOImpl - getDfTotalCnt() 실행");
		return sqlSession.selectOne(NAMESPACE + ".dfTotalCnt");
	}

	@Override
	public String creatDefNum() throws Exception {
		logger.debug("defeciveDAOImpl - creatDefNum() 실행");
		return sqlSession.selectOne(NAMESPACE + ".creatDefNum");
	}
	
}