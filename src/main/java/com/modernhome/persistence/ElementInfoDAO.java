package com.modernhome.persistence;

import java.util.List;
import java.util.Map;

import com.modernhome.domain.ElementInfoVO;

public interface ElementInfoDAO {

	public void regElements(ElementInfoVO vo) throws Exception;

	public void updateMR(ElementInfoVO vo) throws Exception;

	public List<ElementInfoVO> getWorkedList(String work_num) throws Exception;

	public void updateLQC(ElementInfoVO vo) throws Exception;

	public void updatePR(Map<String, Object> parameterMap) throws Exception;

	public List<ElementInfoVO> getReleasedList(String pr_num) throws Exception;

	public void updatePrQC(ElementInfoVO vo) throws Exception;

	public void updateSHP(Map<String, Object> parameterMap) throws Exception;

	public ElementInfoVO getElementInfo(String ele_num) throws Exception;

}
