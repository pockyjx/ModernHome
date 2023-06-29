package com.modernhome.persistence;

import java.util.List;

import com.modernhome.domain.EmployeeVO;
import com.modernhome.domain.PageVO;

public interface EmployeeDAO {
	
	// 로그인 (회원정보 조회)
	public EmployeeVO loginMember(EmployeeVO vo);
	
//	public EmployeeVO loginMember(int id,String pw);
	
	
	// ------------------------- 로그인
	
	
	// 총 사원수 계산
	public int empTotalCnt() throws Exception;
	
	// 사원조회(페이징)
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
