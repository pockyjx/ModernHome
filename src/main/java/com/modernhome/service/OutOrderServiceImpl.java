package com.modernhome.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.modernhome.domain.OutOrderJoinVO;
import com.modernhome.domain.OutOrderVO;
import com.modernhome.domain.PageVO;
import com.modernhome.persistence.OutOrderDAO;

@Service
public class OutOrderServiceImpl implements OutOrderService {
	
	@Inject
	private OutOrderDAO oDAO;

	
	// 수주 전체수 계산
	@Override
	public int outOrderCnt() throws Exception {
		return oDAO.outOrderCnt();
	}
	
	
	// 수주 검색
	@Override
	public List<OutOrderJoinVO> outOrderList(PageVO pvo) throws Exception {
	
		return oDAO.outOrderList(pvo);
	}
	
	


	
	
	
	
	
	// 수주 검색결과수 계산
	@Override
	public int ooSearchCnt(OutOrderJoinVO ovo) throws Exception {
		return oDAO.ooSearchCnt(ovo);
	}


	// 수주 리스트 검색
	@Override
	public List<OutOrderJoinVO> outOrderListSearch(OutOrderJoinVO ovo, PageVO pvo) {
		
		return oDAO.outOrderListSearch(ovo, pvo);
	}
	
	
	
	
	
	
	
	// 수주정보 등록
	@Override
	public void regOutOrder(OutOrderVO ovo) {
		oDAO.regOutOrder(ovo);
	}

	// 수주정보 삭제
	@Override
	public void deleteOutOrder(String oo_num) {
		oDAO.deleteOutOrder(oo_num);
	}


	// 수주정보 수정
	@Override
	public void updateOutOrder(OutOrderVO ovo) {
		oDAO.updateOutOrder(ovo);
	}
	
	
	

	
}
