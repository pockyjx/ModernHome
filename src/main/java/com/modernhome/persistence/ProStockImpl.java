package com.modernhome.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.modernhome.domain.ProductStockVO;

@Repository
public class ProStockImpl implements ProductStockDAO {
	
	@Autowired
	SqlSession sqlSession;

	private static final Logger logger = LoggerFactory.getLogger(ProStockImpl.class);
	private static final String NAMESPACE = "com.modernhome.domain.ProductStockVO";
	
	// 완제품 재고 목록
	@Override
	public List<ProductStockVO> getPsList() {
		logger.debug("완제품 재고 목록 출력!");
		return sqlSession.selectList(NAMESPACE + ".getProStock");
	}

}
