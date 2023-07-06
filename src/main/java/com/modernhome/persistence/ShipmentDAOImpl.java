package com.modernhome.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.modernhome.domain.PageVO;
import com.modernhome.domain.ShipmentJoinVO;

@Repository
public class ShipmentDAOImpl implements ShipmentDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESAPCE = "com.modernhome.mapper.ShipmentMapper";
	
	

	private static final Logger logger = LoggerFactory.getLogger(ShipmentDAOImpl.class);
	
	
	
	// 출하 전체수 계산
	@Override
	public int shipmentCnt() throws Exception {
		logger.debug("shipmentCnt 실행");
		return sqlSession.selectOne(NAMESAPCE + ".shipmentCnt");
	}



	// 출하조회
	@Override
	public List<ShipmentJoinVO> shipmentList(PageVO pvo) {
		logger.debug("DAO -> mapper호출 -> SQL 실행(출하조회)");
		logger.debug("shipmentList 실행");
		
		return sqlSession.selectList(NAMESAPCE+".shipmentList", pvo);
	}

	// 출하 검색결과수 계산
	@Override
	public int shpSearchCnt(ShipmentJoinVO svo) throws Exception {
		return sqlSession.selectOne(NAMESAPCE + ".shpSearchCnt", svo);
	}
	
	// 출하 조회 검색
	@Override
	public List<ShipmentJoinVO> shipmentListSearch(ShipmentJoinVO svo, PageVO pvo) {
		
		logger.debug("DAO -> mapper호출 -> SQL 실행(출하 검색된 데이터 출력)"+svo);
		logger.debug("shipmentListSearch 실행");
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("svo", svo);
		paramMap.put("pvo", pvo);
		
		return sqlSession.selectList(NAMESAPCE+".shipmentListSearch", paramMap);
	}

	// 출하 등록
	@Override
	public void regShipment(ShipmentJoinVO svo) {
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
	public void updateShipment(ShipmentJoinVO svo) {
		logger.debug("DAO -> 출하 수정");
		
		sqlSession.update(NAMESAPCE + ".updateShipment", svo);
		
	}



	@Override
	public void modifyShpState(ShipmentJoinVO svo) throws Exception {
		logger.debug("modifyShpState() 실행");
		
		sqlSession.update(NAMESAPCE + ".modifyShpState", svo);
		
	}



	@Override
	public void modifyShpState2(ShipmentJoinVO svo) throws Exception {
		logger.debug("modifyShpState2() 실행");
		
		sqlSession.update(NAMESAPCE + ".modifyShpState2", svo);
		
	}
	
	
	
	

}
