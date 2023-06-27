package com.modernhome.domain;

public class ProductStockVO {
	
	private Integer ps_id;
	private String ps_num;
	private Integer pro_id;
	private int ps_cnt;
	private Integer wh_id;
//	private	String ps_reg_date;
//	private int emp_id;
//	private Timestamp ps_update_date;
//	private int update_emp_id;
	
	private String wh_name;
	
	private String pro_num;
	private String pro_name;
	private String pro_unit;
	
	public Integer getPs_id() {
		return ps_id;
	}
	public void setPs_id(Integer ps_id) {
		this.ps_id = ps_id;
	}
	public String getPs_num() {
		return ps_num;
	}
	public void setPs_num(String ps_num) {
		this.ps_num = ps_num;
	}
	public Integer getPro_id() {
		return pro_id;
	}
	public void setPro_id(Integer pro_id) {
		this.pro_id = pro_id;
	}
	public int getPs_cnt() {
		return ps_cnt;
	}
	public void setPs_cnt(int ps_cnt) {
		this.ps_cnt = ps_cnt;
	}
	public Integer getWh_id() {
		return wh_id;
	}
	public void setWh_id(Integer wh_id) {
		this.wh_id = wh_id;
	}
	public String getWh_name() {
		return wh_name;
	}
	public void setWh_name(String wh_name) {
		this.wh_name = wh_name;
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
	
	@Override
	public String toString() {
		return "ProductStockVO [ps_id=" + ps_id + ", ps_num=" + ps_num + ", pro_id=" + pro_id + ", ps_cnt=" + ps_cnt
				+ ", wh_id=" + wh_id + ", wh_name=" + wh_name + ", pro_num=" + pro_num + ", pro_name=" + pro_name
				+ ", pro_unit=" + pro_unit + "]";
	}
	
	
	
	
	
	

}
