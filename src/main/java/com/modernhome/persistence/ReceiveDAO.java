package com.modernhome.persistence;

import java.util.List;

import com.modernhome.domain.ReceiveVO;

public interface ReceiveDAO {
	
	// 입고 조회
	public List<ReceiveVO> getReceiveList();
		
	// 입고 조회 + 검색
	public List<ReceiveVO> getReceiveSearch(String startDate, String endDate, String ma_name, String io_num);
	
	// 입고 등록
	public void regReceive(ReceiveVO rvo);
	
	// 입고 수정
	public void updateReceive(ReceiveVO rvo);
	
	// 입고 삭제
	public void deleteReceive(int rec_id);
	
}
