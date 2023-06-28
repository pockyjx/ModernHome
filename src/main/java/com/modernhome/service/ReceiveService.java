package com.modernhome.service;

import java.util.List;

import com.modernhome.domain.PageVO;
import com.modernhome.domain.ReceiveVO;

public interface ReceiveService {
	
	// 입고 조회 (페이징)
	public List<ReceiveVO> getReceiveList(PageVO vo) throws Exception;
		
	// 전체 글 개수 (페이징)
	public int getTotalCntRec() throws Exception;
	
	// 입고 조회 + 검색 (페이징)
	public List<ReceiveVO> getReceiveSearch(String startDate, String endDate, 
											String ma_name, String io_num, PageVO vo) throws Exception; 
	
	// 검색 결과 개수 (페이징)
	public int getRecSearchCnt(String startDate, String endDate, 
								String ma_name, String io_num);
	
	// 입고 등록
	public void regReceive(ReceiveVO rvo);
	
	// 입고 수정
	public void updateReceive(ReceiveVO rvo);
	
	// 입고 삭제
	public void deleteReceive(int rec_id);
}
