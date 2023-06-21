package com.modernhome.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.modernhome.domain.ReqJoinVO;
import com.modernhome.domain.RequirementVO;
import com.modernhome.persistence.RequirmentDAO;

@Service
public class RequirmentServiceImpl implements RequirmentService {
	
	// DAO 객체 주입
	@Autowired
	private RequirmentDAO rdao;
	
	// 소요량 조회
	@Override
	public List<ReqJoinVO> getListAll() throws Exception {
		return rdao.getRequirements();
	}
	
	// 소요량 검색
	@Override
	public List<ReqJoinVO> getReqSearch(String option, String search) throws Exception {
		return rdao.getReqSearch(option, search);
	}

	// 소요량 등록
	@Override
	public void regRequirement(ReqJoinVO vo) throws Exception {
		rdao.regRequirement(vo);
	}

	// 소요량 수정
	@Override
	public void modifyRequirement(ReqJoinVO vo) throws Exception {
		rdao.modifyRequirement(vo);
	}

	// 소요량 삭제
	@Override
	public void deleteRequirement(int req_id) throws Exception {
		rdao.deleteRequirement(req_id);
	}
	
	

	
	
	

}
