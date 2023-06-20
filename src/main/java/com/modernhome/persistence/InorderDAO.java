package com.modernhome.persistence;

import java.util.List;

import com.modernhome.domain.InorderVO;

public interface InorderDAO {
	
	// 발주 조회
	public List<InorderVO> getInorderList();
	
	// 발주 조회 + 검색
	public List<InorderVO> getInorderSearch(String istartDate, String iendDate,String rstartDate, String rendDate, String ma_name, String io_state);
	
	// 발주 등록
	public void regInorder(InorderVO iovo);
	
	// 발주 수정
	public void updateInorder(InorderVO iovo);
	
	// 발주 삭제
	public void deleteInorder(int io_id);
}
