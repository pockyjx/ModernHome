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

@Repository
public class InorderDAOImpl implements InorderDAO {
	
	// 의존성 주입
	@Inject
	private SqlSession sqlSession;
	
	// 네임스페이스
	private static final String NAMESPACE = "com.modernhome.mapper.inorderMapper";
	
	private static final Logger logger
				= LoggerFactory.getLogger(InorderDAOImpl.class);
	
	// 발주 조회
	@Override
	public List<InorderVO> getInorderList() {
		return sqlSession.selectList(NAMESPACE + ".getInorderList");
	}

	// 발주 검색 결과
	@Override
	public List<InorderVO> getInorderSearch(String istartDate, String iendDate,String rstartDate, String rendDate, String ma_name, String io_state) {
		
		Map<String, Object> parameterMap = new HashMap();
		parameterMap.put("istartDate", istartDate);
		parameterMap.put("iendDate", iendDate);
		parameterMap.put("rstartDate", rstartDate);
		parameterMap.put("rendDate", rendDate);
		parameterMap.put("ma_name", ma_name);
		parameterMap.put("io_state", io_state);
		
		return sqlSession.selectList(NAMESPACE + ".inorderSearch" ,parameterMap);
	}
	
	// 발주 등록
	@Override
	public void regInorder(InorderVO iovo) {
		logger.debug("DAO -> mapper호출 -> SQL 실행 (발주등록)");
		
		sqlSession.insert(NAMESPACE + ".regInorder", iovo); 
	}

	// 발주 수정
	@Override
	public void updateInorder(InorderVO iovo) {
		logger.debug("DAO -> mapper호출 -> SQL 실행 (발주수정)");
		
		sqlSession.update(NAMESPACE + ".updateInorder", iovo);
	}

	// 발주 삭제
	@Override
	public void deleteInorder(int io_id) {
		logger.debug("DAO -> mapper호출 -> SQL 실행(발주삭제)");
	
		sqlSession.delete(NAMESPACE + ".deleteInorder", io_id);
	}
}
