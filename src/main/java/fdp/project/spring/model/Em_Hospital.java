package fdp.project.spring.model;

import java.util.List;

import com.google.gson.annotations.SerializedName;

import lombok.Data;

@Data
public class Em_Hospital {
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
				private List<Item> item;

				@Data
				public class Item {
					@SerializedName("dutyName")	public String dutyName; 	// 병원명
					@SerializedName("dutyTel3")	public String tel;			// 병원 전화번호
					@SerializedName("hv1")		public int hv1; 			// 응급실 당직의 직통 연락처
					@SerializedName("hv2")		public int hv2;				// 내과 중환자실
					@SerializedName("hv3")		public String hv3;			// 외과 중환자실
					@SerializedName("hv4")		public int hv4;				// 외과 입원실
					@SerializedName("hv5")		public String hv5;			// 신경 외과입원실
					@SerializedName("hv6")		public int hv6;				// 신경외과 중환자실
					@SerializedName("hv7")		public String hv7;
					@SerializedName("hv8")		public String hv8;
					@SerializedName("hv9")		public String hv9;
					@SerializedName("hv10")		public String hv10;
					@SerializedName("hv11")		public String hv11;		// 인큐베이터 유무
					@SerializedName("hv12")		public String hv12;		// 소아당직의 직통번호
					@SerializedName("hvec")		public String hvec;		// 응급실
					@SerializedName("hvcc")		public String hvcc;		// 신경 중환자
					@SerializedName("hvccc")	public String hvccc;	// 흉부 중환자
					@SerializedName("hvncc")	public String hvncc;	// 신생 중환자
					@SerializedName("hvicc")	public String hvicc;	// 일반 중환자
					@SerializedName("hpid")		public String hpid;		// 기관코드(기관ID)
					
					public String addr;
					public String inserttime;
				}
			}
		}
		
	}
}