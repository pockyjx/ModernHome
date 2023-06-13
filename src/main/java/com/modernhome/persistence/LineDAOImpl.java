package com.modernhome.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.modernhome.domain.LineVO;

@Repository
public class LineDAOImpl implements LineDAO {
	
	// 로거
	private static final Logger logger = LoggerFactory.getLogger(LineDAOImpl.class);
	
	// 네임스페이스
	private static final String NAMESPACE = "";
	
	// 의존성 주입
	@Inject
	private SqlSession sqlSession;
	
	// 라인 추가
	@Override
	public void addLine(LineVO vo) {
		
	}

}