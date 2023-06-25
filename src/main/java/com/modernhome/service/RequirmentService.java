package com.modernhome.service;

import java.util.List;

import com.modernhome.domain.ReqJoinVO;
import com.modernhome.domain.RequirementVO;

public interface RequirmentService {
	
	// 소요량 목록 조회
	public List<ReqJoinVO> getListAll() throws Exception;
	
	// 소요량 검색 결과
	public List<ReqJoinVO> getReqSearch(String option, 
								String search) throws Exception;
	
	// 소요량 등록
	public void regRequirement(ReqJoinVO vo) throws Exception;

	// 소요량 수정
	public void modifyRequirement(ReqJoinVO vo) throws Exception;
	
	// 소요량 삭제
	public void deleteRequirement(int req_id) throws Exception;

	// 완제품 별 소요량 조회
	public List<ReqJoinVO> getBOMList(int pro_id) throws Exception;
	
}
