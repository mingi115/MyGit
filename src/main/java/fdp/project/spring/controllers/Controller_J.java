package fdp.project.spring.controllers;

import java.io.IOException;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import fdp.project.spring.helper.WebHelper;
import fdp.project.spring.model.Member;
import fdp.project.spring.service.DiseaseRegionService;
import fdp.project.spring.service.MemberService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class Controller_J {

    @Autowired
    WebHelper webHelper;

    @Autowired
    MemberService memberService;

    @Autowired
    DiseaseRegionService diseaseRegionService;

    @Value("#{servletContext.contextPath}")
    String contextPath;

    /**
     * Simply selects the home view to render by returning its name.
     */

    @RequestMapping(value = "07_Statistics.do", method = RequestMethod.GET)
    public ModelAndView statistics(HttpServletRequest request, Model model) {
        return new ModelAndView("07_Statistics");
    }

    @RequestMapping(value = "09_Sign_up_a.do", method = RequestMethod.GET)
    public String signup() {
        return "09_Sign_up_a";
    }

    @RequestMapping(value = "09_Sign_up_a2.do", method = { RequestMethod.POST, RequestMethod.GET })
    public String signupina() {
        return "09_Sign_up_a2";
    }

    @RequestMapping(value = "10_Sign_up_i_d2.do", method = RequestMethod.GET)
    public ModelAndView signupidd(Model model) {
        int fdpmember_id = webHelper.getInt("fdpmember_id");

        if (fdpmember_id == 0) {
            return webHelper.redirect(null, "회원번호가 없습니다.");
        }

        Member input = new Member();
        input.setFdpmember_id(fdpmember_id);

        Member output = null;

        try {
            output = memberService.getMemberItem(input);
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }

        model.addAttribute("output", output);
        return new ModelAndView("10_Sign_up_i_d2");
    }

    @RequestMapping(value = "10_Sign_up_i_d.do", method = RequestMethod.GET)
    public ModelAndView signupid(Model model) {
        return new ModelAndView("10_Sign_up_i_d");
    }

    @RequestMapping(value = "10_Sign_up_d_add.do", method = RequestMethod.POST)
    public ModelAndView signupid2(Model model, HttpServletRequest request, HttpServletResponse response) {

        String name = request.getParameter("name");
        String user_id = request.getParameter("user_id");
        String user_pw = request.getParameter("user_pw");
        String email = request.getParameter("email");
        int gender = webHelper.getInt("gender");
        String birthdate = request.getParameter("birthdate");
        String tel = request.getParameter("tel");
        String addr1 = request.getParameter("addr1");
        String addr2 = request.getParameter("addr2");
        String addr3 = request.getParameter("addr3");
        String addr4 = request.getParameter("addr4");
        String reg_date = request.getParameter("reg_date");
        String edit_date = request.getParameter("edit_date");
        String medical_field = request.getParameter("medical_field");

        if (name == null || user_id == null || user_pw == null || email == null || gender == 0 || birthdate == null || tel == null || addr1 == null || addr2 == null || addr3 == null || addr4 == null || reg_date == null || edit_date == null
                || medical_field == null) {
            // 이전 페이지로 강제 이동 후 종료
            webHelper.redirect(null, "입력항목이 잘못되었습니다.");
        }

        Calendar cal = Calendar.getInstance();
        int yy = cal.get(Calendar.YEAR);
        int mm = cal.get(Calendar.MONTH) + 1;
        int dd = cal.get(Calendar.DAY_OF_MONTH);
        int hh = cal.get(Calendar.HOUR_OF_DAY);
        int mi = cal.get(Calendar.MINUTE);
        int ss = cal.get(Calendar.SECOND);

        String currenttime = String.format("%04d-%02d-%02d %02d:%02d:%02d", yy, mm, dd, hh, mi, ss);

        Member input = new Member();
        input.setName(name);
        input.setUser_id(user_id);
        input.setUser_pw(user_pw);
        input.setEmail(email);
        input.setGender(gender);
        input.setBirthdate(birthdate);
        input.setTel(tel);
        input.setAddr1(addr1);
        input.setAddr2(addr2);
        input.setAddr3(addr3);
        input.setAddr4(addr4);
        input.setReg_date(currenttime);
        input.setEdit_date(edit_date);
        input.setMedical_field(medical_field);
        input.setMember_grade("1");

        try {
            // 데이터 저장
            // --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
            memberService.addMember(input);

        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }

        /** 3) 결과를 확인하기 위한 페이지 이동 */
        // 저장 결과를 확인하기 위해서 데이터 저장시 생성된 PK값을 상세 페이지로 전달해야 한다.
        String redirectUrl = contextPath + "/10_Sign_up_i_d2.do?fdpmember_id=" + input.getFdpmember_id();
        return webHelper.redirect(redirectUrl, "회원정보 입력이 완료되었습니다.");
    }

    @RequestMapping(value = "11_Sign_up_i_n.do", method = RequestMethod.GET)
    public String signupin() {
        return "11_Sign_up_i_n";
    }

    @RequestMapping(value = "11_Sign_up_i_add.do", method = RequestMethod.POST)
    public ModelAndView signupin2(Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {

        String name = request.getParameter("name");
        String user_id = request.getParameter("user_id");
        String user_pw = request.getParameter("user_pw");
        String email = request.getParameter("email");
        int gender = webHelper.getInt("gender");
        String birthdate = request.getParameter("birthdate");
        String tel = request.getParameter("tel");
        String addr1 = request.getParameter("addr1");
        String addr2 = request.getParameter("addr2");
        String addr3 = request.getParameter("addr3");
        String addr4 = request.getParameter("addr4");
        String reg_date = request.getParameter("reg_date");
        String edit_date = request.getParameter("edit_date");

        if (name == null || user_id == null || user_pw == null || email == null || gender == 0 || birthdate == null || tel == null || addr1 == null || addr2 == null || addr3 == null || addr4 == null || reg_date == null
                || edit_date == null) {
            // 이전 페이지로 강제 이동 후 종료
            webHelper.redirect(null, "입력항목이 잘못되었습니다.");
        }

        Calendar cal = Calendar.getInstance();
        int yy = cal.get(Calendar.YEAR);
        int mm = cal.get(Calendar.MONTH) + 1;
        int dd = cal.get(Calendar.DAY_OF_MONTH);
        int hh = cal.get(Calendar.HOUR_OF_DAY);
        int mi = cal.get(Calendar.MINUTE);
        int ss = cal.get(Calendar.SECOND);

        String currenttime = String.format("%04d-%02d-%02d %02d:%02d:%02d", yy, mm, dd, hh, mi, ss);

        Member input = new Member();
        input.setName(name);
        input.setUser_id(user_id);
        input.setUser_pw(user_pw);
        input.setEmail(email);
        input.setGender(gender);
        input.setBirthdate(birthdate);
        input.setTel(tel);
        input.setAddr1(addr1);
        input.setAddr2(addr2);
        input.setAddr3(addr3);
        input.setAddr4(addr4);
        input.setReg_date(currenttime);
        input.setEdit_date(edit_date);
        input.setMember_grade("2");

        try {
            // 데이터 저장
            // --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
            memberService.addMember(input);
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }

        String redirectUrl = contextPath + "/11_Sign_up_i_n2.do?fdpmember_id=" + input.getFdpmember_id();
        return webHelper.redirect(redirectUrl, "가입을 환영합니다.");
    }

    @ResponseBody
    @RequestMapping(value = "idcheck.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
    public String idcheck() {
        String user_id = webHelper.getString("user_id");

        Member member = new Member();
        member.setUser_id(user_id);
        Member output = null;

        try {
            // 데이터 저장
            // --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
            output = memberService.getMemberItem(member);
        } catch (Exception e) {
            System.out.println("중복된 아이디가 없습니다.");
        }

        String status = "OK";
        System.out.println(output);

        if (output != null) {
            status = "FAIL";
        }

        Gson gson = new Gson();
        return gson.toJson(status);
    }

    @ResponseBody
    @RequestMapping(value = "eamilCheck.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
    public String eamilCheck() {
        String email = webHelper.getString("email");

        Member member = new Member();
        member.setEmail(email);
        Member output = null;

        try {
            // 데이터 저장
            // --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
            output = memberService.getMemberItem(member);
        } catch (Exception e) {
            System.out.println("중복된 이메일이 없습니다.");
        }

        String status = "OK";
        System.out.println(output);

        if (output != null) {
            status = "FAIL";
        }

        Gson gson = new Gson();
        return gson.toJson(status);
    }

    @RequestMapping(value = "11_Sign_up_i_n2.do", method = RequestMethod.GET)
    public ModelAndView signupnn(Model model) {
        int fdpmember_id = webHelper.getInt("fdpmember_id");

        if (fdpmember_id == 0) {
            return webHelper.redirect(null, "회원번호가 없습니다.");
        }

        Member input = new Member();
        input.setFdpmember_id(fdpmember_id);

        Member output = null;

        try {
            output = memberService.getMemberItem(input);
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }

        model.addAttribute("output", output);
        return new ModelAndView("11_Sign_up_i_n2");
    }

    @RequestMapping(value = "12_Sign_up_s.do", method = RequestMethod.GET)
    public String signups() {
        return "12_Sign_up_s";
    }

}
