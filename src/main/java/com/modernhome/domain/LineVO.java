package com.modernhome.domain;

import java.sql.Timestamp;
import java.time.LocalDateTime;

public class LineVO {
	
	private Integer line_id;
	private String line_num;
	private String line_name;
	private String use_yn;
	private String reg_date;
	private Integer emp_id;
	private String update_date;
	private Integer update_emp_id;
	public Integer getLine_id() {
		return line_id;
	}
	public void setLine_id(Integer line_id) {
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
	public String getUse_yn() {
		return use_yn;
	}
	public void setUse_yn(String use_yn) {
		this.use_yn = use_yn;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public Integer getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(Integer emp_id) {
		this.emp_id = emp_id;
	}
	public String getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(String update_date) {
		this.update_date = update_date;
	}
	public Integer getUpdate_emp_id() {
		return update_emp_id;
	}
	public void setUpdate_emp_id(Integer update_emp_id) {
		this.update_emp_id = update_emp_id;
	}
	
	@Override
	public String toString() {
		return "LineVO [line_id=" + line_id + ", line_num=" + line_num + ", line_name=" + line_name + ", use_yn="
				+ use_yn + ", reg_date=" + reg_date + ", emp_id=" + emp_id + ", update_date=" + update_date
				+ ", update_emp_id=" + update_emp_id + "]";
	}
	

	
	
}