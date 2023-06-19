package com.modernhome.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.modernhome.domain.InorderVO;
import com.modernhome.persistence.InorderDAO;

@Service
public class InorderServiceImpl implements InorderService {
	
	@Inject
	private InorderDAO iodao;
	
	@Override
	public List<InorderVO> getInorderList() throws Exception {
		return iodao.getInorderList();
	}

	@Override
	public List<InorderVO> getInorderSearch(String istartDate, String iendDate,String rstartDate, String rendDate, String ma_name, String io_state)
			throws Exception {
		return iodao.getInorderSearch(istartDate, iendDate,rstartDate, rendDate, ma_name, io_state);
	}

	
}
