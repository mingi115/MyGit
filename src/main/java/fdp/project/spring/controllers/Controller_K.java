package fdp.project.spring.controllers;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import fdp.project.spring.helper.MailHelper;
import fdp.project.spring.helper.PageData;
import fdp.project.spring.helper.RegexHelper;
import fdp.project.spring.helper.WebHelper;
import fdp.project.spring.model.Count;
import fdp.project.spring.model.Document;
import fdp.project.spring.model.Member;
import fdp.project.spring.service.CountService;
import fdp.project.spring.service.DocumentService;
import fdp.project.spring.service.MemberService;
import net.sf.json.JSONArray;

@Controller
public class Controller_K {

    @Autowired
    WebHelper webHelper;

    @Autowired
    RegexHelper regexHelper;

    @Autowired
    DocumentService documentService;

    @Autowired
    CountService countService;

    @Autowired
    MemberService memberService;

    @Autowired
    MailHelper mailHelper;

    @Value("#{servletContext.contextPath}")
    String contextPath;

    @RequestMapping(value = "/21_Management.do", method = { RequestMethod.GET, RequestMethod.POST })
    public ModelAndView Management(Model model, HttpServletRequest request) {

        /** 게시글 목록 조회하기 */
        // 조회결과를 저장할 객체 선언
        List<Document> output = null;
        List<Member> output2 = null;

        try {
            // 데이터 조회 --> 검색조건 없이 모든 게시글 조회
            output = documentService.getDocumentList(null);
            output2 = memberService.getMemberList(null);
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }

        /** 컨트롤러에서 세션을 식별하기 위한 처리 */
        HttpSession session = request.getSession();
        String mySessionId = (String) session.getAttribute("session_id");
        if (mySessionId == null) {
            mySessionId = "";
        }
        String mySessionPw = (String) session.getAttribute("session_pw");
        if (mySessionPw == null) {
            mySessionPw = "";
        }
        String mySessionName = (String) session.getAttribute("session_name");
        if (mySessionName == null) {
            mySessionName = "";
        }

        model.addAttribute("output", output);
        model.addAttribute("output2", output2);
        model.addAttribute("my_session_id", mySessionId);
        model.addAttribute("my_session_pw", mySessionPw);
        model.addAttribute("my_session_name", mySessionName);

        return new ModelAndView("21_Management");
    }

    @RequestMapping(value = "/22_Login_s.do")
    public ModelAndView Login_s(Model model) {

        String grade = (String) webHelper.getSession("UserGrade", "0");

        if (!grade.equals("0")) {
            // 관리자 로그인 시 관리자가 아니면 로그 아웃
            webHelper.removeAllSession();

            String redirectUrl = contextPath + "/22_Login_s.do";
            return webHelper.redirect(redirectUrl, "관리자가 아닌 회원은 로그아웃 됩니다.");

        } else {
            return new ModelAndView("22_Login_s");
        }
    }

    // 관리자 ID/PW 세션에 저장된 값이랑 비교
    @RequestMapping(value = "/check.do", method = RequestMethod.POST)
    public ModelAndView checkFunction(Model model, HttpServletRequest request) {

        /** 1) 입력값을 받아오기 */
        String checkId = webHelper.getString("user_id");
        String checkPw = webHelper.getString("user_pw");
        /** 2) 데이터 조회하기 */
        // 데이터 조회에 필요한 조건값을 Beans에 저장하기
        Member input = new Member();

        // 중복확인 때문에 사실상 고유한 값
        input.setUser_id(checkId);

        // 조회결과를 저장할 객체 선언
        Member output = null;

        try {
            output = memberService.getMemberItem(input);
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }

        if (!checkId.equals(output.getUser_id()) || !checkPw.equals(output.getUser_pw())) {
            String redirectUrl = contextPath + "/22_Login_s.do";
            return webHelper.redirect(redirectUrl, "아이디 또는 비밀번호를 확인해주세요.");
        } else if (!output.getMember_grade().equals("0")) {
            String redirectUrl = contextPath + "/22_Login_s.do";
            return webHelper.redirect(redirectUrl, "관리자 계정이 아닙니다.");
        } else {
            model.addAttribute("user_id", output.getUser_id());
            model.addAttribute("user_pw", output.getUser_pw());
            model.addAttribute("user_name", output.getName());
            return new ModelAndView("redirect:/session/save.do");
        }
    }

