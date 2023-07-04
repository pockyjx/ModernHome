package com.modernhome.domain;

public class LineShutdownVO {
	
	private Integer ls_id;
	private Integer line_id;
	private String ls_yn;
	private String ls_rsns;
	private String reg_date;
	private Integer emp_id;
	private String line_num;
	private String emp_name;
	
	public Integer getLs_id() {
		return ls_id;
	}
	public void setLs_id(Integer ls_id) {
		this.ls_id = ls_id;
	}
	public Integer getLine_id() {
		return line_id;
	}
	public void setLine_id(Integer line_id) {
		this.line_id = line_id;
	}
	public String getLs_yn() {
		return ls_yn;
	}
	public void setLs_yn(String ls_yn) {
		this.ls_yn = ls_yn;
	}
	public String getLs_rsns() {
		return ls_rsns;
	}
	public void setLs_rsns(String ls_rsns) {
		this.ls_rsns = ls_rsns;
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
	public String getLine_num() {
		return line_num;
	}
	public void setLine_num(String line_num) {
		this.line_num = line_num;
	}
	
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	@Override
	public String toString() {
		return "LineShutdownVO [ls_id=" + ls_id + ", line_id=" + line_id + ", ls_yn=" + ls_yn + ", ls_rsns=" + ls_rsns
				+ ", reg_date=" + reg_date + ", emp_id=" + emp_id + ", line_num=" + line_num + ", emp_name=" + emp_name
				+ "]";
	}
	
}