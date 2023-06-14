package com.modernhome.service;

import java.util.List;

import com.modernhome.domain.ProductVO;

public interface ItemService {

	// 완제품 목록
	public List<ProductVO> getProductList();
	
}
