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
	public List<InorderVO> getInorderList() {
		
		return iodao.getInorderList();
	}
	
}
