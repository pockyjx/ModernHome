package com.modernhome.service;

import java.util.List;

import com.modernhome.domain.PageVO;
import com.modernhome.domain.WijoinVO;

public interface QualityService {
	
	// 품질검사(완제품) 목록 조회(페이징)
	public List<WijoinVO> getQualityList(PageVO pvo) throws Exception;
	
	// 품질검사 개수(페이징)
	public int getTotalCntQc() throws Exception;
	
	// 품질검사(완제품) 목록 조회 + 검색(페이징)
	public List<WijoinVO> getQualitySearch(String qc_num, String startDate, String endDate, String qc_yn, PageVO pvo) throws Exception;
	
	// 품질검사(완제품) 검색 결과(페이징) 
	public int getQualitySearchCnt(String qc_num, String startDate, String endDate, String qc_yn) throws Exception;

	// 품질검사(완제품) 수정
	public void updateQuality(WijoinVO wvo) throws Exception;
	
	////////////////////////////////////////////////////////////////////////////////////////////////////
	
	// 품질검사(자재) 목록 조회(페이징)
	public List<WijoinVO> getMaterialQualityList(PageVO pvo) throws Exception;
	
	// 품질검사(자재) 개수(페이징)
	public int getTotalCntMqc() throws Exception;
	
	// 품질검사(자재) 목록 조회 + 검색(페이징)
	public List<WijoinVO> getMaterialQualitySearch(String qc_num, String startDate, String endDate, String qc_yn, PageVO pvo) throws Exception;
	
	// 품질검사(자재) 검색 결과(페이징)
	public int getMaterialQualitySearchCnt(String qc_num, String startDate, String endDate, String qc_yn) throws Exception;
	
	// 품질검사(자재) 수정
	public void updateMaterialQuality(WijoinVO wvo) throws Exception;
	
	// 입고에서 입고대기일 경우 품질검사 자동 등록
	public void addQC(WijoinVO wvo) throws Exception;
	
	// 품질검사(자재)에서 불량개수가 0이면 입고완료로 변경
	public void modifyRec(WijoinVO wvo) throws Exception;
	
	/////////////////////////////////////////////////////////////////////////////////////////
	
	// 출고검사 목록 조회
	public List<WijoinVO> getMrList(PageVO pvo) throws Exception;
	
	// 출고검사(자재) 개수 (페이징)
	public int getTotalCntFi() throws Exception;
	
	// 출고검사 목록 조회 + 검색
	public List<WijoinVO> getMrListSearch(String qc_num, String qc_yn, String startDate, String endDate, PageVO pvo) throws Exception;
	
	// 출고검사 검색 결과(페이징)
	public int getMrListSearchCnt(String qc_num, String qc_yn, String startDate, String endDate) throws Exception;
	
	// 출고검사 수정
	public void updateFactoryInspection(WijoinVO wvo) throws Exception;
	
	// 자재 출고에서 출고대기일 경우 품질검사 자동 등록
	public void addMrQC(WijoinVO wvo) throws Exception;
	
	// 완제품 출고에서 출고대기일 경우 품질검사 자동 등록
	public void addPrQC(WijoinVO wvo) throws Exception;
	
}// QualityService
