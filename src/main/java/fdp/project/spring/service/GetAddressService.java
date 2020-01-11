package fdp.project.spring.service;

import fdp.project.spring.model.Addr;
import retrofit2.Call;
import retrofit2.http.Headers;
import retrofit2.http.POST;
import retrofit2.http.Query;

public interface GetAddressService {
	public static final String BASE_URL = "https://dapi.kakao.com";

    @Headers("Authorization: KakaoAK e8d7dcb6be011fe56f1bb483d527a326")
    @POST("/v2/local/search/address.json")
    Call<Addr> getAddress(@Query("query") String query);
}
