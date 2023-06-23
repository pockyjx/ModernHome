package com.modernhome.service;

import java.util.List;

import com.modernhome.domain.ClientVO;
import com.modernhome.domain.EmployeeVO;

public interface ClientService {
	
	// 거래처 조회
	public List<ClientVO> clientList();
	
	// 거래처조회 + 검색
	public List<ClientVO> clientListSearch(ClientVO cvo);
	
	// 거래처 등록
	public void regClient(ClientVO cvo);
		
	// 거래처 삭제
	public void deleteClient(int clt_id);
		
	// 거래처 업데이트
	public void updateClient(ClientVO cvo); 

}
