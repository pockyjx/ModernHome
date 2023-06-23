package com.modernhome.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.modernhome.domain.ShipmentJoinVO;
import com.modernhome.domain.ShipmentVO;
import com.modernhome.persistence.ShipmentDAO;

@Service
public class ShipmentServiceImpl implements ShipmentService {

	@Inject
	private ShipmentDAO sDAO;
	
	// 출하 조회
	@Override
	public List<ShipmentJoinVO> shipmentList() {
		return sDAO.shipmentList();
	}

	// 출하조회 + 검색
	@Override
	public List<ShipmentJoinVO> shipmentListSearch(ShipmentJoinVO svo) {
		return sDAO.shipmentListSearch(svo);
	}

	// 출하정보 등록
	@Override
	public void regShipment(ShipmentVO svo) {
		sDAO.regShipment(svo);
		
	}
	
	
	

}
