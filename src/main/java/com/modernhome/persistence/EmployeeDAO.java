package com.modernhome.persistence;

import java.util.List;

import com.modernhome.domain.EmployeeVO;

public interface EmployeeDAO {
	
	// 사원조회
	public List<EmployeeVO> employeeList();
	
	// 사원조회 + 검색
	public List<EmployeeVO> employeeListSearch(EmployeeVO evo);
	
	// 로그인 (회원정보 조회)
	public EmployeeVO loginMember(EmployeeVO vo);
	public EmployeeVO loginMember(int id,String pw);
	
	
}
