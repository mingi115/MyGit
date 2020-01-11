package fdp.project.spring.model;

import lombok.Data;

@Data
public class EmRoom {
	public int er_id;
	public String dutyName; 	// 병원명
	public String tel;			// 병원 전화번호
	public int hv1; 			// 응급실 당직의 직통 연락처
	public int hv2;			// 내과 중환자실
	public String hv3;			// 외과 중환자실
	public int hv4;			// 외과 입원실
	public String hv5;			// 신경 외과입원실
	public int hv6;			// 신경외과 중환자실
	public String hv7;
	public String hv8;
	public String hv9;
	public String hv10;
	public String hv11;		// 인큐베이터 유무
	public String hv12;		// 소아당직의 직통번호
	public String hvec;		// 응급실
	public String hvcc;		// 신경 중환자
	public String hvccc;		// 흉부 중환자
	public String hvncc;		// 신생 중환자
	public String hvicc;		// 일반 중환자
	public String hpid;
	
	public String addr;
	public String inserttime;
	
	
	
	public EmRoom(String dutyName, String tel, int hv1, int hv2, String hv3, int hv4, String hv5, int hv6, String hv7,
			String hv8, String hv9, String hv10, String hv11, String hv12, String hvec, String hvcc, String hvccc,
			String hvncc, String hvicc, String hpid) {
		super();
		this.dutyName = dutyName;
		this.tel = tel;
		this.hv1 = hv1;
		this.hv2 = hv2;
		this.hv3 = hv3;
		this.hv4 = hv4;
		this.hv5 = hv5;
		this.hv6 = hv6;
		this.hv7 = hv7;
		this.hv8 = hv8;
		this.hv9 = hv9;
		this.hv10 = hv10;
		this.hv11 = hv11;
		this.hv12 = hv12;
		this.hvec = hvec;
		this.hvcc = hvcc;
		this.hvccc = hvccc;
		this.hvncc = hvncc;
		this.hvicc = hvicc;
		this.hpid = hpid;
	}



	public EmRoom(String dutyName, String tel, int hv1, int hv2, String hv3, int hv4, String hv5, int hv6, String hv7,
			String hv8, String hv9, String hv10, String hv11, String hv12, String hvec, String hvcc, String hvccc,
			String hvncc, String hvicc, String hpid, String addr) {
		super();
		this.dutyName = dutyName;
		this.tel = tel;
		this.hv1 = hv1;
		this.hv2 = hv2;
		this.hv3 = hv3;
		this.hv4 = hv4;
		this.hv5 = hv5;
		this.hv6 = hv6;
		this.hv7 = hv7;
		this.hv8 = hv8;
		this.hv9 = hv9;
		this.hv10 = hv10;
		this.hv11 = hv11;
		this.hv12 = hv12;
		this.hvec = hvec;
		this.hvcc = hvcc;
		this.hvccc = hvccc;
		this.hvncc = hvncc;
		this.hvicc = hvicc;
		this.hpid = hpid;
		this.addr = addr;
	}



	public EmRoom() {
		super();
	}	
	
	
}
