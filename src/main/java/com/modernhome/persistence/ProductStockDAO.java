package com.modernhome.persistence;

import java.util.List;

import com.modernhome.domain.MaterialStockVO;
import com.modernhome.domain.ProductStockVO;

public interface ProductStockDAO {
	
	// 완제품 재고 목록
	public List<ProductStockVO> getPsList();
	
	// 완제품 재고 등록
	public void regProStock(int maxProId);
}
