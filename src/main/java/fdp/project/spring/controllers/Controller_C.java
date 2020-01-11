package fdp.project.spring.controllers;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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

import fdp.project.spring.helper.DownloadHelper;
import fdp.project.spring.helper.PageData;
import fdp.project.spring.helper.RegexHelper;
import fdp.project.spring.helper.UploadItem;
import fdp.project.spring.helper.WebHelper;
import fdp.project.spring.model.Comment;
import fdp.project.spring.model.DocAnswer;
import fdp.project.spring.model.Document;
import fdp.project.spring.model.NFile;
import fdp.project.spring.model.Member;
import fdp.project.spring.service.CommentService;
import fdp.project.spring.service.DocAnswerService;
import fdp.project.spring.service.DocumentService;
import fdp.project.spring.service.NFileService;
import fdp.project.spring.service.MemberService;

@Controller
public class Controller_C {
    /** WebHelper 주입 */
    // --> import org.springframework.beans.factory.annotation.Autowired;
    // --> import study.spring.springhelper.helper.WebHelper;
    @Autowired
    WebHelper webHelper;

    /** RegexHelper 주입 */
    // --> import fdp.project.spring.helper.RegexHelper;
    @Autowired
    RegexHelper regexHelper;

    /** Service 패턴 구현체 주입 */
    // --> import study.spring.service.DocumentService;
    @Autowired
    DocumentService documentService;

    // --> import study.spring.service.DocAnswerService;
    @Autowired
    DocAnswerService docAnswerService;

    // --> import study.spring.service.MemberService;
    @Autowired
    MemberService memberService;

    // --> import study.spring.service.CommentService;
    @Autowired
    CommentService commentService;

    // --> import study.spring.service.FileService;
    @Autowired
    NFileService fileService;

    @Autowired
    DownloadHelper downloadHelper;

    /** "/프로젝트이름"에 해당하는 ContextPath 변수 주입 */
    @Value("#{servletContext.contextPath}")
    String contextPath;

    /** 일반게시판 목록 페이지 */
    @RequestMapping(value = "/13_Notice_board.do", method = RequestMethod.GET)
    public ModelAndView Notice_board(Model model, @RequestParam(value = "keyword", defaultValue = "") String keyword) {
        /** 1) 필요한 변수 값 생성 */
        int nowPage = webHelper.getInt("page", 1); // 페이지 번호 (기본값 1)
        int totalCount = 0; // 전체 게시글 수
        int listCount = 10; // 한 페이지당 표시할 목록 수
        int pageCount = 5; // 한 그룹당 표시할 페이지 번호 수

        /** 2) 데이터 조회하기 */
        // 조회에 필요한 조건 값(검색어)를 Beans에 담는다.
        Document input = new Document();
        input.setWriter_name(keyword);
        input.setSubject(keyword);
        input.setContent(keyword);
        input.setHit(0);
        input.setReg_date(keyword);
        input.setEdit_date(keyword);

        List<Document> output = null; // 조회 결과가 저장될 객체
        PageData pageData = null; // 페이지 번호를 계산한 결과가 저장될 객체

        try {
            // 전체 게시글 수 조회
            totalCount = documentService.getDocumentCount(input);
            // 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
            pageData = new PageData(nowPage, totalCount, listCount, pageCount);

            // SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
            Document.setOffset(pageData.getOffset());
            Document.setListCount(pageData.getListCount());

            // 데이터 조회하기
            output = documentService.getDocumentList(input);
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }

        /** 3) View 처리 */
        model.addAttribute("keyword", keyword);
        model.addAttribute("output", output);
        model.addAttribute("pageData", pageData);
        String viewPath = "13_Notice_board";
        return new ModelAndView(viewPath);
    }

