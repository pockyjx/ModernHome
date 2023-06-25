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
	
	// 소요량 등록
	@Override
	public void regRequirement(ReqJoinVO vo) {
		logger.debug("소요량 등록!");
		sqlSession.insert(NAMESPACE + ".regRequirement", vo);
		
		
	}

	// 소요량 수정
	@Override
	public void modifyRequirement(ReqJoinVO vo) {
		logger.debug("소요량 수정!");
		sqlSession.update(NAMESPACE + ".updateReq", vo);
	}
	
	// 소요량 삭제
	@Override
	public void deleteRequirement(int req_id) {
		logger.debug("소요량 삭제!");
		sqlSession.delete(NAMESPACE + ".delRequirement", req_id);
	}

	// 완제품 별 소요량 조회
	@Override
	public List<RequirementVO> getBOMList(int pro_id) {
		logger.debug(pro_id + "번 완제품 소요량 조회!");
		return sqlSession.selectList(NAMESPACE + ".getBOMList", pro_id);
	}
	
	

	
	
	

	

}
