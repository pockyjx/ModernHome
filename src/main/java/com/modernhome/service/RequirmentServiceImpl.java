package com.modernhome.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.modernhome.domain.RequirementVO;
import com.modernhome.persistence.RequirmentDAO;

@Service
public class RequirmentServiceImpl implements RequirmentService {
	
	// DAO 객체 주입
	@Autowired
	private RequirmentDAO rdao;
	
	@Override
	public List<RequirementVO> getListAll() throws Exception {
		return rdao.getRequirements();
	}

}
