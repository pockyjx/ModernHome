package com.modernhome.domain;

import java.time.LocalDateTime;

public class QualityCheckingVO {
	
	private int qc_id;
	private String qc_num;
	private int pro_id;
	private int line_id;
	private int ma_id;
	private String qc_yn;
	private int qc_cnt;
	private LocalDateTime qc_date;
	private int emp_id;
	private int repaired;
	
	public int getQc_id() {
		return qc_id;
	}
	public void setQc_id(int qc_id) {
		this.qc_id = qc_id;
	}
	public String getQc_num() {
		return qc_num;
	}
	public void setQc_num(String qc_num) {
		this.qc_num = qc_num;
	}
	public int getPro_id() {
		return pro_id;
	}
	public void setPro_id(int pro_id) {
		this.pro_id = pro_id;
	}
	public int getLine_id() {
		return line_id;
	}
	public void setLine_id(int line_id) {
		this.line_id = line_id;
	}
	public int getMa_id() {
		return ma_id;
	}
	public void setMa_id(int ma_id) {
		this.ma_id = ma_id;
	}
	public String getQc_yn() {
		return qc_yn;
	}
	public void setQc_yn(String qc_yn) {
		this.qc_yn = qc_yn;
	}
	public int getQc_cnt() {
		return qc_cnt;
	}
	public void setQc_cnt(int qc_cnt) {
		this.qc_cnt = qc_cnt;
	}
	public LocalDateTime getQc_date() {
		return qc_date;
	}
	public void setQc_date(LocalDateTime qc_date) {
		this.qc_date = qc_date;
	}
	public int getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(int emp_id) {
		this.emp_id = emp_id;
	}
	public int getRepaired() {
		return repaired;
	}
	public void setRepaired(int repaired) {
		this.repaired = repaired;
	}
	
	@Override
	public String toString() {
		return "QualityCheckingVO [qc_id=" + qc_id + ", qc_num=" + qc_num + ", pro_id=" + pro_id + ", line_id="
				+ line_id + ", ma_id=" + ma_id + ", qc_yn=" + qc_yn + ", qc_cnt=" + qc_cnt + ", qc_date=" + qc_date
				+ ", emp_id=" + emp_id + ", repaired=" + repaired + "]";
	}
	
}