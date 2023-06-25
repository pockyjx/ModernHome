package com.modernhome.persistence;

import java.util.List;

import com.modernhome.domain.MaterialStockVO;

public interface MaterialStockDAO {
	
	// 자재 재고 목록
	public List<MaterialStockVO> getMsList();
	
	// 자재 재고 등록
	public void regMaStock(int maxMaId);
	
	// 자재 재고 검색
	public List<MaterialStockVO> searchMateStock(MaterialStockVO vo);
	

}
