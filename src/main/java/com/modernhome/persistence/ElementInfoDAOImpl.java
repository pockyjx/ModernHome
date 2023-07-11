package com.modernhome.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.modernhome.domain.ElementInfoVO;

@Repository
public class ElementInfoDAOImpl implements ElementInfoDAO {

	@Autowired
	private SqlSession sqlSession;
	private static final String NAMESPACE = "com.itwillbs.mapper.ElementInfoMapper";
	
	private static final Logger logger = LoggerFactory.getLogger(ElementInfoDAOImpl.class);

	@Override
	public void regElements(ElementInfoVO vo) throws Exception {
		sqlSession.insert(NAMESPACE + ".regElements", vo);		
	}

	@Override
	public void updateMR(ElementInfoVO vo) throws Exception {
		sqlSession.update(NAMESPACE + ".updateMR", vo);
		
	}

	@Override
	public List<ElementInfoVO> getWorkedList(String work_num) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getWorkedList", work_num);
	}

	@Override
	public void updateLQC(ElementInfoVO vo) throws Exception {
		sqlSession.update(NAMESPACE + ".updateLQC", vo);
		
	}

	@Override
	public void updatePR(Map<String, Object> parameterMap) throws Exception {
		sqlSession.update(NAMESPACE+ ".updatePR", parameterMap);
		
	}

	@Override
	public List<ElementInfoVO> getReleasedList(String pr_num) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getReleasedList", pr_num);
	}

	@Override
	public void updatePrQC(ElementInfoVO vo) throws Exception {
		sqlSession.update(NAMESPACE + ".updatePrQC", vo);
		
	}

	@Override
	public void updateSHP(Map<String, Object> parameterMap) throws Exception {
		sqlSession.update(NAMESPACE+ ".updateSHP", parameterMap);
		
	}
	
	
}
