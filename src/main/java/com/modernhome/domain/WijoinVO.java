package com.modernhome.domain;

import java.util.Date;

public class WijoinVO {
	
	private Integer work_id;
	private Integer pro_id;
	private Integer req_id;
	private Integer clt_id;
	private Integer oo_id;
	private Integer line_id;
	private Integer emp_id;
	private String work_state;
	private String clt_name;
	private String pro_name;
	private String pro_unit;
	private String work_num;
	private String pro_num;
	private String ma_num;
	private String ma_name;
	private String oo_num;
	private String line_num;
	private String line_name;
	private String emp_name;
	private int work_cnt;
	private int oo_cnt;
	private int req_cnt;
	private String reg_date;
	private String oo_end_date;
	
	public Integer getWork_id() {
		return work_id;
	}
	public void setWork_id(Integer work_id) {
		this.work_id = work_id;
	}
	public Integer getPro_id() {
		return pro_id;
	}
	public void setPro_id(Integer pro_id) {
		this.pro_id = pro_id;
	}
	public Integer getReq_id() {
		return req_id;
	}
	public void setReq_id(Integer req_id) {
		this.req_id = req_id;
	}
	public Integer getClt_id() {
		return clt_id;
	}
	public void setClt_id(Integer clt_id) {
		this.clt_id = clt_id;
	}
	public Integer getOo_id() {
		return oo_id;
	}
	public void setOo_id(Integer oo_id) {
		this.oo_id = oo_id;
	}
	public Integer getLine_id() {
		return line_id;
	}
	public void setLine_id(Integer line_id) {
		this.line_id = line_id;
	}
	public Integer getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(Integer emp_id) {
		this.emp_id = emp_id;
	}
	public String getWork_num() {
		return work_num;
	}
	public void setWork_num(String work_num) {
		this.work_num = work_num;
	}
	public String getWork_state() {
		return work_state;
	}
	public void setWork_state(String work_state) {
		this.work_state = work_state;
	}
	public String getClt_name() {
		return clt_name;
	}
	public void setClt_name(String clt_name) {
		this.clt_name = clt_name;
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
	public String getPro_unit() {
		return pro_unit;
	}
	public void setPro_unit(String pro_unit) {
		this.pro_unit = pro_unit;
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
	public String getOo_num() {
		return oo_num;
	}
	public void setOo_num(String oo_num) {
		this.oo_num = oo_num;
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
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public int getWork_cnt() {
		return work_cnt;
	}
	public void setWork_cnt(int work_cnt) {
		this.work_cnt = work_cnt;
	}
	public int getOo_cnt() {
		return oo_cnt;
	}
	public void setOo_cnt(int oo_cnt) {
		this.oo_cnt = oo_cnt;
	}
	public int getReq_cnt() {
		return req_cnt;
	}
	public void setReq_cnt(int req_cnt) {
		this.req_cnt = req_cnt;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getOo_end_date() {
		return oo_end_date;
	}
	public void setOo_end_date(String oo_end_date) {
		this.oo_end_date = oo_end_date;
	}
	
	@Override
	public String toString() {
		return "WijoinVO [work_id=" + work_id + ", pro_id=" + pro_id + ", req_id=" + req_id + ", clt_id=" + clt_id
				+ ", oo_id=" + oo_id + ", line_id=" + line_id + ", emp_id=" + emp_id + ", work_num=" + work_num
				+ ", work_state=" + work_state + ", clt_name=" + clt_name + ", pro_num=" + pro_num + ", pro_name="
				+ pro_name + ", pro_unit=" + pro_unit + ", ma_num=" + ma_num + ", ma_name=" + ma_name + ", oo_num="
				+ oo_num + ", line_num=" + line_num + ", line_name=" + line_name + ", emp_name=" + emp_name
				+ ", work_cnt=" + work_cnt + ", oo_cnt=" + oo_cnt + ", req_cnt=" + req_cnt + ", reg_date=" + reg_date
				+ ", oo_end_date=" + oo_end_date + "]";
	}
	
}