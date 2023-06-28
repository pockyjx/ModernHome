package com.modernhome.persistence;

import java.util.List;

import com.modernhome.domain.WijoinVO;

public interface QualityDAO {
	
	// 품질검사(완제품) 목록 조회
	public List<WijoinVO> getQualityList() throws Exception;
	
	// 품질검사(완제품) 목록 조회 + 검색
	public List<WijoinVO> getQualitySearch(String qc_num, String startDate, String endDate, String qc_yn) throws Exception;
	
	// 품질검사(완제품) 수정
	public void updateQuality(WijoinVO wvo);
	
	// 품질검사(자재) 목록 조회
	public List<WijoinVO> getMaterialQualityList() throws Exception;
	
//	// 품질검사(자재) 목록 조회 + 검색
	public List<WijoinVO> getMaterialQualitySearch(String qc_num, String startDate, String endDate, String qc_yn) throws Exception;
	
	// 품질검사(자재) 수정
//	public void updateMaterialQuality(WijoinVO wvo);
	
} // QualityDAO
