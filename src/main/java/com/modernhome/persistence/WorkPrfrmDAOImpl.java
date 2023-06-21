package com.modernhome.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.modernhome.domain.WijoinVO;

@Repository
public class WorkPrfrmDAOImpl implements WorkPrfrmDAO {
	
	// 로거
	private static final Logger logger = LoggerFactory.getLogger(WorkPrfrmDAOImpl.class);

	// 네임스페이스
	private static final String NAMESPACE = "com.modernhome.mapper.WorkInstrMapper";
	
	// 의존성 주입
	@Autowired
	private SqlSession sqlSession;

	@Override
	
	public List<WijoinVO> getqcEndInstr() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
}