package fdp.project.spring.service;


import retrofit2.Call;
import retrofit2.http.GET;

import retrofit2.http.Query;
import fdp.project.spring.model.EmergencyAddr;
import fdp.project.spring.model.Em_Hospital;

public interface ApiHospitalService {
	public static final String BASE_URL="http://apis.data.go.kr";
	
    /*
     * curl -v -X GET
     * "https://dapi.kakao.com/v3/search/book?query=책제목&page=1&size=50" \
     * --data-urlencode "query=미움받을 용기" \ -H
     * "Authorization: KakaoAK 4c91f33724a323e04664b6ccc4a5b0b7"
     */
    @GET("/B552657/ErmctInfoInqireService/getEmrrmRltmUsefulSckbdInfoInqire?ServiceKey=O8gvumE%2FwKA8ZHjxTpD336sl4GhoffDlYlPPtN2jQOdelGf60J1urLLAJm0Vcj3lEypo%2B4tm36OePX8%2Bcf%2FI0g%3D%3D&_type=json")
    Call<Em_Hospital> getHospital(@Query("STAGE1") String stage, @Query("pageNo") int page, @Query("numOfRows") int row);
    
    @GET("/B552657/ErmctInfoInqireService/getEgytListInfoInqire?ServiceKey=6uch9Il5RNbCxMbov%2BBH%2FQej6hm4KxgsbZ3tizOMq5omTbpKzWArZGTdnAtw%2FJ019Bowf7qakavrs%2Frn8k%2Ft%2Fg%3D%3D&_type=json")
    Call<EmergencyAddr> getEmergencyAddr(@Query("Q0") String stage, @Query("pageNo") int page, @Query("numOfRows") int row);
}