    /** 일반 게시판 상세 페이지 */
    @RequestMapping(value = "/14_Notice_board_i.do", method = RequestMethod.GET)
    public ModelAndView Notice_board_i(Model model, HttpServletRequest request) {
        /** 1) 필요한 변수 값 생성 */
        // 조회할 대상에 대한 PK 값
        HttpSession session = request.getSession();
        int document_id = webHelper.getInt("document_id");
        int fdpmember_id = webHelper.getInt("fdpmember_id");

        /** 2) 데이터 조회하기 */
        // 이 값이 존재하지 않는다면 데이터가 조회가 불가능하므로 반드시 필수 값으로 처리해야한다.
        if (document_id == 0) {
            return webHelper.redirect(null, "게시물 번호가 없습니다.");
        }

        // Document 테이블 데이터
        Document input = new Document();
        input.setDocument_id(document_id);
        input.setFdpmember_id(fdpmember_id);
        Document output = null;

        try {
            // 데이터 조회
            output = documentService.getDocumentItem(input);
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }

        // 로그인한 유저가 자신이 쓴 글을 조회하면 조회수가 증가하지 않음
        int a = 0;
        if (session.getAttribute("PK") != null) {
            a = ((Integer) (session.getAttribute("PK"))).intValue();
        }

        if (output.getFdpmember_id() != a) {
            output.setHit(output.getHit() + 1);
            try {
                // 데이터 수정(조회수 증가 관련 업데이트)
                documentService.editDocument(output);
            } catch (Exception e) {
                return webHelper.redirect(null, e.getLocalizedMessage());
            }
        }

        // DocAnswer 테이블 데이터
        DocAnswer input1 = new DocAnswer();
        input1.setDocument_id(document_id);
        List<DocAnswer> output1 = null;

        try {
            // 의사 답글 데이터 조회
            output1 = docAnswerService.getDocAnswerList(input1);
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }

        // Comment 테이블 데이터
        Comment input3 = new Comment();
        input3.setDocument_id(document_id);
        List<Comment> output3 = null;

        try {
            // 댓글 데이터 조회
            output3 = commentService.getCommentList(input3);
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }

        // File 테이블 데이터
        NFile input4 = new NFile();
        input4.setDocument_id(document_id);
        List<NFile> output4 = null;

        try {
            // 첨부파일 데이터 조회
            output4 = fileService.getFileList(input4);
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }

        /** 3) view 처리 */
        model.addAttribute("output", output);
        model.addAttribute("output1", output1);
        model.addAttribute("output3", output3);
        model.addAttribute("output4", output4);
        return new ModelAndView("14_Notice_board_i");
    }

    /** 일반게시판 의사글(docAnswer) 저장, 수정에 대한 action 페이지 */
    @RequestMapping(value = "/14_Notice_board_docAns_ok.do", method = RequestMethod.POST)
    public ModelAndView Notice_board_docAns_ok(Model model) {
        /** 1) 필요한 변수값 생성 */
        int docAnswer_id = webHelper.getInt("docAnswer_id", 0);
        int document_id = webHelper.getInt("document_id");
        int fdpmember_id = webHelper.getInt("fdpmember_id");
        String content = webHelper.getString("content");
        SimpleDateFormat d = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Calendar time = Calendar.getInstance();
        String reg_date = d.format(time.getTime());

        // docAnswer_id가 0이면 답글 데이터 저장 처리
        if (docAnswer_id == 0) {

            /** 2) 데이터 조회하기 */
            // fdpmember 테이블 데이터
            Member input = new Member();
            input.setFdpmember_id(fdpmember_id);
            Member output = null;

            try {
                // member 데이터 조회
                output = memberService.getMemberItem(input);
            } catch (Exception e) {
                return webHelper.redirect(null, e.getLocalizedMessage());
            }

            // docAnswer 테이블 데이터
            DocAnswer docAnswer = new DocAnswer();
            docAnswer.setWriter_name(output.getName());
            docAnswer.setMedical_field(output.getMedical_field());
            docAnswer.setDocument_id(document_id);
            docAnswer.setContent(content);
            docAnswer.setFdpmember_id(fdpmember_id);
            docAnswer.setReg_date(reg_date);

            try {
                // 의사 답글(docAnswer) 데이터 저장
                docAnswerService.addDocAnswer(docAnswer);
            } catch (Exception e) {
                return webHelper.redirect(null, e.getLocalizedMessage());
            }

            Document document = new Document();
            document.setDocument_id(document_id);
            document.setDocA_ok(1);

            try {
                // 게시글 의사답변 태그(docA_ok) 데이터 수정(0 --> 1)
                documentService.editDocA_ok(document);
            } catch (Exception e) {
                return webHelper.redirect(null, e.getLocalizedMessage());
            }

            /** 3) 결과를 확인하기 위한 페이지 이동 */
            // 저장 결과를 확인하기 위해서 데이터 저장 시 생성된 PK 값을 상세페이지로 전달해야한다.
            String redirectUrl = contextPath + "/14_Notice_board_i.do?document_id=" + document_id;
            return webHelper.redirect(redirectUrl, "답글이 등록되었습니다.");

            // docAnswer_id가 0이 아니면 답글 수정 처리
        } else {
            /** 1) 사용자가 입력한 파라미터 수신 및 유효성 검사 */
            String writer_name = webHelper.getString("writer_name");
            String medical_field = webHelper.getString("medical_field");
            String edit_date = d.format(time.getTime());

            if (docAnswer_id == 0) {
                return webHelper.redirect(null, "의사 답글 번호가 없습니다.");
            }

            if (writer_name == null) {
                return webHelper.redirect(null, "작성자를 입력하세요.");
            }

            if (content == null) {
                return webHelper.redirect(null, "내용을 입력하세요.");
            }

            if (reg_date == null) {
                return webHelper.redirect(null, "등록일이 없습니다.");
            }

            /** 2) 의사 답글(docAnswer) 데이터 수정하기 */
            // 수정할 값들을 Beans에 담는다.
            DocAnswer input2 = new DocAnswer();

            input2.setDocAnswer_id(docAnswer_id);
            input2.setWriter_name(writer_name);
            input2.setContent(content);
            input2.setReg_date(reg_date);
            input2.setEdit_date(edit_date);
            input2.setMedical_field(medical_field);
            input2.setDocument_id(document_id);

            try {
                // 데이터 수정
                docAnswerService.editDocAnswer(input2);
            } catch (Exception e) {
                return webHelper.redirect(null, e.getLocalizedMessage());
            }
            /** 3) 결과를 확인하기 위한 페이지 이동 */
            // 저장 결과를 확인하기 위해서 데이터 저장 시 생성된 PK 값을 상세페이지로 전달해야한다.
            String redirectUrl = contextPath + "/14_Notice_board_i.do?document_id=" + document_id;
            return webHelper.redirect(redirectUrl, "답글이 수정되었습니다.");
        }
    }

