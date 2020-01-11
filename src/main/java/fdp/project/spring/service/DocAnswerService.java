package fdp.project.spring.service;

import java.util.List;

import fdp.project.spring.model.DocAnswer;

/** 답글 데이터 관리 기능을 제공하기 위한 Service 계층 */
public interface DocAnswerService {

	/**
	 * 데이터 상세 조회
	 * @param DocAnswer 조회할 답글의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public DocAnswer getDocAnswerItem(DocAnswer input) throws Exception;

	/**
	 * 답글 데이터 목록 조회
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<DocAnswer> getDocAnswerList(DocAnswer input) throws Exception;

	/**
	 * 답글 데이터가 저장되어 있는 갯수 조회
	 * @return int
	 * @throws Exception
	 */
	public int getDocAnswerCount(DocAnswer input) throws Exception;

	/**
	 * 답글 데이터 등록하기
	 * @param DocAnswer 저장할 정보를 담고 있는 Beans
	 * @throws Exception
	 */
	public int addDocAnswer(DocAnswer input) throws Exception;

	/**
	 * 답글 데이터 수정하기
	 * @param DocAnswer 수정할 정보를 담고 있는 Beans
	 * @throws Exception
	 */
	public int editDocAnswer(DocAnswer input) throws Exception;

	/**
	 * 답글 데이터 삭제하기
	 * @param DocAnswer 삭제할 답글의 일련번호를 담고 있는 Beans
	 * @throws Exception
	 */
	public int deleteDocAnswer(DocAnswer input) throws Exception;
}
