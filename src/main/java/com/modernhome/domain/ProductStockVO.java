package com.modernhome.domain;

import java.sql.Timestamp;

public class ProductStockVO {
	
	private int ps_id;
	private String ps_num;
	private int pro_id;
	private int ps_cnt;
	private int wh_id;
	private Timestamp ps_reg_date;
	private int emp_id;
	private Timestamp ps_update_date;
	private int update_emp_id;
	
	private ProductVO productVO;
	private WarehouseVO warehouseVO;
	
	public int getPs_id() {
		return ps_id;
	}
	public void setPs_id(int ps_id) {
		this.ps_id = ps_id;
	}
	public String getPs_num() {
		return ps_num;
	}
	public void setPs_num(String ps_num) {
		this.ps_num = ps_num;
	}
	public int getPro_id() {
		return pro_id;
	}
	public void setPro_id(int pro_id) {
		this.pro_id = pro_id;
	}
	public int getPs_cnt() {
		return ps_cnt;
	}
	public void setPs_cnt(int ps_cnt) {
		this.ps_cnt = ps_cnt;
	}
	public int getWh_id() {
		return wh_id;
	}
	public void setWh_id(int wh_id) {
		this.wh_id = wh_id;
	}
	public Timestamp getPs_reg_date() {
		return ps_reg_date;
	}
	public void setPs_reg_date(Timestamp ps_reg_date) {
		this.ps_reg_date = ps_reg_date;
	}
	public int getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(int emp_id) {
		this.emp_id = emp_id;
	}
	public Timestamp getPs_update_date() {
		return ps_update_date;
	}
	public void setPs_update_date(Timestamp ps_update_date) {
		this.ps_update_date = ps_update_date;
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
	public void setProductVO(ProductVO productVO) {
		this.productVO = productVO;
	}
	public WarehouseVO getWarehouseVO() {
		return warehouseVO;
	}
	public void setWarehouseVO(WarehouseVO warehouseVO) {
		this.warehouseVO = warehouseVO;
	}
	
	@Override
	public String toString() {
		return "ProductStockVO [ps_id=" + ps_id + ", ps_num=" + ps_num + ", pro_id=" + pro_id + ", ps_cnt=" + ps_cnt
				+ ", wh_id=" + wh_id + ", ps_reg_date=" + ps_reg_date + ", emp_id=" + emp_id + ", ps_update_date="
				+ ps_update_date + ", update_emp_id=" + update_emp_id + ", productVO=" + productVO + ", warehouseVO="
				+ warehouseVO + "]";
	}
	
	
	
	

}
