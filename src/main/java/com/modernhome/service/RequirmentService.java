package com.modernhome.service;

import java.util.List;

import com.modernhome.domain.PageVO;
import com.modernhome.domain.ReqJoinVO;

public interface RequirmentService {
	
	// 소요량 목록 조회 (페이징)
	public List<ReqJoinVO> getListAll(PageVO vo) throws Exception;
	
	// 전체 글 개수 (페이징)
	public int getTotalCntReq() throws Exception;
	
	// 소요량 검색 결과 (페이징)
	public List<ReqJoinVO> getReqSearch(String option, 
								String search, PageVO vo) throws Exception;
	
	// 검색 결과 개수 (페이징)
	public int getReqSearchCnt(String option, String search) throws Exception;
	
	// 소요량 등록
	public void regRequirement(ReqJoinVO vo) throws Exception;

	// 소요량 수정
	public void modifyRequirement(ReqJoinVO vo) throws Exception;
	
	// 소요량 삭제
	public void deleteRequirement(int req_id) throws Exception;

	// 완제품 별 소요량 조회
	public List<ReqJoinVO> getBOMList(int pro_id) throws Exception;
	
}
