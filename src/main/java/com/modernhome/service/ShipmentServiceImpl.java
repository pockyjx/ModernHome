package com.modernhome.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.modernhome.domain.PageVO;
import com.modernhome.domain.ShipmentJoinVO;
import com.modernhome.persistence.ShipmentDAO;

@Service
public class ShipmentServiceImpl implements ShipmentService {

	@Inject
	private ShipmentDAO sDAO;
	
	
	// 출하 전체수 계산
	@Override
	public int shipmentCnt() throws Exception {
		return sDAO.shipmentCnt();
	}

	// 출하 검색결과수 계산
	@Override
	public int shpSearchCnt(ShipmentJoinVO svo) throws Exception {
		return sDAO.shpSearchCnt(svo);
	}

	// 출하 조회
	@Override
	public List<ShipmentJoinVO> shipmentList(PageVO pvo) {
		return sDAO.shipmentList(pvo);
	}

	// 출하조회 + 검색
	@Override
	public List<ShipmentJoinVO> shipmentListSearch(ShipmentJoinVO svo, PageVO pvo) {
		return sDAO.shipmentListSearch(svo, pvo);
	}

	// 출하정보 등록
	@Override
	public void regShipment(ShipmentJoinVO svo) {
		sDAO.regShipment(svo);
		
	}

	// 출하정보 삭제
	@Override
	public void deleteShipment(String shp_num) {
		sDAO.deleteShipment(shp_num);
		
	}

	// 출하정보 수정
	@Override
	public void updateShipment(ShipmentJoinVO svo) {
		sDAO.updateShipment(svo);
		
	}
	
	
	
	

}
