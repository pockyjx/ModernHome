package com.modernhome.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.modernhome.domain.MaterialVO;
import com.modernhome.domain.PageVO;
import com.modernhome.domain.ProductVO;
import com.modernhome.persistence.MaterialDAO;
import com.modernhome.persistence.ProductDAO;

@Service
public class ItemServiceImpl implements ItemService {

	@Inject
	private ProductDAO pdao;
	
	@Inject
	private MaterialDAO mdao;
	
	// 완제품 목록
	@Override
	public List<ProductVO> getProductList() {
		return pdao.getProductList();
	}

	// 완제품 검색 결과
	@Override
	public List<ProductVO> getProductList(ProductVO vo, PageVO pvo) {
		return pdao.getProductList(vo, pvo);
	}
	
	// 완제품 등록
	@Override
	public void regProduct(ProductVO vo) {
		pdao.regProduct(vo);
	}
	
	// 완제품 삭제
	@Override
	public void deleteProduct(int pro_id) {
		pdao.deleteProduct(pro_id);
	}
	
	// 완제품 수정
	@Override
	public void modifyProduct(ProductVO vo) {
		pdao.modifyProduct(vo);
	}
	
	// 완제품 id값 가져오기
	@Override
	public int getProId() {
		return pdao.getMaxProId();
	}
	
	// 완제품 목록 (페이징)
	@Override
	public List<ProductVO> getProListPage(PageVO vo) throws Exception {
		return pdao.getProListPage(vo);
	}
	
	// 완제품 글 개수
	@Override
	public int getTotalCntPro() throws Exception {
		return pdao.getTotalCntPro();
	}
	
	// 검색 결과 개수
	@Override
	public int getProSearchCnt(ProductVO vo) throws Exception {
		return pdao.getProSearchCnt(vo);
	}
	
	
	/////////////////////////////////////////////////////////////////////////
	
	// 자재 목록 (페이징)
	@Override
	public List<MaterialVO> getMaterialList(PageVO vo) {
		return mdao.getMaterialList(vo);
	}
	
	// 자재 개수
	@Override
	public int getTotalCntMate() throws Exception {
		return mdao.getTotalCntMate();
	}
	
	// 자재 검색 결과
	@Override
	public List<MaterialVO> getMaterialList(MaterialVO vo) {
		return mdao.getMaterialList(vo);
	}


	// 자재 등록
	@Override
	public void regMaterial(MaterialVO vo) {
		mdao.regMaterial(vo);
	}

	// 자제 삭제
	@Override
	public void delMaterial(int ma_id) {
		mdao.delMaterial(ma_id);
	}


	// 자재 수정
	@Override
	public void modifyMaterial(MaterialVO vo) {
		mdao.modifyMaterial(vo);
	}

	// 자재 id값 가져오기
	@Override
	public int getMaId() {
		return mdao.getMaxMaId();
	}
	
	
	
	
	
	
	
}
