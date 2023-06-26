package com.modernhome.service;

import java.util.List;

import com.modernhome.domain.WijoinVO;

public interface WorkPrfrmService {
	
	// 작업지시 목록 중 품질검사가 완료인 목록
	public List<WijoinVO> getqcEndInstr() throws Exception;
	
	// 생산실적 목록 출력
	public List<WijoinVO> getPrfrmList() throws Exception;
	
	// 생산실적번호 자동 생성
	public String createPrfrmNum() throws Exception;
	
	// 생산실적 등록
	public void addPrfrm(WijoinVO vo) throws Exception;
	
	// 생산실적 수정
	public void modifyPrfrm(WijoinVO vo) throws Exception;
	
	// 생산실적 삭제
	public void deletePrfrm(WijoinVO vo) throws Exception;
	
}