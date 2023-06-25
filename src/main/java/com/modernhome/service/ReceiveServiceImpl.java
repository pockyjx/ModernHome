package com.modernhome.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.modernhome.domain.ReceiveVO;
import com.modernhome.persistence.ReceiveDAO;

@Service
public class ReceiveServiceImpl implements ReceiveService {
	
		// DAO 객체 주입
		@Inject
		private ReceiveDAO rdao;
		
		// 입고 조회
		@Override
		public List<ReceiveVO> getReceiveList() throws Exception {
			return rdao.getReceiveList();
		}
		
		// 입고 조회 + 검색
		@Override
		public List<ReceiveVO> getReceiveSearch(String startDate, String endDate, String ma_name, String io_num)
				throws Exception {
			return rdao.getReceiveSearch(startDate, endDate, ma_name, io_num);
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
