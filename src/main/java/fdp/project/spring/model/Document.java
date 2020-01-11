package fdp.project.spring.model;

import lombok.Data;

/** 테이블 구조에 맞춘 Java Beans 생성 */
@Data
public class Document {
	// 1) 기본 컬럼
	private int document_id;
	private String writer_name;
	private String subject;
	private String content;
	private int hit;
	private String reg_date;
	private String edit_date;
	private int docA_ok;
	// 2) Join절에 따른 추가 컬럼
	private int fdpmember_id;
	
	// 페이지 구현이 필요한 경우 아래 속성도 추가한다.
    private static int offset;
    private static int listCount;

    public static int getOffset() {
        return offset;
    }

    public static void setOffset(int offset) {
        Document.offset = offset;
    }

    public static int getListCount() {
        return listCount;
    }

    public static void setListCount(int listCount) {
        Document.listCount = listCount;
    }
}