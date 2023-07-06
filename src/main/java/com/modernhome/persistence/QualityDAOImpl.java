package com.modernhome.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.modernhome.domain.PageVO;
import com.modernhome.domain.QualityCheckingVO;
import com.modernhome.domain.WijoinVO;

@Repository
public class QualityDAOImpl implements QualityDAO{
	
	// 의존성 주입
	@Inject
	private SqlSession sqlSession;
	
	// 네임스페이스
	private static final String NAMESPACE = "com.modernhome.mapper.QualityMapper";
	
	// 로거
	private static final Logger logger = LoggerFactory.getLogger(QualityDAOImpl.class);
	

	// 품질검사(완제품) 목록 조회(페이징)
	@Override
	public List<WijoinVO> getQualityList(PageVO pvo) throws Exception {
		logger.debug("QualityDAOImpl_getQualityList 실행");
		return sqlSession.selectList(NAMESPACE+".getQualityList",pvo);
	}
	
	// 총 개수 계산(페이징)
	@Override
	public int getTotalCntQc() throws Exception {
		return sqlSession.selectOne(NAMESPACE+".getTotalCntQc");
	}

	// 품질검사(완제품) 목록 조회 + 검색
	@Override
	public List<WijoinVO> getQualitySearch(String qc_num, String startDate, String endDate, String qc_yn, PageVO pvo) throws Exception {
		logger.debug("QualityDAOImpl_getQualityList(검색) 실행");
		
		Map<String, Object> parameterMap = new HashMap<>();
		parameterMap.put("qc_num", qc_num);
		parameterMap.put("startDate", startDate);
		parameterMap.put("endDate", endDate);
		parameterMap.put("qc_yn", qc_yn);
		parameterMap.put("pageVO", pvo);
		
		return sqlSession.selectList(NAMESPACE+".getQualitySearch",parameterMap);
	}
	
	// 품질검사(완제품) 검색 결과 개수(페이징)
	@Override
	public int getQualitySearchCnt(String qc_num, String startDate, String endDate, String qc_yn) throws Exception {
		
		Map<String, Object> parameterMap = new HashMap<>();
		parameterMap.put("qc_num", qc_num);
		parameterMap.put("startDate", startDate);
		parameterMap.put("endDate", endDate);
		parameterMap.put("qc_yn", qc_yn);
		
		return sqlSession.selectOne(NAMESPACE+".getQualitySearchCnt",parameterMap);
	}

	// 품질검사(완제품) 수정
	@Override
	public void updateQuality(WijoinVO wvo) throws Exception {
		logger.debug("DAO -> mapper 호출 -> SQL 실행(품질등록)");
		
		sqlSession.update(NAMESPACE+".updateQuality",wvo);
		
	}
	
	

	// 품질검사(자재) 목록 조회(페이징)
	@Override
	public List<WijoinVO> getMaterialQualityList(PageVO pvo) throws Exception {
		logger.debug("QualityDAOImpl_getMaterialQualityList 실행");
		
		return sqlSession.selectList(NAMESPACE + ".getMaterialQualityList",pvo);
	}
	
	// 총 개수 계산(페이징)
	@Override
	public int getTotalCntMqc() throws Exception {
		return sqlSession.selectOne(NAMESPACE+".getTotalCntMqc");
	}

	// 품질검사(자재) 목록 조회 + 검색 (페이징)
	@Override
	public List<WijoinVO> getMaterialQualitySearch(String qc_num, String startDate, String endDate, String qc_yn, PageVO pvo) throws Exception {
		logger.debug("QualityDAOImpl_getQualityList(검색) 실행");
		
		Map<String, Object> parameterMap = new HashMap<>();
		parameterMap.put("qc_num", qc_num);
		parameterMap.put("startDate", startDate);
		parameterMap.put("endDate", endDate);
		parameterMap.put("qc_yn", qc_yn);
		parameterMap.put("pageVO", pvo);
		
		return sqlSession.selectList(NAMESPACE+".getMaterialQualitySearch", parameterMap);
	}
	
	// 품질검사(자재) 검색 결과 개수 (페이징)
	@Override
	public int getMaterialQualitySearchCnt(String qc_num, String startDate, String endDate, String qc_yn) throws Exception {
		logger.debug("QualityDAOImpl_getQualityList(검색) 실행");
		
		Map<String, Object> parameterMap = new HashMap<>();
		parameterMap.put("qc_num", qc_num);
		parameterMap.put("startDate", startDate);
		parameterMap.put("endDate", endDate);
		parameterMap.put("qc_yn", qc_yn);
		
		return sqlSession.selectOne(NAMESPACE+".getMateriqlQualitySearchCnt", parameterMap);
	}