    // 세션 저장하는 페이지
    @RequestMapping(value = "/session/save.do", method = RequestMethod.GET)
    public String sessionSave(Model model, HttpServletRequest request, @RequestParam(value = "user_id", defaultValue = "") String userId, @RequestParam(value = "user_pw", defaultValue = "") String userPw,
            @RequestParam(value = "user_name", defaultValue = "") String userName) {

        /** 1) request 객체를 사용해서 세션 객체 만들기 */
        HttpSession session = request.getSession();

        /** 2) 세션 저장, 삭제 */
        if (!userId.equals("")) {
            session.setAttribute("session_id", userId);
        } else {
            session.removeAttribute("session_id");
        }

        if (!userPw.equals("")) {
            session.setAttribute("session_pw", userPw);
        } else {
            session.removeAttribute("session_pw");
        }

        if (!userName.equals("")) {
            session.setAttribute("session_name", userName);
        } else {
            session.removeAttribute("session_name");
        }

        // 세션 유지시간 10분
        session.setMaxInactiveInterval(600);

        /** 3) Spring 방식의 페이지 이동 */
        return "redirect:/21_Management.do";
    }

    // 세션 삭제 하는 페이지
    @RequestMapping(value = "/session/delete.do", method = RequestMethod.GET)
    public String sessionDelete(HttpServletRequest request) {
        /** 1) request 객체를 사용해서 세션 객체 만들기 */
        HttpSession session = request.getSession();

        /** 2) 세션 초기화 */
        session.invalidate();

        /** 3) Spring 방식의 페이지 이동 */
        return "redirect:/21_Management.do";
    }

    @RequestMapping(value = "/26_Profile_i.do")
    public ModelAndView Profile_i(Model model, HttpServletRequest request, HttpServletResponse response) {

        return new ModelAndView("26_Profile_i");
    }

    @RequestMapping(value = "/check2.do")
    public ModelAndView checkFunctionTwo(Model model) {

        /** 1) 필요한 변수값 생성 */
        String user_pw = webHelper.getString("user_pw");
        String user_id = (String) webHelper.getSession("fdpCookie", "");

        /** 2) 데이터 조회하기 */
        // 데이터 조회에 필요한 조건값을 Beans에 저장하기
        Member input = new Member();
        input.setUser_id(user_id);
        input.setUser_pw(user_pw);

        // 조회결과를 저장할 객체 선언
        Member output = null;

        try {
            output = memberService.getMemberItem(input);
        } catch (Exception e) {

            return webHelper.redirect(null, e.getLocalizedMessage());
        }

        if (!user_pw.equals(output.getUser_pw())) {
            String redirectUrl = contextPath + "/26_Profile_i.do";
            return webHelper.redirect(redirectUrl, "비밀번호를 확인해주세요.");
        } else {
            /** 3) View 처리 */
            model.addAttribute("output", output);
            String redirectUrl = contextPath + "/27_Profile.do?fdpmember_id=" + output.getFdpmember_id();
            return webHelper.redirect(redirectUrl, "확인 되었습니다.");
        }
    }

    @RequestMapping(value = "/27_Profile.do", method = { RequestMethod.GET, RequestMethod.POST })
    public ModelAndView Profile(Model model, HttpServletRequest request) {

        /** 1) 필요한 변수값 생성 */
        // 조회할 대상에 대한 PK값
        int fdpmember_id = webHelper.getInt("fdpmember_id");

        // 이 값이 존재하지 않는다면 데이터 조회가 불가능하므로 반드시 필수값으로 처리해야 한다.
        if (fdpmember_id == 0) {
            return webHelper.redirect(null, "회원번호가 없습니다.");
        }

        /** 2) 데이터 조회하기 */
        // 데이터 조회에 필요한 조건값을 Beans에 저장하기
        Member input = new Member();
        input.setFdpmember_id(fdpmember_id);

        // 조회결과를 저장할 객체 선언
        Member output = null;

        try {
            output = memberService.getMemberItem(input);
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }

        /** 3) View 처리 */
        model.addAttribute("output", output);
        return new ModelAndView("27_Profile");
    }

