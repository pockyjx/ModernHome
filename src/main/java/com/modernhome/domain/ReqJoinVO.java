package com.modernhome.domain;


public class ReqJoinVO {
	
	private Integer req_id;
	private String req_num;
	private Integer pro_id;
	private Integer ma_id;
	private int req_cnt;
	private String req_unit;
	private String req_reg_date;
	private Integer emp_id;
	private String req_update_date;
	private Integer update_emp_id;
	
	private String pro_num;
	private String pro_name;
	
	private String ma_num;
	private String ma_name;
	
	public Integer getReq_id() {
		return req_id;
	}
	public void setReq_id(Integer req_id) {
		this.req_id = req_id;
	}
	public String getReq_num() {
		return req_num;
	}
	public void setReq_num(String req_num) {
		this.req_num = req_num;
	}
	public Integer getPro_id() {
		return pro_id;
	}
	public void setPro_id(Integer pro_id) {
		this.pro_id = pro_id;
	}
	public Integer getMa_id() {
		return ma_id;
	}
	public void setMa_id(Integer ma_id) {
		this.ma_id = ma_id;
	}
	public int getReq_cnt() {
		return req_cnt;
	}
	public void setReq_cnt(int req_cnt) {
		this.req_cnt = req_cnt;
	}
	public String getReq_unit() {
		return req_unit;
	}
	public void setReq_unit(String req_unit) {
		this.req_unit = req_unit;
	}
	public String getReq_reg_date() {
		return req_reg_date;
	}
	public void setReq_reg_date(String req_reg_date) {
		this.req_reg_date = req_reg_date;
	}
	public Integer getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(Integer emp_id) {
		this.emp_id = emp_id;
	}
	public String getReq_update_date() {
		return req_update_date;
	}
	public void setReq_update_date(String req_update_date) {
		this.req_update_date = req_update_date;
	}
	public Integer getUpdate_emp_id() {
		return update_emp_id;
	}
	public void setUpdate_emp_id(Integer update_emp_id) {
		this.update_emp_id = update_emp_id;
	}
	public String getPro_num() {
		return pro_num;
	}
	public void setPro_num(String pro_num) {
		this.pro_num = pro_num;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public String getMa_num() {
		return ma_num;
	}
	public void setMa_num(String ma_num) {
		this.ma_num = ma_num;
	}
	public String getMa_name() {
		return ma_name;
	}
	public void setMa_name(String ma_name) {
		this.ma_name = ma_name;
	}
	@Override
	public String toString() {
		return "ReqJoinVO [req_id=" + req_id + ", req_num=" + req_num + ", pro_id=" + pro_id + ", ma_id=" + ma_id
				+ ", req_cnt=" + req_cnt + ", req_unit=" + req_unit + ", req_reg_date=" + req_reg_date + ", emp_id="
				+ emp_id + ", req_update_date=" + req_update_date + ", update_emp_id=" + update_emp_id + ", pro_num="
				+ pro_num + ", pro_name=" + pro_name + ", ma_num=" + ma_num + ", ma_name=" + ma_name + "]";
	}
	
	
	

}
