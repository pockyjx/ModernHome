package com.modernhome.domain;

public class ShipmentVO {
	
	private Integer shp_id;
	private String shp_num;
	private Integer emp_id;
	private Integer clt_id;
	private Integer pro_id;
	private Integer shp_cnt;
	private String shp_date;
	private Integer update_emp_id;
	private String update_shp_date;
	private String shp_reg_date;
	private Integer oo_id;
	
	public Integer getShp_id() {
		return shp_id;
	}
	public void setShp_id(Integer shp_id) {
		this.shp_id = shp_id;
	}
	public String getShp_num() {
		return shp_num;
	}
	public void setShp_num(String shp_num) {
		this.shp_num = shp_num;
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
	public Integer getShp_cnt() {
		return shp_cnt;
	}
	public void setShp_cnt(Integer shp_cnt) {
		this.shp_cnt = shp_cnt;
	}
	public String getShp_date() {
		return shp_date;
	}
	public void setShp_date(String shp_date) {
		this.shp_date = shp_date;
	}
	public Integer getUpdate_emp_id() {
		return update_emp_id;
	}
	public void setUpdate_emp_id(Integer update_emp_id) {
		this.update_emp_id = update_emp_id;
	}
	public String getUpdate_shp_date() {
		return update_shp_date;
	}
	public void setUpdate_shp_date(String update_shp_date) {
		this.update_shp_date = update_shp_date;
	}
	public Integer getOo_id() {
		return oo_id;
	}
	public void setOo_id(Integer oo_id) {
		this.oo_id = oo_id;
	}
	
	public String getShp_reg_date() {
		return shp_reg_date;
	}
	public void setShp_reg_date(String shp_reg_date) {
		this.shp_reg_date = shp_reg_date;
	}
	@Override
	public String toString() {
		return "ShipmentVO [shp_id=" + shp_id + ", shp_num=" + shp_num + ", emp_id=" + emp_id + ", clt_id=" + clt_id
				+ ", pro_id=" + pro_id + ", shp_cnt=" + shp_cnt + ", shp_date=" + shp_date + ", update_emp_id="
				+ update_emp_id + ", update_shp_date=" + update_shp_date + ", shp_reg_date=" + shp_reg_date + ", oo_id="
				+ oo_id + "]";
	}
	

}
