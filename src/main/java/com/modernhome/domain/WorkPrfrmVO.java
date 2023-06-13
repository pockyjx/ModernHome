package com.modernhome.domain;

import java.time.LocalDateTime;

public class WorkPrfrmVO {
	
	private int prfrm_id;
	private String prfrm_num;
	private int work_id;
	private int line_id;
	private int pro_id;
	private String gb_yn;
	private int prfrm_cnt;
	private LocalDateTime reg_date;
	private int emp_id;
	private LocalDateTime update_date;
	private int update_emp_id;
	private String note;
	
	public int getPrfrm_id() {
		return prfrm_id;
	}
	public void setPrfrm_id(int prfrm_id) {
		this.prfrm_id = prfrm_id;
	}
	public String getPrfrm_num() {
		return prfrm_num;
	}
	public void setPrfrm_num(String prfrm_num) {
		this.prfrm_num = prfrm_num;
	}
	public int getWork_id() {
		return work_id;
	}
	public void setWork_id(int work_id) {
		this.work_id = work_id;
	}
	public int getLine_id() {
		return line_id;
	}
	public void setLine_id(int line_id) {
		this.line_id = line_id;
	}
	public int getPro_id() {
		return pro_id;
	}
	public void setPro_id(int pro_id) {
		this.pro_id = pro_id;
	}
	public String getGb_yn() {
		return gb_yn;
	}
	public void setGb_yn(String gb_yn) {
		this.gb_yn = gb_yn;
	}
	public int getPrfrm_cnt() {
		return prfrm_cnt;
	}
	public void setPrfrm_cnt(int prfrm_cnt) {
		this.prfrm_cnt = prfrm_cnt;
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
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	
}