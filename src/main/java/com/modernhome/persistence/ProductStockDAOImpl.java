package com.modernhome.persistence;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.modernhome.domain.PageVO;
import com.modernhome.domain.ProductStockVO;

@Repository
public class ProductStockDAOImpl implements ProductStockDAO {
	
	@Autowired
	SqlSession sqlSession;

	private static final Logger logger = LoggerFactory.getLogger(ProductStockDAOImpl.class);
	private static final String NAMESPACE = "com.modernhome.domain.ProductStockVO";
	
	// 완제품 재고 목록 (페이징)
	@Override
	public List<ProductStockVO> getPsList(PageVO vo) {
		logger.debug("완제품 재고 목록 출력!");
		return sqlSession.selectList(NAMESPACE + ".getProStock", vo);
	}
	
	// 전체 글 개수 (페이징)
	@Override
	public int getPsTotalCnt() throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".psTotalCnt");
	}

	// 완제품 재고 등록
	@Override
	public void regProStock(int maxProId) {
		logger.debug("완제품 재고 정보 자동 등록!");
		sqlSession.insert(NAMESPACE + ".regProStock", maxProId);
	}

	// 완제품 재고 검색 (페이징)
	@Override
	public List<ProductStockVO> searchProStock(ProductStockVO vo, PageVO pvo) {
		logger.debug("완제품 재고 검색!");
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("psVO", vo);
		paramMap.put("pageVO", pvo);
		
		return sqlSession.selectList(NAMESPACE + ".searchProStock", paramMap);
	}

	// 검색 결과 개수 (페이징)
	@Override
	public int getPsSearchCnt(ProductStockVO vo) {
		return sqlSession.selectOne(NAMESPACE + ".psSearchCnt", vo);
	}
	
	

}
