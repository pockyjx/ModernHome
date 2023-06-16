package com.modernhome.service;

import java.util.List;

import com.modernhome.domain.ClientVO;

public interface ClientService {
	
	// 거래처 조회
	public List<ClientVO> clientList();
	
	// 거래처조회 + 검색
	public List<ClientVO> clientListSearch(ClientVO cvo);

}
