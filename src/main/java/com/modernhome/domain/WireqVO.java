package com.modernhome.domain;

public class WireqVO {
	
	private Integer work_id;
	private Integer pro_id;
	private String ma_num;
	private String ma_name;
	private int req_cnt;
	private int work_cnt;
	
	public Integer getWork_id() {
		return work_id;
	}
	public void setWork_id(Integer work_id) {
		this.work_id = work_id;
	}
	public Integer getPro_id() {
		return pro_id;
	}
	public void setPro_id(Integer pro_id) {
		this.pro_id = pro_id;
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
	public int getReq_cnt() {
		return req_cnt;
	}
	public void setReq_cnt(int req_cnt) {
		this.req_cnt = req_cnt;
	}
	public int getWork_cnt() {
		return work_cnt;
	}
	public void setWork_cnt(int work_cnt) {
		this.work_cnt = work_cnt;
	}
	@Override
	public String toString() {
		return "WIReqVO [work_id=" + work_id + ", pro_id=" + pro_id + ", ma_num=" + ma_num + ", ma_name=" + ma_name
				+ ", req_cnt=" + req_cnt + ", work_cnt=" + work_cnt + "]";
	}
	
}