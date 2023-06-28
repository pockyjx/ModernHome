package com.modernhome.service;

import java.util.List;

import com.modernhome.domain.EmployeeVO;
import com.modernhome.domain.PageVO;

public interface EmployeeService {
	
	// 구현동작 설계
	public void employeeJoin(EmployeeVO vo);
	
	// 로그인
	public EmployeeVO employeeLogin(EmployeeVO vo); // vo - id,pw만 저장
	
	// --------------- 로그인
	
	// 총 사원수 계산
	public int empTotalCnt() throws Exception;
	
	// 사원조회
	public List<EmployeeVO> employeeList(PageVO pvo);
	
	
	
	// 사원조회 + 검색
	public List<EmployeeVO> employeeListSearch(EmployeeVO evo, PageVO pvo);
	
	// 사원 검색결과수 계산
	public int empSearchCnt(EmployeeVO evo) throws Exception;

	
	
	
	
	// 사원등록
	public void regEmployee(EmployeeVO evo);
	
	// 사원삭제
	public void deleteEmployee(int emp_id);
	
	// 사원업데이트
	public void updateEmployee(EmployeeVO evo);
	
	
	
	
}
