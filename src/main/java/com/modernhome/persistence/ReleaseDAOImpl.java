package com.modernhome.persistence;

import java.util.List;

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
		return sqlSession.selectList(NAMESPACE + ".getMaterialReleaseList");

	}

	@Override
	public List<ProductReleaseVO> getProductReleaseList() throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getProductReleaseList");

	}

}
