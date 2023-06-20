package com.modernhome.persistence;

import java.util.List;

import com.modernhome.domain.MaterialVO;
import com.modernhome.domain.ProductVO;

public interface MaterialDAO {

	// 자재 목록 조회
	public List<MaterialVO> getMaterialList();
	
	// 자재 검색 결과 
	public List<MaterialVO> getMaterialList(String itemOption, String search);
	
	// 자재 등록
	public void regMaterial(MaterialVO vo);
	
	// 자재 삭제
	public void delMaterial(int ma_id);
	
	// 자재 수정
	public void modifyMaterial(MaterialVO vo);
	
	// 자재 목록 팝업
	public List<MaterialVO> getPopUpMate();

}
