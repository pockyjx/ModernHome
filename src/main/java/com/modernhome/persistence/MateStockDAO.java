package com.modernhome.persistence;

import java.util.List;

import com.modernhome.domain.MaterialStockVO;

public interface MateStockDAO {
	
	// 자재 재고 목록
	public List<MaterialStockVO> getMsList();
	
	// 자재 재고 등록
	public void regMaStock(int maxMaId);
	

}
