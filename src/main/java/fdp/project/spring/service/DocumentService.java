package fdp.project.spring.service;

import java.util.List;

import fdp.project.spring.model.Document;

/** 게시판 데이터 관리 기능을 제공하기 위한 Service 계층. */
public interface DocumentService {
    /**
     * 게시판 데이터 상세 조회
     * @param Document 조회할 게시판의 일련번호를 담고 있는 Beans
     * @return 조회된 데이터가 저장된 Beans
     * @throws Exception
     */
    public Document getDocumentItem(Document input) throws Exception;
    
    /**
     * 게시판 데이터 목록 조회
     * @return 조회 결과에 대한 컬렉션
     * @throws Exception
     */
    public List<Document> getDocumentList(Document input) throws Exception;
    
    /**
     * 게시판 데이터가 저장되어 있는 갯수 조회
     * @return int
     * @throws Exception
     */
    public int getDocumentCount(Document input) throws Exception;
    
    /**
     * 게시판 데이터 등록하기
     * @param Document 저장할 정보를 담고 있는 Beans
     * @throws Exception
     */
    public int addDocument(Document input) throws Exception;
    
    /**
     * 게시판 데이터 수정하기
     * @param Document 수정할 정보를 담고 있는 Beans
     * @throws Exception
     */
    public int editDocument(Document input) throws Exception;
    
    /**
     * 게시판 docA_ok 데이터 수정하기
     * @param Document 수정할 정보를 담고 있는 Beans
     * @throws Exception
     */
    public int editDocA_ok(Document input) throws Exception;
    
    /**
     * 게시판 데이터 삭제하기
     * @param Document 삭제할 게시판의 일련번호를 담고 있는 Beans
     * @throws Exception
     */
    public int deleteDocument(Document input) throws Exception;
    
}