    @RequestMapping(value = "/28_User_stasis.do", method = { RequestMethod.GET, RequestMethod.POST })
    public ModelAndView User_stasis(Model model, HttpServletRequest request) {

        /** 1) 필요한 변수값 생성 */
        String keyword = webHelper.getString("keyword", ""); // 검색어
        int nowPage = webHelper.getInt("page", 1); // 페이지 번호 (기본값 1)
        int totalCount = 0; // 전체 게시글 수
        int listCount = 10; // 한 페이지당 표시할 목록 수
        int pageCount = 5; // 한 그룹당 표시할 페이지 번호 수

        /** 2) 데이터 조회하기 */
        // 조회에 필요한 조건값(검색어)를 Beans에 담는다.
        Member input = new Member();
        input.setName(keyword);
        input.setUser_id(keyword);
        input.setAddr2(keyword);

        List<Member> output = null; // 조회결과가 저장될 객체
        PageData pageData = null; // 페이지 번호를 계산한 결과가 저장될 객체

        try {
            // 전체 게시글 수 조회
            totalCount = memberService.getMemberCount(input);
            // 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
            pageData = new PageData(nowPage, totalCount, listCount, pageCount);

            // SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
            Member.setOffset(pageData.getOffset());
            Member.setListCount(pageData.getListCount());

            // 데이터 조회하기
            output = memberService.getMemberList(input);
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }

        /** 컨트롤러에서 세션을 식별하기 위한 처리 */
        HttpSession session = request.getSession();
        String mySessionId = (String) session.getAttribute("session_id");
        if (mySessionId == null) {
            mySessionId = "";
        }
        String mySessionPw = (String) session.getAttribute("session_pw");
        if (mySessionPw == null) {
            mySessionPw = "";
        }

        /** 3) View 처리 */
        model.addAttribute("output", output);
        model.addAttribute("keyword", keyword);
        model.addAttribute("pageData", pageData);
        /** 세션 값 */
        model.addAttribute("my_session_id", mySessionId);
        model.addAttribute("my_session_pw", mySessionPw);

        return new ModelAndView("28_User_stasis");
    }

