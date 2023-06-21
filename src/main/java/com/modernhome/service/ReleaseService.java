package com.modernhome.service;

import java.util.List;

import com.modernhome.domain.MaterialReleaseVO;
import com.modernhome.domain.ProductReleaseVO;

public interface ReleaseService {

	public List<MaterialReleaseVO> getMaterialReleaseList() throws Exception;
	public List<ProductReleaseVO> getProductReleaseList() throws Exception;
}
