package com.modernhome.service;

import java.util.List;

import com.modernhome.domain.MaterialVO;
import com.modernhome.domain.ProductVO;

public interface ItemService {

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
	
	// 완제품 id값 가져오기
	public int getProId();
	
	////////////////////////////////////////////////////////////////////////
	
	// 자재 목록
	public List<MaterialVO> getMaterialList();
	
	// 자재 검색 결과
	public List<MaterialVO> getMaterialList(MaterialVO vo);
	
	// 자재 등록
	public void regMaterial(MaterialVO vo);
	
	// 자재 삭제
	public void delMaterial(int ma_id);
	
	// 자재 수정
	public void modifyMaterial(MaterialVO vo);
	
	// 자재 id값 가져오기
	public int getMaId();
	
}
