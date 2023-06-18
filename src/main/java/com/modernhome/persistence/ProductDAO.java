package com.modernhome.persistence;

import java.util.List;

import com.modernhome.domain.ProductVO;

public interface ProductDAO {

	// 완제품 목록
	public List<ProductVO> getProductList();
	
	// 완제품 검색 결과 
	public List<ProductVO> getProductList(String itemOption, String search);
	
	// 완제품 등록
	public void regProduct(ProductVO vo);
	
	// 완제품 코드 자동 부여
//	public String setProNum();
	
}
