package com.modernhome.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.modernhome.domain.MaterialStockVO;
import com.modernhome.domain.MaterialVO;
import com.modernhome.domain.ProductStockVO;
import com.modernhome.domain.RequirementVO;
import com.modernhome.persistence.MateStockDAO;
import com.modernhome.persistence.ProductStockDAO;

@Service
public class StockServiceImpl implements StockService {
	
	@Autowired
	MateStockDAO msdao;
	
	@Autowired
	ProductStockDAO psdao;
	
	// 자재 재고 목록
	@Override
	public List<MaterialStockVO> getMsList() throws Exception {
		return msdao.getMsList();
	}

	// 완제품 재고 목록
	@Override
	public List<ProductStockVO> getPsList() throws Exception {
		return psdao.getPsList();
	}
	
	
	

}
