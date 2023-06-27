package com.modernhome.persistence;

import java.util.List;

import com.modernhome.domain.MaterialStockVO;
import com.modernhome.domain.PageVO;
import com.modernhome.domain.ProductStockVO;

public interface ProductStockDAO {
	
	// 완제품 재고 목록 (페이징)
	public List<ProductStockVO> getPsList(PageVO vo) throws Exception;
	
	// 전체 글 개수 (페이징)
	public int getPsTotalCnt() throws Exception;
	
	// 완제품 재고 등록
	public void regProStock(int maxProId) throws Exception;
	
	// 완제품 재고 검색 (페이징)
	public List<ProductStockVO> searchProStock(ProductStockVO vo, PageVO pvo) throws Exception;

	// 검색 결과 개수 (페이징)
	public int getPsSearchCnt(ProductStockVO vo);

}
