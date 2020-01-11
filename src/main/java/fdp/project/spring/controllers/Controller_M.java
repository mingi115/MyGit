package fdp.project.spring.controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import fdp.project.spring.helper.RetrofitHelper;
import fdp.project.spring.helper.WebHelper;
import fdp.project.spring.model.Addr;
import fdp.project.spring.model.ErItem;
import fdp.project.spring.model.HosItem;
import fdp.project.spring.model.HosItemUno;
import fdp.project.spring.model.HospInfo;
import fdp.project.spring.model.Member;
import fdp.project.spring.model.MyErList;
import fdp.project.spring.model.MyErList.Response.Body.Items.Item;
import fdp.project.spring.model.MyErListUno;
import fdp.project.spring.model.Addr.Documents;
import fdp.project.spring.model.EmRoom;
import fdp.project.spring.model.MyErListUno.Response.Body.Items.Itema;
import fdp.project.spring.service.ErInfoService;
import fdp.project.spring.service.ErService;
import fdp.project.spring.service.GetAddressService;
import fdp.project.spring.service.HospInfoService;
import fdp.project.spring.service.MemberService;
import retrofit2.Call;
import retrofit2.Retrofit;

@Controller
public class Controller_M {
    @Autowired
    WebHelper webHelper;
    @Autowired
    RetrofitHelper retrofitHelper;

    @RequestMapping(value = "02_Login.do", method = RequestMethod.GET)
    public String Login(Model model) {
        int dir = webHelper.getInt("document_id");
        String id = webHelper.getCookie("auto", "");

        model.addAttribute("document_id", dir);
        model.addAttribute("id", id);

        return "02_Login";
    }

    @RequestMapping(value = "monitor.do", method = RequestMethod.GET)
    public String monitor() {

        return "30_Monitoring";
    }

    @RequestMapping(value = "03_Find_h.do", method = RequestMethod.GET)
    public String Find_h(Model model) {
        String fdpCookie = (String) webHelper.getSession("fdpCookie", "");

        if (fdpCookie != "") {
            Member member = new Member();
            member.setUser_id(fdpCookie);

            try {
                member = memberService.getMemberItem(member);
                String dd = "";

                int kk = member.getAddr2().indexOf(" ");
                int bb = member.getAddr2().indexOf(" ", kk + 1);
                String gu = member.getAddr2().substring(kk + 1, bb);

                String dong = "";
                if (member.getAddr4() == null || member.getAddr4() == "") {
                    int cc = member.getAddr2().indexOf(" ", bb + 1);
                    dong = member.getAddr2().substring(bb + 1, cc);
                } else {
                    int ee = member.getAddr4().indexOf("(");
                    int ff = member.getAddr4().indexOf("동");

                    dong = member.getAddr4().substring(ee + 1, ff + 1);
                }

                if (dd.contains("본동")) {
                    dd = dd.replace("본동", "동");
                } else if (dd.contains("1동")) {
                    dd = dd.replace("1동", "동");
                } else if (dd.contains("2동")) {
                    dd = dd.replace("2동", "동");
                } else if (dd.contains("3동")) {
                    dd = dd.replace("3동", "동");
                } else if (dd.contains("4동")) {
                    dd = dd.replace("4동", "동");
                } else if (dd.contains("5동")) {
                    dd = dd.replace("5동", "동");
                } else if (dd.contains("6동")) {
                    dd = dd.replace("6동", "동");
                } else if (dd.contains("7동")) {
                    dd = dd.replace("7동", "동");
                } else if (dd.contains("8동")) {
                    dd = dd.replace("8동", "동");
                } else if (dd.contains("9동")) {
                    dd = dd.replace("9동", "동");
                } else if (dd.contains("10동")) {
                    dd = dd.replace("10동", "동");
                }

                model.addAttribute("gu", gu);
                model.addAttribute("dong", dong);
            } catch (Exception e) {
                e.printStackTrace();
                return "03_Find_h";
            }

        }

        return "03_Find_h";
    }

