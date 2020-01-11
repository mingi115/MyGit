package fdp.project.spring.service;

import fdp.project.spring.model.HosItem;
import fdp.project.spring.model.HosItemUno;
import fdp.project.spring.model.MyErList;
import fdp.project.spring.model.MyErListUno;
import retrofit2.Call;
import retrofit2.http.GET;
import retrofit2.http.Query;

public interface ErService {
public static final String BASE_URL ="http://apis.data.go.kr";
	
	@GET("/B552657/ErmctInfoInqireService/getEgytListInfoInqire?_type=json&Q0=서울특별시&ServiceKey=yt%2Fieh%2Fbe%2Fjap6NlGQZMqUd%2Bu0hfmIjkuSp4ROnxTK9TgWw5rx%2F2uNEI7TvW%2BGOGQUsN%2BXNsVSmNBz0xmICjOA%3D%3D&")
	Call<MyErList> getMyErList(@Query("Q1") String mygu);
	
	@GET("/B552657/ErmctInfoInqireService/getEgytListInfoInqire?_type=json&Q0=서울특별시&ServiceKey=yt%2Fieh%2Fbe%2Fjap6NlGQZMqUd%2Bu0hfmIjkuSp4ROnxTK9TgWw5rx%2F2uNEI7TvW%2BGOGQUsN%2BXNsVSmNBz0xmICjOA%3D%3D&")
	Call<MyErListUno> getMyErListUno(@Query("Q1") String mygu);
	
	@GET("/B551182/hospInfoService/getHospBasisList?ServiceKey=yt%2Fieh%2Fbe%2Fjap6NlGQZMqUd%2Bu0hfmIjkuSp4ROnxTK9TgWw5rx%2F2uNEI7TvW%2BGOGQUsN%2BXNsVSmNBz0xmICjOA%3D%3D&_type=json&sidoCd=110000&numOfRows=100")
	Call<HosItem> getHospi(@Query("dgsbjtCd") String dgsbjtCd, @Query("sgguCd") String sgguCd,  @Query("emdongNm") String emdongNm);
	
	@GET("/B551182/hospInfoService/getHospBasisList?ServiceKey=yt%2Fieh%2Fbe%2Fjap6NlGQZMqUd%2Bu0hfmIjkuSp4ROnxTK9TgWw5rx%2F2uNEI7TvW%2BGOGQUsN%2BXNsVSmNBz0xmICjOA%3D%3D&_type=json&sidoCd=110000&numOfRows=100")
	Call<HosItemUno> getHospiUno(@Query("dgsbjtCd") String dgsbjtCd, @Query("sgguCd") String sgguCd,  @Query("emdongNm") String emdongNm);
}
