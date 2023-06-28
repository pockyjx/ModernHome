package com.modernhome.service;

import java.util.List;

import com.modernhome.domain.ClientVO;
import com.modernhome.domain.MaterialVO;
import com.modernhome.domain.PageVO;

public interface ClientService {
	
	
	// 거래처 조회 (페이징)
	public List<ClientVO> getClientList(PageVO pvo);
	
	// 거래처조회 + 검색
	public List<ClientVO> clientListSearch(ClientVO cvo);
	
	// 거래처 등록
	public void regClient(ClientVO cvo);
		
	// 거래처 삭제
	public void deleteClient(String clt_num);
		
	// 거래처 업데이트
	public void updateClient(ClientVO cvo); 
	
	// 거래처 갯수 (페이징)
	public int getTotalCntClt() throws Exception;
	
	// 거래처 검색 결과 (페이징)
	public List<ClientVO> getClientList(ClientVO cvo, PageVO pvo);
	
	// 거래처 결과 개수(페이징)
	public int getCltSearchCnt(ClientVO cvo) throws Exception;
	

}
