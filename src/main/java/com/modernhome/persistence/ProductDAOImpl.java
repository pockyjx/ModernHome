package com.modernhome.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	// 완제품 검색 결과
	@Override
	public List<ProductVO> getProductList(String itemOption, String search) {
		logger.debug("완제품 검색 결과 조회!");
		
		 Map<String, Object> parameterMap = new HashMap();
		 parameterMap.put("itemOption", itemOption);
		 parameterMap.put("search", search);	
		
		return sqlSession.selectList(NAMESPACRE + ".proSearchList", parameterMap);
	}
	
	// 완제품 등록
	@Override
	public void regProduct(ProductVO vo) {
		logger.debug("완제품 등록!");
		
		sqlSession.insert(NAMESPACRE + ".regProduct", vo);
		
	}

	// 완제품 팝업
	@Override
	public List<ProductVO> getPopUpProduct() {
		logger.debug("완제품 목록 조회! (팝업)");
		return sqlSession.selectList(NAMESPACRE + ".getPopUpPro");
	}

	// 완제품 삭제
	@Override
	public void deleteProduct(int pro_id) {
		logger.debug("완제품 삭제!");
		sqlSession.delete(NAMESPACRE + ".delProduct", pro_id);
	}

	// 완제품 수정
	@Override
	public void modifyProduct(ProductVO vo) {
		logger.debug("완제품 수정!");
		sqlSession.update(NAMESPACRE + ".updateProduct", vo);
	}
	
	
	
	

	
	
}
