package com.modernhome.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.modernhome.domain.ProductVO;

@Repository
public class ProductDAOImpl implements ProductDAO {
	
	// 로거
	private static final Logger logger = LoggerFactory.getLogger(ProductDAOImpl.class);
	
	// 의존성 주입
	@Inject
	private SqlSession sqlSession;
	
	// 네임스페이스
	private static final String NAMESPACRE = "com.modernhome.mapper.ProductMapper";
	
	// 완제품 목록 조회
	@Override
	public List<ProductVO> getProductList() {
		logger.debug("완제품 목록 조회!");
		return sqlSession.selectList(NAMESPACRE + ".productList");
	}
	
	
	
}
