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
	
	@Override
	public List<WarehouseVO> getWarehouseList() {

		return wdao.getWarehouseList();
	}
	
}