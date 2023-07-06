package com.modernhome.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.modernhome.domain.InorderVO;
import com.modernhome.domain.PageVO;
import com.modernhome.persistence.InorderDAO;

@Service
public class InorderServiceImpl implements InorderService {
	
	// DAO 객체 주입
	@Inject
	private InorderDAO iodao;
	
	// 발주 조회 (페이징)
	@Override
	public List<InorderVO> getInorderList(PageVO pvo) throws Exception {
		return iodao.getInorderList(pvo);
	}

	// 발주 개수
	@Override
	public int getTotalCntMate() throws Exception {
		return iodao.getTotalCntMate();
	}
	
	// 발주 조회 + 검색
	@Override
	public List<InorderVO> getInorderSearch(String istartDate, String iendDate,
			String rstartDate, String rendDate, 
			String ma_name, String io_state, PageVO pvo)
			throws Exception {
		return iodao.getInorderSearch(istartDate, iendDate,rstartDate, rendDate, ma_name, io_state, pvo);
	}
	
	// 검색 결과 개수
	@Override
	public int getIoSearchCnt(String istartDate, String iendDate, String rstartDate, String rendDate, String ma_name,
			String io_state) throws Exception {
		return iodao.getIoSearchCnt(istartDate, iendDate,rstartDate, rendDate, ma_name, io_state);
	}

	// 발주 등록
	@Override
	public void regInorder(InorderVO iovo) throws Exception {
		iodao.regInorder(iovo);
	}

	// 발주 수정
	@Override
	public void updateInorder(InorderVO iovo) throws Exception {
		iodao.updateInorder(iovo);
	}

	// 발주 삭제
	@Override
	public void deleteInorder(int io_id) throws Exception {
		iodao.deleteInorder(io_id);
	}

	// 발주서 가져오기
	@Override
	public List<InorderVO> getIoList(String io_num) throws Exception {
		return iodao.getIoList(io_num);
	}

	// 발주 팝업 목록
	@Override
	public List<InorderVO> getIoPopup(PageVO vo) throws Exception {
		return iodao.getIoPopup(vo);
	}
	
	// 발주 팝업 목록 개수
	@Override
	public int getIoPopupCnt() throws Exception {
		return iodao.getIoPopupCnt();
	}

	// 발주 월별 그래프
	@Override
	public List<InorderVO> monthlyIOResult() throws Exception {
		return iodao.monthlyIOResult();
	}

	
	
	

	
}
