package com.modernhome.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.modernhome.domain.EmployeeVO;
import com.modernhome.service.EmployeeService;

@Controller
@RequestMapping(value = "/employee/*")
public class EmployeeController {
	
	EmployeeVO evo = null;
	
	private static final Logger logger = LoggerFactory.getLogger(EmployeeController.class);
	
	@Inject
	private EmployeeService eService;
	
	// 사원조회 - /employee/employeeList (GET)
	// http://localhost:8088/employee/employeeList
	@RequestMapping(value = "/employeeList", method = RequestMethod.GET)
	public void employeeListGET(Model model, EmployeeVO evo) throws Exception{
		logger.debug("employeeListGET() 호출");
		logger.debug("/emp/employeeList.jsp 페이지 이동");
		
		// 검색어가 하나라도 있으면 if문 실행, 아닐경우 else문 실행
		if(evo.getEmp_id() != null || evo.getEmp_name() != null || evo.getEmp_dept() != null
				|| evo.getEmp_rank() != null	|| evo.getEmp_state() != null) {
			logger.debug("검색어 O, 검색된 데이터만 출력 " + evo);
			// 서비스 -> 회원목록 가져오기
			List<EmployeeVO> employeeList = eService.employeeListSearch(evo);
			
			// Model 객체에 저장
			model.addAttribute("employeeList", employeeList);
		}else {

			logger.debug("검색어 X, 전체 데이터 출력 " + evo);
			// 서비스 -> 회원목록 가져오기
			List<EmployeeVO> employeeList = eService.employeeList();
			
			// Model 객체에 저장
			model.addAttribute("employeeList", employeeList);
		}
	}

	
}
