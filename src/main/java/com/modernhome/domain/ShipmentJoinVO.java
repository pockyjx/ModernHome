package com.modernhome.domain;

public class ShipmentJoinVO {
	
	private Integer shp_id;
	private String shp_num;
	private Integer emp_id;
	private Integer clt_id;
	private Integer pro_id;
	private Integer pr_id;
	private String shp_state;
	private String shp_date;
	private String shp_reg_date;
	private Integer update_emp_id;
	private String update_shp_date;
	private Integer oo_id;
	
	private String emp_name;
	private String clt_name;
	
	private String pro_name;
	
	private String pr_num;
	private String pr_state;
	
	private String startDate;
	private String endDate;
	
	private String oo_num;
	private Integer oo_cnt;
	private String oo_end_date;
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
	public Integer getPr_id() {
		return pr_id;
	}
	public void setPr_id(Integer pr_id) {
		this.pr_id = pr_id;
	}
	public String getShp_state() {
		return shp_state;
	}
	public void setShp_state(String shp_state) {
		this.shp_state = shp_state;
	}
	public String getShp_date() {
		return shp_date;
	}
	public void setShp_date(String shp_date) {
		this.shp_date = shp_date;
	}
	public String getShp_reg_date() {
		return shp_reg_date;
	}
	public void setShp_reg_date(String shp_reg_date) {
		this.shp_reg_date = shp_reg_date;
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
	public String getPr_num() {
		return pr_num;
	}
	public void setPr_num(String pr_num) {
		this.pr_num = pr_num;
	}
	public String getPr_state() {
		return pr_state;
	}
	public void setPr_state(String pr_state) {
		this.pr_state = pr_state;
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
	public String getOo_num() {
		return oo_num;
	}
	public void setOo_num(String oo_num) {
		this.oo_num = oo_num;
	}
	public Integer getOo_cnt() {
		return oo_cnt;
	}
	public void setOo_cnt(Integer oo_cnt) {
		this.oo_cnt = oo_cnt;
	}
	public String getOo_end_date() {
		return oo_end_date;
	}
	public void setOo_end_date(String oo_end_date) {
		this.oo_end_date = oo_end_date;
	}
	
	@Override
	public String toString() {
		return "ShipmentJoinVO [shp_id=" + shp_id + ", shp_num=" + shp_num + ", emp_id=" + emp_id + ", clt_id=" + clt_id
				+ ", pro_id=" + pro_id + ", pr_id=" + pr_id + ", shp_state=" + shp_state + ", shp_date=" + shp_date
				+ ", shp_reg_date=" + shp_reg_date + ", update_emp_id=" + update_emp_id + ", update_shp_date="
				+ update_shp_date + ", oo_id=" + oo_id + ", emp_name=" + emp_name + ", clt_name=" + clt_name
				+ ", pro_name=" + pro_name + ", pr_num=" + pr_num + ", pr_state=" + pr_state + ", startDate="
				+ startDate + ", endDate=" + endDate + ", oo_num=" + oo_num + ", oo_cnt=" + oo_cnt + ", oo_end_date="
				+ oo_end_date + "]";
	}
	

}
