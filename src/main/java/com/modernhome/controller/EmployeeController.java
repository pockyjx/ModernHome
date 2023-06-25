package com.modernhome.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.modernhome.domain.EmployeeVO;
import com.modernhome.service.EmployeeService;

@Controller
@RequestMapping(value = "/employee/*")
public class EmployeeController {
	
	EmployeeVO evo = null;
	
	private static final Logger logger = LoggerFactory.getLogger(EmployeeController.class);
	
	@Inject
	private EmployeeService eService;
	
	
	// 로그인 - 정보 입력(get)
	@RequestMapping(value = "/login",method = RequestMethod.GET)
	public void loginGET() {
		logger.debug(" loginGET() 호출 ");
		logger.debug(" 연결된 뷰페이지로 이동 (/emp/login.jsp)");
	}
	
	
	// 로그인 - 정보 처리(post)
	@RequestMapping(value = "/login",method = RequestMethod.POST)
	public String loginPOST(EmployeeVO vo,HttpSession session,HttpServletResponse response) throws Exception {
		// 전달정보 (로그인 ID,PW) 저장
		logger.debug(vo+"");
		
		// 서비스 -> DAO - 로그인체크 
		EmployeeVO resultVO = eService.employeeLogin(vo);
		
		logger.debug(resultVO+"");
		// 로그인 여부에 따라서 페이지 이동
		if(resultVO != null) {
			// 	O
			//   메인페이지로 이동(redirect)
			//   로그인 아이디, 이름, 부서, 권한을 세션에 저장
			session.setAttribute("emp_id", resultVO.getEmp_id());
			session.setAttribute("emp_name", resultVO.getEmp_name());
			session.setAttribute("emp_dept", resultVO.getEmp_dept());
			session.setAttribute("emp_auth", resultVO.getEmp_auth());
			logger.debug(" 로그인 성공! "+resultVO.getEmp_id());
			return "redirect:/employee/employeeList";
		}else {
			// 	X
			//   다시 로그인페이지로 이동
			logger.debug(" 로그인 실패! ");
			
			response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('아이디 또는 비밀번호를 잘못 입력했습니다. \\n입력하신 내용을 다시 확인해주세요.');");
				out.println("history.back();");
				out.println("</script>");
				out.close();
		        
			return null;
			
		}
	} // 로그인
		
//		// 메인페이지 
//		@RequestMapping(value = "/main",method = RequestMethod.GET)
//		public void mainGET() {
//			logger.debug(" mainGET() 호출 ");
//			
//			logger.debug(" /employee/main.jsp페이지 이동 ");
//		}
		
	// 로그아웃
	@RequestMapping(value = "/logout",method = RequestMethod.GET)
	public String logoutGET(HttpSession session) throws Exception{
		logger.debug("logoutGET() 호출!");
		
		// 세션정보 초기화
		session.invalidate();

		return "redirect:/employee/login";
	}
	
	// ------------------------------------------ 로그인 --------------
	
	
	
	
	
	
	
	
	// 사원조회 - /employee/employeeList (GET)
	// http://localhost:8088/employee/employeeList
	// http://localhost:8088/employee/login
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
			
			logger.debug(employeeList + "");
			
			// Model 객체에 저장
			model.addAttribute("employeeList", employeeList);
		}
	}
	

	
	
	// 사원등록, 사원 업데이트
	@RequestMapping(value = "/regEmployee", method = RequestMethod.POST)
	public String regEmployeePOST(EmployeeVO evo) throws Exception{
		
		if(evo.getEmp_id() == null) {
			logger.debug("regEmployeePOST() 호출(사원 등록)");
			
			logger.debug("evo : " + evo);
			
			eService.regEmployee(evo);
		}else {
			logger.debug("regEmployePOST() 호출(사원 업데이트)");
			
			logger.debug("evo : " + evo);
			
			eService.updateEmployee(evo);
		}
		
		return "redirect:/employee/employeeList";
	}
		
		
	// 사원삭제
	@RequestMapping(value = "/deleteEmployee")
	public String deleteEmployee(@RequestParam(value = "selectedEmpId", required = false) Integer[] selectedEmpIds) throws Exception {
		
		logger.debug("deleteEmployee() 호출(사원삭제)");
		if(selectedEmpIds != null) {
		    for (Integer emp_id : selectedEmpIds) {
		    	eService.deleteEmployee(emp_id);
		    }
		}
	    
	    return "redirect:/employee/employeeList";
	}
		
		
		
		
}
