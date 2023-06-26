package com.modernhome.domain;

public class OutOrderVO {

	private Integer oo_id;
	private String oo_num;
	private Integer emp_id;
	private Integer clt_id;
	private Integer pro_id;
	private Integer clt_cost;
	private Integer oo_cnt;
	private String oo_start_date;
	private String oo_end_date;
	private String oo_state;
	private Integer update_emp_id;
	private String oo_reg_date;
	private String oo_update_date;
	public Integer getOo_id() {
		return oo_id;
	}
	public void setOo_id(Integer oo_id) {
		this.oo_id = oo_id;
	}
	public String getOo_num() {
		return oo_num;
	}
	public void setOo_num(String oo_num) {
		this.oo_num = oo_num;
	}
	public Integer getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(Integer emp_id) {
		this.emp_id = emp_id;
	}
	public Integer getClt_id() {
		return clt_id;
	}
	public void setClt_id(Integer clt_id) {
		this.clt_id = clt_id;
	}
	public Integer getPro_id() {
		return pro_id;
	}
	public void setPro_id(Integer pro_id) {
		this.pro_id = pro_id;
	}
	public Integer getClt_cost() {
		return clt_cost;
	}
	public void setClt_cost(Integer clt_cost) {
		this.clt_cost = clt_cost;
	}
	public Integer getOo_cnt() {
		return oo_cnt;
	}
	public void setOo_cnt(Integer oo_cnt) {
		this.oo_cnt = oo_cnt;
	}
	public String getOo_start_date() {
		return oo_start_date;
	}
	public void setOo_start_date(String oo_start_date) {
		this.oo_start_date = oo_start_date;
	}
	public String getOo_end_date() {
		return oo_end_date;
	}
	public void setOo_end_date(String oo_end_date) {
		this.oo_end_date = oo_end_date;
	}
	public String getOo_state() {
		return oo_state;
	}
	public void setOo_state(String oo_state) {
		this.oo_state = oo_state;
	}
	public Integer getUpdate_emp_id() {
		return update_emp_id;
	}
	public void setUpdate_emp_id(Integer update_emp_id) {
		this.update_emp_id = update_emp_id;
	}
	public String getOo_reg_date() {
		return oo_reg_date;
	}
	public void setOo_reg_date(String oo_reg_date) {
		this.oo_reg_date = oo_reg_date;
	}
	public String getOo_update_date() {
		return oo_update_date;
	}
	public void setOo_update_date(String oo_update_date) {
		this.oo_update_date = oo_update_date;
	}
	@Override
	public String toString() {
		return "OutOrderVO [oo_id=" + oo_id + ", oo_num=" + oo_num + ", emp_id=" + emp_id + ", clt_id=" + clt_id
				+ ", pro_id=" + pro_id + ", clt_cost=" + clt_cost + ", oo_cnt=" + oo_cnt + ", oo_start_date="
				+ oo_start_date + ", oo_end_date=" + oo_end_date + ", oo_state=" + oo_state + ", update_emp_id="
				+ update_emp_id + ", oo_reg_date=" + oo_reg_date + ", oo_update_date=" + oo_update_date + "]";
	}
	
	
	
	
	
	
	
	
}
