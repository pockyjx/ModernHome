package com.modernhome.domain;

public class EmployeeVO {
	
	private Integer emp_id;
	private String emp_pw;
	private String emp_name;
	private String emp_gender;
	
	
	
//	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) // 이거는 datetime-local 을 DB에 넣을 때 사용
//	@DateTimeFormat(pattern = "yyyy-MM-dd")
	
	private String emp_birth;
	
	private String emp_dept;
	private String emp_rank;
	private Integer emp_auth;
	private String emp_state;
	private String emp_tel;
	private String emp_email;
	
	private String emp_hire_date;
	private String emp_rsgnt_date;
	private String emp_start_leave_date;
	private String emp_end_leave_date;
	
	private String emp_pic;

	public Integer getEmp_id() {
		return emp_id;
	}

	public void setEmp_id(Integer emp_id) {
		this.emp_id = emp_id;
	}

	public String getEmp_pw() {
		return emp_pw;
	}

	public void setEmp_pw(String emp_pw) {
		this.emp_pw = emp_pw;
	}

	public String getEmp_name() {
		return emp_name;
	}

	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}

	public String getEmp_gender() {
		return emp_gender;
	}

	public void setEmp_gender(String emp_gender) {
		this.emp_gender = emp_gender;
	}

	public String getEmp_birth() {
		return emp_birth;
	}

	public void setEmp_birth(String emp_birth) {
		this.emp_birth = emp_birth;
	}

	public String getEmp_dept() {
		return emp_dept;
	}

	public void setEmp_dept(String emp_dept) {
		this.emp_dept = emp_dept;
	}

	public String getEmp_rank() {
		return emp_rank;
	}

	public void setEmp_rank(String emp_rank) {
		this.emp_rank = emp_rank;
	}

	public Integer getEmp_auth() {
		return emp_auth;
	}

	public void setEmp_auth(Integer emp_auth) {
		this.emp_auth = emp_auth;
	}

	public String getEmp_state() {
		return emp_state;
	}

	public void setEmp_state(String emp_state) {
		this.emp_state = emp_state;
	}

	public String getEmp_tel() {
		return emp_tel;
	}

	public void setEmp_tel(String emp_tel) {
		this.emp_tel = emp_tel;
	}

	public String getEmp_email() {
		return emp_email;
	}

	public void setEmp_email(String emp_email) {
		this.emp_email = emp_email;
	}

	public String getEmp_hire_date() {
		return emp_hire_date;
	}

	public void setEmp_hire_date(String emp_hire_date) {
		this.emp_hire_date = emp_hire_date;
	}

	public String getEmp_rsgnt_date() {
		return emp_rsgnt_date;
	}

	public void setEmp_rsgnt_date(String emp_rsgnt_date) {
		this.emp_rsgnt_date = emp_rsgnt_date;
	}

	public String getEmp_start_leave_date() {
		return emp_start_leave_date;
	}

	public void setEmp_start_leave_date(String emp_start_leave_date) {
		this.emp_start_leave_date = emp_start_leave_date;
	}

	public String getEmp_end_leave_date() {
		return emp_end_leave_date;
	}

	public void setEmp_end_leave_date(String emp_end_leave_date) {
		this.emp_end_leave_date = emp_end_leave_date;
	}

	public String getEmp_pic() {
		return emp_pic;
	}

	public void setEmp_pic(String emp_pic) {
		this.emp_pic = emp_pic;
	}

	@Override
	public String toString() {
		return "EmployeeVO [emp_id=" + emp_id + ", emp_pw=" + emp_pw + ", emp_name=" + emp_name + ", emp_gender="
				+ emp_gender + ", emp_birth=" + emp_birth + ", emp_dept=" + emp_dept + ", emp_rank=" + emp_rank
				+ ", emp_auth=" + emp_auth + ", emp_state=" + emp_state + ", emp_tel=" + emp_tel + ", emp_email="
				+ emp_email + ", emp_hire_date=" + emp_hire_date + ", emp_rsgnt_date=" + emp_rsgnt_date
				+ ", emp_start_leave_date=" + emp_start_leave_date + ", emp_end_leave_date=" + emp_end_leave_date
				+ ", emp_pic=" + emp_pic + "]";
	}
	

	
	// 로컬데이터타임 데이터 타입을 yyyy-MM-DD 형태로 값을 저장하기 위함, DB에 넣을 때 사용, 혹시나 해서 일단 남겨둠
//	public void setEmp_birth(Timestamp emp_birth) {
//		if (emp_birth != null) {
//			this.emp_birth = emp_birth.toLocalDateTime().toLocalDate();
//		}
//	}
	
	

	
	
}
