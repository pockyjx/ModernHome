package com.modernhome.domain;

import java.time.LocalDateTime;

public class LineVO {
	
	private int line_id;
	private String line_num;
	private String line_name;
	private String user_yn;
	private LocalDateTime reg_date;
	private int emp_id;
	private LocalDateTime update_date;
	private int update_emp_id;
	
	public int getLine_id() {
		return line_id;
	}
	public void setLine_id(int line_id) {
		this.line_id = line_id;
	}
	public String getLine_num() {
		return line_num;
	}
	public void setLine_num(String line_num) {
		this.line_num = line_num;
	}
	public String getLine_name() {
		return line_name;
	}
	public void setLine_name(String line_name) {
		this.line_name = line_name;
	}
	public String getUser_yn() {
		return user_yn;
	}
	public void setUser_yn(String user_yn) {
		this.user_yn = user_yn;
	}
	public LocalDateTime getReg_date() {
		return reg_date;
	}
	public void setReg_date(LocalDateTime reg_date) {
		this.reg_date = reg_date;
	}
	public int getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(int emp_id) {
		this.emp_id = emp_id;
	}
	public LocalDateTime getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(LocalDateTime update_date) {
		this.update_date = update_date;
	}
	public int getUpdate_emp_id() {
		return update_emp_id;
	}
	public void setUpdate_emp_id(int update_emp_id) {
		this.update_emp_id = update_emp_id;
	}
	
	@Override
	public String toString() {
		return "LineVO [line_id=" + line_id + ", line_num=" + line_num + ", line_name=" + line_name + ", user_yn="
				+ user_yn + ", reg_date=" + reg_date + ", emp_id=" + emp_id + ", update_date=" + update_date
				+ ", update_emp_id=" + update_emp_id + "]";
	}
	
}