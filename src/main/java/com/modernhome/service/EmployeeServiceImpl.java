package com.modernhome.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.modernhome.domain.EmployeeVO;
import com.modernhome.domain.PageVO;
import com.modernhome.persistence.EmployeeDAO;

@Service
public class EmployeeServiceImpl implements EmployeeService{
	
	@Inject
	private EmployeeDAO eDAO;
	
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
	
	// ------------------------ 로그인
	
	// 총 사원수 계산
	@Override
	public int empTotalCnt() throws Exception {
		return eDAO.empTotalCnt();
	}
	
	// 사원조회
	@Override
	public List<EmployeeVO> employeeList(PageVO pvo) {
		return eDAO.employeeList(pvo);
	}

	
	
	
	
	
	// 사원조회 + 검색
	@Override
	public List<EmployeeVO> employeeListSearch(EmployeeVO evo, PageVO pvo) {
		return eDAO.employeeListSearch(evo, pvo);
	}

	// 사원 검색결과수 계산
	@Override
	public int empSearchCnt(EmployeeVO evo) throws Exception {
		return eDAO.empSearchCnt(evo);
	}

	
	
	
	
	
	
	
	// 사원등록
	@Override
	public void regEmployee(EmployeeVO evo) {
		eDAO.regEmployee(evo);
	}

	
	
	// 사원삭제
	@Override
	public void deleteEmployee(int emp_id) {
		eDAO.deleteEmployee(emp_id);
	}

	
	// 사원업데이트(수정)
	@Override
	public void updateEmployee(EmployeeVO evo) {
		eDAO.updateEmployee(evo);
	}


	
	
	
}
