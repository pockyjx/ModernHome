package com.modernhome.domain;

public class ElementInfoVO {
	private String ele_num;
	private Integer rec_id;
	private Integer	ma_id;
	private Integer	mr_id;
	private Integer	work_id;
	private Integer pro_id;
	private Integer line_qc_id;
	private Integer line_qc_defect;
	private String lot_num;
	private Integer pr_id;
	private Integer pr_qc_id;
	private Integer pr_qc_defect;
	private Integer shp_id;
	private Integer cnt;

	private ReceiveVO receiveVO;
	private MaterialVO materialVO;
	private MaterialReleaseVO materialReleaseVO;
	private WorkInstrVO workInstrVO;
	private OutOrderVO outOrderVO;
	private LineVO lineVO;
	private ProductVO productVO;
	private QualityCheckingVO liQualityCheckingVO;
	private DefectiveVO liDefectiveVO;
	private QualityCheckingVO prQualityCheckingVO;
	private DefectiveVO prDefectiveVO;
	private ProductReleaseVO productReleaseVO;
	private ShipmentVO shipmentVO;
	
	public String getEle_num() {
		return ele_num;
	}
	public void setEle_num(String ele_num) {
		this.ele_num = ele_num;
	}
	public Integer getRec_id() {
		return rec_id;
	}
	public void setRec_id(Integer rec_id) {
		this.rec_id = rec_id;
	}
	public Integer getMa_id() {
		return ma_id;
	}
	public void setMa_id(Integer ma_id) {
		this.ma_id = ma_id;
	}
	public Integer getMr_id() {
		return mr_id;
	}
	public void setMr_id(Integer mr_id) {
		this.mr_id = mr_id;
	}
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
	public Integer getLine_qc_id() {
		return line_qc_id;
	}
	public void setLine_qc_id(Integer line_qc_id) {
		this.line_qc_id = line_qc_id;
	}
	public Integer getLine_qc_defect() {
		return line_qc_defect;
	}
	public void setLine_qc_defect(Integer line_qc_defect) {
		this.line_qc_defect = line_qc_defect;
	}
	public String getLot_num() {
		return lot_num;
	}
	public void setLot_num(String lot_num) {
		this.lot_num = lot_num;
	}
	public Integer getPr_id() {
		return pr_id;
	}
	public void setPr_id(Integer pr_id) {
		this.pr_id = pr_id;
	}
	public Integer getPr_qc_id() {
		return pr_qc_id;
	}
	public void setPr_qc_id(Integer pr_qc_id) {
		this.pr_qc_id = pr_qc_id;
	}
	public Integer getPr_qc_defect() {
		return pr_qc_defect;
	}
	public void setPr_qc_defect(Integer pr_qc_defect) {
		this.pr_qc_defect = pr_qc_defect;
	}
	public Integer getShp_id() {
		return shp_id;
	}
	public void setShp_id(Integer shp_id) {
		this.shp_id = shp_id;
	}
	public Integer getCnt() {
		return cnt;
	}
	public void setCnt(Integer cnt) {
		this.cnt = cnt;
	}
	public ReceiveVO getReceiveVO() {
		return receiveVO;
	}
	public void setReceiveVO(ReceiveVO receiveVO) {
		this.receiveVO = receiveVO;
	}
	public MaterialVO getMaterialVO() {
		return materialVO;
	}
	public void setMaterialVO(MaterialVO materialVO) {
		this.materialVO = materialVO;
	}
	public MaterialReleaseVO getMaterialReleaseVO() {
		return materialReleaseVO;
	}
	public void setMaterialReleaseVO(MaterialReleaseVO materialReleaseVO) {
		this.materialReleaseVO = materialReleaseVO;
	}
	public WorkInstrVO getWorkInstrVO() {
		return workInstrVO;
	}
	public void setWorkInstrVO(WorkInstrVO workInstrVO) {
		this.workInstrVO = workInstrVO;
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
	public QualityCheckingVO getLiQualityCheckingVO() {
		return liQualityCheckingVO;
	}
	public void setLiQualityCheckingVO(QualityCheckingVO liQualityCheckingVO) {
		this.liQualityCheckingVO = liQualityCheckingVO;
	}
	public DefectiveVO getLiDefectiveVO() {
		return liDefectiveVO;
	}
	public void setLiDefectiveVO(DefectiveVO liDefectiveVO) {
		this.liDefectiveVO = liDefectiveVO;
	}
	public QualityCheckingVO getPrQualityCheckingVO() {
		return prQualityCheckingVO;
	}
	public void setPrQualityCheckingVO(QualityCheckingVO prQualityCheckingVO) {
		this.prQualityCheckingVO = prQualityCheckingVO;
	}
	public DefectiveVO getPrDefectiveVO() {
		return prDefectiveVO;
	}
	public void setPrDefectiveVO(DefectiveVO prDefectiveVO) {
		this.prDefectiveVO = prDefectiveVO;
	}
	public ProductReleaseVO getProductReleaseVO() {
		return productReleaseVO;
	}
	public void setProductReleaseVO(ProductReleaseVO productReleaseVO) {
		this.productReleaseVO = productReleaseVO;
	}
	public ShipmentVO getShipmentVO() {
		return shipmentVO;
	}
	public void setShipmentVO(ShipmentVO shipmentVO) {
		this.shipmentVO = shipmentVO;
	}
	@Override
	public String toString() {
		return "ElementInfoVO [ele_num=" + ele_num + ", rec_id=" + rec_id + ", ma_id=" + ma_id + ", mr_id=" + mr_id
				+ ", work_id=" + work_id + ", pro_id=" + pro_id + ", line_qc_id=" + line_qc_id + ", line_qc_defect="
				+ line_qc_defect + ", lot_num=" + lot_num + ", pr_id=" + pr_id + ", pr_qc_id=" + pr_qc_id
				+ ", pr_qc_defect=" + pr_qc_defect + ", shp_id=" + shp_id + ", cnt=" + cnt + ", receiveVO=" + receiveVO
				+ ", materialVO=" + materialVO + ", materialReleaseVO=" + materialReleaseVO + ", workInstrVO="
				+ workInstrVO + ", outOrderVO=" + outOrderVO + ", lineVO=" + lineVO + ", productVO=" + productVO
				+ ", liQualityCheckingVO=" + liQualityCheckingVO + ", liDefectiveVO=" + liDefectiveVO
				+ ", prQualityCheckingVO=" + prQualityCheckingVO + ", prDefectiveVO=" + prDefectiveVO
				+ ", productReleaseVO=" + productReleaseVO + ", shipmentVO=" + shipmentVO + "]";
	}
	
}
