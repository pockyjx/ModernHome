package com.modernhome.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.modernhome.persistence.WorkPrfrmDAO;

@Service
public class WorkPrfrmServiceImpl implements WorkPrfrmService {
	
	// 의존성 주입
	@Autowired
	private WorkPrfrmDAO dao;
	
}