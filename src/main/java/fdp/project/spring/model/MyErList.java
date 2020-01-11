package fdp.project.spring.model;

import java.util.List;

import com.google.gson.annotations.SerializedName;

import lombok.Data;
@Data
public class MyErList {
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
					@SerializedName("dutyAddr") private String dutyAddr;
					@SerializedName("dutyName") private String dutyName;
					@SerializedName("dutyTel1") private String dutyTel;
					@SerializedName("wgs84Lat") private Double wgs84Lat;
					@SerializedName("wgs84Lon") private Double wgs84Lon;	
				}
			}
		}
	}
	
	
	
	
	
}
