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
	public List<WijoinVO> getInstr(WijoinVO wjvo) throws Exception {
		logger.debug("WorkInstrDAOImpl_getInstr 실행");
		return sqlSession.selectList(NAMESPACE + ".getInstr", wjvo);
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
	public List<WijoinVO> getBeforeInstrReq(WijoinVO wjvo) throws Exception {
		logger.debug("WorkInstrDAOImpl_getBeforeInstrReq() 실행");
		return sqlSession.selectList(NAMESPACE + ".getBeforeInstrReq", wjvo);
	}

	@Override
	public List<WijoinVO> createIdNum() throws Exception {
		logger.debug("WorkInstrDAOImpl_createWorkNum() 실행");
		return sqlSession.selectList(NAMESPACE + ".createIdNum");
	}
	
	@Override
	public void addInstr(WijoinVO vo) throws Exception {
		logger.debug("WorkInstrDAOImpl_addInstr() 실행");
		sqlSession.insert(NAMESPACE + ".addInstr", vo);
	}

	@Override
	public void modifyInstr(WijoinVO vo) throws Exception {
		logger.debug("WorkInstrDAOImpl_modifyInstr() 실행");
		sqlSession.update(NAMESPACE + ".modifyInstr", vo);
	}

	@Override
	public void deleteInstr(int work_id) throws Exception {
		logger.debug("WorkInstrDAOImpl_deleteInstr() 실행");
		sqlSession.delete(NAMESPACE + ".deleteInstr", work_id);
	}

	@Override
	public void addQC(WijoinVO vo) throws Exception {
		logger.debug("WorkInstrDAOImpl_addQC() 실행");
		sqlSession.insert(NAMESPACE + ".addQC", vo);
	}

}
