package com.modernhome.service;

import java.util.List;

import com.modernhome.domain.OutOrderJoinVO;
import com.modernhome.domain.OutOrderVO;
import com.modernhome.domain.PageVO;

public interface OutOrderService {
	
	// 수주 전체수 계산
	public int outOrderCnt() throws Exception;
	
	// 수주 조회
	public List<OutOrderJoinVO> outOrderList(PageVO pvo) throws Exception;
	
	
	
	// 수주 검색결과수 계산
	public int ooSearchCnt(OutOrderJoinVO ovo) throws Exception;
	
	
	// 수주 조회 + 검색
	public List<OutOrderJoinVO> outOrderListSearch(OutOrderJoinVO ovo, PageVO pvo);
	
	
	
	
	
	// 수주정보 등록
	public void regOutOrder(OutOrderVO ovo);
	
	// 수주정보 삭제
	public void deleteOutOrder(String oo_num);
	
	// 수주정보 수정
	public void updateOutOrder(OutOrderVO ovo);
	
	
	// 수주서
	public OutOrderJoinVO outOrderContract(String oo_num);
}

	
	
