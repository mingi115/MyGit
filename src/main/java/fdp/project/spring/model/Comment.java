package fdp.project.spring.model;

import lombok.Data;

@Data
public class Comment {

	/** 댓글 번호(PK) */
	private int comment_id;
	/** 작성자 이름 */
	private String writer_name;
	/** 댓글 내용 */
	private String content;
	/** 댓글 등록 시간 */
	private String reg_date;
	/** 댓글 수정 시간 */
	private String edit_date;
	/** 게시글 번호 */
	private int document_id;
	/** 회원 번호 */
	private int fdpmember_id;
	
	/** ----- 페이지 구현이 필요한 경우 아래 속성들을 추가한다. (static) ----- */
	private static int offset;		// LIMIT 절에서 사용할 검색 시작 위치
	private static int listCount;	// LIMIT 절에서 사용할 검색할 데이터 수
	
	public static int getOffset() {
		return offset;
	}
	
	public static void setOffset(int offset) {
		Comment.offset = offset;
	}
	
	public static int getListCount() {
		return listCount;
	}
	
	public static void setListCount(int listCount) {
		Comment.listCount = listCount;
	}

}
