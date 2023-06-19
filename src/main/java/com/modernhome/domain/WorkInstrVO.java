package com.modernhome.domain;

import java.sql.Timestamp;

public class WorkInstrVO {
	
	private Integer work_id;
	private String work_num;
	private int line_id;
	private int pro_id;
	private int req_id;
	private int oo_id;
	private int work_cnt;
	private String work_state;
	private Timestamp reg_date;
	private int emp_id;
	private Timestamp update_date;
	private int update_emp_id;
	
	// join을 위한 객체
	private ClientVO clientVO;
	private OutOrderVO outOrderVO;
	private LineVO lineVO;
	private ProductVO productVO;
	private EmployeeVO employeeVO;
	
	public Integer getWork_id() {
		return work_id;
	}
	public void setWork_id(Integer work_id) {
		this.work_id = work_id;
	}
	public String getWork_num() {
		return work_num;
	}
	public void setWork_num(String work_num) {
		this.work_num = work_num;
	}
	public int getLine_id() {
		return line_id;
	}
	public void setLine_id(int line_id) {
		this.line_id = line_id;
	}
	public int getPro_id() {
		return pro_id;
	}
	public void setPro_id(int pro_id) {
		this.pro_id = pro_id;
	}
	public int getReq_id() {
		return req_id;
	}
	public void setReq_id(int req_id) {
		this.req_id = req_id;
	}
	public int getOo_id() {
		return oo_id;
	}
	public void setOo_id(int oo_id) {
		this.oo_id = oo_id;
	}
	public int getWork_cnt() {
		return work_cnt;
	}
	public void setWork_cnt(int work_cnt) {
		this.work_cnt = work_cnt;
	}
	public String getWork_state() {
		return work_state;
	}
	public void setWork_state(String work_state) {
		this.work_state = work_state;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public int getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(int emp_id) {
		this.emp_id = emp_id;
	}
	public Timestamp getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(Timestamp update_date) {
		this.update_date = update_date;
	}
	public int getUpdate_emp_id() {
		return update_emp_id;
	}
	public void setUpdate_emp_id(int update_emp_id) {
		this.update_emp_id = update_emp_id;
	}
	public ClientVO getClientVO() {
		return clientVO;
	}
	public void setClientVO(ClientVO clientVO) {
		this.clientVO = clientVO;
	}
	public OutOrderVO getOutOrderVO() {
		return outOrderVO;
	}
	public void setOutOrderVO(OutOrderVO outOrderVO) {
		this.outOrderVO = outOrderVO;
	}
	public LineVO getLineVO() {
		return lineVO;
	}
	public void setLineVO(LineVO lineVO) {
		this.lineVO = lineVO;
	}
	public ProductVO getProductVO() {
		return productVO;
	}
	public void setProductVO(ProductVO productVO) {
		this.productVO = productVO;
	}
	public EmployeeVO getEmployeeVO() {
		return employeeVO;
	}
	public void setEmployeeVO(EmployeeVO employeeVO) {
		this.employeeVO = employeeVO;
	}
	
	@Override
	public String toString() {
		return "WorkInstrVO [work_id=" + work_id + ", work_num=" + work_num + ", line_id=" + line_id + ", pro_id="
				+ pro_id + ", req_id=" + req_id + ", oo_id=" + oo_id + ", work_cnt=" + work_cnt + ", work_state="
				+ work_state + ", reg_date=" + reg_date + ", emp_id=" + emp_id + ", update_date=" + update_date
				+ ", update_emp_id=" + update_emp_id + ", clientVO=" + clientVO + ", outOrderVO=" + outOrderVO
				+ ", lineVO=" + lineVO + ", productVO=" + productVO + ", employeeVO=" + employeeVO +  "]";
	}
	
}