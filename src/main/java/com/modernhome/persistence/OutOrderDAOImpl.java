package com.modernhome.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.modernhome.domain.OutOrderJoinVO;
import com.modernhome.domain.OutOrderResultVO;
import com.modernhome.domain.OutOrderVO;
import com.modernhome.domain.PageVO;

@Repository
public class OutOrderDAOImpl implements OutOrderDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESAPCE = "com.modernhome.mapper.OutOrderMapper";

	
	private static final Logger logger = LoggerFactory.getLogger(OutOrderDAOImpl.class);
	
	// 수주 전체수 계산
	@Override
	public int outOrderCnt() throws Exception {
		return sqlSession.selectOne(NAMESAPCE + ".outOrderCnt");
	}
	
	
	
	
	// 수주 조회
	@Override
	public List<OutOrderJoinVO> outOrderList(PageVO pvo) {
		logger.debug("DAO -> mapper 호출 -> SQL 실행 (수주조회)");
		
		return sqlSession.selectList(NAMESAPCE+".outOrderList", pvo);
	}
	
	
	
	
	
	
	// 수주 검색결과수 계산
	@Override
	public int ooSearchCnt(OutOrderJoinVO ovo) throws Exception {
		return sqlSession.selectOne(NAMESAPCE + ".ooSearchCnt", ovo);
	}




	// 수주조회(검색)
	@Override
	public List<OutOrderJoinVO> outOrderListSearch(OutOrderJoinVO ovo, PageVO pvo) {
		logger.debug("DAO - > mapper 호출 -> SQL 실행 (수주조회 - 검색된 데이터만 출력)");
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("ovo", ovo);
		paramMap.put("pvo", pvo);
		
		return sqlSession.selectList(NAMESAPCE + ".outOrderListSearch", paramMap);
	}

	
	
	
	
	
	
	
	
	// 수주 등록
	@Override
	public void regOutOrder(OutOrderVO ovo) {
		logger.debug("DAO -> mapper -> SQL 실행(수주 등록)");
		
		logger.debug("ovo : " + ovo);
		sqlSession.insert(NAMESAPCE + ".regOutOrder", ovo);
		
	}
	
	// 수주 삭제
	@Override
	public void deleteOutOrder(String oo_num) {
		logger.debug("DAO -> mapper -> SQL 실행 - 수주 삭제");
		
		logger.debug("oo_num : " + oo_num);
		sqlSession.delete(NAMESAPCE + ".deleteOutOrder", oo_num);
	}

	
	// 수주 수정
	@Override
	public void updateOutOrder(OutOrderVO ovo) {
		logger.debug("DAO -> 수주 수정");
		
		sqlSession.update(NAMESAPCE + ".updateOutOrder", ovo);
	}



	// 수주서
	@Override
	public OutOrderJoinVO outOrderContract(String oo_num) {
		logger.debug("DAO -> 수주서");
		
		return sqlSession.selectOne(NAMESAPCE + ".outOrderContract", oo_num);
	}




	
	// 월별 수주 건수, 금액
	@Override
	public List<OutOrderResultVO> monthlyOrderResult() {
		logger.debug("DAO -> 월별 수주 실적");
		
		return sqlSession.selectList(NAMESAPCE + ".monthlyOrderResult");
	}
	
	

}
