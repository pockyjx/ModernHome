package com.modernhome.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.modernhome.domain.MaterialVO;
import com.modernhome.domain.ProductVO;
import com.modernhome.persistence.MaterialDAO;
import com.modernhome.persistence.ProductDAO;

@Service
public class ItemServiceImpl implements ItemService {

	@Inject
	private ProductDAO pdao;
	
	@Inject
	private MaterialDAO mdao;
	
	// 완제품 목록
	@Override
	public List<ProductVO> getProductList() {
		return pdao.getProductList();
	}


	// 완제품 검색 결과
	@Override
	public List<ProductVO> getProductList(String itemOption, String search) {
		return pdao.getProductList(itemOption, search);
	}

	/////////////////////////////////////////////////////////////////////////
	
	// 자재 목록
	@Override
	public List<MaterialVO> getMaterialList() {
		return mdao.getMaterialList();
	}
	
	// 자재 검색 결과
	@Override
	public List<MaterialVO> getMaterialList(String itemOption, String search) {
		return mdao.getMaterialList(itemOption, search);
	}
	
	
	
	
}
