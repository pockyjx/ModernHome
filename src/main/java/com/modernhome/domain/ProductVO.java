package com.modernhome.domain;

public class ProductVO {
	
	private int pro_id;
	private String pro_num;
	private String pro_name;
	private String pro_unit;
	private int pro_price;
	public int getPro_id() {
		return pro_id;
	}
	public void setPro_id(int pro_id) {
		this.pro_id = pro_id;
	}
	public String getPro_num() {
		return pro_num;
	}
	public void setPro_num(String pro_num) {
		this.pro_num = pro_num;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public String getPro_unit() {
		return pro_unit;
	}
	public void setPro_unit(String pro_unit) {
		this.pro_unit = pro_unit;
	}
	public int getPro_price() {
		return pro_price;
	}
	public void setPro_price(int pro_price) {
		this.pro_price = pro_price;
	}
	
	@Override
	public String toString() {
		return "ProductVO [pro_id=" + pro_id + ", pro_num=" + pro_num + ", pro_name=" + pro_name + ", pro_unit="
				+ pro_unit + ", pro_price=" + pro_price + "]";
	}
	
	
	
	
	
}
