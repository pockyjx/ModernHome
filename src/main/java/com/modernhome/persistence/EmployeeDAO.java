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
	
	// 사원등록
	public void regEmployee(EmployeeVO evo);
	
	// 사원삭제
	public void deleteEmployee(int emp_id);
	
	// 사원업데이트
	public void updateEmployee(EmployeeVO evo);
	
	// 팀원관리
	public List<EmployeeVO> employeeManagement(Integer emp_id);
	
	// 팀원관리 - 검색
	public List<EmployeeVO> employeeMngSearch(EmployeeVO evo, Integer session_emp_id);
	
}
