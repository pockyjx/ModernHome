package com.modernhome.service;

import java.util.List;

import com.modernhome.domain.MaterialVO;
import com.modernhome.domain.ProductVO;

public interface ItemService {

	// 완제품 목록
	public List<ProductVO> getProductList();
	
	
	// 완제품 검색 결과
	public List<ProductVO> getProductList(String itemOption, String search);
	
	// 완제품 코드 부여
//	public String setProNum();
	
	// 완제품 등록
	public void regProduct(ProductVO vo);
	
	////////////////////////////////////////////////////////////////////////
	
	// 자재 목록
	public List<MaterialVO> getMaterialList();
	
	// 자재 검색 결과
	public List<MaterialVO> getMaterialList(String itemOption, String search);
	
	// 
	
}
