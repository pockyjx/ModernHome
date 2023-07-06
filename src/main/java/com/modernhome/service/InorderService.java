package com.modernhome.service;

import java.util.List;

import com.modernhome.domain.InorderVO;
import com.modernhome.domain.PageVO;
import com.modernhome.domain.ReqJoinVO;

import jdk.jshell.spi.ExecutionControl.ExecutionControlException;

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
	
	// 발주서 조회
	public List<InorderVO> getIoList(String io_num) throws Exception;
	
	// 발주 팝업 목록
	public List<InorderVO> getIoPopup(PageVO vo) throws Exception;
	
	// 발주 팝업 목록 개수
	public int getIoPopupCnt() throws Exception;	
	
	// 발주 월별 그래프
	public List<InorderVO> monthlyIOResult() throws Exception;
	
}	