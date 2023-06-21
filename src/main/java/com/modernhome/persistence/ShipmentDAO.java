package com.modernhome.persistence;

import java.util.List;

import com.modernhome.domain.ShipmentVO;

public interface ShipmentDAO {

	// 출하 조회
	public List<ShipmentVO> shipmentList();
	
	// 출하조회 + 검색
	public List<ShipmentVO> shipmentListSearch(ShipmentVO svo);
}
