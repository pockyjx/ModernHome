package com.modernhome.domain;

public class ShipmentJoinVO {
	
	private Integer shp_id;
	private String shp_num;
	private Integer emp_id;
	private Integer clt_id;
	private Integer pro_id;
	private Integer shp_cnt;
	private String shp_date;
	private Integer update_emp_id;
	private String update_shp_date;
	
	private String emp_name;
	private String clt_num;
	private String clt_name;
	
	private String pro_name;
	private String pro_num;
	
	private String startDate;
	private String endDate;
	
	
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
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public String getClt_name() {
		return clt_name;
	}
	public void setClt_name(String clt_name) {
		this.clt_name = clt_name;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public String getPro_num() {
		return pro_num;
	}
	public void setPro_num(String pro_num) {
		this.pro_num = pro_num;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getClt_num() {
		return clt_num;
	}
	public void setClt_num(String clt_num) {
		this.clt_num = clt_num;
	}
	@Override
	public String toString() {
		return "ShipmentJoinVO [shp_id=" + shp_id + ", shp_num=" + shp_num + ", emp_id=" + emp_id + ", clt_id=" + clt_id
				+ ", pro_id=" + pro_id + ", shp_cnt=" + shp_cnt + ", shp_date=" + shp_date + ", update_emp_id="
				+ update_emp_id + ", update_shp_date=" + update_shp_date + ", emp_name=" + emp_name + ", clt_num="
				+ clt_num + ", clt_name=" + clt_name + ", pro_name=" + pro_name + ", pro_num=" + pro_num
				+ ", startDate=" + startDate + ", endDate=" + endDate + "]";
	}
	
	
	
	
	

}
