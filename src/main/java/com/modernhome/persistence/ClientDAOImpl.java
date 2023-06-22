package com.modernhome.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.modernhome.domain.ClientVO;

@Repository
public class ClientDAOImpl implements ClientDAO {
	
	@Inject
	private SqlSession sqlSession;

	private static final String NAMESPACE = "com.modernhome.mapper.ClientMapper";

	private static final Logger logger = LoggerFactory.getLogger(ClientDAOImpl.class);
	
	// 거래처조회
	@Override
	public List<ClientVO> clientList() {
		logger.debug("DAO -> mapper호출 -> SQL 실행(거러채조회)");
		
		return sqlSession.selectList(NAMESPACE+".clientList");
	}
	
	
	// 거래처조회 - 검색
	@Override
	public List<ClientVO> clientListSearch(ClientVO cvo) {
		logger.debug("DAO -> mapper호출 -> SQL 실행(거래처조회 - 검색된 데이터 출력)");
		
		return sqlSession.selectList(NAMESPACE + ".clientListSearch", cvo);
	}
	
	

}
