package com.modernhome.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.modernhome.domain.MaterialVO;
import com.modernhome.domain.PageVO;

@Repository
public class MaterialDAOImpl implements MaterialDAO {

	// 로거
	private static final Logger logger = LoggerFactory.getLogger(MaterialDAOImpl.class);
	
	// 의존성 주입
	@Inject
	private SqlSession sqlSession;
	
	// 네임스페이스
	private static final String NAMESPACRE = "com.modernhome.mapper.MaterialMapper";
	
	// 자재 목록 조회 (페이징)
	@Override
	public List<MaterialVO> getMaterialList(PageVO vo) {
		logger.debug("자재 목록 조회!");
		return sqlSession.selectList(NAMESPACRE + ".materialList", vo);
	}
	
	// 총 개수 계산
	@Override
	public int getTotalCntMate() throws Exception {
		return sqlSession.selectOne(NAMESPACRE + ".mateTotalCnt");
	}







	// 자재 검색 결과
	@Override
	public List<MaterialVO> getMaterialList(MaterialVO vo) {

		 return sqlSession.selectList(NAMESPACRE + ".maSearchList", vo);

	}

	// 자재 등록
	@Override
	public void regMaterial(MaterialVO vo) {
		logger.debug("자재 등록!");
		sqlSession.insert(NAMESPACRE + ".regMaterial", vo);
	}
	
	// 자재 삭제
	@Override
	public void delMaterial(int ma_id) {
		logger.debug("자재 삭제!");
		sqlSession.delete(NAMESPACRE + ".delMaterial", ma_id);
	}

	// 자재 수정
	@Override
	public void modifyMaterial(MaterialVO vo) {
		logger.debug("자재 수정!");
		sqlSession.update(NAMESPACRE + ".updateMaterial", vo);
	}
	

	// 자재 id값 가져오기
	@Override
	public int getMaxMaId() {
		return sqlSession.selectOne(NAMESPACRE + ".getMaId");
	}
	
	
	
	
	

}
