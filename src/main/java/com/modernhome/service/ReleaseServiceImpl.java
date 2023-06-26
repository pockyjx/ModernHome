package com.modernhome.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.modernhome.domain.MaterialReleaseVO;
import com.modernhome.domain.ProductReleaseVO;
import com.modernhome.persistence.ReleaseDAO;

@Service
public class ReleaseServiceImpl implements ReleaseService {

	@Autowired
	ReleaseDAO rDAO;
	
	@Override
	public List<MaterialReleaseVO> getMaterialReleaseList() throws Exception {
		return rDAO.getMaterialReleaseList();		
	}

	@Override
	public List<MaterialReleaseVO> getMaterialReleaseList(String startDate, String endDate, String ma_name, String mr_num) throws Exception {
		return rDAO.getMaterialReleaseList(startDate, endDate, ma_name, mr_num);
	}

	@Override
	public List<ProductReleaseVO> getProductReleaseList() throws Exception {
		return rDAO.getProductReleaseList();		
	}
	
	@Override
	public List<ProductReleaseVO> getProductReleaseList(String startDate, String endDate, String pro_name, String pr_num) throws Exception {
		return rDAO.getProductReleaseList(startDate, endDate, pro_name, pr_num);
	}

	@Override
	public void regMaterialRelease(MaterialReleaseVO vo) throws Exception {
		rDAO.regMaterialRelease(vo);
		
	}

	@Override
	public void modifyMaterialRelease(MaterialReleaseVO vo) throws Exception {
		rDAO.modifyMaterialRelease(vo);
		
	}

	@Override
	public void delMaterialRelease(Integer mr_id) throws Exception {
		rDAO.delMaterialRelease(mr_id);
		
	}

	@Override
	public void regProductRelease(ProductReleaseVO vo) throws Exception {
		rDAO.regProductRelease(vo);
		
	}

	@Override
	public void modifyProductRelease(ProductReleaseVO vo) throws Exception {
		rDAO.modifyProductRelease(vo);
		
	}

	@Override
	public void delProductRelease(Integer pr_id) throws Exception {
		rDAO.delProductRelease(pr_id);
		
	}

	@Override
	public ProductReleaseVO getProductStock(Integer pro_id) throws Exception {
		return rDAO.getProductStock(pro_id);
	}

	@Override
	public List<ProductReleaseVO> getOutorderInfo() throws Exception {
		return rDAO.getOutorderInfo() ;
	}

	@Override
	public void acceptPR(Integer pr_id, Integer pro_id, Integer pr_cnt) throws Exception {
		rDAO.acceptPR(pr_id, pro_id, pr_cnt);
		
	}
	
	
}
