package com.modernhome.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.modernhome.domain.MaterialStockVO;
import com.modernhome.domain.MaterialVO;
import com.modernhome.domain.PageVO;
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
	
	// 자재 재고 목록 (페이징)
	@Override
	public List<MaterialStockVO> getMsList(PageVO vo) throws Exception {
		return msdao.getMsList(vo);
	}
	
	// 전체 글 개수 (페이징)
	@Override
	public int getTotalCntMs() throws Exception {
		return msdao.getMsTotalCnt();
	}
	
	// 자재 재고 정보 등록
	@Override
	public void regMaStock(int maxMaId) throws Exception {
		msdao.regMaStock(maxMaId);
	}

	// 자재 재고 검색 (페이징)
	@Override
	public List<MaterialStockVO> searchMS(MaterialStockVO vo, PageVO pvo) throws Exception {
		return msdao.searchMateStock(vo, pvo);
	}
	
	// 검색 결과 개수
	@Override
	public int getMsSearchCnt(MaterialStockVO vo) throws Exception {
		return msdao.getMsSearchCnt(vo);
	}
	
	
	/////////////////////////////////////////////////////////////////
	

	// 완제품 재고 목록 (페이징)
	@Override
	public List<ProductStockVO> getPsList(PageVO vo) throws Exception {
		return psdao.getPsList(vo);
	}
	

	// 전체 글 개수
	@Override
	public int getTotalCntPs() throws Exception {
		return psdao.getPsTotalCnt();
	}

	// 완제품 재고 정보 등록
	@Override
	public void regProStock(int maxProId) throws Exception {
		psdao.regProStock(maxProId);
	}

	// 완제품 재고 검색 (페이징)
	@Override
	public List<ProductStockVO> searchPS(ProductStockVO vo, PageVO pvo) throws Exception {
		return psdao.searchProStock(vo, pvo);
	}

	// 검색 결과 개수 (페이징)
	@Override
	public int getPsSearchCnt(ProductStockVO vo) throws Exception {
		return psdao.getPsSearchCnt(vo);
	}
	
	

}
