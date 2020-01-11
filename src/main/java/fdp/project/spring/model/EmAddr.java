package fdp.project.spring.model;

import lombok.Data;

@Data
public class EmAddr {
	public String dutyAddr; 		// 주소
	public String dutyEmcls;		// 응급의료기관분류
	public String dutyEmclsName; 		// 응급의료기관분류명
	public String dutyName;			// 기관명
	public String dutyTel1;		// 대표전화1
	public String dutyTel3;			// 응급실전화
	public String hpid;			// 기관ID
	public String phpid;				// 기관ID(OLD)
	public int rnum;			// 일련번호
	public double wgs84Lat;		// 병원위도
	public double wgs84Lon;		// 병원경도
	
	public EmAddr(String dutyAddr, String dutyEmcls, String dutyEmclsName, String dutyName, String dutyTel1,
			String dutyTel3, String hpid, String phpid, int rnum, double wgs84Lat, double wgs84Lon) {
		super();
		this.dutyAddr = dutyAddr;
		this.dutyEmcls = dutyEmcls;
		this.dutyEmclsName = dutyEmclsName;
		this.dutyName = dutyName;
		this.dutyTel1 = dutyTel1;
		this.dutyTel3 = dutyTel3;
		this.hpid = hpid;
		this.phpid = phpid;
		this.rnum = rnum;
		this.wgs84Lat = wgs84Lat;
		this.wgs84Lon = wgs84Lon;
	}
	
	
	
}
