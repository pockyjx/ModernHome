package com.modernhome.service;

import java.util.List;

import com.modernhome.domain.MaterialStockVO;
import com.modernhome.domain.PageVO;
import com.modernhome.domain.ProductStockVO;

public interface StockService {
	
	// 자재 재고 목록 조회 (페이징)
	public List<MaterialStockVO> getMsList(PageVO vo) throws Exception;
	
	// 전체 글 개수 (페이징)
	public int getTotalCntMs() throws Exception;
	
	// 자재 재고 등록
	public void regMaStock(int maxMaId) throws Exception;
	
	// 자재 재고 검색 (페이징)
	public List<MaterialStockVO> searchMS(MaterialStockVO vo, PageVO pvo) throws Exception;
	
	// 검색 결과 개수 (페이징)
	public int getMsSearchCnt(MaterialStockVO vo) throws Exception;
	
	////////////////////////////////////////////////////////////////
	
	// 완제품 재고 목록 조회 (페이징)
	public List<ProductStockVO> getPsList(PageVO vo) throws Exception;
	
	// 전체 글 개수 (페이징)
	public int getTotalCntPs() throws Exception;
	
	// 완제품 재고 등록
	public void regProStock(int maxProId) throws Exception;
	
	// 완제품 재고 검색 (페이징)
	public List<ProductStockVO> searchPS(ProductStockVO vo, PageVO pvo) throws Exception;
	
	// 검색 결과 개수 (페이징)
	public int getPsSearchCnt(ProductStockVO vo) throws Exception;
	
}
