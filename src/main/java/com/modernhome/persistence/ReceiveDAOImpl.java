package com.modernhome.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.modernhome.domain.PageVO;
import com.modernhome.domain.ReceiveVO;

@Repository
public class ReceiveDAOImpl implements ReceiveDAO {
	
	// 의존성 주입
	@Inject
	private SqlSession sqlSession;
	
	// 네임스페이스
	private static final String NAMESPACE = "com.modernhome.mapper.receiveMapper";
	
	private static final Logger logger
				= LoggerFactory.getLogger(ReceiveDAOImpl.class);

	// 입고 조회 (페이징)
	@Override
	public List<ReceiveVO> getReceiveList(PageVO vo) {
		return sqlSession.selectList(NAMESPACE + ".getReceiveList", vo);
	}
	
	// 전체 글 개수 (페이징)
	@Override
	public int getRecTotalCnt() {
		return sqlSession.selectOne(NAMESPACE + ".recTotalCnt");
	}
	

	// 입고 검색 결과 (페이징)
	@Override
	public List<ReceiveVO> getReceiveSearch(String startDate, String endDate, 
											String ma_name, String io_num, 
											PageVO vo) {
		
		Map<String, Object> parameterMap = new HashMap<>();
		parameterMap.put("startDate", startDate);
		parameterMap.put("endDate", endDate);
		parameterMap.put("ma_name", ma_name);
		parameterMap.put("io_num", io_num);
		parameterMap.put("pageVO", vo);
		
		return sqlSession.selectList(NAMESPACE + ".receiveSearch" ,parameterMap);
	}
	
	// 검색 결과 개수 (페이징)
	@Override
	public int getRecSearchCnt(String startDate, String endDate, String ma_name, String io_num) {
		
		Map<String, Object> parameterMap = new HashMap<>();
		parameterMap.put("startDate", startDate);
		parameterMap.put("endDate", endDate);
		parameterMap.put("ma_name", ma_name);
		parameterMap.put("io_num", io_num);
		
		return sqlSession.selectOne(NAMESPACE + ".recSearchCnt", parameterMap);
	}

	// 입고 등록
	@Override
	public void regReceive(ReceiveVO rvo) {
		logger.debug("DAO -> mapper호출 -> SQL 실행 (입고등록)");
		
		sqlSession.insert(NAMESPACE + ".regReceive", rvo); 
	}
	
	

	// 입고 수정
	@Override
	public void updateReceive(ReceiveVO rvo) {
		logger.debug("DAO -> mapper호출 -> SQL 실행 (입고수정)");
		
		sqlSession.update(NAMESPACE + ".updateReceive", rvo);
	}
	
	// 입고 삭제
	@Override
	public void deleteReceive(int rec_id) {
		logger.debug("DAO -> mapper호출 -> SQL 실행(입고삭제)");
	
		sqlSession.delete(NAMESPACE + ".deleteReceive", rec_id);
	}

	// 입고 처리
	@Override
	public void acceptReceive(Integer rec_id, Integer ma_id, Integer rec_cnt) throws Exception {
		logger.debug("입고 처리!");
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("ma_id", ma_id);
		paramMap.put("rec_cnt", rec_cnt);
		
		// 입고 상태 변경
		sqlSession.update(NAMESPACE + ".updateRec", rec_id);
		
		// 재고 반영
		sqlSession.update(NAMESPACE + ".updateMS", paramMap);
		
	}

	// 입고 id값 가져오기
	@Override
	public int getMaxRecId() {
		return sqlSession.selectOne(NAMESPACE + ".getRecId");
	}
	
	
	
}
