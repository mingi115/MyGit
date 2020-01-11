package fdp.project.spring.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import fdp.project.spring.helper.RegexHelper;
import fdp.project.spring.helper.RetrofitHelper;
import fdp.project.spring.helper.WebHelper;
import fdp.project.spring.model.DiseaseRegion;
import fdp.project.spring.model.Disease_age_gender;
import fdp.project.spring.model.EmAddr;
import fdp.project.spring.model.EmRoom;
import fdp.project.spring.model.Em_Hospital;
import fdp.project.spring.model.Em_Hospital.Response.Body.Items.Item;
import fdp.project.spring.model.EmergencyAddr;
import fdp.project.spring.model.EmergencyAddr.Response.Body.Items.Itema;
//import fdp.project.spring.model.EmergencyAddr;
import fdp.project.spring.service.ApiHospitalService;
import fdp.project.spring.service.DiseaseRegionService;
import fdp.project.spring.service.DiseaseService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import retrofit2.Call;
import retrofit2.Retrofit;

/**
 * Handles requests for the application home page.
 */
@Controller
public class Controller_S {

    // --> import study.spring.springhelper.helper.WebHelper;
    @Autowired
    WebHelper webHelper;

    // --> import study.spring.springhelper.helper.RegexHelper;
    @Autowired
    RegexHelper regexHelper;

    @Autowired
    DiseaseService diseaseService;
    // --> import study.spring.springhelper.helper.RetrofitHelper;

    @Autowired
    DiseaseRegionService diseaseRegionService;

    /** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
    // --> import org.springframework.beans.factory.annotation.Value;
    @Value("#{servletContext.contextPath}")
    String contextPath;

    /**
     * Simply selects the home view to render by returning its name.
     */
    @RequestMapping(value = "/17_Navigator.do", method = RequestMethod.GET)
    public String Navigator() {

        return "17_Navigator";
    }

    @RequestMapping(value = "/18_Intention.do", method = RequestMethod.GET)
    public String Intention() {

        return "18_Intention";
    }

    @RequestMapping(value = "/19_Team_introduction.do", method = RequestMethod.GET)
    public String Team_introduction() {

        return "19_Team_introduction";
    }

    @RequestMapping(value = "/20_Strong_point.do", method = RequestMethod.GET)
    public String Strong_point() {

        return "20_Strong_point";
    }

    @Autowired
    RetrofitHelper retrofitHelper;