    @RequestMapping(value = "05_Find_e.do", method = RequestMethod.GET)
    public String Find_e(Model model) {

        String fdpCookie = (String) webHelper.getSession("fdpCookie", "");

        List<Documents> list = new ArrayList<Documents>();
        String gu = "";
        list.add(new Documents(0.0, 0.0));

        if (fdpCookie != "") {
            Member member = new Member();
            member.setUser_id(fdpCookie);
            String addr = "";

            try {
                member = memberService.getMemberItem(member);
                addr = member.getAddr2();
                int kk = member.getAddr2().indexOf(" ");
                int bb = member.getAddr2().indexOf(" ", kk + 1);
                gu = member.getAddr2().substring(kk + 1, bb);
            } catch (Exception e) {
                e.printStackTrace();
                return "index";
            }
            Addr output = null;
            Retrofit retrofit = retrofitHelper.getRetrofit(GetAddressService.BASE_URL);
            GetAddressService getAddr = retrofit.create(GetAddressService.class);

            Call<Addr> call = getAddr.getAddress(addr);

            try {
                output = call.execute().body();
            } catch (IOException e) {
                e.printStackTrace();
                return "index";
            }
            if (!output.getDocuments().isEmpty()) {
                list = output.getDocuments();
                System.out.println("output 비었음");
            }

            System.out.println("1111" + output.getDocuments());

        }
        model.addAttribute("list", list);
        model.addAttribute("gu", gu);

        return "05_Find_e";
    }