    @ResponseBody
    @RequestMapping(value = "GMember.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
    public String GMember() {

        /** 1) 필요한 변수값 생성 */
        int clickNum = webHelper.getInt("fdpmember_id");

        /** 2) 데이터 조회하기 */
        // 조회에 필요한 조건값(검색어)를 Beans에 담는다.
        Member input = new Member();
        input.setFdpmember_id(clickNum);

        Member output = null; // 조회결과가 저장될 객체

        try {
            output = memberService.getMemberItem(input);
        } catch (Exception e) {
            e.printStackTrace();
        }

        /** 3) View 처리 */
        Gson gson = new Gson();
        return gson.toJson(output);
    }

    @RequestMapping(value = "/29_User_stasis2.do", method = { RequestMethod.GET, RequestMethod.POST })
    public ModelAndView Profile2(Model model, HttpServletRequest request) {

        /** 컨트롤러에서 세션을 식별하기 위한 처리 */
        HttpSession session = request.getSession();
        String mySessionId = (String) session.getAttribute("session_id");
        if (mySessionId == null) {
            mySessionId = "";
        }
        String mySessionPw = (String) session.getAttribute("session_pw");
        if (mySessionPw == null) {
            mySessionPw = "";
        }

        model.addAttribute("my_session_id", mySessionId);
        model.addAttribute("my_session_pw", mySessionPw);

        return new ModelAndView("29_User_stasis2");
    }

    @RequestMapping(value = "/edit_ok.do")
    public ModelAndView edit_ok(Model model) {
        /** 1) 사용자가 입력한 파라미터 수신 및 유효성 검사 */
        int fdpmember_id = webHelper.getInt("fdpmember_id");
        String name = webHelper.getString("name");
        String user_id = webHelper.getString("user_id");
        String user_pw = webHelper.getString("user_pw");
        String email = webHelper.getString("email");
        int gender = webHelper.getInt("gender");
        String birthdate = webHelper.getString("birthdate");
        String tel = webHelper.getString("tel");
        String addr1 = webHelper.getString("addr1");
        String addr2 = webHelper.getString("addr2");
        String addr3 = webHelper.getString("addr3");
        String addr4 = webHelper.getString("addr4");
        String reg_date = webHelper.getString("reg_date");
        String medical_field = webHelper.getString("medical_field");
        String member_grade = webHelper.getString("member_grade");

        // 회원정보 수정 시 현재 시간 저장
        Date time = new Date();
        SimpleDateFormat formattt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String edit_date = formattt.format(time);

        /** 2) 데이터 수정하기 */
        // 수정할 값들을 Beans에 담는다.
        Member input = new Member();
        input.setFdpmember_id(fdpmember_id);
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
        input.setReg_date(reg_date);
        input.setEdit_date(edit_date);
        input.setMedical_field(medical_field);
        input.setMember_grade(member_grade);

        try {
            // 데이터 수정
            memberService.editMember(input);
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }

        /** 3) 결과를 확인하기 위한 페이지 이동 */
        // 수정한 대상을 상세페이지에 알려주기 위해서 PK값을 전달해야 한다.
        String redirectUrl = contextPath + "/index.do";
        return webHelper.redirect(redirectUrl, "수정되었습니다.");
    }

    @RequestMapping(value = "/ddelete_ok.do")
    public ModelAndView delete_ok(Model model) {
        /** 1) 필요한 변수값 생성 */
        // 삭제할 대상에 대한 PK값
        int fdpmember_id = webHelper.getInt("fdpmember_id");

        // 이 값이 존재하지 않는다면 데이터 삭제가 불가능하므로 반드시 필수값으로 처리해야 한다.
        if (fdpmember_id == 0) {
            return webHelper.redirect(null, "회원 번호가 없습니다.");
        }

        /** 2) 데이터 삭제하기 */
        // 데이터 삭제에 필요한 조건값을 Beans에 저장하기
        Member input = new Member();
        input.setFdpmember_id(fdpmember_id);

        try {
            memberService.deleteMember(input); // 데이터 삭제
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }

        /** 3) 페이지 이동 */
        // 확인할 대상이 삭제된 상태이므로 목록 페이지로 이동
        return webHelper.redirect("28_User_stasis.do", "회원 탈퇴가 완료되었습니다.");
    }

    @RequestMapping(value = "/allDelete_ok.do")
    public ModelAndView allDelete_ok(Model model, HttpServletRequest request) {

        /** 1) 필요한 변수값 생성 */
        // 삭제할 대상에 대한 PK값
        String[] fdpmember_id = request.getParameterValues("fdpmember_id[]");

        for (int i = 0; i < fdpmember_id.length; i++) {
            // 이 값이 존재하지 않는다면 데이터 삭제가 불가능하므로 반드시 필수값으로 처리해야 한다.
            if (fdpmember_id[i] == null) {
                return webHelper.redirect(null, "회원 번호가 없습니다.");
            }

            /** 2) 데이터 삭제하기 */
            // 데이터 삭제에 필요한 조건값을 Beans에 저장하기
            Member input = new Member();
            input.setFdpmember_id(Integer.parseInt(fdpmember_id[i]));

            try {
                memberService.deleteMember(input); // 데이터 삭제
            } catch (Exception e) {
                return webHelper.redirect(null, e.getLocalizedMessage());
            }
        } // for문 끝

        return null;
    }

    @RequestMapping(value = "/assets/api/chart0.do")
    public ModelAndView chart00(Model model) {

        /** 구별 회원 수 조회하기 */
        // 조회결과를 저장할 객체 선언
        List<Count> output = null;

        try {
            output = countService.getAddrCount(null);
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }

        model.addAttribute("jsonList", JSONArray.fromObject(output));
        return new ModelAndView("assets/api/chart0");
    }

    @RequestMapping(value = "/assets/api/chart1.do")
    public ModelAndView chart11(Model model) {

        /** 남,여 회원 수 조회하기 */
        // 조회결과를 저장할 객체 선언
        List<Count> output = null;

        try {
            output = countService.getGenderCount(null);
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }

        model.addAttribute("jsonList", JSONArray.fromObject(output));
        return new ModelAndView("assets/api/chart1");
    }

    @RequestMapping(value = "/assets/api/chart2.do")
    public ModelAndView chart22(Model model) {

        /** 회원 나이별로 조회하기 */
        // 조회결과를 저장할 객체 선언
        List<Count> output = null;

        try {
            output = countService.getAgeCount(null);
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }

        model.addAttribute("jsonList", JSONArray.fromObject(output));
        return new ModelAndView("assets/api/chart2");
    }

    @RequestMapping(value = "/assets/api/chart3.do")
    public ModelAndView chart33(Model model) {

        /** 남,여 회원 수 조회하기 */
        // 조회결과를 저장할 객체 선언
        List<Count> output = null;

        try {
            output = countService.getAgeGenderCount(null);
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }

        model.addAttribute("jsonList", JSONArray.fromObject(output));
        return new ModelAndView("assets/api/chart3");
    }

    @RequestMapping(value = "/assets/api/chart4.do")
    public ModelAndView chart44(Model model) {

        /** 남,여 회원 수 조회하기 */
        // 조회결과를 저장할 객체 선언
        List<Count> output = null;

        try {
            output = countService.getDoctorCount(null);
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }

        model.addAttribute("jsonList", JSONArray.fromObject(output));
        return new ModelAndView("assets/api/chart4");
    }

    // email로 id확인
    @RequestMapping(value = "25_find_id.do")
    public ModelAndView find_id(Model model) {

        return new ModelAndView("25_find_id");
    }

    @RequestMapping(value = "25_find_pw.do")
    public ModelAndView find_pw(Model model) {

        return new ModelAndView("25_find_pw");
    }

    @ResponseBody
    @RequestMapping(value = "25_find_id_check.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
    public String find_id_check(Model model) {

        /** 1) 필요한 변수값 생성 */
        // 조회할 대상에 대한 PK값
        String email = webHelper.getString("data");

        Member input = new Member();
        input.setEmail(email);

        // 조회결과를 저장할 객체 선언
        Member output = null;

        try {
            output = memberService.getMemberItem(input);
        } catch (Exception e) {
            e.printStackTrace();
        }

        /** 3) View 처리 */
        Gson gson = new Gson();
        return gson.toJson(output);
    }

    @ResponseBody
    @RequestMapping(value = "25_find_pw_check.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
    public String find_pw_check(Model model) {
        /** 1) 필요한 변수값 생성 */
        // 조회할 대상에 대한 PK값
        String email = webHelper.getString("data");
        String user_id = webHelper.getString("data1");
        Member input = new Member();
        input.setEmail(email);
        input.setUser_id(user_id);

        int a = 0;
        // 조회결과를 저장할 객체 선언
        Member output = null;
        Gson gson = new Gson();

        // id, email 조회
        try {
            output = memberService.getMemberItem(input);
        } catch (Exception e) {
            a++;
        }

        // 조회 실패 시 id 존재 여부 확인
        if (a == 1) {
            input.setEmail(null);
            try {
                output = memberService.getMemberItem(input);
                return gson.toJson(a);
            } catch (Exception e) {
                a++;
            }
        }

        // 조회 실패 시 email 존재 여부 확인
        if (a == 2) {
            input.setUser_id(null);
            input.setEmail(email);

            try {
                output = memberService.getMemberItem(input);
                return gson.toJson(a);
            } catch (Exception e) {
                a++;
                return gson.toJson(a);
            }
        }

        // 랜덤 비밀번호
        // 0 ~ 25 랜덤 실수 만들고 소문자 'a' 의 아스키 코드 번호는 97
        String user_pw = "";
        for (int i = 0; i < 12; i++) {
            user_pw += (char) ((Math.random() * 26) + 97);
        }

        output.setUser_pw(user_pw);

        try {
            // 데이터 수정
            memberService.editMember(output);
        } catch (Exception e) {
            return null;
        }

        try {
            String emailcontent = "<p style='text-align:center;'>" + output.getName() + " 회원님께 임의로 발급된 비밀번호는 <b>" + output.getUser_pw() + "</b>입니다.<br />"
                    + "비밀번호 변경 후 사용해주시길 바랍니다.<br /></p><div style='text-align:center;'><img style='width:500px;' src='https://postfiles.pstatic.net/MjAxOTEyMjdfMjQ4/MDAxNTc3NDE2ODQzOTQz.ZyAwSwKyzpdDFaGDvdqHZ8gl3_E99Dgnd3CNcSmduEMg.gJL9BImjP9zodMnwb8OMwPum-3wCTDL_uC31hsQ8-5Ug.PNG.min_gi115/FindDoctor.png?type=w580' alt='로고'></div>";

            // 메일 Helper 사용
            mailHelper.sendMail(output.getEmail(), "Find Doctor 임시 비밀번호 발급 안내", emailcontent);

        } catch (Exception e) {
            e.printStackTrace();
        }

        /** 3) View 처리 */
        return gson.toJson(output);
    }

}
