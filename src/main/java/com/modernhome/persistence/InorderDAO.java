package com.modernhome.persistence;

import java.util.List;

import com.modernhome.domain.InorderVO;

public interface InorderDAO {
	
	// 발주 목록 조회
	public List<InorderVO> getInorderList();
}
