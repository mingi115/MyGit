package fdp.project.spring.model;


import com.google.gson.annotations.SerializedName;

import lombok.Data;
@Data
public class HosItemUno {
	@SerializedName("response") public Response response;
	
	@Data
	public class Response{
		@SerializedName("body") public Body body;
		
		@Data
		public class Body{
			@SerializedName("items") public Items items;
			
			@Data
			public class Items{
				@SerializedName("item") public Item itema;
				
				@Data
				public class Item{
					@SerializedName("clCdNm") private String clCdNm;
					@SerializedName("yadmNm") private String yadmNm;
					@SerializedName("addr") private String addr;
					@SerializedName("telno") private String telno;
					@SerializedName("hospUrl") private String hospUrl;
					@SerializedName("XPos") private Double XPos;
					@SerializedName("YPos") private Double YPos;	
				}
			}
		}
	}
}
