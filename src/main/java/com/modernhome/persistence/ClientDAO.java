package com.modernhome.persistence;

import java.util.List;

import com.modernhome.domain.ClientVO;

public interface ClientDAO {
	
	// 거래처 조회
	public List<ClientVO> clientList();
	
	// 거래처조회 + 검색
	public List<ClientVO> clientListSearch(ClientVO cvo);
	
	// 사원등록
	public void regClient(ClientVO cvo);
		
	// 사원삭제
	public void deleteClient(String clt_num);
		
	// 사원업데이트
	public void updateClient(ClientVO cvo);

}
