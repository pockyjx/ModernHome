package com.modernhome.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.modernhome.domain.ElementInfoVO;
import com.modernhome.persistence.ElementInfoDAO;

@Service
public class ElementInfoServiceImpl implements ElementInfoService {

	@Autowired
	private ElementInfoDAO eDAO;
	@Override
	public void regElements(ElementInfoVO vo) throws Exception {
		eDAO.regElements(vo);
		
	}
	@Override
	public void updateMR(ElementInfoVO vo) throws Exception {
		eDAO.updateMR(vo);
		
	}
	@Override
	public List<ElementInfoVO> getWorkedList(String work_num) throws Exception {
		return eDAO.getWorkedList(work_num);
	}
	@Override
	public void updateLQC(ElementInfoVO vo) throws Exception {
		eDAO.updateLQC(vo);
		
	}
	@Override
	public void updatePR(Map<String, Object> parameterMap) throws Exception {
		eDAO.updatePR(parameterMap);
		
	}
	@Override
	public List<ElementInfoVO> getReleasedList(String pr_num) throws Exception {
		return eDAO.getReleasedList(pr_num);
	}
	@Override
	public void updatePrQC(ElementInfoVO vo) throws Exception {
		eDAO.updatePrQC(vo);
		
	}
	@Override
	public void updateSHP(Map<String, Object> parameterMap) throws Exception {
		eDAO.updateSHP(parameterMap);
		
	}

}
