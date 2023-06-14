package com.modernhome.domain;

public class MaterialVO {

	private int ma_id;
	private String ma_num;
	private String ma_name;
	private String ma_unit;
	private int ma_price;
	
	public int getMa_id() {
		return ma_id;
	}
	public void setMa_id(int ma_id) {
		this.ma_id = ma_id;
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
	public String getMa_unit() {
		return ma_unit;
	}
	public void setMa_unit(String ma_unit) {
		this.ma_unit = ma_unit;
	}
	public int getMa_price() {
		return ma_price;
	}
	public void setMa_price(int ma_price) {
		this.ma_price = ma_price;
	}
	
	@Override
	public String toString() {
		return "MaterialVO [ma_id=" + ma_id + ", ma_num=" + ma_num + ", ma_name=" + ma_name + ", ma_unit=" + ma_unit
				+ ", ma_price=" + ma_price + "]";
	}
	
	
	
}
