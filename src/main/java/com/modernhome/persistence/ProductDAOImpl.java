package com.modernhome.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.modernhome.domain.PagingVO;
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
	public List<ProductVO> getProductList(ProductVO vo) {
		logger.debug("완제품 검색 결과 조회!");
		
		return sqlSession.selectList(NAMESPACRE + ".proSearchList", vo);
	}
	
	// 완제품 등록
	@Override
	public void regProduct(ProductVO vo) {
		logger.debug("완제품 등록!");
		
		sqlSession.insert(NAMESPACRE + ".regProduct", vo);
		
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
	
	// 게시물 총 개수
	@Override
	public int countProduct() {
		return sqlSession.selectOne(NAMESPACRE + ".countProduct");
	}
	
	// 페이징 처리 게시글 조회
	@Override
	public List<ProductVO> pagingProduct(PagingVO pvo) {
		return sqlSession.selectList(NAMESPACRE + ".pagingProduct");
	}
	
	
	
	
	

	
	
}
