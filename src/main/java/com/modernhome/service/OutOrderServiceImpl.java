package com.modernhome.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.modernhome.domain.OutOrderVO;
import com.modernhome.persistence.OutOrderDAO;

@Service
public class OutOrderServiceImpl implements OutOrderService {
	
	@Inject
	private OutOrderDAO oDAO;

	@Override
	public List<OutOrderVO> outOrderList() throws Exception {
	
		return oDAO.outOrderList();
	}

	@Override
	public List<OutOrderVO> outOrderListSearch(OutOrderVO ovo) {
		
		return oDAO.outOrderListSearch(ovo);
	}
	
	
	// 수주정보 등록
	@Override
	public void regOutOrder(OutOrderVO ovo) {
		oDAO.regOutOrder(ovo);
	}
	
	
	

	
}
