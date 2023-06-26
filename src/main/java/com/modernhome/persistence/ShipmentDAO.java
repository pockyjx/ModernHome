package com.modernhome.persistence;

import java.util.List;

import com.modernhome.domain.OutOrderVO;
import com.modernhome.domain.ShipmentJoinVO;
import com.modernhome.domain.ShipmentVO;

public interface ShipmentDAO {

	// 출하 조회
	public List<ShipmentJoinVO> shipmentList();
	
	// 출하조회 + 검색
	public List<ShipmentJoinVO> shipmentListSearch(ShipmentJoinVO svo);
	
	// 출하 등록
	public void regShipment(ShipmentVO svo);
	
	// 출하 삭제
	public void deleteShipment(String shp_num);
	
	// 출하 수정
	public void updateShipment(ShipmentVO svo);
}
