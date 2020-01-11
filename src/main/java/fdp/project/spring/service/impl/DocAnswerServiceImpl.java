package fdp.project.spring.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fdp.project.spring.model.DocAnswer;
import fdp.project.spring.service.DocAnswerService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class DocAnswerServiceImpl implements DocAnswerService {

	/** MyBatis */
	// --> import org.apache.ibatis.session.SqlSession;
	@Autowired
	SqlSession sqlSession;

	/**
	 * 답글 데이터 상세 조회
	 * @param DocAnswer 조회할 답글의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	@Override
	public DocAnswer getDocAnswerItem(DocAnswer input) throws Exception {
		DocAnswer result = null;

		try {
			result = sqlSession.selectOne("DocAnswerMapper.selectItem", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	/**
	 * 답글 데이터 목록 조회
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	@Override
	public List<DocAnswer> getDocAnswerList(DocAnswer input) throws Exception {
		List<DocAnswer> result = null;

		try {
			result = sqlSession.selectList("DocAnswerMapper.selectList", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	/**
	 * 답글 데이터가 저장되어 있는 갯수 조회
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int getDocAnswerCount(DocAnswer input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("DocAnswerMapper.selectCountAll", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	/**
	 * 답글 데이터 등록하기
	 * @param DocAnswer 저장할 정보를 담고 있는 Beans
	 * @throws Exception
	 */
	@Override
	public int addDocAnswer(DocAnswer input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.insert("DocAnswerMapper.insertItem", input);

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
	 * 답글 데이터 수정하기
	 * @param DocAnswer 수정할 정보를 담고 있는 Beans
	 * @throws Exception
	 */
	@Override
	public int editDocAnswer(DocAnswer input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("DocAnswerMapper.updateItem", input);

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
	 * 답글 데이터 삭제하기
	 * @param DocAnswer 삭제할 답글의 일련번호를 담고 있는 Beans
	 * @throws Exception
	 */
	@Override
	public int deleteDocAnswer(DocAnswer input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.delete("DocAnswerMapper.deleteItem", input);

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
}
