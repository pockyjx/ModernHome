package com.modernhome.domain;

import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class EmployeeVO {
	
	private Integer emp_id;
	private String emp_pw;
	private String emp_name;
	private String emp_gender;
	
//	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) // 이거는 datetime-local 을 DB에 넣을 때 사용
	
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate emp_birth;
	
	private String emp_dept;
	private String emp_rank;
	private Integer emp_auth;
	private String emp_state;
	private String emp_tel;
	private String emp_email;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate emp_hire_date;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate emp_rsgnt_date;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate emp_start_leave_date;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate emp_end_leave_date;
	
	private String emp_pic;
	
	

	
	// 로컬데이터타임 데이터 타입을 yyyy-MM-DD 형태로 값을 저장하기 위함, DB에 넣을 때 사용, 혹시나 해서 일단 남겨둠
//	public void setEmp_birth(Timestamp emp_birth) {
//		if (emp_birth != null) {
//			this.emp_birth = emp_birth.toLocalDateTime().toLocalDate();
//		}
//	}
	

	
	
}
