package com.modernhome.persistence;

import java.util.List;
import java.util.Map;

import com.modernhome.domain.ElementInfoVO;

public interface ElementInfoDAO {

	void regElements(ElementInfoVO vo) throws Exception;

	void updateMR(ElementInfoVO vo) throws Exception;

	List<ElementInfoVO> getWorkedList(String work_num) throws Exception;

	void updateLQC(ElementInfoVO vo) throws Exception;

	void updatePR(Map<String, Object> parameterMap) throws Exception;

	List<ElementInfoVO> getReleasedList(String pr_num) throws Exception;

	void updatePrQC(ElementInfoVO vo) throws Exception;

	void updateSHP(Map<String, Object> parameterMap) throws Exception;

}
