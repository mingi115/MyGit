package fdp.project.spring.model;

import lombok.Data;

@Data
public class ErItem {
	private String dutyAddr = null;
	private String dutyName = null;
	private String dutyTel = null;
	private Double wgs84Lat = null;
	private Double wgs84Lon = null;
	public ErItem(String dutyAddr, String dutyName, String dutyTel, Double wgs84Lat, Double wgs84Lon) {
		super();
		this.dutyAddr = dutyAddr;
		this.dutyName = dutyName;
		this.dutyTel = dutyTel;
		this.wgs84Lat = wgs84Lat;
		this.wgs84Lon = wgs84Lon;
	}
	
	
}
