package com.modernhome.domain;

/**
 * @author jinwoo
 *
 */
public class ProductReleaseVO {
	private int pr_id;
	private String pr_num;
	private int oo_id;
	private int wh_id;
	private int pr_cnt;
	private String pr_date;
	private String pr_state;
	private int emp_id;
	
	private OutOrderVO outOrderVO;
	private ClientVO clientVO;
	private WarehouseVO warehouseVO;
	private ProductStockVO productStockVO;
	
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
	public WarehouseVO getWarehouseVO() {
		return warehouseVO;
	}
	public void setWarehouseVO(WarehouseVO warehouseVO) {
		this.warehouseVO = warehouseVO;
	}
	public ProductStockVO getProductStockVO() {
		return productStockVO;
	}
	public void setProductStockVO(ProductStockVO productStockVO) {
		this.productStockVO = productStockVO;
	}
	
	@Override
	public String toString() {
		return "ProductReleaseVO [pr_id=" + pr_id + ", pr_num=" + pr_num + ", oo_id=" + oo_id + ", wh_id=" + wh_id
				+ ", pr_cnt=" + pr_cnt + ", pr_date=" + pr_date + ", pr_state=" + pr_state + ", emp_id=" + emp_id
				+ ", outOrderVO=" + outOrderVO + ", clientVO=" + clientVO + ", warehouseVO=" + warehouseVO
				+ ", productStockVO=" + productStockVO + "]";
	}

	
	
}
