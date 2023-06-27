package com.modernhome.persistence;

import java.util.List;

import com.modernhome.domain.MaterialVO;
import com.modernhome.domain.PageVO;
import com.modernhome.domain.ProductVO;

public interface MaterialDAO {

	// 자재 목록 조회 (페이징)
	public List<MaterialVO> getMaterialList(PageVO vo);
	
	// 총 글 수 계산
	public int getTotalCntMate() throws Exception;
	
	// 자재 검색 결과 (페이징)
	public List<MaterialVO> getMaterialList(MaterialVO vo, PageVO pvo);
	
	// 검색 결과 개수 (페이징)
	public int getMaSearchCnt(MaterialVO vo) throws Exception;
	
	// 자재 등록
	public void regMaterial(MaterialVO vo);
	
	// 자재 삭제
	public void delMaterial(int ma_id);
	
	// 자재 수정
	public void modifyMaterial(MaterialVO vo);
	
	// 자재 id값 가져오기
	public int getMaxMaId();

}
