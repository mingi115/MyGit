package fdp.project.spring.service;

import java.util.List;

import fdp.project.spring.model.Disease_age_gender;

/** 게시판 데이터 관리 기능을 제공하기 위한 Service 계층. */
public interface DiseaseService {

    public Disease_age_gender getDisease_age_genderItem(Disease_age_gender input) throws Exception;
    
    /**
     * 게시판 데이터 목록 조회
     * @return 조회 결과에 대한 컬렉션
     * @throws Exception
     */
    public List<Disease_age_gender> getDisease_age_genderYear(Disease_age_gender input) throws Exception;
    
    /**
     * 게시판 데이터 목록 조회
     * @return 조회 결과에 대한 컬렉션
     * @throws Exception
     */
    public List<Disease_age_gender> getDisease_age_genderAge(Disease_age_gender input) throws Exception;
    
    /**
     * 게시판 데이터 목록 조회
     * @return 조회 결과에 대한 컬렉션
     * @throws Exception
     */
    public List<Disease_age_gender> getDisease_age_genderGender(Disease_age_gender input) throws Exception;
    
    /**
     * 게시판 데이터 목록 조회
     * @return 조회 결과에 대한 컬렉션
     * @throws Exception
     */
    public List<Disease_age_gender> getDisease_age_genderHit(Disease_age_gender input) throws Exception;
    

}
