package com.modernhome.service;

import java.util.List;

import com.modernhome.domain.ReceiveVO;

public interface ReceiveService {
	
	// 입고 조회
	public List<ReceiveVO> getReceiveList() throws Exception;
		
	// 입고 조회 + 검색
	public List<ReceiveVO> getReceiveSearch(java.util.Date startDate, java.util.Date endDate, 
											String ma_name, String io_num) throws Exception; 
}
