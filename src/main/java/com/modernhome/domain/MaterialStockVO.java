package com.modernhome.domain;

import java.sql.Timestamp;

public class MaterialStockVO {
	
	private int ms_id;
	private String ms_num;
	private int ma_id;
	private int ms_cnt;
	private int wh_id;
//	private Timestamp ms_reg_date;
//	private int emp_id;
//	private Timestamp ms_update_date;
//	private int update_emp_id;
	
//	private MaterialVO materialVO;
//	private WarehouseVO warehouseVO;
	
	private String wh_name;
	
	private String ma_num;
	private String ma_name;
	private String ma_unit;
	
	public int getMs_id() {
		return ms_id;
	}
	public void setMs_id(int ms_id) {
		this.ms_id = ms_id;
	}
	public String getMs_num() {
		return ms_num;
	}
	public void setMs_num(String ms_num) {
		this.ms_num = ms_num;
	}
	public int getMa_id() {
		return ma_id;
	}
	public void setMa_id(int ma_id) {
		this.ma_id = ma_id;
	}
	public int getMs_cnt() {
		return ms_cnt;
	}
	public void setMs_cnt(int ms_cnt) {
		this.ms_cnt = ms_cnt;
	}
	public int getWh_id() {
		return wh_id;
	}
	public void setWh_id(int wh_id) {
		this.wh_id = wh_id;
	}
	public String getWh_name() {
		return wh_name;
	}
	public void setWh_name(String wh_name) {
		this.wh_name = wh_name;
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
	public String getMa_unit() {
		return ma_unit;
	}
	public void setMa_unit(String ma_unit) {
		this.ma_unit = ma_unit;
	}
	
	@Override
	public String toString() {
		return "MaterialStockVO [ms_id=" + ms_id + ", ms_num=" + ms_num + ", ma_id=" + ma_id + ", ms_cnt=" + ms_cnt
				+ ", wh_id=" + wh_id + ", wh_name=" + wh_name + ", ma_num=" + ma_num + ", ma_name=" + ma_name
				+ ", ma_unit=" + ma_unit + "]";
	}
	
	
	
	

}
