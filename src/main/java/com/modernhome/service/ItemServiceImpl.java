package com.modernhome.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.modernhome.domain.ProductVO;
import com.modernhome.persistence.ProductDAO;

@Service
public class ItemServiceImpl implements ItemService {

	@Inject
	private ProductDAO pdao;
	
	// 완제품 목록
	@Override
	public List<ProductVO> getProductList() {
		return pdao.getProductList();
	}
	
	
	
}
