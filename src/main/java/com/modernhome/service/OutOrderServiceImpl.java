package com.modernhome.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.modernhome.domain.OutOrderJoinVO;
import com.modernhome.domain.OutOrderVO;
import com.modernhome.persistence.OutOrderDAO;

@Service
public class OutOrderServiceImpl implements OutOrderService {
	
	@Inject
	private OutOrderDAO oDAO;

	
	
	
	// 수주 검색
	@Override
	public List<OutOrderJoinVO> outOrderList() throws Exception {
	
		return oDAO.outOrderList();
	}
	
	
	// 수주 리스트 검색
	@Override
	public List<OutOrderJoinVO> outOrderListSearch(OutOrderJoinVO ovo) {
		
		return oDAO.outOrderListSearch(ovo);
	}
	
	
	// 수주정보 등록
	@Override
	public void regOutOrder(OutOrderVO ovo) {
		oDAO.regOutOrder(ovo);
	}
	
	
	

	
}
