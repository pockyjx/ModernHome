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
import com.modernhome.domain.PageVO;

@Repository
public class InorderDAOImpl implements InorderDAO {
	
	// 의존성 주입
	@Inject
	private SqlSession sqlSession;
	
	// 네임스페이스
	private static final String NAMESPACE = "com.modernhome.mapper.inorderMapper";
	
	private static final Logger logger
				= LoggerFactory.getLogger(InorderDAOImpl.class);
	
	// 발주 조회 (페이징)
	@Override
	public List<InorderVO> getInorderList(PageVO pvo) throws Exception {
		logger.debug("발주 목록 조회!");
		return sqlSession.selectList(NAMESPACE + ".getInorderList", pvo);
	}

	// 총 개수 계산 (페이징)
	@Override
	public int getTotalCntMate() throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".ioTotalCnt");
	}
	
	// 발주 검색 결과 (페이징)
	@Override
	public List<InorderVO> getInorderSearch(String istartDate, String iendDate,
			String rstartDate, String rendDate, 
			String ma_name, String io_state, PageVO pvo) throws Exception {
		
		Map<String, Object> parameterMap = new HashMap<>();
		parameterMap.put("istartDate", istartDate);
		parameterMap.put("iendDate", iendDate);
		parameterMap.put("rstartDate", rstartDate);
		parameterMap.put("rendDate", rendDate);
		parameterMap.put("ma_name", ma_name);
		parameterMap.put("io_state", io_state);
		parameterMap.put("pageVO", pvo);
		
		return sqlSession.selectList(NAMESPACE + ".inorderSearch", parameterMap);
	}
	
	// 검색 결과 개수 (페이징)
	@Override
	public int getIoSearchCnt(String istartDate, String iendDate, 
			String rstartDate, String rendDate, 
			String ma_name, String io_state) throws Exception {
		
		Map<String, Object> parameterMap = new HashMap<>();
		parameterMap.put("istartDate", istartDate);
		parameterMap.put("iendDate", iendDate);
		parameterMap.put("rstartDate", rstartDate);
		parameterMap.put("rendDate", rendDate);
		parameterMap.put("ma_name", ma_name);
		parameterMap.put("io_state", io_state);
		
		return sqlSession.selectOne(NAMESPACE + ".ioSearchCnt", parameterMap);
	}
	

	// 발주 등록
	@Override
	public void regInorder(InorderVO iovo) throws Exception {
		logger.debug("DAO -> mapper호출 -> SQL 실행 (발주등록)");
		
		sqlSession.insert(NAMESPACE + ".regInorder", iovo); 
	}


	// 발주 수정
	@Override
	public void updateInorder(InorderVO iovo) throws Exception {
		logger.debug("DAO -> mapper호출 -> SQL 실행 (발주수정)");
		
		sqlSession.update(NAMESPACE + ".updateInorder", iovo);
	}

	// 발주 삭제
	@Override
	public void deleteInorder(int io_id) throws Exception {
		logger.debug("DAO -> mapper호출 -> SQL 실행(발주삭제)");
	
		sqlSession.delete(NAMESPACE + ".deleteInorder", io_id);
	}

	// 발주서 가져오기
	@Override
	public List<InorderVO> getIoList(int io_id) throws Exception {
		logger.debug(io_id + "번 발주서 조회!");
		return sqlSession.selectList(NAMESPACE + ".getIoList", io_id);
	}

	
	
	
	
	// 발주 월별 그래프
	@Override
	public List<InorderVO> monthlyIOResult() throws Exception {
		return sqlSession.selectList(NAMESPACE + ".monthlyIOResult");
	}

	
}