    @RequestMapping(value = "/30_Monitoring.do", method = RequestMethod.GET)
    public String Monitoring(Model model, HttpServletRequest request) {

        /** 1) 필요한 객체 생성 부분 */
        // Retrofit 객체 생성
        // -> import retrofit2.Retrofit;
        // -> import study.jsp.model1.service.ApiKobisService;
        Retrofit retrofit = retrofitHelper.getRetrofit(ApiHospitalService.BASE_URL);

        // Service 객체를 생성한다. 구현체는 Retrofit이 자동으로 생성해 준다.
        ApiHospitalService apiHospitalService = retrofit.create(ApiHospitalService.class);

        /** 2) 검색일 파라미터 처리 */
        // 검색어 키워드 받기
        String query = request.getParameter("query");

        // 검색어가 없다면 Caledar 클래스를 사용하여 하루 전 날짜 값을 yyyy-mm-dd 형식으로 생성한다.
        if (query == null) {
            query = "서울특별시";
        }

        /** 3) API 연동 */
        /*
         * List<fdp.project.spring.model.Em_Hospital.Response.Body.Items.Item> item =
         * hospital.getResponse().getBody().getItems().getItem();
         * List<fdp.project.spring.model.EmergencyAddr.Response.Body.Items.Item> item1 =
         * emergencyAddr.getResponse().getBody().getItems().getItem();
         */

        List<Item> list = null;
        List<Itema> list1 = null;
        Em_Hospital hospital = null;
        EmergencyAddr address = null;
        // 검색어가 존재할 경우 KakaoOpenAPI를 통해 검색 결과 받아옴.
        if (query.equals("서울특별시")) {
            Call<Em_Hospital> call = apiHospitalService.getHospital("서울특별시", 1, 49);
            Call<EmergencyAddr> call1 = apiHospitalService.getEmergencyAddr("서울특별시", 1, 49);
            try {
                hospital = call.execute().body();
                address = call1.execute().body();
            } catch (Exception e) {
                e.printStackTrace();
            }

            list = hospital.getResponse().getBody().getItems().getItem();

            List<EmRoom> output = new ArrayList<EmRoom>();
            for (Item abc : list) {
                String dutyName = abc.getDutyName();
                String tel = abc.getTel();
                int hv1 = abc.getHv1();
                int hv2 = abc.getHv2();
                String hv3 = abc.getHv3();
                int hv4 = abc.getHv4();
                String hv5 = abc.getHv5();
                int hv6 = abc.getHv6();
                String hv7 = abc.getHv7();
                String hv8 = abc.getHv8();
                String hv9 = abc.getHv9();
                String hv10 = abc.getHv10();
                String hv11 = abc.getHv11();
                String hv12 = abc.getHv12();
                String hvec = abc.getHvec();
                String hvcc = abc.getHvcc();
                String hvccc = abc.getHvccc();
                String hvncc = abc.getHvncc();
                String hvicc = abc.getHvicc();
                String hpid = abc.getHpid();

                output.add(new EmRoom(dutyName, tel, hv1, hv2, hv3, hv4, hv5, hv6, hv7, hv8, hv9, hv10, hv11, hv12, hvec, hvcc, hvccc, hvncc, hvicc, hpid));

            }
            list1 = address.getResponse().getBody().getItems().getItem();

            List<EmAddr> output1 = new ArrayList<EmAddr>();
            for (Itema def : list1) {
                String dutyAddr = def.getDutyAddr();
                String dutyEmcls = def.getDutyEmcls();
                String dutyName = def.getDutyName();
                String dutyTel1 = def.getDutyTel1();
                String dutyTel3 = def.getDutyTel3();
                String hpid = def.getHpid();
                String phpid = def.getPhpid();
                int rnum = def.getRnum();
                double wgs84Lat = def.getWgs84Lat();
                double wgs84Lon = def.getWgs84Lon();
                output1.add(new EmAddr(dutyAddr, dutyEmcls, dutyName, dutyTel1, dutyTel3, hpid, phpid, phpid, rnum, wgs84Lat, wgs84Lon));

            }
            /** 4) View 처리 */
            model.addAttribute("output", output);
            model.addAttribute("output1", output1);

            /*
             * model.addAttribute("item", item); model.addAttribute("item1", item1);
             */
        }

        return "30_Monitoring";
    }

    @RequestMapping(value = "gogo.do")
    public String statistics() {
        return "gogo";
    }

    @RequestMapping(value = "/assets/api/chart5.do", method = RequestMethod.GET)
    public ModelAndView chart5(Model model, HttpServletRequest request) {
        List<Disease_age_gender> output = null;
        List<Disease_age_gender> output1 = null;
        List<Disease_age_gender> output2 = null;
        List<DiseaseRegion> output3 = null;

        // 질병이름별
        String year = request.getParameter("selectedValue");
        String disName = webHelper.getString("disName");

        Disease_age_gender input = new Disease_age_gender();
        DiseaseRegion input3 = new DiseaseRegion();

        input.setDis_name(disName);
        input3.setDisName(disName);

        // 년도별
        input.setDis_year(year);
        input3.setDisYear(year);

        try {
            // 데이터 조회하기
            output = diseaseService.getDisease_age_genderYear(input);
            output1 = diseaseService.getDisease_age_genderGender(input);
            output2 = diseaseService.getDisease_age_genderAge(input);
            output3 = diseaseRegionService.getDisByRegion(input3);

        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }

        System.out.println("***********************************" + output);

        /** 5) View 처리 */
        // View에게 변수를 전달하기 위한 값들을 Model 객체에 담는다.
        Gson gson = new Gson();

        JSONObject json = new JSONObject();
        json.put("output", output);
        json.put("output1", output1);
        json.put("output2", output2);
        json.put("output3", output3);

        model.addAttribute("jsonObj", gson.toJson(json));

        model.addAttribute("jsonList", JSONArray.fromObject(output));
        model.addAttribute("jsonList1", JSONArray.fromObject(output1));
        model.addAttribute("jsonList2", JSONArray.fromObject(output2));
        model.addAttribute("jsonList3", JSONArray.fromObject(output3));
        model.addAttribute("output", output);

        return new ModelAndView("assets/api/chart5");
    }

