package fdp.project.spring.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import fdp.project.spring.helper.RetrofitHelper;
import fdp.project.spring.model.EmRoom;
import fdp.project.spring.model.Em_Hospital;
import fdp.project.spring.model.EmergencyAddr;
import fdp.project.spring.model.Em_Hospital.Response.Body.Items.Item;
import fdp.project.spring.model.EmergencyAddr.Response.Body.Items.Itema;
import fdp.project.spring.service.ApiHospitalService;
import fdp.project.spring.service.ErInfoService;
import retrofit2.Call;
import retrofit2.Retrofit;

@Controller
public class ErScheduler {
    @Autowired
    ErInfoService erInfoService;
    @Autowired
    RetrofitHelper retrofitHelper;

    public void ErMonitoring() {

        /** 1) 필요한 객체 생성 부분 */
        // Retrofit 객체 생성
        // -> import retrofit2.Retrofit;
        // -> import study.jsp.model1.service.ApiKobisService;
        Retrofit retrofit = retrofitHelper.getRetrofit(ApiHospitalService.BASE_URL);

        // Service 객체를 생성한다. 구현체는 Retrofit이 자동으로 생성해 준다.
        ApiHospitalService apiHospitalService = retrofit.create(ApiHospitalService.class);

        /** 3) API 연동 */
        List<Item> list = null;
        List<Itema> list1 = null;
        Em_Hospital hospital = null;
        EmergencyAddr address = null;
        // 검색어가 존재할 경우 KakaoOpenAPI를 통해 검색 결과 받아옴.
        Call<Em_Hospital> call = apiHospitalService.getHospital("서울특별시", 1, 49);
        Call<EmergencyAddr> call1 = apiHospitalService.getEmergencyAddr("서울특별시", 1, 49);
        try {
            hospital = call.execute().body();
            address = call1.execute().body();
        } catch (Exception e) {
            e.printStackTrace();
        }

        list = hospital.getResponse().getBody().getItems().getItem();
        list1 = address.getResponse().getBody().getItems().getItem();

        List<EmRoom> emRoom = new ArrayList<EmRoom>();
        for (Item abc : list) {
            for (Itema def : list1) {
                if (abc.getDutyName().equals(def.getDutyName())) {
                    abc.setAddr(def.getDutyAddr());

                    emRoom.add(new EmRoom(abc.getDutyName(), abc.getTel(), abc.getHv1(), abc.getHv2(), abc.getHv3(), abc.getHv4(), abc.getHv5(), abc.getHv6(), abc.getHv7(), abc.getHv8(), abc.getHv9(), abc.getHv10(), abc.getHv11(),
                            abc.getHv12(), abc.getHvec(), abc.getHvcc(), abc.getHvccc(), abc.getHvncc(), abc.getHvicc(), abc.getHpid(), def.getDutyAddr()));
                }
            }
        }

        try {
            erInfoService.setErInfoList(emRoom);
        } catch (Exception e) {
            e.printStackTrace();
        }

        try {
            erInfoService.byeErInfoList();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
