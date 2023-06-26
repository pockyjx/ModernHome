package com.modernhome.persistence;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.modernhome.domain.MaterialStockVO;
import com.modernhome.domain.PageVO;

@Repository
public class MaterialStockDAOImpl implements MaterialStockDAO {
	
	@Autowired
	private SqlSession sqlSession;

	private static final Logger logger = LoggerFactory.getLogger(MaterialStockDAOImpl.class);
	private static final String NAMESPACE = "com.modernhome.domain.MaterialStockVO";
	
	// 자재 재고 목록
	@Override
	public List<MaterialStockVO> getMsList(PageVO vo) {
		return sqlSession.selectList(NAMESPACE + ".getMateStock", vo);
	}
	
	// 전체 글 개수 (페이징)
	@Override
	public int getMsTotalCnt() throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".msTotalCnt");
	}
	
	// 자재 재고 등록
	@Override
	public void regMaStock(int maxMaId) {
		logger.debug("자재 재고 정보 자동 등록!");
		sqlSession.insert(NAMESPACE + ".regMaStock", maxMaId); 
	}

	// 자재 재고 검색 (페이징)
	@Override
	public List<MaterialStockVO> searchMateStock(MaterialStockVO vo, PageVO pvo) {
		logger.debug("자재 재고 검색!");
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("msVO", vo);
		paramMap.put("pageVO", pvo);
		
		return sqlSession.selectList(NAMESPACE + ".searchMateStock", paramMap);
	}

	// 검색 결과 개수 (페이징)
	@Override
	public int getMsSearchCnt(MaterialStockVO vo) {
		return sqlSession.selectOne(NAMESPACE + ".msSearchCnt", vo);
	}
	
	

	
	
	
}
