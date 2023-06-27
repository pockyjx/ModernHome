package com.modernhome.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.modernhome.domain.ClientVO;
import com.modernhome.domain.PageVO;
import com.modernhome.persistence.ClientDAO;

@Service
public class ClientServiceImpl implements ClientService {
	
	@Inject
	private ClientDAO cDAO;

	// 거래처 조회
	@Override
	public List<ClientVO> getClientList(PageVO pvo) {
		return cDAO.getClientList(pvo);
	}

	// 거래처조회 + 검색
	@Override
	public List<ClientVO> clientListSearch(ClientVO cvo) {
		return cDAO.clientListSearch(cvo);
	}

	// 거래처 등록
	@Override
	public void regClient(ClientVO cvo) {
		cDAO.regClient(cvo);
		
	}

	// 거래처 삭제
	@Override
	public void deleteClient(String clt_num) {
		cDAO.deleteClient(clt_num);
		
	}

	// 거래처 업데이트
	@Override
	public void updateClient(ClientVO cvo) {
		cDAO.updateClient(cvo);
		
	}

	// 거래처 개수 (페이징)
	@Override
	public int getTotalCntClt() throws Exception {
		return cDAO.getTotalCntClt();
	}

	// 거래처 검색 결과 (페이징)
	@Override
	public List<ClientVO> getClientList(ClientVO cvo, PageVO pvo) {
		return cDAO.getClientList(cvo, pvo);
	}

	// 검색 결과 개수 (페이징)
	@Override
	public int getCltSearchCnt(ClientVO cvo) throws Exception {
		return cDAO.getCltSearchCnt(cvo);
	}
	
	
	

}
