package fdp.project.spring.model;

import lombok.Data;

@Data
public class HospInfo {
	int hosp_id;
	String yadmNm;	//병원이름
	double XPos;	//X좌표
	double YPos;	//y좌표
	String addr;	//주ㅗ
	String clCdNm;	//병원규모
	String hospUrl;	// 병원URL
	String telno;	// 전화번호
	String subj;	// 진료 과목 코드
	
	String opentime;
	String closetime;
	int day_of_week;
	
	

	public HospInfo() {
		super();
	}



	public HospInfo(String yadmNm, double xPos, double yPos, String addr, String clCdNm, String hospUrl, String telno,
			String subj) {
		super();
		this.yadmNm = yadmNm;
		XPos = xPos;
		YPos = yPos;
		this.addr = addr;
		this.clCdNm = clCdNm;
		this.hospUrl = hospUrl;
		this.telno = telno;
		this.subj = subj;
	}
	
	
}
