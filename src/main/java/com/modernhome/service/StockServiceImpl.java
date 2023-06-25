package com.modernhome.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.modernhome.domain.MaterialStockVO;
import com.modernhome.domain.MaterialVO;
import com.modernhome.domain.ProductStockVO;
import com.modernhome.domain.RequirementVO;
import com.modernhome.persistence.MaterialStockDAO;
import com.modernhome.persistence.ProductStockDAO;

@Service
public class StockServiceImpl implements StockService {
	
	@Autowired
	MaterialStockDAO msdao;
	
	@Autowired
	ProductStockDAO psdao;
	
	// 자재 재고 목록
	@Override
	public List<MaterialStockVO> getMsList() throws Exception {
		return msdao.getMsList();
	}
	
	// 자재 재고 정보 등록
	@Override
	public void regMaStock(int maxMaId) throws Exception {
		msdao.regMaStock(maxMaId);
	}
	
	// 자재 재고 검색
	@Override
	public List<MaterialStockVO> searchMS(MaterialStockVO vo) throws Exception {
		return msdao.searchMateStock(vo);
	}
	
	/////////////////////////////////////////////////////////////////
	

	// 완제품 재고 목록
	@Override
	public List<ProductStockVO> getPsList() throws Exception {
		return psdao.getPsList();
	}

	// 완제품 재고 정보 등록
	@Override
	public void regProStock(int maxProId) throws Exception {
		psdao.regProStock(maxProId);
	}

	// 완제품 재고 검색
	@Override
	public List<ProductStockVO> searchPS(ProductStockVO vo) throws Exception {
		return psdao.searchProStock(vo);
	}


}
