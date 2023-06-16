package com.modernhome.domain;

public class WarehouseVO {
	
	private Integer wh_id;
	private String wh_num;
	private String wh_name;
	private String wh_type;
	private String wh_tel;
	private Integer emp_id;
	
	public Integer getWh_id() {
		return wh_id;
	}
	public void setWh_id(Integer wh_id) {
		this.wh_id = wh_id;
	}
	public String getWh_num() {
		return wh_num;
	}
	public void setWh_num(String wh_num) {
		this.wh_num = wh_num;
	}
	public String getWh_name() {
		return wh_name;
	}
	public void setWh_name(String wh_name) {
		this.wh_name = wh_name;
	}
	public String getWh_type() {
		return wh_type;
	}
	public void setWh_type(String wh_type) {
		this.wh_type = wh_type;
	}
	public String getWh_tel() {
		return wh_tel;
	}
	public void setWh_tel(String wh_tel) {
		this.wh_tel = wh_tel;
	}
	public Integer getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(Integer emp_id) {
		this.emp_id = emp_id;
	}
	
	@Override
	public String toString() {
		return "WarehouseVO [wh_id=" + wh_id + ", wh_num=" + wh_num + ", wh_name=" + wh_name + ", wh_type=" + wh_type
				+ ", wh_tel=" + wh_tel + ", emp_id=" + emp_id + "]";
	}
	
}