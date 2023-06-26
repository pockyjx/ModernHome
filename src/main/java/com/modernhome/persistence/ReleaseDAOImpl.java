package com.modernhome.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.modernhome.domain.MaterialReleaseVO;
import com.modernhome.domain.ProductReleaseVO;

@Repository
public class ReleaseDAOImpl implements ReleaseDAO {

	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE = "com.modernhome.mapper.releaseMapper";
	private static final Logger logger = LoggerFactory.getLogger(ReleaseDAOImpl.class);

	@Override
	public List<MaterialReleaseVO> getMaterialReleaseList() throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getmrlist");

	}

	@Override
	public List<MaterialReleaseVO> getMaterialReleaseList(String startDate, String endDate, String ma_name, String mr_num) throws Exception {
		
		Map<String, Object> parameterMap = new HashMap<>();
		parameterMap.put("startDate", startDate);
		parameterMap.put("endDate", endDate);
		parameterMap.put("ma_name", ma_name);
		parameterMap.put("mr_num", mr_num);
		
		return sqlSession.selectList(NAMESPACE + ".getmrlistp", parameterMap);
	}

	@Override
	public void regMaterialRelease(MaterialReleaseVO vo) throws Exception {
		logger.debug("자재 출고 등록!");
		
		sqlSession.insert(NAMESPACE + ".regmtRelease", vo);
		
	}

	@Override
	public void modifyMaterialRelease(MaterialReleaseVO vo) throws Exception {
		logger.debug("자재 출고 수정!");
		sqlSession.update(NAMESPACE + ".updatemtRelease", vo);
		
	}

	@Override
	public void delMaterialRelease(Integer mr_id) throws Exception {
		logger.debug("자재 출고 삭제!");
		sqlSession.delete(NAMESPACE + ".delmtRelease", mr_id);
		
	}
	
	@Override
	public List<ProductReleaseVO> getProductReleaseList() throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getprlist");
		
	}
	
	@Override
	public List<ProductReleaseVO> getProductReleaseList(String startDate, String endDate, String pro_name, String pr_num) throws Exception {
		
		Map<String, Object> parameterMap = new HashMap<>();
		parameterMap.put("startDate", startDate);
		parameterMap.put("endDate", endDate);
		parameterMap.put("pro_name", pro_name);
		parameterMap.put("pr_num", pr_num);
		
		return sqlSession.selectList(NAMESPACE + ".getprlistp", parameterMap);
	}
	
	@Override
	public void regProductRelease(ProductReleaseVO vo) throws Exception {
		logger.debug("제품 출고 등록!");
		
		sqlSession.insert(NAMESPACE + ".regprRelease", vo);
		
	}

	@Override
	public void modifyProductRelease(ProductReleaseVO vo) throws Exception {
//		logger.debug("제품 출고 수정!");
//		sqlSession.update(NAMESPACE + ".updateprRelease", vo);
		
	}

	@Override
	public void delProductRelease(Integer pr_id) throws Exception {
		logger.debug("제품 출고 삭제!");
		sqlSession.delete(NAMESPACE + ".delprRelease", pr_id);
		
	}

	@Override
	public ProductReleaseVO getProductStock(Integer pro_id) throws Exception {
		logger.debug("제품 재고 조회!");
		return sqlSession.selectOne(NAMESPACE + ".getProductStock", pro_id);		
	}

	@Override
	public List<ProductReleaseVO> getOutorderInfo() throws Exception {
		logger.debug("수주 정보 조회!");
		return sqlSession.selectList(NAMESPACE + ".getOutorderinfo");	
	}

	@Override
	public void acceptPR(Integer pr_id, Integer pro_id, Integer pr_cnt) throws Exception {
		logger.debug("출고처리!");
		Map<String, Object> parameterMap = new HashMap<>();
		parameterMap.put("pro_id", pro_id);
		parameterMap.put("pr_cnt", pr_cnt);
		sqlSession.update(NAMESPACE + ".acceptPR", pr_id);
		sqlSession.update(NAMESPACE + ".updatePS", parameterMap);
		
	}
}
