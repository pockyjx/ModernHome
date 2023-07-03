package com.modernhome.domain;

public class QualityCheckingVO {
	
	private Integer qc_id;
	private String qc_num;
	private	Integer pro_id;
	private Integer line_id;
	private Integer ma_id;
	private String qc_yn;
	private Integer qc_cnt;
	private String qc_date;
	private String update_date;
	private Integer emp_id;
	private Integer update_emp_id;
	private Integer rec_id;
	private Integer repaired;
	private Integer df_cnt;
	private String fi_type;
	private String shp_id;
	private String mr_id;
	public Integer getQc_id() {
		return qc_id;
	}
	public void setQc_id(Integer qc_id) {
		this.qc_id = qc_id;
	}
	public String getQc_num() {
		return qc_num;
	}
	public void setQc_num(String qc_num) {
		this.qc_num = qc_num;
	}
	public Integer getPro_id() {
		return pro_id;
	}
	public void setPro_id(Integer pro_id) {
		this.pro_id = pro_id;
	}
	public Integer getLine_id() {
		return line_id;
	}
	public void setLine_id(Integer line_id) {
		this.line_id = line_id;
	}
	public Integer getMa_id() {
		return ma_id;
	}
	public void setMa_id(Integer ma_id) {
		this.ma_id = ma_id;
	}
	public String getQc_yn() {
		return qc_yn;
	}
	public void setQc_yn(String qc_yn) {
		this.qc_yn = qc_yn;
	}
	public Integer getQc_cnt() {
		return qc_cnt;
	}
	public void setQc_cnt(Integer qc_cnt) {
		this.qc_cnt = qc_cnt;
	}
	public String getQc_date() {
		return qc_date;
	}
	public void setQc_date(String qc_date) {
		this.qc_date = qc_date;
	}
	public String getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(String update_date) {
		this.update_date = update_date;
	}
	public Integer getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(Integer emp_id) {
		this.emp_id = emp_id;
	}
	public Integer getUpdate_emp_id() {
		return update_emp_id;
	}
	public void setUpdate_emp_id(Integer update_emp_id) {
		this.update_emp_id = update_emp_id;
	}
	public Integer getRec_id() {
		return rec_id;
	}
	public void setRec_id(Integer rec_id) {
		this.rec_id = rec_id;
	}
	public Integer getRepaired() {
		return repaired;
	}
	public void setRepaired(Integer repaired) {
		this.repaired = repaired;
	}
	public Integer getDf_cnt() {
		return df_cnt;
	}
	public void setDf_cnt(Integer df_cnt) {
		this.df_cnt = df_cnt;
	}
	public String getFi_type() {
		return fi_type;
	}
	public void setFi_type(String fi_type) {
		this.fi_type = fi_type;
	}
	public String getShp_id() {
		return shp_id;
	}
	public void setShp_id(String shp_id) {
		this.shp_id = shp_id;
	}
	public String getMr_id() {
		return mr_id;
	}
	public void setMr_id(String mr_id) {
		this.mr_id = mr_id;
	}
	@Override
	public String toString() {
		return "QualityCheckingVO [qc_id=" + qc_id + ", qc_num=" + qc_num + ", pro_id=" + pro_id + ", line_id="
				+ line_id + ", ma_id=" + ma_id + ", qc_yn=" + qc_yn + ", qc_cnt=" + qc_cnt + ", qc_date=" + qc_date
				+ ", update_date=" + update_date + ", emp_id=" + emp_id + ", update_emp_id=" + update_emp_id
				+ ", rec_id=" + rec_id + ", repaired=" + repaired + ", df_cnt=" + df_cnt + ", fi_type=" + fi_type
				+ ", shp_id=" + shp_id + ", mr_id=" + mr_id + "]";
	}
	

}