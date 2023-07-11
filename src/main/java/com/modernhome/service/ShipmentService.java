package com.modernhome.service;

import java.util.List;

import com.modernhome.domain.PageVO;
import com.modernhome.domain.ShipmentJoinVO;
import com.modernhome.domain.WijoinVO;

public interface ShipmentService {
	
	
	// 출하 전체수 계산
	public int shipmentCnt() throws Exception;
		
	// 출하 조회
	public List<ShipmentJoinVO> shipmentList(PageVO pvo) throws Exception;
	
	// 출하 검색결과수 계산
	public int shpSearchCnt(ShipmentJoinVO svo) throws Exception;
	
	// 출하조회 + 검색
	public List<ShipmentJoinVO> shipmentListSearch(ShipmentJoinVO svo, PageVO pvo);
	
	
	
	
	// 출하정보 등록
	public void regShipment(ShipmentJoinVO svo);
	
	// 수주정보 삭제
	public void deleteShipment(String shp_id);
		
	// 수주정보 수정
	public void updateShipment(ShipmentJoinVO svo);
	
	// 출하 테이블에서 출하상태를 '출하완료'으로 변경
	public void modifyShpState(ShipmentJoinVO svo) throws Exception;
	
	public void modifyShpState2(ShipmentJoinVO svo) throws Exception;

}
