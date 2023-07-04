package com.modernhome.domain;

public class InorderVO {
	
	private Integer io_id;
	private String io_num;
	private Integer ma_id;
	private Integer io_cnt;
	private Integer io_amount;
	private String io_unit;
	private String io_date;
	private String io_state;
	private String rec_date; 
	private Integer clt_id;
	private Integer emp_id;
	private String io_reg_date;
	private String io_update_date;
	private Integer update_emp_id;
	
	private String ma_num;
	private String ma_name;
	private String ma_price;
	
	private String clt_num;
	private String clt_name;
	
	private String emp_name;
	
	
	
	private Integer monthlyIOCount;
	private Integer monthlyIOAmount;
	private String month;

	// join 할 테이블
//	private MaterialVO materialVO;
//	private ClientVO clientVO;
	
	
	public Integer getIo_id() {
		return io_id;
	}

	public void setIo_id(Integer io_id) {
		this.io_id = io_id;
	}

	public String getIo_num() {
		return io_num;
	}

	public void setIo_num(String io_num) {
		this.io_num = io_num;
	}

	public Integer getMa_id() {
		return ma_id;
	}

	public void setMa_id(Integer ma_id) {
		this.ma_id = ma_id;
	}

	public Integer getIo_cnt() {
		return io_cnt;
	}

	public void setIo_cnt(Integer io_cnt) {
		this.io_cnt = io_cnt;
	}

	public Integer getIo_amount() {
		return io_amount;
	}

	public void setIo_amount(Integer io_amount) {
		this.io_amount = io_amount;
	}

	public String getIo_unit() {
		return io_unit;
	}

	public void setIo_unit(String io_unit) {
		this.io_unit = io_unit;
	}

	public String getIo_date() {
		return io_date;
	}

	public void setIo_date(String io_date) {
		this.io_date = io_date;
	}

	public String getIo_state() {
		return io_state;
	}

	public void setIo_state(String io_state) {
		this.io_state = io_state;
	}

	public String getRec_date() {
		return rec_date;
	}

	public void setRec_date(String rec_date) {
		this.rec_date = rec_date;
	}

	public Integer getClt_id() {
		return clt_id;
	}

	public void setClt_id(Integer clt_id) {
		this.clt_id = clt_id;
	}

	public Integer getEmp_id() {
		return emp_id;
	}

	public void setEmp_id(Integer emp_id) {
		this.emp_id = emp_id;
	}

	public String getIo_reg_date() {
		return io_reg_date;
	}

	public void setIo_reg_date(String io_reg_date) {
		this.io_reg_date = io_reg_date;
	}

	public String getIo_update_date() {
		return io_update_date;
	}

	public void setIo_update_date(String io_update_date) {
		this.io_update_date = io_update_date;
	}

	public Integer getUpdate_emp_id() {
		return update_emp_id;
	}

	public void setUpdate_emp_id(Integer update_emp_id) {
		this.update_emp_id = update_emp_id;
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

	public String getMa_price() {
		return ma_price;
	}

	public void setMa_price(String ma_price) {
		this.ma_price = ma_price;
	}

	public String getClt_num() {
		return clt_num;
	}

	public void setClt_num(String clt_num) {
		this.clt_num = clt_num;
	}

	public String getClt_name() {
		return clt_name;
	}

	public void setClt_name(String clt_name) {
		this.clt_name = clt_name;
	}

	public String getEmp_name() {
		return emp_name;
	}

	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	
	

	
	
	
	public Integer getMonthlyIOCount() {
		return monthlyIOCount;
	}

	public void setMonthlyIOCount(Integer monthlyIOCount) {
		this.monthlyIOCount = monthlyIOCount;
	}

	public Integer getMonthlyIOAmount() {
		return monthlyIOAmount;
	}

	public void setMonthlyIOAmount(Integer monthlyIOAmount) {
		this.monthlyIOAmount = monthlyIOAmount;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	
	
	@Override
	public String toString() {
		return "InorderVO [io_id=" + io_id + ", io_num=" + io_num + ", ma_id=" + ma_id + ", io_cnt=" + io_cnt
				+ ", io_amount=" + io_amount + ", io_unit=" + io_unit + ", io_date=" + io_date + ", io_state="
				+ io_state + ", rec_date=" + rec_date + ", clt_id=" + clt_id + ", emp_id=" + emp_id + ", io_reg_date="
				+ io_reg_date + ", io_update_date=" + io_update_date + ", update_emp_id=" + update_emp_id + ", ma_num="
				+ ma_num + ", ma_name=" + ma_name + ", ma_price=" + ma_price + ", clt_num=" + clt_num + ", clt_name="
				+ clt_name + ", emp_name=" + emp_name + ", monthlyIOCount=" + monthlyIOCount + ", monthlyIOAmount="
				+ monthlyIOAmount + ", month=" + month + "]";
	}

	

	
}