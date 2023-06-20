package com.modernhome.service;

import java.util.List;

import com.modernhome.domain.InorderVO;
import com.modernhome.domain.WarehouseVO;

public interface InorderService {
	
	// 발주 조회
	public List<InorderVO> getInorderList() throws Exception;
	
	// 발주 조회 + 검색
	public List<InorderVO> getInorderSearch(String istartDate, String iendDate, String rstartDate, String rendDate,
											String ma_name, String io_state) throws Exception; 

	// 창고 등록
	public void regInorder(InorderVO iovo);
	
	// 창고 수정
	public void updateInorder(InorderVO iovo);
	
	// 창고 삭제
	public void deleteInorder(int io_id);
}	