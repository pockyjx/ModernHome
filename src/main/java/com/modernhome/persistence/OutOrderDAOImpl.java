package com.modernhome.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.modernhome.domain.OutOrderJoinVO;
import com.modernhome.domain.OutOrderVO;

@Repository
public class OutOrderDAOImpl implements OutOrderDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESAPCE = "com.modernhome.mapper.OutOrderMapper";

	

	private static final Logger logger = LoggerFactory.getLogger(OutOrderDAOImpl.class);
	// 수주 조회
	@Override
	public List<OutOrderJoinVO> outOrderList() {
		logger.debug("DAO -> mapper 호출 -> SQL 실행 (수주조회)");
		
		return sqlSession.selectList(NAMESAPCE+".outOrderList");
	}

	// 수주조회(검색)
	@Override
	public List<OutOrderJoinVO> outOrderListSearch(OutOrderJoinVO ovo) {
		logger.debug("DAO - > mapper 호출 -> SQL 실행 (수주조회 - 검색된 데이터만 출력)");
		
		return sqlSession.selectList(NAMESAPCE+ ".outOrderListSearch", ovo);
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
		logger.debug("DAo -> 수주 수정");
		
		sqlSession.update(NAMESAPCE + ".updateOutOrder", ovo);
	}
	
	

}
