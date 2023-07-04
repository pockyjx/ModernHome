package com.modernhome.persistence;

import java.util.List;

import com.modernhome.domain.ClientVO;
import com.modernhome.domain.MaterialReleaseVO;
import com.modernhome.domain.PageVO;
import com.modernhome.domain.ProductReleaseVO;
import com.modernhome.domain.ProductVO;

public interface ReleaseDAO {

	public List<MaterialReleaseVO> getMaterialReleaseList(PageVO vo) throws Exception;
	public int getMrTotalCnt() throws Exception;
	public List<MaterialReleaseVO> getMaterialReleaseList(String startDate, String endDate, String ma_name, String mr_num, PageVO vo) throws Exception;
	public int getMrSearchCnt(String startDate, String endDate, String ma_name, String mr_num);
	
	public void regMaterialRelease(MaterialReleaseVO vo) throws Exception;
//	public void modifyMaterialRelease(MaterialReleaseVO vo) throws Exception;
	public void delMaterialRelease(Integer mr_id) throws Exception;
	
	// 자재 출고 팝업
	public List<MaterialReleaseVO> getWorkInstrInfo(PageVO vo) throws Exception;
	public int getWorkInstrInfoCnt() throws Exception;
	public MaterialReleaseVO getMaterialStock(Integer ma_id) throws Exception;
	
	public List<ProductReleaseVO> getProductReleaseList(PageVO vo) throws Exception;
	public int getPrTotalCnt() throws Exception;
	public List<ProductReleaseVO> getProductReleaseList(String startDate, String endDate, String pro_name, String pr_num, PageVO vo) throws Exception;
	public int getPrSearchCnt2(ProductReleaseVO vo) throws Exception;
	public int getPrSearchCnt(String startDate, String endDate, String pro_name, String pr_num);
	
	// 촐고 팝업 페이징
	public List<ProductReleaseVO> shpPrList(ProductReleaseVO vo, PageVO pvo);
	
	// 출고 팝업 수(검색포함)
	public Integer shpPrCnt(ProductReleaseVO vo);
	
	public void regProductRelease(ProductReleaseVO vo) throws Exception;
//	public void modifyProductRelease(ProductReleaseVO vo) throws Exception;
	public void delProductRelease(Integer pr_id) throws Exception;
	
	// 완제품 출고 팝업
	public List<ProductReleaseVO> getOutorderInfo(PageVO vo) throws Exception;
	public int getOutorderInfoCnt() throws Exception;
	public ProductReleaseVO getProductStock(Integer pro_id) throws Exception;
	
	public void acceptMR(Integer mr_id, Integer ma_id, Integer mr_cnt) throws Exception;
	public void acceptPR(Integer pr_id, Integer pro_id, Integer pr_cnt) throws Exception;

	// 자재 출고 대기 처리
	public void waitingMR(Integer mr_id) throws Exception;
	
	// 완제품 출고 대기 처리
	public void waitingPR(Integer pr_id) throws Exception;


}
