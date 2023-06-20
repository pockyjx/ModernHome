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
	
	@Override
	public List<ReqJoinVO> getListAll() throws Exception {
		return rdao.getRequirements();
	}

	@Override
	public List<ReqJoinVO> getReqSearch(String option, String search) throws Exception {
		return rdao.getReqSearch(option, search);
	}

	
	
	

}
