package fdp.project.spring.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import fdp.project.spring.helper.DownloadHelper;
import fdp.project.spring.helper.RegexHelper;
import fdp.project.spring.helper.WebHelper;

@Controller
public class UploadController {
    // -> import study.spring.springhelper.helper.WebHelper;
    @Autowired
    WebHelper webHelper;

    // -> import study.spring.springhelper.helper.DownloadHelper;
    @Autowired
    DownloadHelper downloadHelper;

    // -> import study.spring.springhelper.helper.RegexHelper;
    @Autowired
    RegexHelper regexHelper;

    /** 파일 다운로드 및 썸네일을 생성하는 페이지 */
    // --> 다운로드 ex) /upload/download.do?file=이미지경로&origin=원본파일이름
    // --> 썸네일 ex) /upload/download.do?file=이미지경로&size=240x320&crop=true
    @RequestMapping(value = "/download.do", method = RequestMethod.GET)
    public ModelAndView download(Model model, @RequestParam(value = "file") String filePath, @RequestParam(value = "origin", required = false) String originName, @RequestParam(value = "size", required = false) String size,
            @RequestParam(value = "crop", defaultValue = "false") String crop) {
        // 서버상에 저장되어 있는 파일경로 (필수)
        // String filePath = webHelper.getString("file");
        // 원본 파일이름 (미필수)
        // String originName = webHelper.getString("origin");
        // 축소될 이미지 해상도 --> 320x320
        // String size = webHelper.getString("size");
        // 이미지 크롭 여부 --> 값이 없을 경우 기본값 false
        // String crop = webHelper.getString("crop", "false");

        /** 다운로드 스트림 출력하기 */
        if (filePath != null) {
            try {
                // 썸네일 생성을 위해 축소될 이미지의 사이즈가 요청되었다면?
                if (size != null) {
                    // x를 기준으로 나눠서 숫자로 변환
                    String[] temp = size.split("x");
                    int width = Integer.parseInt(temp[0]);
                    int height = Integer.parseInt(temp[1]);

                    // 모든 파라미터는 문자열이므로 크롭 여부를 boolean으로 재설정
                    boolean is_crop = false;
                    if (crop.equals("true")) {
                        is_crop = true;
                    }

                    // 썸네일 생성 후 다운로드 처리
                    downloadHelper.download(filePath, width, height, is_crop);
                } else {
                    // 원본에 대한 다운로드 처리
                    downloadHelper.download(filePath, originName);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        // View를 사용하지 않고 FileStream을 출력하므로 리턴값은 없다.
        return null;
    }
}
