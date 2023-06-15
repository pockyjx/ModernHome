package com.modernhome.persistence;

import java.util.List;

import com.modernhome.domain.MaterialVO;
import com.modernhome.domain.ProductVO;

public interface MaterialDAO {

	// 자재 목록 조회
	public List<MaterialVO> getMaterialList();
	
	// 완제품 검색 결과 
	public List<MaterialVO> getMaterialList(String itemOption, String search);
}