    /** 일반게시판 댓글(comment) 저장, 수정에 대한 action 페이지 */
    @RequestMapping(value = "/14_Notice_board_comment_ok.do", method = RequestMethod.POST)
    public ModelAndView Notice_board_comment_ok(Model model) {
        /** 1) 필요한 변수값 생성 */
        int comment_id = webHelper.getInt("comment_id", 0);
        int document_id = webHelper.getInt("document_id");
        int fdpmember_id = webHelper.getInt("fdpmember_id");
        String content = webHelper.getString("content");
        String content1 = webHelper.getString("content1");
        // String writer_name = webHelper.getCookie("Name");(writer_name을 cookie를 이용해서
        // 가져오는 방법도 있음)
        String writer_name = webHelper.getString("writer_name");
        SimpleDateFormat d = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Calendar time = Calendar.getInstance();
        String reg_date = d.format(time.getTime());

        if (comment_id == 0) {
            // 이 값이 존재하지 않는다면 데이터 조회가 불가능하므로 반드시 필수값으로 처리해야 한다.
            if (content == null) {
                return webHelper.redirect(null, "댓글을 입력하세요.");
            }

            // 댓글(Comment) 테이블 데이터
            Comment comment = new Comment();
            comment.setWriter_name(writer_name);
            comment.setDocument_id(document_id);
            comment.setContent(content);
            comment.setFdpmember_id(fdpmember_id);
            comment.setReg_date(reg_date);

            try {
                // 댓글(comment) 데이터 저장
                commentService.addComment(comment);
            } catch (Exception e) {
                return webHelper.redirect(null, e.getLocalizedMessage());
            }

            /** 3) 결과를 확인하기 위한 페이지 이동 */
            // 저장 결과를 확인하기 위해서 데이터 저장 시 생성된 PK 값을 상세페이지로 전달해야한다.
            String redirectUrl = contextPath + "/14_Notice_board_i.do?document_id=" + document_id;
            return webHelper.redirect(redirectUrl, "댓글이 등록되었습니다.");
        } else {
            /** 1) 사용자가 입력한 파라미터 수신 및 유효성 검사 */
            String edit_date = d.format(time.getTime());

            if (comment_id == 0) {
                return webHelper.redirect(null, "댓글 번호가 없습니다.");
            }

            if (writer_name == null) {
                return webHelper.redirect(null, "작성자를 입력하세요.");
            }

            if (content1 == null) {
                return webHelper.redirect(null, "내용을 입력하세요.");
            }

            if (reg_date == null) {
                return webHelper.redirect(null, "등록일이 없습니다.");
            }

            /** 2) 데이터 수정하기 */
            // 수정할 값들을 Beans에 담는다.
            Comment input2 = new Comment();

            input2.setComment_id(comment_id);
            input2.setWriter_name(writer_name);
            input2.setFdpmember_id(fdpmember_id);
            input2.setContent(content1);
            input2.setEdit_date(edit_date);
            input2.setDocument_id(document_id);

            try {
                // 댓글(comment) 데이터 수정
                commentService.editComment(input2);
            } catch (Exception e) {
                return webHelper.redirect(null, e.getLocalizedMessage());
            }

            /** 3) 결과를 확인하기 위한 페이지 이동 */
            // 저장 결과를 확인하기 위해서 데이터 저장 시 생성된 PK 값을 상세페이지로 전달해야한다.
            String redirectUrl = contextPath + "/14_Notice_board_i.do?document_id=" + document_id;
            return webHelper.redirect(redirectUrl, "댓글이 수정되었습니다.");
        }
    }

