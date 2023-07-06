package com.modernhome.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.modernhome.domain.PageVO;
import com.modernhome.domain.WijoinVO;
import com.modernhome.persistence.QualityDAO;

@Service
public class QualityServiceImpl implements QualityService{

	// 의존성 주입
	@Inject
	private QualityDAO qdao;

	// 품질검사(완제품) 목록 조회 (페이징)
	@Override
	public List<WijoinVO> getQualityList(PageVO pvo) throws Exception {
		return qdao.getQualityList(pvo);
	}
	
	// 품질검사 개수
	@Override
	public int getTotalCntQc() throws Exception {
		return qdao.getTotalCntQc();
	}

	// 품질검사(완제품) 목록 조회 + 검색
	@Override
	public List<WijoinVO> getQualitySearch(String qc_num, String startDate, String endDate, String qc_yn, PageVO pvo) throws Exception {
		return qdao.getQualitySearch(qc_num, startDate, endDate, qc_yn, pvo);
	}
	
	// 검색 결과(완제품) 개수
	@Override
	public int getQualitySearchCnt(String qc_num, String startDate, String endDate, String qc_yn) throws Exception {
		return qdao.getQualitySearchCnt(qc_num, startDate, endDate, qc_yn);
	}
		
	// 품질검사(완제품) 수정
	@Override
	public void updateQuality(WijoinVO wvo) throws Exception {
		qdao.updateQuality(wvo);
		
	}
	

	// 품질검사(자재) 목록 조회 (페이징)
	@Override
	public List<WijoinVO> getMaterialQualityList(PageVO pvo) throws Exception {
		return qdao.getMaterialQualityList(pvo);
	}
	
	// 품질검사(자재) 개수
	@Override
	public int getTotalCntMqc() throws Exception {
		return qdao.getTotalCntMqc();
	}

	// 품질검사(자재) 목록 조회 + 검색
	@Override
	public List<WijoinVO> getMaterialQualitySearch(String qc_num, String startDate, String endDate, String qc_yn, PageVO pvo) throws Exception {
		return qdao.getMaterialQualitySearch(qc_num, startDate, endDate, qc_yn, pvo);
	}
	
	// 검색 결과(자재) 개수
	@Override
	public int getMaterialQualitySearchCnt(String qc_num, String startDate, String endDate, String qc_yn) throws Exception {
		return qdao.getMaterialQualitySearchCnt(qc_num,startDate,endDate,qc_yn);
	}

	// 품질검사(자재) 수정
	@Override
	public void updateMaterialQuality(WijoinVO wvo) throws Exception{
		qdao.updateMaterialQuality(wvo);
		
	}

	// 입고에서 입고대기일 경우 품질검사 자동 등록
	@Override
	public void addQC(WijoinVO wvo) throws Exception {
		qdao.addQC(wvo);
		
	}
	
	// 수입검사에서 검사완료가 되면 자재 입고 관리 페이지에 입고완료
	@Override
	public void modifyRecState(WijoinVO wvo) throws Exception {
		qdao.modifyRecState(wvo);
		
	}
	
	
	// 출고검사 목록 출력(페이징)
	@Override
	public List<WijoinVO> getMrList(PageVO pvo) throws Exception {
		return qdao.getMrList(pvo);
	}

	// 출고검사 개수
	@Override
	public int getTotalCntFi() throws Exception {
		return qdao.getTotalCntFi();
	}
	
	// 출고검사 목록 출력 + 검색
	@Override
	public List<WijoinVO> getMrListSearch(String qc_num, String qc_yn, String startDate, String endDate, PageVO pvo) throws Exception {
		return qdao.getMrListSearch(qc_num, qc_yn, startDate, endDate, pvo);
	}

	// 출고검사 검색 결과 개수
	@Override
	public int getMrListSearchCnt(String qc_num, String qc_yn, String startDate, String endDate) throws Exception {
		return qdao.getMrListSearchCnt(qc_num, qc_yn, startDate, endDate);
	}

	// 출고검사 수정
	@Override
	public void updateFactoryInspection(WijoinVO wvo) throws Exception {
		qdao.updateFactoryInspection(wvo);
		
	}

	// 자재 출고에서 출고대기일 경우 품질검사 자동 등록
	@Override
	public void addMrQC(WijoinVO wvo) throws Exception {
		qdao.addMrQC(wvo);
	}
	
	// 완제품 출고에서 출고대기일 경우 품질검사 자동 등록
	@Override
	public void addPrQC(WijoinVO wvo) throws Exception {
		qdao.addPrQC(wvo);
	}

	// 출고검사에서 자재가 검사완료가 되면 자재출고페이지에 출고완료로 변경
	@Override
	public void modifyRel(WijoinVO wvo) throws Exception {
		qdao.modifyRel(wvo);
		
	}

	// 출고검사에서 완제품이 검사완료가 되면 완제품 출고페이지에 출고완료로 변경
	@Override
	public void modifyPro(WijoinVO wvo) throws Exception {
		qdao.modifyPro(wvo);
		
	}
	
	




	
} // QualityServiceImpl
