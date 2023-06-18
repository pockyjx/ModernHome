package com.modernhome.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.modernhome.domain.MaterialStockVO;

@Repository
public class MaterialStockDAOImpl implements MateStockDAO {
	
	@Autowired
	private SqlSession sqlSession;

	private static final Logger logger = LoggerFactory.getLogger(MaterialStockDAOImpl.class);
	private static final String NAMESPACE = "com.modernhome.domain.MaterialStockVO";
	
	// 자재 재고 목록
	@Override
	public List<MaterialStockVO> getMsList() {
		return sqlSession.selectList(NAMESPACE + ".getMateStock");
	}

}
