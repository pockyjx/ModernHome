package com.modernhome.service;

import java.util.List;

import com.modernhome.domain.PageVO;
import com.modernhome.domain.WijoinVO;

public interface QualityService {
	
	// 품질검사(완제품) 목록 조회(페이징)
	public List<WijoinVO> getQualityList(PageVO pvo) throws Exception;
	
	// 품질검사 개수(페이징)
	public int getTotalCntMate() throws Exception;
	
	// 품질검사(완제품) 목록 조회 + 검색(페이징)
	public List<WijoinVO> getQualitySearch(String qc_num, String startDate, String endDate, String qc_yn, PageVO pvo) throws Exception;
	
	// 품질검사(완제품) 검색 결과(페이징) 
	public int getQualitySearchCnt(String qc_num, String startDate, String endDate, String qc_yn) throws Exception;

	// 품질검사(완제품) 수정
	public void updateQuality(WijoinVO wvo) throws Exception;
	
	
	// 품질검사(자재) 목록 조회(페이징)
	public List<WijoinVO> getMaterialQualityList(PageVO pvo) throws Exception;
	
	// 품질검사(자재) 개수(페이징)
	public int getTotalCntMT() throws Exception;
	
	// 품질검사(자재) 목록 조회 + 검색(페이징)
	public List<WijoinVO> getMaterialQualitySearch(String qc_num, String startDate, String endDate, String qc_yn, PageVO pvo) throws Exception;
	
	// 품질검사(자재) 검색 결과(페이징)
	public int getMaterialQualitySearchCnt(String qc_num, String startDate, String endDate, String qc_yn) throws Exception;
	
	// 품질검사(자재) 수정
	public void updateMaterialQuality(WijoinVO wvo) throws Exception;
	
	// 
	public void addQC(WijoinVO wvo) throws Exception;
	
	
}// QualityService
