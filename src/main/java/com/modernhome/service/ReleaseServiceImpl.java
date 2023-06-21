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
	public List<ProductReleaseVO> getProductReleaseList() throws Exception {
		return rDAO.getProductReleaseList();		
	}

}
