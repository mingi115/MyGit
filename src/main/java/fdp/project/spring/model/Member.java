package fdp.project.spring.model;

import lombok.Data;

@Data
public class Member {
	private int fdpmember_id;
	private String name;
	private String user_id;
	private String user_pw;
	private String email;
	private int gender;
	private String birthdate;
	private String tel;
	private String addr1;
	private String addr2;
	private String addr3;
	private String addr4;
	private String reg_date;
	private String edit_date;
	private String medical_field;
	private String member_grade;
	
	// group by
	private String addrcount;
	
	/** ----- 페이지 구현이 필요한 경우 아래 속성들을 추가한다. (static) ----- */
	private static int offset;		// LIMIT 절에서 사용할 검색 시작 위치
	private static int listCount;	// LIMIT 절에서 사용할 검색할 데이터 수
	
	public static int getOffset() {
		return offset;
	}
	
	public static void setOffset(int offset) {
		Member.offset = offset;
	}
	
	public static int getListCount() {
		return listCount;
	}
	
	public static void setListCount(int listCount) {
		Member.listCount = listCount;
	}
}
