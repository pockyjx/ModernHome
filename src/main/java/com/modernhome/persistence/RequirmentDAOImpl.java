package com.modernhome.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.modernhome.domain.ReqJoinVO;
import com.modernhome.domain.RequirementVO;

@Repository
public class RequirmentDAOImpl implements RequirmentDAO {
	
	@Autowired
	private SqlSession sqlSession;

	private static final Logger logger = LoggerFactory.getLogger(RequirmentDAOImpl.class);
	private static final String NAMESPACE = "com.modernhome.mapper.RequirementMapper";

	// 소요량 목록 조회
	@Override
	public List<ReqJoinVO> getRequirements() {
		return sqlSession.selectList(NAMESPACE + ".getRequirements");
	}
	
	// 소요량 검색 결과
	@Override
	public List<ReqJoinVO> getReqSearch(String option, String search) {
		
		Map<String, Object> parameterMap = new HashMap();
		parameterMap.put("option", option);
		parameterMap.put("search", search);
		
		return sqlSession.selectList(NAMESPACE + ".reqSearch", parameterMap);
	}

	
	
	

	

}
