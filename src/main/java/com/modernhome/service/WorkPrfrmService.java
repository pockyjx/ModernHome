package com.modernhome.service;

import java.util.List;

import com.modernhome.domain.WijoinVO;

public interface WorkPrfrmService {
	
	// 작업지시 목록 중 품질검사가 완료인 목록
	public List<WijoinVO> getqcEndInstr() throws Exception;
	
	// 생산실적 목록 출력
	public List<WijoinVO> getPrfrmList() throws Exception;
	
	// 생산실적번호 자동 생성
	public List<WijoinVO> createPrfrmNum() throws Exception;
	
}