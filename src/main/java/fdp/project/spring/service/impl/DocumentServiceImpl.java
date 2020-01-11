package fdp.project.spring.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fdp.project.spring.model.Document;
import fdp.project.spring.service.DocumentService;
import lombok.extern.slf4j.Slf4j;

/** 게시판 데이터 관리 기능을 제공하기 위한 Service 계층에 대한 구현체 */
@Slf4j
@Service  // --> import org.springframework.stereotype.Service;
public class DocumentServiceImpl implements DocumentService {
	
	/** MyBatis */
    // --> import org.apache.ibatis.session.SqlSession
    @Autowired
    SqlSession sqlSession;
	
/**
 * 게시판 데이터 상세 조회
 * @param Document 조회할 학과의 일련번호를 담고 있는 Beans
 * @return 조회된 데이터가 저장된 Beans
 * @throws Exception
 */
    
    @Override
	public Document getDocumentItem(Document input) throws Exception {
    	Document result = null;

        try {
            result = sqlSession.selectOne("DocumentMapper.selectItem", input);

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
	public List<Document> getDocumentList(Document input) throws Exception {
		  List<Document> result = null;

	        try {
	            result = sqlSession.selectList("DocumentMapper.selectList", input);

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
     * 게시판 데이터가 저장되어 있는 갯수 조회
     * @return int
     * @throws Exception
     */
	@Override
	public int getDocumentCount(Document input) throws Exception {
		  int result = 0;
	        
	        try {
	            result = sqlSession.selectOne("DocumentMapper.selectCountAll", input);
	        } catch (Exception e) {
	            log.error(e.getLocalizedMessage());
	            throw new Exception("데이터 조회에 실패했습니다.");
	        }
	        
	        return result;
	}
	
	/**
     * 게시판 데이터 등록하기
     * @param Document 저장할 정보를 담고 있는 Beans
     * @throws Exception
     */
	@Override
	public int addDocument(Document input) throws Exception {
		 int result = 0;

	        try {
	            result = sqlSession.insert("DocumentMapper.insertItem", input);

	            if (result == 0) {
	                throw new NullPointerException("result=0");
	            }
	        } catch (NullPointerException e) {
	            log.error(e.getLocalizedMessage());
	            throw new Exception("저장된 데이터가 없습니다.");
	        } catch (Exception e) {
	            log.error(e.getLocalizedMessage());
	            throw new Exception("데이터 저장에 실패했습니다.");
	        }

	        return result;
	}

	/**
     * 게시판 데이터 수정하기
     * @param Document 수정할 정보를 담고 있는 Beans
     * @throws Exception
     */
	@Override
	public int editDocument(Document input) throws Exception {
		 int result = 0;

	        try {
	            result = sqlSession.update("DocumentMapper.updateItem", input);

	            if (result == 0) {
	                throw new NullPointerException("result=0");
	            }
	        } catch (NullPointerException e) {
	            log.error(e.getLocalizedMessage());
	            throw new Exception("수정된 데이터가 없습니다.");
	        } catch (Exception e) {
	            log.error(e.getLocalizedMessage());
	            throw new Exception("데이터 수정에 실패했습니다.");
	        }

	        return result;
	}
	/**
     * 게시판 데이터 삭제하기
     * @param Document 삭제할 학과의 일련번호를 담고 있는 Beans
     * @throws Exception
     */
	@Override
	public int deleteDocument(Document input) throws Exception {
		int result = 0;

        try {
            result = sqlSession.delete("DocumentMapper.deleteItem", input);

            if (result == 0) {
                throw new NullPointerException("result=0");
            }
        } catch (NullPointerException e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("삭제된 데이터가 없습니다.");
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 삭제에 실패했습니다.");
        }

        return result;
    }

	/**
     * 게시판 docA_ok 데이터 수정하기
     * @param Document 수정할 정보를 담고 있는 Beans
     * @throws Exception
     */
	@Override
	public int editDocA_ok(Document input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("DocumentMapper.updateDocA_ok", input);

			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("수정된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 수정에 실패했습니다.");
		}

		return result;
	}
}