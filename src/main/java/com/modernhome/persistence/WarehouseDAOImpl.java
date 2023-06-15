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
	

	@Override
	public List<WarehouseVO> getWarehouseList() {
		return sqlSession.selectList(NAMESPACE + ".warehouseList");
	}
	
}