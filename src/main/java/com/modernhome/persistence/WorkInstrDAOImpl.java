package com.modernhome.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.modernhome.domain.WorkInstrVO;

@Repository
public class WorkInstrDAOImpl implements WorkInstrDAO {
	
	// 로거
	private static final Logger logger = LoggerFactory.getLogger(WorkInstrDAOImpl.class);
	
	// 네임스페이스
	private static final String NAMESPACE = "com.modernhome.mapper.WorkInstrMapper";
	
	// 의존성 주입
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public WorkInstrVO getInstr(int workId) throws Exception {
		logger.debug("WorkInstrDAOImpl_getInstr 실행");
		return sqlSession.selectOne(NAMESPACE + ".getInstr", workId);
	}

	@Override
	public List<WorkInstrVO> getInstrList() throws Exception {
		logger.debug("WorkInstrDAOImpl_getInstrList 실행");
		return sqlSession.selectList(NAMESPACE + ".getList");
	}

	@Override
	public void addInstr(WorkInstrVO vo) throws Exception {
		logger.debug("WorkInstrDAOImpl_addInstr() 실행");
		sqlSession.insert(NAMESPACE + ".", vo);
	}

}
