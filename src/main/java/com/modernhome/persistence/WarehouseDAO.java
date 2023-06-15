package com.modernhome.persistence;

import java.util.List;

import com.modernhome.domain.WarehouseVO;

public interface WarehouseDAO {
	
	// 창고 목록 조회
	public List<WarehouseVO> getWarehouseList();
	
}
