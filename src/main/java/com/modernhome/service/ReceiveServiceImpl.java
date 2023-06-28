package com.modernhome.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.modernhome.domain.PageVO;
import com.modernhome.domain.ReceiveVO;
import com.modernhome.persistence.ReceiveDAO;

@Service
public class ReceiveServiceImpl implements ReceiveService {
	
		// DAO 객체 주입
		@Inject
		private ReceiveDAO rdao;
		
		// 입고 조회 (페이징)
		@Override
		public List<ReceiveVO> getReceiveList(PageVO vo) throws Exception {
			return rdao.getReceiveList(vo);
		}
		
		// 전체 글 개수 (페이징)
		@Override
		public int getTotalCntRec() throws Exception {
			return rdao.getRecTotalCnt();
		}
		
		// 입고 조회 + 검색 (페이징)
		@Override
		public List<ReceiveVO> getReceiveSearch(String startDate, String endDate, 
											String ma_name, String io_num, PageVO vo) throws Exception {
			return rdao.getReceiveSearch(startDate, endDate, ma_name, io_num, vo);
		}	
		
		// 검색 결과 개수 (페이징)
		@Override
		public int getRecSearchCnt(String startDate, String endDate, String ma_name, String io_num) {
			return rdao.getRecSearchCnt(startDate, endDate, ma_name, io_num);
		}

		// 입고 등록
		@Override
		public void regReceive(ReceiveVO rvo) {
			rdao.regReceive(rvo);
		}

		// 입고 수정
		@Override
		public void updateReceive(ReceiveVO rvo) {
			rdao.updateReceive(rvo);
		}

		// 입고 삭제
		@Override
		public void deleteReceive(int rec_id) {
			rdao.deleteReceive(rec_id);
		}
		
}