    /** 일반 게시판 수정폼 페이지 */
    @RequestMapping(value = "/15_Notice_board_2.do", method = RequestMethod.GET)
    public ModelAndView Notice_board_2(Model model) {
        /** 1) 필요한 변수값 생성 */
        // 조회할 대상에 대한 PK값
        int document_id = webHelper.getInt("document_id");

        // 이 값이 존재하지 않는다면 데이터 조회가 불가능하므로 반드시 필수값으로 처리해야 한다.
        if (document_id == 0) {
            return webHelper.redirect(null, "게시물 번호가 없습니다.");
        }

        /** 2) 데이터 조회하기 */
        // 데이터 조회에 필요한 조건값을 Beans에 저장하기
        Document input = new Document();
        input.setDocument_id(document_id);

        // 조회결과를 저장할 객체 선언
        Document output = null;

        try {
            // 게시물(document) 데이터 조회
            output = documentService.getDocumentItem(input);
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }

        // 데이터 조회에 필요한 조건값을 Beans에 저장하기
        NFile input4 = new NFile();
        input4.setDocument_id(document_id);
        List<NFile> output4 = null;

        try {
            // 첨부파일(file) 데이터 조회
            output4 = fileService.getFileList(input4);
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }
        /** 3) View 처리 */
        model.addAttribute("output", output);
        model.addAttribute("output4", output4);
        return new ModelAndView("15_Notice_board_2");
    }

