package com.modernhome.service;

import java.util.List;

import com.modernhome.domain.InorderVO;
import com.modernhome.domain.PageVO;

public interface InorderService {
	
	// 발주 조회 (페이징)
	public List<InorderVO> getInorderList(PageVO pvo) throws Exception;
	
	// 발주 개수 (페이징)
	public int getTotalCntMate() throws Exception;
	
	// 발주 조회 + 검색 (페이징)
	public List<InorderVO> getInorderSearch(String istartDate, String iendDate, String rstartDate, String rendDate,
											String ma_name, String io_state, PageVO pvo) throws Exception; 

	// 검색 결과 개수 (페이징)
	public int getIoSearchCnt(String istartDate, String iendDate, String rstartDate, String rendDate,
			String ma_name, String io_state) throws Exception;
	
	// 발주 등록
	public void regInorder(InorderVO iovo) throws Exception;
	
	// 발주 수정
	public void updateInorder(InorderVO iovo) throws Exception;
	
	// 발주 삭제
	public void deleteInorder(int io_id) throws Exception;
	
}	