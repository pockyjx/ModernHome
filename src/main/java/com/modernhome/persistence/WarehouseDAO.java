package com.modernhome.persistence;

import java.util.List;

import com.modernhome.domain.WarehouseVO;

public interface WarehouseDAO {
	
	// 창고 조회
	public List<WarehouseVO> warehouseList();
	
	// 창고 조회 + 검색
	public List<WarehouseVO> warehouseListSearch(WarehouseVO wvo);
}
