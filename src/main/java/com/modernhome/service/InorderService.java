package com.modernhome.service;

import java.util.List;

import com.modernhome.domain.InorderVO;

public interface InorderService {
	
	// 발주 조회
	public List<InorderVO> getInorderList() throws Exception;
	
	// 발주 조회 + 검색
	public List<InorderVO> getInorderSearch(String startDate, String endDate, 
											String ma_name, String io_state) throws Exception; 
}	