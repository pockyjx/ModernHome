package com.modernhome.domain;

public class MaterialReleaseVO {
	
	private int mr_id;
	private String mr_num;
	private int ma_id;
	private int work_id;
	private int wh_id;
	private int mr_cnt;
	private String mr_date;
	private String mr_state;
	private int emp_id;
	
	private WorkInstrVO workInstrVO;
	private MaterialVO materialVO;
	private MaterialStockVO materialStockVO;
	private WarehouseVO warehouseVO;
	
	public int getMr_id() {
		return mr_id;
	}
	public void setMr_id(int mr_id) {
		this.mr_id = mr_id;
	}
	public String getMr_num() {
		return mr_num;
	}
	public void setMr_num(String mr_num) {
		this.mr_num = mr_num;
	}
	public int getMa_id() {
		return ma_id;
	}
	public void setMa_id(int ma_id) {
		this.ma_id = ma_id;
	}
	public int getWork_id() {
		return work_id;
	}
	public void setWork_id(int work_id) {
		this.work_id = work_id;
	}
	public int getWh_id() {
		return wh_id;
	}
	public void setWh_id(int wh_id) {
		this.wh_id = wh_id;
	}
	public int getMr_cnt() {
		return mr_cnt;
	}
	public void setMr_cnt(int mr_cnt) {
		this.mr_cnt = mr_cnt;
	}
	public String getMr_date() {
		return mr_date;
	}
	public void setMr_date(String mr_date) {
		this.mr_date = mr_date;
	}
	public String getMr_state() {
		return mr_state;
	}
	public void setMr_state(String mr_state) {
		this.mr_state = mr_state;
	}
	public int getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(int emp_id) {
		this.emp_id = emp_id;
	}
	public WorkInstrVO getWorkInstrVO() {
		return workInstrVO;
	}
	public void setWorkInstrVO(WorkInstrVO workInstrVO) {
		this.workInstrVO = workInstrVO;
	}
	public MaterialVO getMaterialVO() {
		return materialVO;
	}
	public void setMaterialVO(MaterialVO materialVO) {
		this.materialVO = materialVO;
	}
	public MaterialStockVO getMaterialStockVO() {
		return materialStockVO;
	}
	public void setMaterialStockVO(MaterialStockVO materialStockVO) {
		this.materialStockVO = materialStockVO;
	}
	public WarehouseVO getWarehouseVO() {
		return warehouseVO;
	}
	public void setWarehouseVO(WarehouseVO warehouseVO) {
		this.warehouseVO = warehouseVO;
	}
	@Override
	public String toString() {
		return "MaterialReleaseVO [mr_id=" + mr_id + ", mr_num=" + mr_num + ", ma_id=" + ma_id + ", work_id=" + work_id
				+ ", wh_id=" + wh_id + ", mr_cnt=" + mr_cnt + ", mr_date=" + mr_date + ", mr_state=" + mr_state
				+ ", emp_id=" + emp_id + ", workInstrVO=" + workInstrVO + ", materialVO=" + materialVO
				+ ", materialStockVO=" + materialStockVO + ", warehouseVO=" + warehouseVO + "]";
	}
	
	
	
}
