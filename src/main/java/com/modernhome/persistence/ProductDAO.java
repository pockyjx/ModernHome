package com.modernhome.persistence;

import java.util.List;

import com.modernhome.domain.ProductVO;

public interface ProductDAO {

	// 완제품 목록
	public List<ProductVO> getProductList();
	
	// 완제품 검색 결과 
	public List<ProductVO> getProductList(String itemOption, String search);
	
}
