package com.modernhome.persistence;

import java.util.List;

import com.modernhome.domain.PageVO;
import com.modernhome.domain.ReceiveVO;

public interface ReceiveDAO {
	
	// 입고 조회 (페이징)
	public List<ReceiveVO> getReceiveList(PageVO vo);
	
	// 전체 글 개수 (페이징)
	public int getRecTotalCnt();
		
	// 입고 조회 + 검색 (페이징)
	public List<ReceiveVO> getReceiveSearch(String startDate, String endDate, String ma_name, String io_num, PageVO vo);
	
	// 검색 결과 개수 (페이징)
	public int getRecSearchCnt(String startDate, String endDate, String ma_name, String io_num);
	
	// 입고 등록
	public void regReceive(ReceiveVO rvo);
	
	// 입고 수정
	public void updateReceive(ReceiveVO rvo);
	
	// 입고 삭제
	public void deleteReceive(int rec_id);
	
	// 입고 처리
	public void acceptReceive(Integer rec_id, Integer ma_id, Integer rec_cnt) throws Exception;
	
}
