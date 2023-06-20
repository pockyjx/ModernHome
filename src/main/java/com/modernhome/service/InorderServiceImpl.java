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
	
	// 발주 조회
	@Override
	public List<InorderVO> getInorderList() throws Exception {
		return iodao.getInorderList();
	}

	// 발주 조회 + 검색
	@Override
	public List<InorderVO> getInorderSearch(String istartDate, String iendDate,String rstartDate, String rendDate, String ma_name, String io_state)
			throws Exception {
		return iodao.getInorderSearch(istartDate, iendDate,rstartDate, rendDate, ma_name, io_state);
	}
	
	// 발주 등록
	@Override
	public void regInorder(InorderVO iovo) {
		iodao.regInorder(iovo);
	}

	// 발주 수정
	@Override
	public void updateInorder(InorderVO iovo) {
		iodao.updateInorder(iovo);
	}

	// 발주 삭제
	@Override
	public void deleteInorder(int io_id) {
		iodao.deleteInorder(io_id);
	}

	
}
