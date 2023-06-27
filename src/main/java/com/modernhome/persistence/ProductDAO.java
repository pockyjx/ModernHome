package com.modernhome.persistence;

import java.util.List;

import com.modernhome.domain.PageVO;
import com.modernhome.domain.ProductVO;

public interface ProductDAO {

	// 완제품 목록
	public List<ProductVO> getProductList();
	
	// 완제품 검색 결과 (페이징)
	public List<ProductVO> getProductList(ProductVO vo, PageVO pvo);
	
	// 완제품 등록
	public void regProduct(ProductVO vo);
	
	// 완제품 삭제
	public void deleteProduct(int pro_id);
	
	// 완제품 수정
	public void modifyProduct(ProductVO vo);
	
	// 완제품 id값 가져오기
	public int getMaxProId();
	
	// 완제품 목록 (페이징)
	public List<ProductVO> getProListPage(PageVO vo) throws Exception;
	
	// 게시판 총 글 수 계산
	public int getTotalCntPro() throws Exception;
	
	// 검색 결과 개수
	public int getProSearchCnt(ProductVO vo) throws Exception;
	
	
}
