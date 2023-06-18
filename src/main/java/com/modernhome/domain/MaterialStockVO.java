package com.modernhome.domain;

import java.sql.Timestamp;

public class MaterialStockVO {
	
	private int ms_id;
	private String ms_num;
	private int ma_id;
	private int ms_cnt;
	private int wh_id;
	private Timestamp ms_reg_date;
	private int emp_id;
	private Timestamp ms_update_date;
	private int update_emp_id;
	
	private MaterialVO materialVO;
	private WarehouseVO warehouseVO;
	
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
	public Timestamp getMs_reg_date() {
		return ms_reg_date;
	}
	public void setMs_reg_date(Timestamp ms_reg_date) {
		this.ms_reg_date = ms_reg_date;
	}
	public int getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(int emp_id) {
		this.emp_id = emp_id;
	}
	public Timestamp getMs_update_date() {
		return ms_update_date;
	}
	public void setMs_update_date(Timestamp ms_update_date) {
		this.ms_update_date = ms_update_date;
	}
	public int getUpdate_emp_id() {
		return update_emp_id;
	}
	public void setUpdate_emp_id(int update_emp_id) {
		this.update_emp_id = update_emp_id;
	}
	public MaterialVO getMaterialVO() {
		return materialVO;
	}
	public void setMaterialVO(MaterialVO materialVO) {
		this.materialVO = materialVO;
	}
	public WarehouseVO getWarehouseVO() {
		return warehouseVO;
	}
	public void setWarehouseVO(WarehouseVO warehouseVO) {
		this.warehouseVO = warehouseVO;
	}
	
	@Override
	public String toString() {
		return "MaterialStockVO [ms_id=" + ms_id + ", ms_num=" + ms_num + ", ma_id=" + ma_id + ", ms_cnt=" + ms_cnt
				+ ", wh_id=" + wh_id + ", ms_reg_date=" + ms_reg_date + ", emp_id=" + emp_id + ", ms_update_date="
				+ ms_update_date + ", update_emp_id=" + update_emp_id + ", materialVO=" + materialVO + ", warehouseVO="
				+ warehouseVO + "]";
	}
	
	

}