    @RequestMapping(value = "/assets/api/chart6.do")
    public ModelAndView chart6(Model model) {
        List<Disease_age_gender> output = null;
        // AppInterceptor.preHandle.String.format();

        String dname = webHelper.getString("disName");
        Disease_age_gender input = new Disease_age_gender();
        input.setDis_name(dname);

        try {

            // 데이터 조회하기
            output = diseaseService.getDisease_age_genderAge(input);
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }

        /** 5) View 처리 */
        // View에게 변수를 전달하기 위한 값들을 Model 객체에 담는다.
        model.addAttribute("output", output);
        model.addAttribute("jsonList", JSONArray.fromObject(output));

        return new ModelAndView("assets/api/chart6");
    }

    @RequestMapping(value = "/assets/api/chart7.do")
    public ModelAndView chart7(Model model) {
        List<Disease_age_gender> output = null;

        String dname = webHelper.getString("disName");
        Disease_age_gender input = new Disease_age_gender();
        input.setDis_name(dname);

        try {
            // 데이터 조회하기
            output = diseaseService.getDisease_age_genderYear(input);
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }

        int size = output.size();
        String[] dis_month = new String[size];
        String[] dis_name = new String[size];
        String[] dis_age = new String[size];
        String[] dis_gender = new String[size];
        String[] dis_cost = new String[size];
        String[] dis_num_patient = new String[size];

        for (int i = 0; i < size; i++) {
            Disease_age_gender item = output.get(i);
            dis_month[i] = String.valueOf(item.getDis_month());
            dis_name[i] = String.valueOf(item.getDis_name());
            dis_age[i] = String.valueOf(item.getDis_age());
            dis_gender[i] = String.valueOf(item.getDis_gender());
            dis_cost[i] = String.valueOf(item.getDis_cost());
            dis_num_patient[i] = String.valueOf(item.getDis_num_patient());
        }

        Gson gson = new Gson();

        /** 5) View 처리 */
        // View에게 변수를 전달하기 위한 값들을 Model 객체에 담는다.
        model.addAttribute("size", size);
        model.addAttribute("dis_month", dis_month);
        model.addAttribute("dis_num_patient", dis_num_patient);
        model.addAttribute("output", output);
        model.addAttribute("jsonList", JSONArray.fromObject(output));
        model.addAttribute("gson", gson.toJson(output));

        return new ModelAndView("assets/api/chart7");

    }

    @RequestMapping(value = "/assets/api/chart8.do")
    public ModelAndView chart8(Model model) {
        List<Disease_age_gender> output = null;
        // AppInterceptor.preHandle.String.format();

        String dname = webHelper.getString("dis_name");
        Disease_age_gender input = new Disease_age_gender();
        input.setDis_name(dname);

        try {

            // 데이터 조회하기
            output = diseaseService.getDisease_age_genderHit(input);
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }

        /** 5) View 처리 */
        // View에게 변수를 전달하기 위한 값들을 Model 객체에 담는다.
        model.addAttribute("output", output);
        model.addAttribute("jsonList", JSONArray.fromObject(output));

        return new ModelAndView("assets/api/chart8");
    }

}
