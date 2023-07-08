package com.modernhome.service;

import java.util.List;

import com.modernhome.domain.DefectiveVO;
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
	public List<WijoinVO> getDefList(String df_type, String nameSearch, PageVO vo) throws Exception;
	
	// 검색한 글 개수
	public int getDfSearchCnt(String df_type, String nameSearch, PageVO vo) throws Exception;
	
	// 품질검사가 완료이면서 작업지시id가 있는 목록
	public List<WijoinVO> getQcFinInstr() throws Exception;
	
	// 품질검사가 완료이면서 입고id가 있는 목록
	public List<WijoinVO> getQcFinRec() throws Exception;
	
	// 불량 등록
	public void addDefective(WijoinVO vo) throws Exception;
	
	// 불량 등록 시 입고 테이블 변경
	public void modifyRec(WijoinVO vo) throws Exception;
	
	// 불량 수정
	public void modifyDefective(WijoinVO vo) throws Exception;
	
	// 불량 삭제
	public void delDefective(Integer df_id) throws Exception;
	
	// 수리 처리한 불량품을 완제품 재고에 증가
	public void modifyProductReAndDis(WijoinVO vo) throws Exception;
	
	// 수리 처리한 불량품을 자재 재고에 증가
	public void modifyMaterialReAndDis(WijoinVO vo) throws Exception;
	
	// 수리 처리 후 불량 추가수정
	public void modifyDefective2(WijoinVO vo) throws Exception;
	
	// 품질검사가 완료이면서 출고id가 있는 목록
	public List<WijoinVO> getQcFinMrPr() throws Exception;
	
	// 불량 그래프 계산용
	public DefectiveVO dfCnt() throws Exception;
	
}