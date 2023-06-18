package com.modernhome.persistence;

import java.util.List;

import com.modernhome.domain.ReceiveVO;

public interface ReceiveDAO {
	
	// 발주 조회
	public List<ReceiveVO> getReceiveList();
		
	// 발주 조회 + 검색
	public List<ReceiveVO> getReceiveSearch(java.util.Date startDate, java.util.Date endDate, String ma_name, String io_num);

}