	// 품질검사(자재) 수정
	@Override
	public void updateMaterialQuality(WijoinVO wvo) throws Exception{
		logger.debug("DAO -> mapper 호출 -> SQL 실행(품질등록)");
		
		sqlSession.update(NAMESPACE+".updateMaterialQuality",wvo);
		
	}
	
	@Override
	public void addQC(WijoinVO wvo) throws Exception {
		logger.debug("QualityDAOImpl_addQC() 실행");
		
		sqlSession.insert(NAMESPACE+".addQC",wvo);
		
	}
	
	// 수입검사에서 검사완료가 되면 자재 입고 관리 페이지에 입고완료
	@Override
	public void modifyRecState(WijoinVO wvo) throws Exception {
		logger.debug("QualityDAOImpl_modifyRec() 실행"); 
		
		sqlSession.update(NAMESPACE+".modifyRec",wvo);
	}

	
	
	// 출고검사 목록 출력(페이징)
	@Override
	public List<WijoinVO> getMrList(PageVO pvo) throws Exception {
		logger.debug("QualityDAOImpl_getMrlist() 실행");
		return sqlSession.selectList(NAMESPACE + ".getMrList",pvo);
	}
	
	// 총 개수 계산(페이징)
	@Override
	public int getTotalCntFi() throws Exception {
		return sqlSession.selectOne(NAMESPACE+".getTotalCntFi");
	}

	// 출고검사 목록 출력 + 검색
	@Override
	public List<WijoinVO> getMrListSearch(String qc_num, String qc_yn, String startDate, String endDate, PageVO pvo) throws Exception {
		logger.debug("QualityDAOImpl_getMrListSearch(검색) 실행");
		
		Map<String, Object> parameterMap = new HashMap<>();
		parameterMap.put("qc_num", qc_num);
		parameterMap.put("qc_yn", qc_yn);
		parameterMap.put("startDate", startDate);
		parameterMap.put("endDate", endDate);
		parameterMap.put("pageVO", pvo);
		
		return sqlSession.selectList(NAMESPACE+".getMrListSearch", parameterMap);
	}

	// 출고검사 검색 결과 개수 (페이징)
	@Override
	public int getMrListSearchCnt(String qc_num, String qc_yn, String startDate, String endDate) throws Exception {

		Map<String, Object> parameterMap = new HashMap<>();
		parameterMap.put("qc_num", qc_num);
		parameterMap.put("qc_yn", qc_yn);
		parameterMap.put("startDate", startDate);
		parameterMap.put("endDate", endDate);
		
		return sqlSession.selectOne(NAMESPACE+".getMrListSearchCnt", parameterMap);
	}

	// 출고검사 수정
	@Override
	public void updateFactoryInspection(WijoinVO wvo) throws Exception {
		logger.debug("DAO -> mapper 호출 -> SQL 실행(품질등록)");
		sqlSession.update(NAMESPACE+".updateFactoryInspection",wvo);
		
	}
	
	// 자재 출고에서 출고대기일 경우 품질검사 자동 등록
	@Override
	public void addMrQC(WijoinVO wvo) throws Exception {
		logger.debug("QualityDAOImpl_addMrQC() 실행");
		
		sqlSession.insert(NAMESPACE+".addMrQC", wvo);
	}

	// 완제품 출고에서 출고대기일 경우 품질검사 자동 등록
	@Override
	public void addPrQC(WijoinVO wvo) throws Exception {
		logger.debug("QualityDAOImpl_addPrQC() 실행");
		
		sqlSession.insert(NAMESPACE+".addPrQC", wvo);
	}

	// 출고검사에서 자재가 검사완료가 되면 자재 출고페이지에 출고완료로 변경
	@Override
	public void modifyRel(WijoinVO wvo) throws Exception {
		logger.debug("QualityDAOImpl_modifyRel() 실행");
		
		sqlSession.update(NAMESPACE+".modifyRel",wvo);
	}

	// 출고검사에서 완제품이 검사완료가 되면 완제품 출고페이지에 '출고완료로'변경
	@Override
	public void modifyPro(WijoinVO wvo) throws Exception {
		logger.debug("QualityDAOImpl_modifyPro() 실행");
		
		sqlSession.update(NAMESPACE+".modifyPro",wvo);
	}
	
	
	
	// 불량률 계산
	@Override
	public List<QualityCheckingVO> dfRate() throws Exception {
		return sqlSession.selectList(NAMESPACE+".dfRate");
	}

}
