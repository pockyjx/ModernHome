package com.modernhome.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.modernhome.domain.EmployeeVO;

@Repository
public class EmployeeDAOImpl implements EmployeeDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.modernhome.mapper.EmployeeMapper";
	
	
	private static final Logger logger = LoggerFactory.getLogger(EmployeeDAOImpl.class);
	
	// 사원조회
	@Override
	public List<EmployeeVO> employeeList() {
		logger.debug("DAO -> mapper호출 -> SQL 실행 (사원조회)");
		
		return sqlSession.selectList(NAMESPACE + ".employeeList");
	}

	@Override
	public List<EmployeeVO> employeeListSearch(EmployeeVO evo) {
		logger.debug("DAO -> mapper호출 -> SQL 실행 (사원조회 - 검색된 데이터만 출력)");
		
		return sqlSession.selectList(NAMESPACE + ".employeeListSearch", evo);
	}
	
	
	
	
	
}
