package com.modernhome.persistence;

import java.util.List;

import com.modernhome.domain.ProductVO;

public interface ProductDAO {

	// 완제품 목록 조회
	public List<ProductVO> getProductList();
	
}
