package fdp.project.spring.model;

import java.util.List;

import com.google.gson.annotations.SerializedName;

import lombok.Data;
@Data
public class Addr {
	@SerializedName("documents")    private List<Documents> documents;

    @Data
    public static class Documents {
        @SerializedName("x")      private double x;
        @SerializedName("y")     private double y;
		public Documents(double x, double y) {
			super();
			this.x = x;
			this.y = y;
		}
        
        
    }
}
