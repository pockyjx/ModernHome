package com.modernhome.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.modernhome.persistence.DefectiveDAO;

@Service
public class DefectiveServiceImpl implements DefectiveService {
	
	// 의존성 주입
	@Autowired
	private DefectiveDAO dao;
	
}