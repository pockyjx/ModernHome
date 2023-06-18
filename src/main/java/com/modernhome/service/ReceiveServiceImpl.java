package com.modernhome.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.modernhome.domain.InorderVO;
import com.modernhome.domain.ReceiveVO;
import com.modernhome.persistence.InorderDAO;
import com.modernhome.persistence.ReceiveDAO;

@Service
public class ReceiveServiceImpl implements ReceiveService {

		@Inject
		private ReceiveDAO rdao;
		
		@Override
		public List<ReceiveVO> getReceiveList() throws Exception {
			return rdao.getReceiveList();
		}

		@Override
		public List<ReceiveVO> getReceiveSearch(java.util.Date startDate, java.util.Date endDate, String ma_name, String io_num)
				throws Exception {
			return rdao.getReceiveSearch(startDate, endDate, ma_name, io_num);
		}	
	
}
