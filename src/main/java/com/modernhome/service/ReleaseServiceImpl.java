package com.modernhome.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.modernhome.domain.MaterialReleaseVO;
import com.modernhome.domain.PageVO;
import com.modernhome.domain.ProductReleaseVO;
import com.modernhome.persistence.ReleaseDAO;

@Service
public class ReleaseServiceImpl implements ReleaseService {

	@Autowired
	ReleaseDAO rDAO;
	// 자재 출고리스트 전체 조회
	@Override
	public List<MaterialReleaseVO> getMaterialReleaseList(PageVO vo) throws Exception {
		return rDAO.getMaterialReleaseList(vo);		
	}
	
	// 전체 글 개수
	@Override
	public int getTotalCntMr() throws Exception {
		return rDAO.getMrTotalCnt();
	}
	
	// 자재 출고리스트 검색 조회
	@Override
	public List<MaterialReleaseVO> getMaterialReleaseList(String startDate, String endDate, String ma_name, String mr_num, PageVO vo) throws Exception {
		return rDAO.getMaterialReleaseList(startDate, endDate, ma_name, mr_num, vo);
	}
	
	// 검색 결과 개수
	@Override
	public int getMrSearchCnt(String startDate, String endDate, String ma_name, String mr_num) throws Exception {
		return rDAO.getMrSearchCnt(startDate, endDate, ma_name, mr_num);
	}

	// 자재 출고 정보 등록
	@Override
	public void regMaterialRelease(MaterialReleaseVO vo) throws Exception {
		rDAO.regMaterialRelease(vo);
		
	}

	//	// 자재 출고 정보 수정
//	@Override
//	public void modifyMaterialRelease(MaterialReleaseVO vo) throws Exception {
//		rDAO.modifyMaterialRelease(vo);
//		
//	}
	// 자재 출고 정보 삭제
	@Override
	public void delMaterialRelease(Integer mr_id) throws Exception {
		rDAO.delMaterialRelease(mr_id);
		
	}
	// 작업지시 정보 조회
	@Override
	public List<MaterialReleaseVO> getWorkInstrInfo() throws Exception {
		return rDAO.getWorkInstrInfo();
	}
	// 자재재고 수량 조회
	@Override
	public MaterialReleaseVO getMaterialStock(Integer ma_id) throws Exception {
		return rDAO.getMaterialStock(ma_id);
	}

	// 제품 출고리스트 전체 조회
	@Override
	public List<ProductReleaseVO> getProductReleaseList(PageVO vo) throws Exception {
		return rDAO.getProductReleaseList(vo);		
	}
	
	// 전체 글 개수
	@Override
	public int getTotalCntPr() throws Exception {
		return rDAO.getPrTotalCnt();
	}

	// 제품 출고리스트 검색 조회
	@Override
	public List<ProductReleaseVO> getProductReleaseList(String startDate, String endDate, String pro_name, String pr_num, PageVO vo) throws Exception {
		return rDAO.getProductReleaseList(startDate, endDate, pro_name, pr_num, vo);
	}
	
	// 검색 결과 개수
	@Override
	public int getPrSearchCnt(String startDate, String endDate, String pro_name, String pr_num) throws Exception {
		return rDAO.getPrSearchCnt(startDate, endDate, pro_name, pr_num);
	}
	
	
	// 제품 출고 정보 등록
	@Override
	public void regProductRelease(ProductReleaseVO vo) throws Exception {
		rDAO.regProductRelease(vo);
		
	}

	// 제품 출고 정보 수정
//	@Override
//	public void modifyProductRelease(ProductReleaseVO vo) throws Exception {
//		rDAO.modifyProductRelease(vo);
//		
//	}
	// 제품 출고 정보 삭제
	@Override
	public void delProductRelease(Integer pr_id) throws Exception {
		rDAO.delProductRelease(pr_id);
		
	}
	// 수주 정보 조회
	@Override
	public List<ProductReleaseVO> getOutorderInfo() throws Exception {
		return rDAO.getOutorderInfo() ;
	}
	// 제품재고 수량 조회
	@Override
	public ProductReleaseVO getProductStock(Integer pro_id) throws Exception {
		return rDAO.getProductStock(pro_id);
	}

	// 자재 출고
	@Override
	public void acceptMR(Integer mr_id, Integer ma_id, Integer mr_cnt) throws Exception {
		rDAO.acceptMR(mr_id, ma_id, mr_cnt);	
		
	}
	
	// 제품 출고
	@Override
	public void acceptPR(Integer pr_id, Integer pro_id, Integer pr_cnt) throws Exception {
		rDAO.acceptPR(pr_id, pro_id, pr_cnt);
		
	}

	@Override
	public int getPrSearchCnt(ProductReleaseVO vo) throws Exception {
		return rDAO.getPrSearchCnt(vo);
	}
	
	
}
