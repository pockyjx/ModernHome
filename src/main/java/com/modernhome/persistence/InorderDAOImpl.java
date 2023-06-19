package com.modernhome.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.modernhome.domain.InorderVO;

@Repository
public class InorderDAOImpl implements InorderDAO {
	
	// 의존성 주입
	@Inject
	private SqlSession sqlSession;
	
	// 네임스페이스
	private static final String NAMESPACE = "com.modernhome.mapper.inorderMapper";
	
	private static final Logger logger
				= LoggerFactory.getLogger(InorderDAOImpl.class);
	
	// 발주 조회
	@Override
	public List<InorderVO> getInorderList() {
		return sqlSession.selectList(NAMESPACE + ".getInorderList");
	}

	@Override
	public List<InorderVO> getInorderSearch(String startDate, String endDate, String ma_name, String io_state) {
		
		Map<String, Object> parameterMap = new HashMap();
		parameterMap.put("startDate", startDate);
		parameterMap.put("endDate", endDate);
		parameterMap.put("ma_name", ma_name);
		parameterMap.put("io_state", io_state);
		
		return sqlSession.selectList(NAMESPACE + ".inorderSearch" ,parameterMap);
	}
	
	
}
