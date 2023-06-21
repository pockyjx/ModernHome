package com.modernhome.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.modernhome.domain.ShipmentVO;

@Repository
public class ShipmentDAOImpl implements ShipmentDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESAPCE = "com.modernhome.mapper.ShipmentMapper";
	
	

	private static final Logger logger = LoggerFactory.getLogger(ShipmentDAOImpl.class);
	
	// 출하조회
	@Override
	public List<ShipmentVO> shipmentList() {
		logger.debug("DAO -> mapper호출 -> SQL 실행");
		
		return sqlSession.selectList(NAMESAPCE+".shipmentList");
	}

	@Override
	public List<ShipmentVO> shipmentListSearch(ShipmentVO svo) {
		
		logger.debug("DAO -> mapper호출 -> SQL 실행(검색된 데이터 출력)"+svo);
		
		return sqlSession.selectList(NAMESAPCE+".shipmentListSearch", svo);
	}
	
	

}
