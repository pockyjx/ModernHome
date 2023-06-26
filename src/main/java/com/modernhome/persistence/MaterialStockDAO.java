package com.modernhome.persistence;

import java.util.List;

import com.modernhome.domain.MaterialStockVO;
import com.modernhome.domain.PageVO;

public interface MaterialStockDAO {
	
	// 자재 재고 목록 (페이징)
	public List<MaterialStockVO> getMsList(PageVO vo) throws Exception;
	
	// 전체 글 개수 (페이징)
	public int getMsTotalCnt() throws Exception;
	
	// 자재 재고 등록
	public void regMaStock(int maxMaId);
	
	// 자재 재고 검색 (페이징)
	public List<MaterialStockVO> searchMateStock(MaterialStockVO vo, PageVO pvo) throws Exception;
	
	// 검색 결과 개수 (페이징)
	public int getMsSearchCnt(MaterialStockVO vo);
	
}
