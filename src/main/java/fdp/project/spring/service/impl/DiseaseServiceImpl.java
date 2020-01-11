package fdp.project.spring.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fdp.project.spring.model.Disease_age_gender;
import fdp.project.spring.service.DiseaseService;
import lombok.extern.slf4j.Slf4j;

/** 게시판 데이터 관리 기능을 제공하기 위한 Service 계층에 대한 구현체 */
@Slf4j
@Service  // --> import org.springframework.stereotype.Service;
public class DiseaseServiceImpl implements DiseaseService {
	
	/** MyBatis */
    // --> import org.apache.ibatis.session.SqlSession
    @Autowired
    SqlSession sqlSession;
	
/**
 * 게시판 데이터 상세 조회
 * @param Disease_age_gender 조회할 학과의 일련번호를 담고 있는 Beans
 * @return 조회된 데이터가 저장된 Beans
 * @throws Exception
 */
    
    @Override
	public Disease_age_gender getDisease_age_genderItem(Disease_age_gender input) throws Exception {
    	Disease_age_gender result = null;

        try {
            result = sqlSession.selectOne("DiseaseMapper.Item", input);

            if (result == null) {
                throw new NullPointerException("result=null");
            }
        } catch (NullPointerException e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("조회된 데이터가 없습니다.");
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 조회에 실패했습니다.");
        }

        return result;
	}
    
    /**
     * 게시판 데이터 목록 조회
     * @return 조회 결과에 대한 컬렉션
     * @throws Exception
     */
	@Override
	public List<Disease_age_gender> getDisease_age_genderYear(Disease_age_gender input) throws Exception {
		  List<Disease_age_gender> result = null;

	        try {
	            result = sqlSession.selectList("DiseaseMapper.year", input);

	            if (result == null) {
	                throw new NullPointerException("result=null");
	            }
	        } catch (NullPointerException e) {
	            log.error(e.getLocalizedMessage());
	            throw new Exception("조회된 데이터가 없습니다.");
	        } catch (Exception e) {
	            log.error(e.getLocalizedMessage());
	            throw new Exception("데이터 조회에 123123실패했습니다.");
	        }

	        return result;
	}

	   /**
     * 게시판 데이터 목록 조회
     * @return 조회 결과에 대한 컬렉션
     * @throws Exception
     */
	@Override
	public List<Disease_age_gender> getDisease_age_genderAge(Disease_age_gender input) throws Exception {
		  List<Disease_age_gender> result = null;

	        try {
	            result = sqlSession.selectList("DiseaseMapper.age", input);

	            if (result == null) {
	                throw new NullPointerException("result=null");
	            }
	        } catch (NullPointerException e) {
	            log.error(e.getLocalizedMessage());
	            throw new Exception("조회된 데이터가 없습니다.");
	        } catch (Exception e) {
	            log.error(e.getLocalizedMessage());
	            throw new Exception("데이터 조회에 으앙 실패했습니다.");
	        }

	        return result;
	}

	   /**
     * 게시판 데이터 목록 조회
     * @return 조회 결과에 대한 컬렉션
     * @throws Exception
     */
	@Override
	public List<Disease_age_gender> getDisease_age_genderGender(Disease_age_gender input) throws Exception {
		  List<Disease_age_gender> result = null;

	        try {
	            result = sqlSession.selectList("DiseaseMapper.gender", input);

	            if (result == null) {
	                throw new NullPointerException("result=null");
	            }
	        } catch (NullPointerException e) {
	            log.error(e.getLocalizedMessage());
	            throw new Exception("조회된 데이터가 없습니다.");
	        } catch (Exception e) {
	            log.error(e.getLocalizedMessage());
	            throw new Exception("데이터 조회에 으앙 실패했습니다.");
	        }

	        return result;
	}

	   /**
  * 게시판 데이터 목록 조회
  * @return 조회 결과에 대한 컬렉션
  * @throws Exception
  */
	@Override
	public List<Disease_age_gender> getDisease_age_genderHit(Disease_age_gender input) throws Exception {
		  List<Disease_age_gender> result = null;

	        try {
	            result = sqlSession.selectList("DiseaseMapper.hit", input);

	            if (result == null) {
	                throw new NullPointerException("result=null");
	            }
	        } catch (NullPointerException e) {
	            log.error(e.getLocalizedMessage());
	            throw new Exception("조회된 데이터가 없습니다.");
	        } catch (Exception e) {
	            log.error(e.getLocalizedMessage());
	            throw new Exception("데이터 조회에 으앙 실패했습니다.");
	        }

	        return result;
	}
	
	}

	
