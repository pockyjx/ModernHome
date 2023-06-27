package com.modernhome.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.modernhome.domain.ClientVO;
import com.modernhome.domain.PageVO;

@Repository
public class ClientDAOImpl implements ClientDAO {
	
	@Inject
	private SqlSession sqlSession;

	private static final String NAMESPACE = "com.modernhome.mapper.ClientMapper";

	private static final Logger logger = LoggerFactory.getLogger(ClientDAOImpl.class);
	
	
	// 거래처조회 - 검색
	@Override
	public List<ClientVO> clientListSearch(ClientVO cvo) {
		logger.debug("DAO -> mapper호출 -> SQL 실행(거래처조회 - 검색된 데이터 출력)");
		
		return sqlSession.selectList(NAMESPACE + ".clientListSearch", cvo);
	}

	

	// 거래처 등록
	@Override
	public void regClient(ClientVO cvo) {
		logger.debug("DAO -> mapper호출 -> SQL 실행 (거래처등록)");
		
		sqlSession.insert(NAMESPACE + ".regClient", cvo);  
		
	}

	// 거래처 삭제
	@Override
	public void deleteClient(String clt_num) {
		logger.debug("DAO -> mapper호출 -> SQL 실행(거래처삭제)");
		
		sqlSession.delete(NAMESPACE + ".deleteClient", clt_num);
		
	}

	// 거래처 수정
	@Override
	public void updateClient(ClientVO cvo) {
		logger.debug("DAO -> mapper호출 -> SQL 실행(거래처업데이트)");
		
		sqlSession.update(NAMESPACE + ".updateClient", cvo);
		
	}


	// 거래처 목록 조회 (페이징)
	@Override
	public List<ClientVO> getClientList(PageVO pvo) {
		logger.debug("거래처 목록 조회!");
		return sqlSession.selectList(NAMESPACE + ".clientList", pvo);
	}


	// 총 개수 계산
	@Override
	public int getTotalCntClt() throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".cltTotalCnt");
	}


	// 거래처 검색 결과 (페이징)
	@Override
	public List<ClientVO> getClientList(ClientVO cvo, PageVO pvo) {
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("clientVO", cvo);
		paramMap.put("pageVO", pvo);
		
		return sqlSession.selectList(NAMESPACE + ".cltSearchList", paramMap);
	}


	// 검색 결과 개수 (페이징)
	@Override
	public int getCltSearchCnt(ClientVO cvo) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".cltSearchCnt", cvo);
	}



	
	
	
	

}
