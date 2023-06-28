package com.modernhome.persistence;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DefectiveDAOImpl implements DefectiveDAO {
	
	// 로거
	private static final Logger logger = LoggerFactory.getLogger(DefectiveDAOImpl.class);
	
	// 네임 스페이스
	private static final String NAMESPACE = "com.modernhome.mapper.DefectiveMapper";
	
	// 의존성 주입
	@Autowired
	private SqlSession sqlSession;
	
}