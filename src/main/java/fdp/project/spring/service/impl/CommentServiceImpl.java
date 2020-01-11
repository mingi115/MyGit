package fdp.project.spring.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fdp.project.spring.model.Comment;
import fdp.project.spring.service.CommentService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CommentServiceImpl implements CommentService {

	/** MyBatis */
	// --> import org.apache.ibatis.session.SqlSession;
	@Autowired
	SqlSession sqlSession;

	/**
	 * 댓글 데이터 상세 조회
	 * @param Comment 조회할 댓글의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	@Override
	public Comment getCommentItem(Comment input) throws Exception {
		Comment result = null;

		try {
			result = sqlSession.selectOne("CommentMapper.selectItem", input);

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
	 * 댓글 데이터 목록 조회
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	@Override
	public List<Comment> getCommentList(Comment input) throws Exception {
		List<Comment> result = null;

		try {
			result = sqlSession.selectList("CommentMapper.selectList", input);

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
	 * 댓글 데이터가 저장되어 있는 갯수 조회
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int getCommentCount(Comment input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("CommentMapper.selectCountAll", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	/**
	 * 댓글 데이터 등록하기
	 * @param Comment 저장할 정보를 담고 있는 Beans
	 * @throws Exception
	 */
	@Override
	public int addComment(Comment input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.insert("CommentMapper.insertItem", input);

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
	 * 댓글 데이터 수정하기
	 * @param Comment 수정할 정보를 담고 있는 Beans
	 * @throws Exception
	 */
	@Override
	public int editComment(Comment input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("CommentMapper.updateItem", input);

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
	 * 댓글 데이터 삭제하기
	 * @param Comment 삭제할 댓글의 일련번호를 담고 있는 Beans
	 * @throws Exception
	 */
	@Override
	public int deleteComment(Comment input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.delete("CommentMapper.deleteItem", input);

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
