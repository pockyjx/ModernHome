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
	
	// 수주정보 삭제
	public void deleteOutOrder(String oo_num);
	
	// 수주정보 수정
	public void updateOutOrder(OutOrderVO ovo);
}

	
	
