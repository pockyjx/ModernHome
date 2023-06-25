package com.modernhome.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.modernhome.domain.MaterialStockVO;

@Repository
public class MaterialStockDAOImpl implements MaterialStockDAO {
	
	@Autowired
	private SqlSession sqlSession;

	private static final Logger logger = LoggerFactory.getLogger(MaterialStockDAOImpl.class);
	private static final String NAMESPACE = "com.modernhome.domain.MaterialStockVO";
	
	// 자재 재고 목록
	@Override
	public List<MaterialStockVO> getMsList() {
		return sqlSession.selectList(NAMESPACE + ".getMateStock");
	}

	// 자재 재고 등록
	@Override
	public void regMaStock(int maxMaId) {
		logger.debug("자재 재고 정보 자동 등록!");
		sqlSession.insert(NAMESPACE + ".regMaStock", maxMaId); 
	}

	// 자재 재고 검색
	@Override
	public List<MaterialStockVO> searchMateStock(MaterialStockVO vo) {
		logger.debug("자재 재고 검색!");
		return sqlSession.selectList(NAMESPACE + ".searchMateStock", vo);
	}

	
	
	
}
