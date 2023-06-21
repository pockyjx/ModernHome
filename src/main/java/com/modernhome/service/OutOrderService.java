package com.modernhome.service;

import java.util.List;

import com.modernhome.domain.OutOrderVO;

public interface OutOrderService {
	
	// 수주 조회
	public List<OutOrderVO> outOrderList() throws Exception;

	// 수주 조회 + 검색
	public List<OutOrderVO> outOrderListSearch(OutOrderVO ovo);
	
	
	// 수주정보 등록
	public void regOutOrder(OutOrderVO ovo);
}

	
	
