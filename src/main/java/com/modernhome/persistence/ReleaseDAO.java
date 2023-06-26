package com.modernhome.persistence;

import java.util.List;

import com.modernhome.domain.MaterialReleaseVO;
import com.modernhome.domain.ProductReleaseVO;
import com.modernhome.domain.ProductStockVO;

public interface ReleaseDAO {

	public List<MaterialReleaseVO> getMaterialReleaseList() throws Exception;
	public List<MaterialReleaseVO> getMaterialReleaseList(String startDate, String endDate, String ma_name, String mr_num) throws Exception;
	public void regMaterialRelease(MaterialReleaseVO vo) throws Exception;
	public void modifyMaterialRelease(MaterialReleaseVO vo) throws Exception;
	public void delMaterialRelease(Integer mr_id) throws Exception;
	public List<ProductReleaseVO> getProductReleaseList() throws Exception;
	public List<ProductReleaseVO> getProductReleaseList(String startDate, String endDate, String pro_name, String pr_num) throws Exception;
	public void regProductRelease(ProductReleaseVO vo) throws Exception;
	public void modifyProductRelease(ProductReleaseVO vo) throws Exception;
	public void delProductRelease(Integer pr_id) throws Exception;
	public ProductReleaseVO getProductStock(Integer pro_id) throws Exception;
	public List<ProductReleaseVO> getOutorderInfo() throws Exception;
	public void acceptPR(Integer pr_id, Integer pro_id, Integer pr_cnt) throws Exception;
}
