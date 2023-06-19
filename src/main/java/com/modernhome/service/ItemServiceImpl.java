package com.modernhome.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.modernhome.domain.MaterialVO;
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
	public List<ProductVO> getProductList(String itemOption, String search) {
		return pdao.getProductList(itemOption, search);
	}
	
	// 완제품 등록
	@Override
	public void regProduct(ProductVO vo) {
		pdao.regProduct(vo);
	}
	
	// 완제품 팝업
	@Override
	public List<ProductVO> getPopUpPro() {
		return pdao.getPopUpProduct();
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
	
	

	/////////////////////////////////////////////////////////////////////////
	
	// 자재 목록
	@Override
	public List<MaterialVO> getMaterialList() {
		return mdao.getMaterialList();
	}



	// 자재 검색 결과
	@Override
	public List<MaterialVO> getMaterialList(String itemOption, String search) {
		return mdao.getMaterialList(itemOption, search);
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
	
	
	
	
	
	
	
}
