package com.modernhome.domain;

import java.util.Date;

public class ReceiveVO {
	
	private Integer rec_id;
	private String rec_num;
	private Integer io_id;
	private Integer ma_id;
	private Integer rec_cnt;
	private Date rec_date;
	private Integer clt_id;
	private String rec_in_state;
	private Integer wh_id;
	private String rec_state;
	private Integer emp_id;
	
	
	// join 할 테이블
	private WarehouseVO warehouseVO;
	private InorderVO inorderVO;
	private MaterialVO materialVO;
	private ClientVO clientVO;
	
	
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
	public Date getRec_date() {
		return rec_date;
	}
	public void setRec_date(Date rec_date) {
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
	public String getRec_state() {
		return rec_state;
	}
	public void setRec_state(String rec_state) {
		this.rec_state = rec_state;
	}
	public Integer getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(Integer emp_id) {
		this.emp_id = emp_id;
	}
	public WarehouseVO getWarehouseVO() {
		return warehouseVO;
	}
	public void setWarehouseVO(WarehouseVO warehouseVO) {
		this.warehouseVO = warehouseVO;
	}
	public InorderVO getInorderVO() {
		return inorderVO;
	}
	public void setInorderVO(InorderVO inorderVO) {
		this.inorderVO = inorderVO;
	}
	
	public MaterialVO getMaterialVO() {
		return materialVO;
	}
	public ClientVO getClientVO() {
		return clientVO;
	}
	
	@Override
	public String toString() {
		return "ReceiveVO [rec_id=" + rec_id + ", rec_num=" + rec_num + ", io_id=" + io_id + ", ma_id=" + ma_id
				+ ", rec_cnt=" + rec_cnt + ", rec_date=" + rec_date + ", clt_id=" + clt_id + ", rec_in_state="
				+ rec_in_state + ", wh_id=" + wh_id + ", rec_state=" + rec_state + ", emp_id=" + emp_id + "]";
	}
	
}
