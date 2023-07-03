package com.modernhome.persistence;

import java.util.List;

import com.modernhome.domain.OutOrderJoinVO;
import com.modernhome.domain.OutOrderResultVO;
import com.modernhome.domain.OutOrderVO;
import com.modernhome.domain.PageVO;

public interface OutOrderDAO {
	
	// 수주 전체수 계산
	public int outOrderCnt() throws Exception;
	
	// 수주 리스트
	public List<OutOrderJoinVO> outOrderList(PageVO pvo);
	
	
	
	
	
	
	// 수주 검색결과수 계산
	public int ooSearchCnt(OutOrderJoinVO ovo) throws Exception;
	
	// 수주 검색 리스트
	public List<OutOrderJoinVO> outOrderListSearch(OutOrderJoinVO ovo, PageVO pvo);
	

	


	// 수주 등록
	public void regOutOrder(OutOrderVO ovo);
	
	// 수주 삭제
	public void deleteOutOrder(String oo_num);
	
	// 수주 수정
	public void updateOutOrder(OutOrderVO ovo);
	
	
	
	// 수주서
	public OutOrderJoinVO outOrderContract(String oo_num);
	
	
	// 월별 수주건수, 금액
	public List<OutOrderResultVO> monthlyOrderResult();
	
	
}
