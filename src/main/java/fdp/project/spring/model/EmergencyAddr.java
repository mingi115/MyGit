package fdp.project.spring.model;

import java.util.List;

import com.google.gson.annotations.SerializedName;

import lombok.Data;

@Data
public class EmergencyAddr {
	@SerializedName("response")
	private Response response;

	@Data
	public class Response {
		@SerializedName("body")
		private Body body;

		@Data
		public class Body {
			@SerializedName("items")
			private Items items;

			@Data
			public class Items {
				@SerializedName("item")
				private List<Itema> item;

				@Data
				public class Itema {
					@SerializedName("dutyAddr")			private String dutyAddr; 		// 주소
					@SerializedName("dutyEmcls")		private String dutyEmcls;		// 응급의료기관분류
					@SerializedName("dutyEmclsName")	private String dutyEmclsName; 	// 응급의료기관분류명
					@SerializedName("dutyName")			private String dutyName;		// 기관명
					@SerializedName("dutyTel1")			private String dutyTel1;		// 대표전화1
					@SerializedName("dutyTel3")			private String dutyTel3;		// 응급실전화
					@SerializedName("hpid")				private String hpid;			// 기관ID
					@SerializedName("phpid")			private String phpid;			// 기관ID(OLD)
					@SerializedName("rnum")				private int rnum;			// 일련번호
					@SerializedName("wgs84Lat")			private double wgs84Lat;	// 병원위도
					@SerializedName("wgs84Lon")			private double wgs84Lon;	// 병원경도
				}
			}
		}
	}
}