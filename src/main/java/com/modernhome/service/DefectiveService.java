package com.modernhome.service;

import java.util.List;

import com.modernhome.domain.PageVO;
import com.modernhome.domain.WijoinVO;

public interface DefectiveService {
	
	// 불량 목록 출력
	public List<WijoinVO> getDefList(PageVO vo) throws Exception;
	
	// 전체 글 개수
	public int getDfTotalCnt() throws Exception;
	
	// 불량 코드 자동 생성
	public List<WijoinVO> creatDefNum() throws Exception;

	// 검색한 불량 목록 출력
	public List<WijoinVO> getDefList(String df_type, String nameSearch, String line_num, PageVO vo) throws Exception;
	
	// 검색한 글 개수
	public int getDfSearchCnt(String df_type, String nameSearch, String line_num) throws Exception;
	
	// 품질검사가 완료이면서 작업지시id가 있는 목록
	public List<WijoinVO> getQcFinInstr() throws Exception;
	
	// 품질검사가 완료이면서 입고id가 있는 목록
	public List<WijoinVO> getQcFinRec() throws Exception;
	
	// 불량 등록
	public void addDefective(WijoinVO vo) throws Exception;
	
	// 불량 수정
	public void modifyDefective(WijoinVO vo) throws Exception;
	
	// 불량 삭제
	public void delDefective(Integer df_id) throws Exception;
	
}