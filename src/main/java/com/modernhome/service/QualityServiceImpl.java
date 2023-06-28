package com.modernhome.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.modernhome.domain.WijoinVO;
import com.modernhome.persistence.QualityDAO;

@Service
public class QualityServiceImpl implements QualityService{

	// 의존성 주입
	@Inject
	private QualityDAO qdao;

	// 품질검사(완제품) 목록 조회
	@Override
	public List<WijoinVO> getQualityList() throws Exception {
		return qdao.getQualityList();
	}

	// 품질검사(완제품) 목록 조회 + 검색
	@Override
	public List<WijoinVO> getQualitySearch(String qc_num, String startDate, String endDate, String qc_yn) throws Exception {
		return qdao.getQualitySearch(qc_num, startDate, endDate, qc_yn);
	}

	
	// 품질검사(완제품) 수정
	@Override
	public void updateQuality(WijoinVO wvo) throws Exception {
		qdao.updateQuality(wvo);
		
	}

	// 품질검사(자재) 목록 조회
	@Override
	public List<WijoinVO> getMaterialQualityList() throws Exception {
		return qdao.getMaterialQualityList();
	}

	// 품질검사(자재) 목록 조회 + 검색
	@Override
	public List<WijoinVO> getMaterialQualitySearch(String qc_num, String startDate, String endDate, String qc_yn) throws Exception {
		return qdao.getMaterialQualitySearch(qc_num, startDate, endDate, qc_yn);
	}

	// 품질검사(자재) 수정
	@Override
	public void updateMaterialQuality(WijoinVO wvo) throws Exception{
		qdao.updateMaterialQuality(wvo);
		
	}

	@Override
	public void addQC(WijoinVO wvo) throws Exception {
		qdao.addQC(wvo);
		
	}
		

	
	
} // QualityServiceImpl
