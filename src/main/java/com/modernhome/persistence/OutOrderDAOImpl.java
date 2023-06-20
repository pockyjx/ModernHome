package com.modernhome.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.modernhome.domain.OutOrderVO;

@Repository
public class OutOrderDAOImpl implements OutOrderDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESAPCE = "com.modernhome.mapper.OutOrderMapper";

	

	private static final Logger logger = LoggerFactory.getLogger(OutOrderDAOImpl.class);
	// 수주 조회
	@Override
	public List<OutOrderVO> outOrderList() {
		logger.debug("DAO -> mapper 호출 -> SQL 실행 (수주조회)");
		
		return sqlSession.selectList(NAMESAPCE+".outOrderList");
	}

	// 수주조회(검색)
	@Override
	public List<OutOrderVO> outOrderListSearch(OutOrderVO ovo) {
		logger.debug("DAO - > mapper 호출 -> SQL 실행 (수주조회 - 검색된 데이터만 출력)");
		
		return sqlSession.selectList(NAMESAPCE+ ".outOrderListSearch", ovo);
	}
	
	

}
