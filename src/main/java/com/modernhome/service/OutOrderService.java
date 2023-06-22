package com.modernhome.service;

import java.util.List;

import com.modernhome.domain.OutOrderJoinVO;
import com.modernhome.domain.OutOrderVO;

public interface OutOrderService {
	
	// 수주 조회
	public List<OutOrderJoinVO> outOrderList() throws Exception;

	// 수주 조회 + 검색
	public List<OutOrderJoinVO> outOrderListSearch(OutOrderJoinVO ovo);
	
	
	// 수주정보 등록
	public void regOutOrder(OutOrderVO ovo);
}

	
	
