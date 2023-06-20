package com.modernhome.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.modernhome.domain.WarehouseVO;

@Repository
public class WarehouseDAOImpl implements WarehouseDAO {
	
	// 의존성 주입
	@Inject
	private SqlSession sqlSession;
	
	// 네임스페이스
	private static final String NAMESPACE = "com.modernhome.mapper.warehouseMapper";
	
	private static final Logger logger
				= LoggerFactory.getLogger(WarehouseDAOImpl.class);
	
	// 창고 조회
	@Override
	public List<WarehouseVO> warehouseList() {
		logger.debug("DAO -> mapper호출 -> SQL 실행 (창고조회)");
		
		return sqlSession.selectList(NAMESPACE + ".warehouseList");
	}

	// 창고 검색 결과
	@Override
	public List<WarehouseVO> warehouseListSearch(WarehouseVO wvo) {
		logger.debug("DAO -> mapper호출 -> SQL 실행 (창고조회 - 검색된 데이터만 출력)");
		
		return sqlSession.selectList(NAMESPACE + ".warehouseListSearch", wvo);
	}

	// 창고 등록
	@Override
	public void regWarehouse(WarehouseVO wvo) {
		logger.debug("DAO -> mapper호출 -> SQL 실행 (창고등록)");
		
		sqlSession.insert(NAMESPACE + ".regWarehouse", wvo); 
	}

	// 창고 수정
	@Override
	public void updateWarehouse(WarehouseVO wvo) {
		logger.debug("DAO -> mapper호출 -> SQL 실행 (창고수정)");
		
		sqlSession.update(NAMESPACE + ".updateWarehouse", wvo);
	}

	// 창고 삭제
	@Override
	public void deleteWarehouse(int wh_id) {
		logger.debug("DAO -> mapper호출 -> SQL 실행(창고삭제)");
	
		sqlSession.delete(NAMESPACE + ".deleteWarehouse", wh_id);
	}
	
	
	
}