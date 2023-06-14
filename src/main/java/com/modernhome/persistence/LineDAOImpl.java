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
	
	// 로거
	private static final Logger logger = LoggerFactory.getLogger(LineDAOImpl.class);
	
	// 네임스페이스
	private static final String NAMESPACE = "com.modernhome.mapper.LineMapper";
	
	// 의존성 주입
	@Inject
	private SqlSession sqlSession;

	@Override
	public List<LineVO> getLineList() {
		return sqlSession.selectList(NAMESPACE + ".getList");
	}

}