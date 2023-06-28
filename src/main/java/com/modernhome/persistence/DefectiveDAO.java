package com.modernhome.persistence;

import java.util.List;

import com.modernhome.domain.PageVO;
import com.modernhome.domain.WijoinVO;

public interface DefectiveDAO {
	
	// 불량 목록 출력
	public List<WijoinVO> getDefList(PageVO vo) throws Exception;
	
	// 전체 글 개수
	public int getDfTotalCnt() throws Exception;
	
	// 불량 코드 자동 생성
	public String creatDefNum() throws Exception;
	
}