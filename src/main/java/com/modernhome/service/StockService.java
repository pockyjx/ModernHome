package com.modernhome.service;

import java.util.List;

import com.modernhome.domain.MaterialStockVO;
import com.modernhome.domain.ProductStockVO;

public interface StockService {
	
	// 자재 재고 목록 조회
	public List<MaterialStockVO> getMsList() throws Exception;
	
	// 완제품 재고 등록
	public void regMaStock(int maxMaId) throws Exception;
	
	
	////////////////////////////////////////////////////////////////
	
	// 완제품 재고 목록 조회
	public List<ProductStockVO> getPsList() throws Exception;
	
	// 완제품 재고 등록
	public void regProStock(int maxProId) throws Exception;
}
