package com.modernhome.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.modernhome.domain.ShipmentJoinVO;
import com.modernhome.domain.ShipmentVO;

@Repository
public class ShipmentDAOImpl implements ShipmentDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESAPCE = "com.modernhome.mapper.ShipmentMapper";
	
	

	private static final Logger logger = LoggerFactory.getLogger(ShipmentDAOImpl.class);
	
	// 출하조회
	@Override
	public List<ShipmentJoinVO> shipmentList() {
		logger.debug("DAO -> mapper호출 -> SQL 실행(출하조회)");
		
		return sqlSession.selectList(NAMESAPCE+".shipmentList");
	}

	// 출하 조회 검색
	@Override
	public List<ShipmentJoinVO> shipmentListSearch(ShipmentJoinVO svo) {
		
		logger.debug("DAO -> mapper호출 -> SQL 실행(출하 검색된 데이터 출력)"+svo);
		
		return sqlSession.selectList(NAMESAPCE+".shipmentListSearch", svo);
	}

	@Override
	public void regShipment(ShipmentVO svo) {
		logger.debug("DAO -> mapper -> SQL 실행(출하 등록)");
		
		logger.debug("svo : " + svo);
		sqlSession.insert(NAMESAPCE + ".regShipment", svo);
		
	}

	
	// 출하 삭제
	@Override
	public void deleteShipment(String shp_num) {
		logger.debug("DAO -> mapper -> SQL 실행 - 출하 삭제");
		
		logger.debug("shp_num : " + shp_num);
		sqlSession.delete(NAMESAPCE + ".deleteShipment", shp_num);
		
	}

	// 출하 수정
	@Override
	public void updateShipment(ShipmentVO svo) {
		logger.debug("DAO -> 출하 수정");
		
		sqlSession.update(NAMESAPCE + ".updateShipment", svo);
		
	}
	
	
	

}
