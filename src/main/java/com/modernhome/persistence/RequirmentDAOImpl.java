package com.modernhome.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.modernhome.domain.RequirementVO;

@Repository
public class RequirmentDAOImpl implements RequirmentDAO {
	
	@Autowired
	private SqlSession sqlSession;

	private static final Logger logger = LoggerFactory.getLogger(RequirmentDAOImpl.class);
	private static final String NAMESPACE = "com.modernhome.mapper.RequirementMapper";

	@Override
	public List<RequirementVO> getRequirements() {
		return sqlSession.selectList(NAMESPACE + ".getRequirements");
	}

	

}