    /** 일반 게시판 수정폼에 대한 action 페이지 */
    @RequestMapping(value = "/15_Notice_board_2_ok.do", method = RequestMethod.POST)
    public ModelAndView Notice_board_i_ok(Model model) {
        /** 업로드를 수행 */
        try {
            webHelper.upload();
        } catch (Exception e) {
            e.printStackTrace();
        }

        /** 1) 사용자가 입력한 파라미터 수신 및 유효성 검사 */
        Map<String, String> paramMap = webHelper.getParamMap();
        int document_id = Integer.parseInt(paramMap.get("document_id"));
        String writer_name = paramMap.get("writer_name");
        String subject = paramMap.get("subject");
        String content = paramMap.get("content");
        int hit = Integer.parseInt(paramMap.get("hit"));
        String reg_date = paramMap.get("reg_date");
        // dou 0=삭제, 1=수정, 2=추가
        String dou = paramMap.get("dou");
        if (dou == null) {
            dou = "";
        }
        String file_id = paramMap.get("file_id");
        if (file_id == null) {
            file_id = "0";
        }

        SimpleDateFormat d = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Calendar time = Calendar.getInstance();
        String edit_date = d.format(time.getTime());

        if (document_id == 0) {
            return webHelper.redirect(null, "게시글 번호가 없습니다.");
        }

        if (writer_name == null) {
            return webHelper.redirect(null, "작성자를 입력하세요.");
        }

        if (subject == null) {
            return webHelper.redirect(null, "제목을 입력하세요.");
        }

        if (content == null) {
            return webHelper.redirect(null, "내용을 입력하세요.");
        }

        if (reg_date == null) {
            return webHelper.redirect(null, "등록일이 없습니다.");
        }

        List<UploadItem> fileList = webHelper.getFileList();
        // file(img) 개수
        int j = 0;
        // file_id 개수
        int k = 0;

        // 파일데이터가 다수인 경우
        if (dou.contains(",") == true) {
            // doulist로 변수 선언
            String[] doulist = dou.split(",");
            // file_id를 배열로 선언
            String[] fileidList = new String[3];

            // file_id가 다수일 경우(2개 이상)
            if (file_id.contains(",")) {
                fileidList = file_id.split(",");
            } else if (file_id != null) {
                fileidList[0] = file_id;
            }

            // i--> dou 개수
            for (int i = 0; i < doulist.length; i++) {
                /** 1) 파일데이터 삭제하기 */
                if (doulist[i].equals("0")) {
                    NFile input = new NFile();

                    // 데이터 삭제에 필요한 조건값을 Beans에 저장하기
                    input.setFile_id(Integer.parseInt(fileidList[k]));

                    // 데이터를 조회할 output4객체 생성
                    NFile output4 = null;

                    // file db 조회
                    try {
                        output4 = fileService.getFileItem(input);
                    } catch (Exception e) {
                        return webHelper.redirect(null, e.getLocalizedMessage());
                    }

                    // 첫번째 파라미터와 두번째 파라미터가 연결된다.
                    File f1 = new File(webHelper.getUploadDir(), output4.getFilePath());

                    // file 삭제
                    boolean del_ok = f1.delete();
                    System.out.println("파일 삭제 여부: " + del_ok);

                    k++;

                    try {
                        // 파일 데이터 삭제
                        fileService.deleteFile(input);
                    } catch (Exception e) {
                        return webHelper.redirect(null, e.getLocalizedMessage());
                    }
                    /** 2) 파일데이터 수정하기 */
                } else if (doulist[i].equals("1")) {
                    // 수정할 값들을 Beans에 담는다.
                    NFile input = new NFile();
                    UploadItem bb = fileList.get(j);
                    input.setFile_id(Integer.parseInt(fileidList[k]));
                    input.setContentType(bb.getContentType());
                    input.setDocument_id(bb.getDocument_id());
                    input.setFilePath(bb.getFilePath());
                    input.setFileSize(bb.getFileSize());
                    input.setOriginName(bb.getOriginName());
                    input.setFieldName(bb.getFieldName());

                    k++;

                    if (fileList.size() - 1 > j) {
                        j++;
                    }

                    try {
                        // 데이터 수정
                        fileService.editFile(input);
                    } catch (Exception e) {
                        return webHelper.redirect(null, e.getLocalizedMessage());
                    }
                    /** 2) 파일데이터 추가하기 */
                } else if (doulist[i].equals("2")) {
                    NFile input = new NFile();
                    UploadItem bb = fileList.get(j);
                    input.setContentType(bb.getContentType());
                    input.setDocument_id(document_id);
                    input.setFilePath(bb.getFilePath());
                    input.setFileSize(bb.getFileSize());
                    input.setOriginName(bb.getOriginName());

                    j++;

                    try {
                        // 데이터 저장
                        fileService.addFile(input);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
        }

        // 파일데이터가 단일인 경우
        if (dou.contains(",") == false) {
            /** 1) 파일데이터 삭제하기 */
            if (dou.equals("0")) {
                // 데이터 삭제에 필요한 조건값을 Beans에 저장하기
                NFile input = new NFile();
                input.setFile_id(Integer.parseInt(file_id));

                NFile output4 = null;

                // file db 조회
                try {
                    output4 = fileService.getFileItem(input);
                } catch (Exception e) {
                    return webHelper.redirect(null, e.getLocalizedMessage());
                }

                File f1 = new File(webHelper.getUploadDir(), output4.getFilePath());
                boolean del_ok = f1.delete();
                System.out.println("파일 삭제 여부: " + del_ok);

                try {
                    // 데이터 삭제
                    fileService.deleteFile(input);
                } catch (Exception e) {
                    return webHelper.redirect(null, e.getLocalizedMessage());
                }
                /** 2) 파일데이터 수정하기 */
            } else if (dou.equals("1")) {
                // 수정할 값들을 Beans에 담는다.
                NFile input = new NFile();

                input.setFile_id(Integer.parseInt(file_id));

                for (UploadItem aa : fileList) {
                    input.setContentType(aa.getContentType());
                    input.setFilePath(aa.getFilePath());
                    input.setFileSize(aa.getFileSize());
                    input.setOriginName(aa.getOriginName());
                    input.setFieldName(aa.getFieldName());
                }
                try {
                    // 데이터 수정
                    fileService.editFile(input);
                } catch (Exception e) {
                    return webHelper.redirect(null, e.getLocalizedMessage());
                }
                /** 2) 파일데이터 추가하기 */
            } else if (dou.equals("2")) {

                NFile input = new NFile();

                for (UploadItem aa : fileList) {
                    input.setContentType(aa.getContentType());
                    input.setDocument_id(document_id);
                    input.setFilePath(aa.getFilePath());
                    input.setFileSize(aa.getFileSize());
                    input.setOriginName(aa.getOriginName());
                    input.setFieldName(aa.getFieldName());
                }

                try {
                    // 데이터 저장
                    fileService.addFile(input);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

        }

        /** 2) 게시물(document) 데이터 수정하기 */
        // 수정할 값들을 Beans에 담는다.
        Document input = new Document();
        input.setDocument_id(document_id);
        input.setWriter_name(writer_name);
        input.setSubject(subject);
        input.setContent(content);
        input.setHit(hit);
        input.setReg_date(reg_date);
        input.setEdit_date(edit_date);
        try {
            // 데이터 수정
            documentService.editDocument(input);
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }

        /** 3) 결과를 확인하기 위한 페이지 이동 */
        // 수정한 대상을 상세페이지에 알려주기 위해서 PK값을 전달해야 한다.
        String redirectUrl = contextPath + "/14_Notice_board_i.do?document_id=" + input.getDocument_id();
        return webHelper.redirect(redirectUrl, "수정되었습니다.");
    }

    /** 일반 회원(medical_grade=2) 작성폼 페이지 */
    @RequestMapping(value = "/16_Notice_board_new.do", method = RequestMethod.GET)
    public ModelAndView Notice_board_new(Model model) {
        return new ModelAndView("16_Notice_board_new");
    }

    /** 일반 회원(medical_grade=2) 작성폼에 대한 action 페이지 */
    @ResponseBody
    @RequestMapping(value = "/16_Notice_board_new_ok.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
    public String Notice_board_new_ok() {
        /** 업로드를 수행 */
        try {
            webHelper.upload();
        } catch (Exception e) {
            e.printStackTrace();
        }
        /** 1) 사용자가 입력한 파라미터 수신 및 유효성 검사 */
        Map<String, String> paramMap = webHelper.getParamMap();
        String writer_name = paramMap.get("writer_name");
        String subject = paramMap.get("subject");
        String content = paramMap.get("content");
        int fdpmember_id = (int) webHelper.getSession("PK");
        int hit = 0;

        SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Calendar time = Calendar.getInstance();
        String reg_date = f.format(time.getTime());

        /** 2) 데이터 저장하기 */
        Document input = new Document();
        input.setWriter_name(writer_name);
        input.setSubject(subject);
        input.setContent(content);
        input.setHit(hit);
        input.setReg_date(reg_date);
        input.setFdpmember_id(fdpmember_id);
        input.setDocA_ok(0);
        System.out.println(input);
        try {
            // 데이터 저장
            // --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK 값이 저장된다.
            documentService.addDocument(input);
        } catch (Exception e) {
            e.printStackTrace();
        }

        List<UploadItem> fileList = webHelper.getFileList();
        for (UploadItem aa : fileList) {
            NFile file = new NFile();
            file.setContentType(aa.getContentType());
            file.setDocument_id(input.getDocument_id());
            file.setFile_id(aa.getFile_id());
            file.setFilePath(aa.getFilePath());
            file.setFileSize(aa.getFileSize());
            file.setOriginName(aa.getOriginName());
            file.setFieldName(aa.getFieldName());
            try {
                // 데이터 저장
                fileService.addFile(file);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        Gson gson = new Gson();
        return gson.toJson(input);
    }

    /** 일반게시판 docAnswer에 대한 삭제 페이지 */
    @RequestMapping(value = "/14_Notice_board_docAnswer_delete.do", method = RequestMethod.GET)
    public ModelAndView Notice_board_docAnswer_delete(Model model) {
        /** 1) 필요한 변수값 생성 */
        // 삭제할 대상에 대한 PK값
        int docAnswer_id = webHelper.getInt("docAnswer_id");
        int document_id = webHelper.getInt("document_id");

        // 이 값이 존재하지 않는다면 데이터 삭제가 불가능하므로 반드시 필수값으로 처리해야 한다.
        if (docAnswer_id == 0) {
            return webHelper.redirect(null, "의사 답글 번호가 없습니다.");
        }
        if (document_id == 0) {
            return webHelper.redirect(null, "게시글 번호가 없습니다.");
        }

        /** 2) 데이터 삭제하기 */
        // 데이터 삭제에 필요한 조건값을 Beans에 저장하기
        DocAnswer input = new DocAnswer();
        input.setDocAnswer_id(docAnswer_id);

        try {
            // 데이터 삭제
            docAnswerService.deleteDocAnswer(input);
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }

        input.setDocument_id(document_id);
        List<DocAnswer> output = null;

        try {
            // 의사데이터 조회
            output = docAnswerService.getDocAnswerList(input);
        } catch (Exception e) {
            System.out.println("의사 답글 없음");
        }

        if (output.isEmpty()) {
            Document document = new Document();
            document.setDocument_id(document_id);
            document.setDocA_ok(0);
            try {
                // 데이터 수정
                documentService.editDocA_ok(document);
            } catch (Exception e) {
                return webHelper.redirect(null, e.getLocalizedMessage());
            }
        }
        /** 3) 페이지 이동 */
        // 확인할 대상이 삭제된 상태이므로 목록 페이지로 이동

        return webHelper.redirect(contextPath + "/14_Notice_board_i.do?document_id=" + document_id, "의사 답글이 삭제되었습니다.");
    }

    /** 일반게시파 댓글(comment)에 대한 삭제 페이지 */
    @RequestMapping(value = "/14_Notice_board_comment_delete.do", method = RequestMethod.GET)
    public ModelAndView Notice_board_comment_delete(Model model) {
        /** 1) 필요한 변수값 생성 */
        // 삭제할 대상에 대한 PK값
        int comment_id = webHelper.getInt("comment_id");
        int document_id = webHelper.getInt("document_id");

        // 이 값이 존재하지 않는다면 데이터 삭제가 불가능하므로 반드시 필수값으로 처리해야 한다.
        if (comment_id == 0) {
            return webHelper.redirect(null, "댓글 번호가 없습니다.");
        }
        if (document_id == 0) {
            return webHelper.redirect(null, "게시글 번호가 없습니다.");
        }

        /** 2) 데이터 삭제하기 */
        // 데이터 삭제에 필요한 조건값을 Beans에 저장하기
        Comment input = new Comment();
        input.setComment_id(comment_id);

        try {
            // 데이터 삭제
            commentService.deleteComment(input);
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }

        /** 3) 페이지 이동 */
        // 확인할 대상이 삭제된 상태이므로 목록 페이지로 이동
        return webHelper.redirect(contextPath + "/14_Notice_board_i.do?document_id=" + document_id, "댓글이 삭제되었습니다.");
    }

    /** 일반 게시판 삭제 페이지 */
    @RequestMapping(value = "/15_Notice_board_delete.do", method = RequestMethod.GET)
    public ModelAndView Notice_board_delete(Model model, HttpServletRequest request) {
        /** 1) 필요한 변수값 생성 */
        // 삭제할 대상에 대한 PK값
        int document_id = webHelper.getInt("document_id");

        /** 컨트롤러에서 세션을 식별하기 위한 처리 */
        HttpSession session = request.getSession();
        String mySessionId = (String) session.getAttribute("session_id");
        // 이 값이 존재하지 않는다면 데이터 삭제가 불가능하므로 반드시 필수값으로 처리해야 한다.
        if (document_id == 0) {
            return webHelper.redirect(null, "게시글 번호가 없습니다.");
        }

        /** 2-1) 데이터 삭제하기(게시물 삭제 전 내용물 삭제) */
        /** DocAnswer테이블에서 특정 게시글(document_id)같은 값 삭제하기 */
        DocAnswer input1 = new DocAnswer();
        input1.setDocument_id(document_id);
        try {
            // 데이터 삭제
            docAnswerService.deleteDocAnswer(input1);
        } catch (Exception e) {
            e.printStackTrace();
        }

        /** Comment테이블에서 특정 게시글(document_id)같은 값 삭제하기 */
        Comment input2 = new Comment();
        input2.setDocument_id(document_id);

        try {
            // 데이터 삭제
            commentService.deleteComment(input2);
        } catch (Exception e) {
            e.printStackTrace();
        }

        /** File테이블에서 특정 게시글(document_id)같은 값 삭제하기 */
        NFile input3 = new NFile();
        input3.setDocument_id(document_id);

        List<NFile> output4 = null;

        // file db 조회
        try {
            output4 = fileService.getFileList(input3);
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }
        for (NFile aa : output4) {
            File f1 = new File(webHelper.getUploadDir(), aa.getFilePath());
            boolean del_ok = f1.delete();
            System.out.println("파일 삭제 여부: " + del_ok);
        }

        try {
            // 데이터 삭제
            fileService.deleteFile(input3);
        } catch (Exception e) {
            e.printStackTrace();
        }

        /** 2-2) 게시물 데이터 삭제하기 */
        // 데이터 삭제에 필요한 조건값을 Beans에 저장하기
        Document input = new Document();
        input.setDocument_id(document_id);

        try {
            // 데이터 삭제
            documentService.deleteDocument(input);

        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }

        /** 3) 페이지 이동 */
        // 확인할 대상이 삭제된 상태이므로 목록 페이지로 이동
        if (mySessionId == null) {
            return webHelper.redirect(contextPath + "/13_Notice_board.do", "삭제되었습니다.");
        } else {
            return webHelper.redirect(contextPath + "/23_Notice_board_s.do", "삭제되었습니다.");
        }
    }

    /** 관리자 게시판 checkbox 기능(삭제) 페이지 */
    @RequestMapping(value = "23_checkbox_Delete_ok.do")
    public ModelAndView allDelete_ok(Model model, HttpServletRequest request) {

        /** 1) 필요한 변수값 생성 */
        // 삭제할 대상에 대한 PK값
        String[] document_id1 = request.getParameterValues("document_id1[]");

        /** 2) 데이터 삭제하기 */
        for (int i = 0; i < document_id1.length; i++) {
            /** docAnswer 삭제 */
            // 데이터 삭제에 필요한 조건값을 Beans에 저장하기
            DocAnswer input5 = new DocAnswer();
            input5.setDocument_id(Integer.parseInt(document_id1[i]));

            try {
                docAnswerService.deleteDocAnswer(input5); // 데이터 삭제
            } catch (Exception e) {
                e.printStackTrace();
            }
            /** comment 삭제 */
            // 데이터 삭제에 필요한 조건값을 Beans에 저장하기
            Comment input6 = new Comment();
            input6.setDocument_id(Integer.parseInt(document_id1[i]));

            try {
                commentService.deleteComment(input6); // 데이터 삭제
            } catch (Exception e) {
                e.printStackTrace();
            }

            /** file 삭제 */
            NFile input7 = new NFile();
            input7.setDocument_id(Integer.parseInt(document_id1[i]));

            List<NFile> output4 = null;

            // file db 조회
            try {
                output4 = fileService.getFileList(input7);
            } catch (Exception e) {
                return webHelper.redirect(null, e.getLocalizedMessage());
            }

            for (NFile aa : output4) {
                File f1 = new File(webHelper.getUploadDir(), aa.getFilePath());
                boolean del_ok = f1.delete();
                System.out.println("파일 삭제 여부: " + del_ok);
            }

            try {
                // 데이터 삭제
                fileService.deleteFile(input7);
            } catch (Exception e) {
                e.printStackTrace();
            }

            /** document 삭제 */
            // 이 값이 존재하지 않는다면 데이터 삭제가 불가능하므로 반드시 필수값으로 처리해야 한다.
            if (document_id1[i] == null) {
                return webHelper.redirect(null, "회원 번호가 없습니다.");
            }

            // 데이터 삭제에 필요한 조건값을 Beans에 저장하기
            Document input8 = new Document();
            input8.setDocument_id(Integer.parseInt(document_id1[i]));

            try {
                documentService.deleteDocument(input8); // 데이터 삭제
            } catch (Exception e) {
                return webHelper.redirect(null, e.getLocalizedMessage());
            }
        }

        /** 3) 페이지 이동 */
        // 확인할 대상이 삭제된 상태이므로 목록 페이지로 이동
        return webHelper.redirect(contextPath + "23_Notice_board_s.do", "게시물 삭제가 완료되었습니다.");

    }

    /** 관리자 게시판 조회 페이지 */
    @RequestMapping(value = "/23_Notice_board_s.do", method = RequestMethod.GET)
    public ModelAndView Notice_board_s(Model model, @RequestParam(value = "keyword", defaultValue = "") String keyword) {
        /** 1) 필요한 변수 값 생성 */
        // String keyword = webHelper.getString("keyword", ""); // 검색어
        int nowPage = webHelper.getInt("page", 1); // 페이지 번호 (기본값 1)
        int totalCount = 0; // 전체 게시글 수
        int listCount = 10; // 한 페이지당 표시할 목록 수
        int pageCount = 5; // 한 그룹당 표시할 페이지 번호 수

        /** 2) 데이터 조회하기 */
        // 조회에 필요한 조건 값(검색어)를 Beans에 담는다.
        Document input = new Document();
        input.setWriter_name(keyword);
        input.setSubject(keyword);
        input.setContent(keyword);
        input.setHit(0);
        input.setReg_date(keyword);
        input.setEdit_date(keyword);

        List<Document> output = null; // 조회 결과가 저장될 객체
        PageData pageData = null; // 페이지 번호를 계산한 결과가 저장될 객체

        try {
            // 전체 게시글 수 조회
            totalCount = documentService.getDocumentCount(input);
            // 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
            pageData = new PageData(nowPage, totalCount, listCount, pageCount);

            // SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
            Document.setOffset(pageData.getOffset());
            Document.setListCount(pageData.getListCount());

            // 데이터 조회하기
            output = documentService.getDocumentList(input);
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }

        /** 3) View 처리 */
        model.addAttribute("keyword", keyword);
        model.addAttribute("output", output);
        model.addAttribute("pageData", pageData);
        String viewPath = "23_Notice_board_s";
        return new ModelAndView(viewPath);

    }

    /** 관리자 게시판 상세 페이지 */
    @RequestMapping(value = "/24_Notice_board_s_2.do", method = RequestMethod.GET)
    public ModelAndView Notice_board_s_2(Model model) {
        /** 1) 필요한 변수 값 생성 */
        // 조회할 대상에 대한 PK 값
        int document_id = webHelper.getInt("document_id");
        int fdpmember_id = webHelper.getInt("fdpmember_id");
        // 이 값이 존재하지 않는다면 데이터가 조회가 불가능하므로 반드시 필수 값으로 처리해야한다.
        if (document_id == 0) {
            return webHelper.redirect(null, "게시물 번호가 없습니다.");
        }

        /** 2) 데이터 조회하기 */
        // Document 테이블 데이터
        Document input = new Document();
        input.setDocument_id(document_id);
        input.setFdpmember_id(fdpmember_id);
        Document output = null;

        try {
            // 데이터 조회
            output = documentService.getDocumentItem(input);
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }

        // DocAnswer 테이블 데이터
        DocAnswer input1 = new DocAnswer();
        input1.setDocument_id(document_id);
        List<DocAnswer> output1 = null;

        try { // 데이터 조회
            output1 = docAnswerService.getDocAnswerList(input1);
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }

        // Comment 테이블 데이터
        Comment input3 = new Comment();
        input3.setDocument_id(document_id);
        List<Comment> output3 = null;

        try { // 데이터 조회
            output3 = commentService.getCommentList(input3);
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }

        NFile input4 = new NFile();
        input4.setDocument_id(document_id);
        List<NFile> output4 = null;

        try {
            output4 = fileService.getFileList(input4);
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }
        /** 3) view 처리 */
        model.addAttribute("output", output);
        model.addAttribute("output1", output1);
        model.addAttribute("output3", output3);
        model.addAttribute("output4", output4);
        return new ModelAndView("24_Notice_board_s_2");
    }
}
