package com.modernhome.persistence;

import java.util.List;

import com.modernhome.domain.PagingVO;
import com.modernhome.domain.ProductVO;

public interface ProductDAO {

	// 완제품 목록
	public List<ProductVO> getProductList();
	
	// 완제품 검색 결과 
	public List<ProductVO> getProductList(ProductVO vo);
	
	// 완제품 등록
	public void regProduct(ProductVO vo);
	
	// 완제품 삭제
	public void deleteProduct(int pro_id);
	
	// 완제품 수정
	public void modifyProduct(ProductVO vo);
	
	// 게시물 총 개수
	public int countProduct();
	
	// 페이징 처리 게시글 조회
	public List<ProductVO> pagingProduct(PagingVO pvo);
	
}
