package com.modernhome.domain;

import java.sql.Date;

public class RequirementVO {

	private int req_id;
	private String req_num;
	private int pro_id;
	private int ma_id;
	private int req_cnt;
	private String req_unit;
	private Date req_reg_date;
	private int emp_id;
	private Date req_update_date;
	private int update_emp_id;
	
	// join할 테이블
	private ProductVO productVO;
	private MaterialVO materialVO;
	
	public int getReq_id() {
		return req_id;
	}
	public void setReq_id(int req_id) {
		this.req_id = req_id;
	}
	public String getReq_num() {
		return req_num;
	}
	public void setReq_num(String req_num) {
		this.req_num = req_num;
	}
	public int getPro_id() {
		return pro_id;
	}
	public void setPro_id(int pro_id) {
		this.pro_id = pro_id;
	}
	public int getMa_id() {
		return ma_id;
	}
	public void setMa_id(int ma_id) {
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
	public Date getReq_reg_date() {
		return req_reg_date;
	}
	public void setReq_reg_date(Date req_reg_date) {
		this.req_reg_date = req_reg_date;
	}
	public int getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(int emp_id) {
		this.emp_id = emp_id;
	}
	public Date getReq_update_date() {
		return req_update_date;
	}
	public void setReq_update_date(Date req_update_date) {
		this.req_update_date = req_update_date;
	}
	public int getUpdate_emp_id() {
		return update_emp_id;
	}
	public void setUpdate_emp_id(int update_emp_id) {
		this.update_emp_id = update_emp_id;
	}
	
	public ProductVO getProductVO() {
	    return productVO;
	}
	
	public MaterialVO getMaterialVO() {
		return materialVO;
	}
	@Override
	public String toString() {
		return "RequirementVO [req_id=" + req_id + ", req_num=" + req_num + ", pro_id=" + pro_id + ", ma_id=" + ma_id
				+ ", req_cnt=" + req_cnt + ", req_unit=" + req_unit + ", req_reg_date=" + req_reg_date + ", emp_id="
				+ emp_id + ", req_update_date=" + req_update_date + ", update_emp_id=" + update_emp_id + "]";
	}
	
	
	
	
}
