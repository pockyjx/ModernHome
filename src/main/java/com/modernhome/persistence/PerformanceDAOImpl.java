package com.modernhome.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.modernhome.domain.PageVO;
import com.modernhome.domain.WijoinVO;

@Repository
public class PerformanceDAOImpl implements PerformanceDAO {
	
	// 로거
	private static final Logger logger = LoggerFactory.getLogger(PerformanceDAOImpl.class);

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
	public List<WijoinVO> getPrfrmList(PageVO vo) throws Exception {
		logger.debug("WP DAOImpl_getPrfrmList() 실행");
		return sqlSession.selectList(NAMESPACE + ".getPrfrmList");
	}

	@Override
	public String createPrfrmNum() throws Exception {
		logger.debug("WP DAOImpl_createPrfrmNum() 실행");
		return sqlSession.selectOne(NAMESPACE + ".createPrfrmNum");
	}

	@Override
	public void addPrfrm(WijoinVO vo) throws Exception {
		logger.debug("WP DAOImpl_addPrfrm() 실행");
		sqlSession.insert(NAMESPACE + ".addPrfrm", vo);
	}

	@Override
	public void modifyPrfrm(WijoinVO vo) throws Exception {
		logger.debug("WP DAOImpl_modifyPrfrm() 실행");
		sqlSession.update(NAMESPACE + ".modifyPrfrm", vo);
	}

	@Override
	public void deletePrfrm(WijoinVO vo) throws Exception {
		logger.debug("WP DAOImpl_deletePrfrm() 실행");
		sqlSession.delete(NAMESPACE + ".deletePrfrm", vo);
	}

	@Override
	public List<WijoinVO> getPrfrmList(String gb_yn, String work_num, String startDate, String endDate, PageVO vo) throws Exception {
		logger.debug("WP DAOImpl_getPrfrmList(검색) 실행");
		
		Map<String, Object> parameterMap = new HashMap<>();
		parameterMap.put("gb_yn", gb_yn);
		parameterMap.put("work_num", work_num);
		parameterMap.put("startDate", startDate);
		parameterMap.put("endDate", endDate);
		parameterMap.put("pageVO", vo);
		
		return sqlSession.selectList(NAMESPACE + ".listSearch", parameterMap);
	}

	@Override
	public void addPS(WijoinVO vo) throws Exception {
		logger.debug("WP DAOImpl_addPS() 실행");
		sqlSession.update(NAMESPACE + ".addPS", vo);
	}

	@Override
	public int getWpTotalCnt() throws Exception {
		logger.debug("WP DAOImpl_getWpTotalCnt() 실행");
		return sqlSession.selectOne(NAMESPACE + ".wpTotalCnt");
	}

	@Override
	public int getWpSearchCnt(String gb_yn, String work_num, String startDate, String endDate, PageVO vo) throws Exception {
		logger.debug("WP DAOImpl_getWpSearchCnt() 실행");

		Map<String, Object> parameterMap = new HashMap<>();
		parameterMap.put("gb_yn", gb_yn);
		parameterMap.put("work_num", work_num);
		parameterMap.put("startDate", startDate);
		parameterMap.put("endDate", endDate);
		parameterMap.put("pageVO", vo);
		
		return sqlSession.selectOne(NAMESPACE + ".wpSearchCnt", parameterMap);
	}
	
}