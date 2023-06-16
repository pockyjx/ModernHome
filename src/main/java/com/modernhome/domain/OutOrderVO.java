package com.modernhome.domain;

import java.sql.Date;

public class OutOrderVO {
	
	private int oo_id;
	private String oo_num;
	private int emp_id;
	private int clt_id;
	private int pro_id;
	private int clt_cost;
	private int oo_cnt;
	private Date oo_start_date;
	private Date oo_end_date;
	private String oo_state;
	private int update_emp_id;
	private Date oo_update_date;
	
	public int getOo_id() {
		return oo_id;
	}
	public void setOo_id(int oo_id) {
		this.oo_id = oo_id;
	}
	public String getOo_num() {
		return oo_num;
	}
	public void setOo_num(String oo_num) {
		this.oo_num = oo_num;
	}
	public int getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(int emp_id) {
		this.emp_id = emp_id;
	}
	public int getClt_id() {
		return clt_id;
	}
	public void setClt_id(int clt_id) {
		this.clt_id = clt_id;
	}
	public int getPro_id() {
		return pro_id;
	}
	public void setPro_id(int pro_id) {
		this.pro_id = pro_id;
	}
	public int getClt_cost() {
		return clt_cost;
	}
	public void setClt_cost(int clt_cost) {
		this.clt_cost = clt_cost;
	}
	public int getOo_cnt() {
		return oo_cnt;
	}
	public void setOo_cnt(int oo_cnt) {
		this.oo_cnt = oo_cnt;
	}
	public Date getOo_start_date() {
		return oo_start_date;
	}
	public void setOo_start_date(Date oo_start_date) {
		this.oo_start_date = oo_start_date;
	}
	public Date getOo_end_date() {
		return oo_end_date;
	}
	public void setOo_end_date(Date oo_end_date) {
		this.oo_end_date = oo_end_date;
	}
	public String getOo_state() {
		return oo_state;
	}
	public void setOo_state(String oo_state) {
		this.oo_state = oo_state;
	}
	public int getUpdate_emp_id() {
		return update_emp_id;
	}
	public void setUpdate_emp_id(int update_emp_id) {
		this.update_emp_id = update_emp_id;
	}
	public Date getOo_update_date() {
		return oo_update_date;
	}
	public void setOo_update_date(Date oo_update_date) {
		this.oo_update_date = oo_update_date;
	}
	
}