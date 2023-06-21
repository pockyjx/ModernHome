package com.modernhome.persistence;

import java.util.List;

import com.modernhome.domain.WijoinVO;

public interface WorkPrfrmDAO {
	
	// 작업지시 목록 중 품질검사가 완료인 목록
	public List<WijoinVO> getqcEndInstr() throws Exception;
	
}