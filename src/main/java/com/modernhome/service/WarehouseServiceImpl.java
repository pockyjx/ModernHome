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
	
	
	
}