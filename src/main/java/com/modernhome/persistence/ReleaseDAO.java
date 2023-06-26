package com.modernhome.persistence;

import java.util.List;

import com.modernhome.domain.MaterialReleaseVO;
import com.modernhome.domain.ProductReleaseVO;

public interface ReleaseDAO {

	public List<MaterialReleaseVO> getMaterialReleaseList() throws Exception;
	public List<ProductReleaseVO> getProductReleaseList() throws Exception;
}
