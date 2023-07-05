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
import com.modernhome.domain.ReqJoinVO;
import com.modernhome.domain.RequirementVO;

@Repository
public class RequirmentDAOImpl implements RequirmentDAO {
	
	@Autowired
	private SqlSession sqlSession;

	private static final Logger logger = LoggerFactory.getLogger(RequirmentDAOImpl.class);
	private static final String NAMESPACE = "com.modernhome.mapper.RequirementMapper";

	// 소요량 목록 조회 (페이징)
	@Override
	public List<ReqJoinVO> getRequirements(PageVO vo) {
		logger.debug("소요량 목록 (페이징) 조회!");
		logger.debug(vo + "");
		return sqlSession.selectList(NAMESPACE + ".getRequirements", vo);
	}
	
	// 전체 글 개수 (페이징)
	@Override
	public int getReqTotalCnt() throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".reqTotalCnt");
	}
	
	// 소요량 검색 결과 (페이징)
	@Override
	public List<ReqJoinVO> getReqSearch(String option, String search, PageVO vo) {
		
		Map<String, Object> parameterMap = new HashMap();
		parameterMap.put("option", option);
		parameterMap.put("search", search);
		parameterMap.put("pageVO", vo);
		
		return sqlSession.selectList(NAMESPACE + ".reqSearch", parameterMap);
	}
	
	// 검색 결과 개수 (페이징)
	@Override
	public int getReqSearchCnt(String option, String search) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("option", option);
		paramMap.put("search", search);
		
		return sqlSession.selectOne(NAMESPACE + ".reqSearchCnt", paramMap);
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
	public List<ReqJoinVO> getBOMList(String pro_num) {
		logger.debug(pro_num + "번 완제품 소요량 조회!");
		return sqlSession.selectList(NAMESPACE + ".getBOMList", pro_num);
	}

	
	

	
	
	

	

}
