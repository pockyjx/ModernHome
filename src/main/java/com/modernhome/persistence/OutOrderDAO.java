package com.modernhome.persistence;

import java.util.List;

import com.modernhome.domain.OutOrderVO;

public interface OutOrderDAO {

	public List<OutOrderVO> outOrderList();
	
	public List<OutOrderVO> outOrderListSearch(OutOrderVO ovo);
}
