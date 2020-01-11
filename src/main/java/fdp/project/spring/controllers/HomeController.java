package fdp.project.spring.controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import fdp.project.spring.helper.RetrofitHelper;
import fdp.project.spring.helper.WebHelper;
import fdp.project.spring.model.Addr;
import fdp.project.spring.model.Addr.Documents;
import fdp.project.spring.model.Member;
import fdp.project.spring.service.GetAddressService;
import fdp.project.spring.service.MemberService;
import retrofit2.Call;
import retrofit2.Retrofit;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

    /**
     * Simply selects the home view to render by returning its name.
     */
    @Autowired
    WebHelper webHelper;
    @Autowired
    MemberService memberService;
    @Autowired
    RetrofitHelper retrofitHelper;

    @RequestMapping(value = { "/", "index.do" }, method = RequestMethod.GET)
    public String home(Model model) {

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

        return "index";
    }

}
