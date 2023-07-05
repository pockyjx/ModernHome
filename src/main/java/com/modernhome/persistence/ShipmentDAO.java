package com.modernhome.persistence;

import java.util.List;

import com.modernhome.domain.PageVO;
import com.modernhome.domain.ShipmentJoinVO;

public interface ShipmentDAO {

	// 출하 조회
	public List<ShipmentJoinVO> shipmentList(PageVO pvo);
	
	// 출하 검색 리스트
	public List<ShipmentJoinVO> shipmentListSearch(ShipmentJoinVO svo, PageVO pvo);
	
	// 출하 전체수 계산
	public int shipmentCnt() throws Exception;
		
	// 출하 검색결과수 계산
	public int shpSearchCnt(ShipmentJoinVO svo) throws Exception;
		
	
	// 출하 등록
	public void regShipment(ShipmentJoinVO svo);
	
	// 출하 삭제
	public void deleteShipment(String shp_num);
	
	// 출하 수정
	public void updateShipment(ShipmentJoinVO svo);
}
