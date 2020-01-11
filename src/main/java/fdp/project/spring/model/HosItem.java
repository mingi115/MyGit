package fdp.project.spring.model;

import java.util.List;

import com.google.gson.annotations.SerializedName;

import lombok.Data;
@Data
public class HosItem {
	@SerializedName("response") public Response response;
	
	@Data
	public class Response{
		@SerializedName("body") public Body body;
		
		@Data
		public class Body{
			@SerializedName("items") public Items items;
			
			@Data
			public class Items{
				@SerializedName("item") public List<Item> item;
				
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
