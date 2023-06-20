package com.modernhome.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.modernhome.domain.WarehouseVO;
import com.modernhome.persistence.WarehouseDAO;

@Service
public class WarehouseServiceImpl implements WarehouseService {

	@Inject
	private WarehouseDAO wdao;
	
	// 창고조회
	@Override
	public List<WarehouseVO> warehouseList() {
		return wdao.warehouseList();
	}

	// 창고조회 + 검색
	@Override
	public List<WarehouseVO> warehouseListSearch(WarehouseVO wvo) {
		return wdao.warehouseListSearch(wvo);
	}

	// 창고 등록
	@Override
	public void regWarehouse(WarehouseVO wvo) {
		wdao.regWarehouse(wvo);
	}

	// 창고 수정
	@Override
	public void updateWarehouse(WarehouseVO wvo) {
		wdao.updateWarehouse(wvo);
	}

	// 창고 삭제
	@Override
	public void deleteWarehouse(int wh_id) {
		wdao.deleteWarehouse(wh_id);
	}
	
	
	
	
}