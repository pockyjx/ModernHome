package com.modernhome.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.modernhome.domain.LineVO;

@Repository
public class LineDAOImpl implements LineDAO {
	
	// 의존성 주입
	@Inject
	private SqlSession sqlSession;
	
	// 로거
	private static final Logger logger = LoggerFactory.getLogger(LineDAOImpl.class);
	
	// 네임스페이스
	private static final String NAMESPACE = "com.modernhome.mapper.LineMapper";

	@Override
	public List<LineVO> lineList() {
		logger.debug("DAO -> mapper호출 -> SQL 실행(라인조회");
		
		return sqlSession.selectList(NAMESPACE + ".lineList");
	}

	@Override
	public List<LineVO> lineListSearch(LineVO lvo) {
		logger.debug("DAO -> mapper호출 -> SQL 실행 (사원조회 - 검색된 데이터만 출력)");

		return sqlSession.selectList(NAMESPACE +  ".lineListSearch",lvo);
	}
	



}