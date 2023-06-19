package com.modernhome.persistence;

import java.util.List;

import com.modernhome.domain.InorderVO;

public interface InorderDAO {
	
	// 발주 조회
	public List<InorderVO> getInorderList();
	
	// 발주 조회 + 검색
	public List<InorderVO> getInorderSearch(String startDate, String endDate, String ma_name, String io_state);
}