    @ResponseBody
    @RequestMapping(value = { "fer.do" }, method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
    public String fer() {

        /** 1) 필요한 객체 생성 부분 */

        String gu = webHelper.getString("data", "0");

        List<String> ergu = new ArrayList<String>();

        if (gu.equals("1")) {
            ergu.add("도봉구");
            ergu.add("성북구");
            ergu.add("노원구");
        } else if (gu.equals("2")) {
            ergu.add("동대문구");
            ergu.add("중랑구");
            ergu.add("성동구");
            ergu.add("노원구");
        } else if (gu.equals("3")) {
            ergu.add("강동구");
            ergu.add("송파구");
        } else if (gu.equals("4")) {
            ergu.add("서초구");
            ergu.add("강남구");
        } else if (gu.equals("5")) {
            ergu.add("동작구");
            ergu.add("관악구");
            ergu.add("금천구");
        } else if (gu.equals("6")) {
            ergu.add("양천구");
            ergu.add("영등포구");
            ergu.add("구로구");
        } else if (gu.equals("7")) {
            ergu.add("은평구");
            ergu.add("서대문구");
        } else {
            ergu.add("종로구");
            ergu.add("중구");
            ergu.add("용산구");
        }

        // Retrofit 객체 생성
        // -> import retrofit2.Retrofit;
        // -> import study.jsp.model1.service.ApiKobisService;
        Retrofit retrofit = retrofitHelper.getRetrofit(ErService.BASE_URL);

        // Service 객체를 생성한다. 구현체는 Retrofit이 자동으로 생성해 준다.
        ErService erService = retrofit.create(ErService.class);

        List<Item> list = null;
        List<ErItem> result = new ArrayList<ErItem>();
        for (int i = 0; i < ergu.size(); i++) {
            String mygu = ergu.get(i);

            Call<MyErList> call = erService.getMyErList(mygu);
            MyErList myErList = null;
            try {
                myErList = call.execute().body();
            } catch (Exception e) {
                System.out.println("배열의 형태가 아님");
            }

            if (myErList != null) {
                list = myErList.getResponse().getBody().getItems().getItem();

                for (Item abc : list) {
                    String dutyAddr = abc.getDutyAddr();
                    String dutyName = abc.getDutyName();
                    String dutyTel = abc.getDutyTel();
                    Double wgs84Lat = abc.getWgs84Lat();
                    Double wgs84Lon = abc.getWgs84Lon();

                    result.add(new ErItem(dutyAddr, dutyName, dutyTel, wgs84Lat, wgs84Lon));
                }

            } else {
                Call<MyErListUno> call1 = erService.getMyErListUno(mygu);
                MyErListUno myErListUno = null;
                try {
                    myErListUno = call1.execute().body();
                } catch (IOException e) {
                    e.printStackTrace();
                }
                Itema item = myErListUno.getResponse().getBody().getItems().getItema();

                String dutyAddr = item.getDutyAddr();
                String dutyName = item.getDutyName();
                String dutyTel = item.getDutyTel();
                Double wgs84Lat = item.getWgs84Lat();
                Double wgs84Lon = item.getWgs84Lon();

                result.add(new ErItem(dutyAddr, dutyName, dutyTel, wgs84Lat, wgs84Lon));

            }
        }
        Gson gson = new Gson();
        return gson.toJson(result);
    }

    @Autowired
    HospInfoService hospInfoService;

    @ResponseBody
    @RequestMapping(value = { "findh.do" }, method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
    public String findh() {
        String dgsbjtCd = webHelper.getString("subject");
        String sgguCd = webHelper.getString("data");
        String emdongNm = webHelper.getString("dong");

        int bbb = Integer.parseInt(sgguCd);
        String aaa = "";

        if (emdongNm.contains("본동")) {
            emdongNm = emdongNm.replace("본동", "동");
        } else if (emdongNm.contains("1동")) {
            emdongNm = emdongNm.replace("1동", "동");
        } else if (emdongNm.contains("2동")) {
            emdongNm = emdongNm.replace("2동", "동");
        } else if (emdongNm.contains("3동")) {
            emdongNm = emdongNm.replace("3동", "동");
        } else if (emdongNm.contains("4동")) {
            emdongNm = emdongNm.replace("4동", "동");
        } else if (emdongNm.contains("5동")) {
            emdongNm = emdongNm.replace("5동", "동");
        } else if (emdongNm.contains("6동")) {
            emdongNm = emdongNm.replace("6동", "동");
        } else if (emdongNm.contains("7동")) {
            emdongNm = emdongNm.replace("7동", "동");
        } else if (emdongNm.contains("8동")) {
            emdongNm = emdongNm.replace("8동", "동");
        } else if (emdongNm.contains("9동")) {
            emdongNm = emdongNm.replace("9동", "동");
        } else if (emdongNm.contains("10동")) {
            emdongNm = emdongNm.replace("10동", "동");
        }
        
        
        switch (bbb) {
        case 110001:
            aaa = "강남구";
            break;
        case 110002:
            aaa = "강동구";
            break;
        case 110003:
            aaa = "강서구";
            break;
        case 110004:
            aaa = "관악구";
            break;
        case 110005:
            aaa = "구로구";
            break;
        case 110006:
            aaa = "도봉구";
            break;
        case 110007:
            aaa = "동대문구";
            break;
        case 110008:
            aaa = "동작구";
            break;
        case 110009:
            aaa = "마포구";
            break;
        case 110010:
            aaa = "서대문구";
            break;
        case 110011:
            aaa = "성동구";
            break;
        case 110012:
            aaa = "성북구";
            break;
        case 110013:
            aaa = "영등포구";
            break;
        case 110014:
            aaa = "용산구";
            break;
        case 110015:
            aaa = "은평구";
            break;
        case 110016:
            aaa = "종로구";
            break;
        case 110017:
            aaa = "중구";
            break;
        case 110018:
            aaa = "송파구";
            break;
        case 110019:
            aaa = "중랑구";
            break;
        case 110020:
            aaa = "양천구";
            break;
        case 110021:
            aaa = "서초구";
            break;
        case 110022:
            aaa = "노원구";
            break;
        case 110023:
            aaa = "광진구";
            break;
        case 110024:
            aaa = "강북구";
            break;
        case 110025:
            aaa = "금천구";
            break;
        }

        HospInfo input = new HospInfo();
        Gson gson = new Gson();

        input.setOpentime(aaa);
        input.setAddr(emdongNm);
        input.setSubj(dgsbjtCd);

        List<HospInfo> output = null;

        try {
            output = hospInfoService.getHospInfoList(input);

            int i = 0;
            Calendar c = Calendar.getInstance();
            for (HospInfo cc : output) {
                cc.setDay_of_week(c.get(Calendar.DAY_OF_WEEK));
                cc.setOpentime(sgguCd);
                HospInfo dd = cc;
                try {

                    cc = hospInfoService.getHospInfo(cc);

                    dd.setOpentime(cc.getOpentime());
                    dd.setClosetime(cc.getClosetime());
                } catch (Exception e) {
                    if (c.get(Calendar.DAY_OF_WEEK) == 7) {
                        dd.setOpentime("0900");
                        dd.setClosetime("1230");
                    } else if (c.get(Calendar.DAY_OF_WEEK) == 1) {
                        dd.setOpentime("0000");
                        dd.setClosetime("0000");
                    } else {
                        dd.setOpentime("0900");
                        dd.setClosetime("1700");
                    }
                }

                if (!output.isEmpty()) {
                    output.set(i, dd);
                }

                i++;
            }

            if (!output.isEmpty()) {
                return gson.toJson(output);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (output == null || output.isEmpty()) {
            /** 1) 필요한 객체 생성 부분 */
            // Retrofit 객체 생성
            Retrofit retrofit = retrofitHelper.getRetrofit(ErService.BASE_URL);

            // Service 객체를 생성한다. 구현체는 Retrofit이 자동으로 생성해 준다.
            ErService ErService = retrofit.create(ErService.class);

            HosItem hos = null;
            List<fdp.project.spring.model.HosItem.Response.Body.Items.Item> list = null;
            Call<HosItem> call = ErService.getHospi(dgsbjtCd, sgguCd, emdongNm);
            try {
                hos = call.execute().body();
            } catch (Exception e) {
                System.out.println("배열이 아님");
            }

            if(hos  != null) {
            	
            	 list = hos.getResponse().getBody().getItems().getItem();
	            for (fdp.project.spring.model.HosItem.Response.Body.Items.Item abc : list) {
	                if (abc == null) {
	                    continue;
	                } else if(abc.getXPos()==null) {
	                	continue;
	                } else if(abc.getXPos()==null) {
	                	continue;
	                }
	                System.out.println(abc);
	                String yadmNm = abc.getYadmNm();
	                String addr = abc.getAddr();
	                Double XPos = abc.getXPos();
	                Double YPos = abc.getYPos();
	                String clCdNm = abc.getClCdNm();
	                String hospUrl = abc.getHospUrl();
	                String hosTel = abc.getTelno();
	                String subj = dgsbjtCd;
	
	                HospInfo tmp = new HospInfo(yadmNm, XPos, YPos, addr, clCdNm, hospUrl, hosTel, subj);
	                System.out.println("zzzzzzz"+ tmp);
	                output.add(tmp);
	            }
	            try {
	                // 데이터 저장
	                // --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
	                hospInfoService.addHospInfo(output);
	
	                int i = 0;
	                Calendar c = Calendar.getInstance();
	                for (HospInfo cc : output) {
	                    cc.setDay_of_week(c.get(Calendar.DAY_OF_WEEK));
	                    HospInfo dd = cc;
	                    try {
	                        cc = hospInfoService.getHospInfo(cc);
	
	                        dd.setOpentime(cc.getOpentime());
	                        dd.setClosetime(cc.getClosetime());
	                    } catch (Exception e) {
	                        if (c.get(Calendar.DAY_OF_WEEK) == 7) {
	                            dd.setOpentime("0900");
	                            dd.setClosetime("1230");
	                        } else if (c.get(Calendar.DAY_OF_WEEK) == 1) {
	                            dd.setOpentime("0000");
	                            dd.setClosetime("0000");
	                        } else {
	                            dd.setOpentime("0900");
	                            dd.setClosetime("1700");
	                        }
	                    }
	
	                    if (!output.isEmpty()) {
	                        output.set(i, dd);
	                    }
	
	                    i++;
	                }
	            } catch (Exception e) {
	                System.out.println("--------------------------------");
	                e.printStackTrace();
	            }
            }else if(hos == null) {
            	 Call<HosItemUno> call1 = ErService.getHospiUno(dgsbjtCd, sgguCd, emdongNm);
            	 HosItemUno  hosUno = null;
            	 try {
                     hosUno = call1.execute().body();
                     fdp.project.spring.model.HosItemUno.Response.Body.Items.Item abc =null;
                	 abc = hosUno.getResponse().getBody().getItems().getItema();
                	 HospInfo tmp = new HospInfo(abc.getYadmNm(), abc.getXPos(), abc.getYPos(), abc.getAddr(), abc.getClCdNm(), abc.getHospUrl(), abc.getTelno(), dgsbjtCd);
    	             System.out.println("zzzzzzz"+ tmp);
    	             output.add(tmp);
    	             
    	             try {
 		                // 데이터 저장
 		                // --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
 		                hospInfoService.addHospInfo(output);
 		
 		                int i = 0;
 		                Calendar c = Calendar.getInstance();
 		                for (HospInfo cc : output) {
 		                    cc.setDay_of_week(c.get(Calendar.DAY_OF_WEEK));
 		                    HospInfo dd = cc;
 		                    try {
 		                        cc = hospInfoService.getHospInfo(cc);
 		
 		                        dd.setOpentime(cc.getOpentime());
 		                        dd.setClosetime(cc.getClosetime());
 		                    } catch (Exception e) {
 		                        if (c.get(Calendar.DAY_OF_WEEK) == 7) {
 		                            dd.setOpentime("0900");
 		                            dd.setClosetime("1230");
 		                        } else if (c.get(Calendar.DAY_OF_WEEK) == 1) {
 		                            dd.setOpentime("0000");
 		                            dd.setClosetime("0000");
 		                        } else {
 		                            dd.setOpentime("0900");
 		                            dd.setClosetime("1700");
 		                        }
 		                    }
 		
 		                    if (!output.isEmpty()) {
 		                        output.set(i, dd);
 		                    }
 		
 		                    i++;
 		                }
 		            } catch (Exception e) {
 		                System.out.println("--------------------------------");
 		                e.printStackTrace();
 		            }
                 } catch (Exception e) {
                     output = null;
                 }
            	 
	            
            }
        }
        return gson.toJson(output);
    }

    @Autowired
    MemberService memberService;

    @RequestMapping(value = "/coosave.do", method = RequestMethod.POST)
    public ModelAndView coosave(HttpServletResponse response) {
        String user_id = webHelper.getString("user_id");
        String user_pw = webHelper.getString("user_pw");
        int autologin = webHelper.getInt("autologin");
        int document_id = webHelper.getInt("document_id", 0);
        if (user_id == null) {
            return webHelper.redirect(null, "아이디를 입력해주세요.");
        }
        if (user_pw == null) {
            return webHelper.redirect(null, "비밀번호를 입력해주세요.");
        }

        Member input = new Member();
        input.setUser_id(user_id);
        input.setUser_pw(user_pw);

        Member output = null;

        try {
            output = memberService.getMemberOne(input);
            System.out.println(output);
        } catch (Exception e) {
            return webHelper.redirect(null, "해당하는 아이디와 비밀번호의 회원이 없습니다.");
        }
        if (output == null) {
            return webHelper.redirect(null, "해당하는 아이디와 비밀번호의 회원이 없습니다.");
        }
        if (output != null) {
            webHelper.setSession("fdpCookie", user_id);
            webHelper.setSession("UserGrade", output.getMember_grade());
            webHelper.setSession("Name", output.getName());
            webHelper.setSession("PK", output.getFdpmember_id());

            if (autologin == 7) {
                webHelper.setCookie("auto", user_id, 604800);
            }
        }

        if (document_id == 0) {
            return new ModelAndView("redirect: index.do");
        } else {
            return new ModelAndView("redirect: 14_Notice_board_i.do?document_id=" + document_id);
        }
    }

    @RequestMapping(value = "/coodel.do", method = RequestMethod.GET)
    public ModelAndView coodel() {
        String aa = (String) webHelper.getSession("Name");

        webHelper.removeAllSession();

        return webHelper.redirect("index.do", "안녕히가세요 " + aa + "님");
    }

    @Autowired
    ErInfoService erInfoService;

    @ResponseBody
    @RequestMapping(value = "/getErInfo.do", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
    public String getErInfo() {
        List<EmRoom> output = null;

        try {
            output = erInfoService.getErInfoList();
        } catch (Exception e) {
            e.printStackTrace();
        }

        Gson gson = new Gson();
        return gson.toJson(output);
    }

    @ResponseBody
    @RequestMapping(value = "/ErGraph.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
    public String ErGraph() {
        String hosname = webHelper.getString("hos");
        EmRoom input = new EmRoom();
        input.setDutyName(hosname);
        List<EmRoom> output = null;

        try {
            output = erInfoService.getErGraph(input);
        } catch (Exception e) {
            e.printStackTrace();
        }
        for (EmRoom tt : output) {

            tt.inserttime = tt.inserttime.replace(" ", "/");
            tt.inserttime = tt.inserttime.replace("-", "/");
            
            System.out.println(tt.inserttime);
        }

        Gson gson = new Gson();
        return gson.toJson(output);
    }
}
