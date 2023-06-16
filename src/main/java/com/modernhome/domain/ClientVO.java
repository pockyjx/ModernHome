package com.modernhome.domain;

public class ClientVO {
	
	private Integer clt_id;
	private String clt_num;
	private String clt_sort;
	private String clt_name;
	private String clt_rep;
	private String clt_tel;
	private String clt_adr;
	private String clt_post;
	private String clt_email;
	
	public Integer getClt_id() {
		return clt_id;
	}
	public void setClt_id(Integer clt_id) {
		this.clt_id = clt_id;
	}
	public String getClt_num() {
		return clt_num;
	}
	public void setClt_num(String clt_num) {
		this.clt_num = clt_num;
	}
	public String getClt_sort() {
		return clt_sort;
	}
	public void setClt_sort(String clt_sort) {
		this.clt_sort = clt_sort;
	}
	public String getClt_name() {
		return clt_name;
	}
	public void setClt_name(String clt_name) {
		this.clt_name = clt_name;
	}
	public String getClt_rep() {
		return clt_rep;
	}
	public void setClt_rep(String clt_rep) {
		this.clt_rep = clt_rep;
	}
	public String getClt_tel() {
		return clt_tel;
	}
	public void setClt_tel(String clt_tel) {
		this.clt_tel = clt_tel;
	}
	public String getClt_adr() {
		return clt_adr;
	}
	public void setClt_adr(String clt_adr) {
		this.clt_adr = clt_adr;
	}
	public String getClt_post() {
		return clt_post;
	}
	public void setClt_post(String clt_post) {
		this.clt_post = clt_post;
	}
	public String getClt_email() {
		return clt_email;
	}
	public void setClt_email(String clt_email) {
		this.clt_email = clt_email;
	}
	@Override
	public String toString() {
		return "ClientVO [clt_id=" + clt_id + ", clt_num=" + clt_num + ", clt_sort=" + clt_sort + ", clt_name="
				+ clt_name + ", clt_rep=" + clt_rep + ", clt_tel=" + clt_tel + ", clt_adr=" + clt_adr + ", clt_post="
				+ clt_post + ", clt_email=" + clt_email + "]";
	}
	
	
	
	
}
