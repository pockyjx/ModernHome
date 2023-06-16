package com.modernhome.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.modernhome.domain.EmployeeVO;
import com.modernhome.persistence.EmployeeDAO;

@Service
public class EmployeeServiceImpl implements EmployeeService{
	
	@Inject
	private EmployeeDAO eDAO;
	
	// 사원조회
	@Override
	public List<EmployeeVO> employeeList() {
		return eDAO.employeeList();
	}

	// 사원조회 + 검색
	@Override
	public List<EmployeeVO> employeeListSearch(EmployeeVO evo) {
		return eDAO.employeeListSearch(evo);
	}

	// 로그인 동작 설계
	@Override
	public void employeeJoin(EmployeeVO vo) {
		// TODO Auto-generated method stub
		
	}

	// 사원 로그인
	@Override
	public EmployeeVO employeeLogin(EmployeeVO vo) {
		EmployeeVO resultVO = eDAO.loginMember(vo);
		return resultVO;
	}
	
	
	
	
	
}
