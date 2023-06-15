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
	
	
	
	
}
