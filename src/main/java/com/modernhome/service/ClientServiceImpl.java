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

}
