package com.modernhome.domain;

public class WorkPrfrmVO {
	
	private Integer prfrm_id;
	private String prfrm_num;
	private Integer work_id;
	private Integer line_id;
	private Integer pro_id;
	private String gb_yn;
	private int prfrm_cnt;
	private String reg_date;
	private int emp_id;
	private String update_date;
	private int update_emp_id;
	private String note;
	
	// join 객체
	private WijoinVO wijoinVO;
	
	public Integer getPrfrm_id() {
		return prfrm_id;
	}

	public void setPrfrm_id(Integer prfrm_id) {
		this.prfrm_id = prfrm_id;
	}

	public String getPrfrm_num() {
		return prfrm_num;
	}

	public void setPrfrm_num(String prfrm_num) {
		this.prfrm_num = prfrm_num;
	}

	public Integer getWork_id() {
		return work_id;
	}

	public void setWork_id(Integer work_id) {
		this.work_id = work_id;
	}

	public Integer getLine_id() {
		return line_id;
	}

	public void setLine_id(Integer line_id) {
		this.line_id = line_id;
	}

	public Integer getPro_id() {
		return pro_id;
	}

	public void setPro_id(Integer pro_id) {
		this.pro_id = pro_id;
	}

	public String getGb_yn() {
		return gb_yn;
	}

	public void setGb_yn(String gb_yn) {
		this.gb_yn = gb_yn;
	}

	public int getPrfrm_cnt() {
		return prfrm_cnt;
	}

	public void setPrfrm_cnt(int prfrm_cnt) {
		this.prfrm_cnt = prfrm_cnt;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public int getEmp_id() {
		return emp_id;
	}

	public void setEmp_id(int emp_id) {
		this.emp_id = emp_id;
	}

	public String getUpdate_date() {
		return update_date;
	}

	public void setUpdate_date(String update_date) {
		this.update_date = update_date;
	}

	public int getUpdate_emp_id() {
		return update_emp_id;
	}

	public void setUpdate_emp_id(int update_emp_id) {
		this.update_emp_id = update_emp_id;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public WijoinVO getWijoinVO() {
		return wijoinVO;
	}

	public void setWijoinVO(WijoinVO wijoinVO) {
		this.wijoinVO = wijoinVO;
	}
	
}