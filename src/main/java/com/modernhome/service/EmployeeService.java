package com.modernhome.service;

import java.util.List;

import com.modernhome.domain.EmployeeVO;

public interface EmployeeService {
	
	// 사원조회
	public List<EmployeeVO> employeeList();
	
	// 사원조회 + 검색
	public List<EmployeeVO> employeeListSearch(EmployeeVO evo);
	
}
