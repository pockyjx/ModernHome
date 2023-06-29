package com.modernhome.persistence;

import java.util.List;

import com.modernhome.domain.MaterialReleaseVO;
import com.modernhome.domain.PageVO;
import com.modernhome.domain.ProductReleaseVO;

public interface ReleaseDAO {

	public List<MaterialReleaseVO> getMaterialReleaseList(PageVO vo) throws Exception;
	public int getMrTotalCnt() throws Exception;
	public List<MaterialReleaseVO> getMaterialReleaseList(String startDate, String endDate, String ma_name, String mr_num, PageVO vo) throws Exception;
	public int getMrSearchCnt(String startDate, String endDate, String ma_name, String mr_num);
	
	public void regMaterialRelease(MaterialReleaseVO vo) throws Exception;
//	public void modifyMaterialRelease(MaterialReleaseVO vo) throws Exception;
	public void delMaterialRelease(Integer mr_id) throws Exception;
	public List<MaterialReleaseVO> getWorkInstrInfo() throws Exception;
	public MaterialReleaseVO getMaterialStock(Integer ma_id) throws Exception;
	
	public List<ProductReleaseVO> getProductReleaseList(PageVO vo) throws Exception;
	public int getPrTotalCnt() throws Exception;
	public List<ProductReleaseVO> getProductReleaseList(String startDate, String endDate, String pro_name, String pr_num, PageVO vo) throws Exception;
	public int getPrSearchCnt(String startDate, String endDate, String pro_name, String pr_num);
	
	public void regProductRelease(ProductReleaseVO vo) throws Exception;
//	public void modifyProductRelease(ProductReleaseVO vo) throws Exception;
	public void delProductRelease(Integer pr_id) throws Exception;
	public List<ProductReleaseVO> getOutorderInfo() throws Exception;
	public ProductReleaseVO getProductStock(Integer pro_id) throws Exception;
	
	public void acceptMR(Integer mr_id, Integer ma_id, Integer mr_cnt) throws Exception;
	public void acceptPR(Integer pr_id, Integer pro_id, Integer pr_cnt) throws Exception;
}
