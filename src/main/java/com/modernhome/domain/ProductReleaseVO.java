package com.modernhome.domain;

public class ProductReleaseVO {
	
	private Integer pr_id;
	private String pr_num;
	private Integer pro_id;
	private Integer oo_id;
	private Integer wh_id;
	private Integer pr_cnt;
	private String pr_date;
	private String pr_state;
	private Integer emp_id;
	
	private ProductVO productVO;
	private ProductStockVO productStockVO;
	private WarehouseVO warehouseVO;
	private EmployeeVO employeeVO;
	private OutOrderVO outOrderVO;
	private ClientVO clientVO;
	
	public int getPr_id() {
		return pr_id;
	}
	public void setPr_id(int pr_id) {
		this.pr_id = pr_id;
	}
	public String getPr_num() {
		return pr_num;
	}
	public void setPr_num(String pr_num) {
		this.pr_num = pr_num;
	}
	public int getPro_id() {
		return pro_id;
	}
	public void setPro_id(int pro_id) {
		this.pro_id = pro_id;
	}
	public int getOo_id() {
		return oo_id;
	}
	public void setOo_id(int oo_id) {
		this.oo_id = oo_id;
	}
	public int getWh_id() {
		return wh_id;
	}
	public void setWh_id(int wh_id) {
		this.wh_id = wh_id;
	}
	public int getPr_cnt() {
		return pr_cnt;
	}
	public void setPr_cnt(int pr_cnt) {
		this.pr_cnt = pr_cnt;
	}
	public String getPr_date() {
		return pr_date;
	}
	public void setPr_date(String pr_date) {
		this.pr_date = pr_date;
	}
	public String getPr_state() {
		return pr_state;
	}
	public void setPr_state(String pr_state) {
		this.pr_state = pr_state;
	}
	public int getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(int emp_id) {
		this.emp_id = emp_id;
	}
	public ProductVO getProductVO() {
		return productVO;
	}
	public void setProductVO(ProductVO productVO) {
		this.productVO = productVO;
	}
	public ProductStockVO getProductStockVO() {
		return productStockVO;
	}
	public void setProductStockVO(ProductStockVO productStockVO) {
		this.productStockVO = productStockVO;
	}
	public WarehouseVO getWarehouseVO() {
		return warehouseVO;
	}
	public void setWarehouseVO(WarehouseVO warehouseVO) {
		this.warehouseVO = warehouseVO;
	}
	public EmployeeVO getEmployeeVO() {
		return employeeVO;
	}
	public void setEmployeeVO(EmployeeVO employeeVO) {
		this.employeeVO = employeeVO;
	}
	public OutOrderVO getOutOrderVO() {
		return outOrderVO;
	}
	public void setOutOrderVO(OutOrderVO outOrderVO) {
		this.outOrderVO = outOrderVO;
	}
	public ClientVO getClientVO() {
		return clientVO;
	}
	public void setClientVO(ClientVO clientVO) {
		this.clientVO = clientVO;
	}
	@Override
	public String toString() {
		return "ProductReleaseVO [pr_id=" + pr_id + ", pr_num=" + pr_num + ", pro_id=" + pro_id + ", oo_id=" + oo_id
				+ ", wh_id=" + wh_id + ", pr_cnt=" + pr_cnt + ", pr_date=" + pr_date + ", pr_state=" + pr_state
				+ ", emp_id=" + emp_id + ", productVO=" + productVO + ", productStockVO=" + productStockVO
				+ ", warehouseVO=" + warehouseVO + ", employeeVO=" + employeeVO + ", outOrderVO=" + outOrderVO
				+ ", clientVO=" + clientVO + "]";
	}
	

}