package com.modernhome.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.modernhome.domain.ClientVO;
import com.modernhome.persistence.ClientDAO;

@Service
public class ClientServiceImpl implements ClientService {
	
	@Inject
	private ClientDAO cDAO;

	// 거래처 조회
	@Override
	public List<ClientVO> clientList() {
		return cDAO.clientList();
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
	public void deleteClient(int clt_id) {
		cDAO.deleteClient(clt_id);
		
	}

	// 거래처 업데이트
	@Override
	public void updateClient(ClientVO cvo) {
		cDAO.updateClient(cvo);
		
	}
	
	

}
