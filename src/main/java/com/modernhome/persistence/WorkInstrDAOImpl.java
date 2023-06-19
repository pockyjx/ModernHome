package com.modernhome.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.modernhome.domain.WijoinVO;
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
	public List<WijoinVO> getInstr(WorkInstrVO wivo) throws Exception {
		logger.debug("WorkInstrDAOImpl_getInstr 실행");
		return sqlSession.selectList(NAMESPACE + ".getInstr", wivo);
	}

	@Override
	public List<WijoinVO> getInstrList() throws Exception {
		logger.debug("WorkInstrDAOImpl_getInstrList 실행");
		return sqlSession.selectList(NAMESPACE + ".getList");
	}
	
	@Override
	public List<WijoinVO> getInstrReq(WorkInstrVO wivo) throws Exception {
		logger.debug("WorkInstrDAOImpl_getInstrReq() 실행");
		return sqlSession.selectList(NAMESPACE + ".getInstrReq", wivo);
	}

	@Override
	public void addInstr(WorkInstrVO vo) throws Exception {
		logger.debug("WorkInstrDAOImpl_addInstr() 실행");
		sqlSession.insert(NAMESPACE + ".", vo);
	}

	@Override
	public List<WijoinVO> getInstrList(String work_state, String pro_num, String startDate, String endDate) throws Exception {
		logger.debug("WorkInstrDAOImpl_getInstList(검색) 실행");
		
		Map<String, Object> parameterMap = new HashMap<>();
		parameterMap.put("work_state", work_state);
		parameterMap.put("pro_num", pro_num);
		parameterMap.put("startDate", startDate);
		parameterMap.put("endDate", endDate);
		
		return sqlSession.selectList(NAMESPACE + ".wiListSearch", parameterMap);
	}

	@Override
	public List<WijoinVO> getBeforeInstr() throws Exception {
		logger.debug("WorkInstrDAOImpl_getBeforeInstr() 실행");
		return sqlSession.selectList(NAMESPACE + ".getBeforeInstr");
	}

	@Override
	public List<WijoinVO> getBeforeInstrReq(String oo_num) throws Exception {
		logger.debug("WorkInstrDAOImpl_getBeforeInstrReq() 실행");
		return sqlSession.selectList(NAMESPACE + ".getBeforeInstrReq", oo_num);
	}

}
