package com.modernhome.domain;

public class ReceiveVO {
	
	private Integer rec_id;
	private String rec_num;
	private Integer io_id;
	private Integer ma_id;
	private Integer rec_cnt;
	private String rec_date;
	private Integer clt_id;
	private String rec_in_state;
	private Integer wh_id;
	private Integer emp_id;
	private String reg_date;
	private String update_date;
	private Integer update_emp_id;
	
	private String wh_name;
	
	private String io_num;
	private Integer io_cnt;
	
	private String ma_name;
	
	private String clt_name;
	
	private String emp_name;

	// join 할 테이블
//	private WarehouseVO warehouseVO;
//	private InorderVO inorderVO;
//	private MaterialVO materialVO;
//	private ClientVO clientVO;
	
	
	public Integer getRec_id() {
		return rec_id;
	}

	public void setRec_id(Integer rec_id) {
		this.rec_id = rec_id;
	}

	public String getRec_num() {
		return rec_num;
	}

	public void setRec_num(String rec_num) {
		this.rec_num = rec_num;
	}

	public Integer getIo_id() {
		return io_id;
	}

	public void setIo_id(Integer io_id) {
		this.io_id = io_id;
	}

	public Integer getMa_id() {
		return ma_id;
	}

	public void setMa_id(Integer ma_id) {
		this.ma_id = ma_id;
	}

	public Integer getRec_cnt() {
		return rec_cnt;
	}

	public void setRec_cnt(Integer rec_cnt) {
		this.rec_cnt = rec_cnt;
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

	public String getRec_in_state() {
		return rec_in_state;
	}

	public void setRec_in_state(String rec_in_state) {
		this.rec_in_state = rec_in_state;
	}

	public Integer getWh_id() {
		return wh_id;
	}

	public void setWh_id(Integer wh_id) {
		this.wh_id = wh_id;
	}

	public Integer getEmp_id() {
		return emp_id;
	}

	public void setEmp_id(Integer emp_id) {
		this.emp_id = emp_id;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public String getUpdate_date() {
		return update_date;
	}

	public void setUpdate_date(String update_date) {
		this.update_date = update_date;
	}

	public Integer getUpdate_emp_id() {
		return update_emp_id;
	}

	public void setUpdate_emp_id(Integer update_emp_id) {
		this.update_emp_id = update_emp_id;
	}

	public String getWh_name() {
		return wh_name;
	}

	public void setWh_name(String wh_name) {
		this.wh_name = wh_name;
	}

	public String getIo_num() {
		return io_num;
	}

	public void setIo_num(String io_num) {
		this.io_num = io_num;
	}

	public Integer getIo_cnt() {
		return io_cnt;
	}

	public void setIo_cnt(Integer io_cnt) {
		this.io_cnt = io_cnt;
	}

	public String getMa_name() {
		return ma_name;
	}

	public void setMa_name(String ma_name) {
		this.ma_name = ma_name;
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

	@Override
	public String toString() {
		return "ReceiveVO [rec_id=" + rec_id + ", rec_num=" + rec_num + ", io_id=" + io_id + ", ma_id=" + ma_id
				+ ", rec_cnt=" + rec_cnt + ", rec_date=" + rec_date + ", clt_id=" + clt_id + ", rec_in_state="
				+ rec_in_state + ", wh_id=" + wh_id + ", emp_id=" + emp_id + ", reg_date=" + reg_date + ", update_date="
				+ update_date + ", update_emp_id=" + update_emp_id + ", wh_name=" + wh_name + ", io_num=" + io_num
				+ ", io_cnt=" + io_cnt + ", ma_name=" + ma_name + ", clt_name=" + clt_name + ", emp_name=" + emp_name
				+ "]";
	}

}