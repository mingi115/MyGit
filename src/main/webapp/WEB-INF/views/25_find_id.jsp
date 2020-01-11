<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text.css" href="./assets/plugins/ajax/ajax_helper.css">
<head>
<style>
	.btn {
		background: #666;
		color: white;
	}

	
	.box1 {
		width: 948px;
		height: 234px;
		margin: auto;
		border: 1px solid #eee;
		padding: 0.15px 16px;
		box-shadow: -20px 20px 30px -15px gray;
	}
	
	.emailInput {
		width: 910px;
		
		border: 2px solid #666;
		border-top: 0;
		border-left: 0;
		border-right: 0;
	}
</style>
<jsp:include page="./assets/inc/head.jsp" />
<meta charset="UTF-8">
<title>find ID</title>
</head>
<body>
	<div class="box0">
		<div class="box1">
			<form method="post" action="25_find_id_check.do">
				<div>
					<h3>아이디 찾기</h3>
				</div>
				<div>
					<p>
						<label>Email</label>
						<input class="emailInput" type="text" id="email" name="email" placeholder="이메일을 입력하세요." required />
					</p>
					<p class="w3-center">
						<button type="submit" id="findBtn" class="btn btn-lg btn-block">find</button>
						<button type="button" onclick="history.go(-1);" class="btn btn-lg btn-block">Cancel</button>
					</p>
				</div>
			</form>
		</div>
	</div>
	
	<script src="./assets/js/jquery.min.js"></script>
    <script src="./assets/js/bootstrap.min.js"></script>
    <script src="./assets/plugins/ajax/ajax_helper.js"></script>
    <script src="./assets/js/regex.js"></script>
    
    <script src="${pageContext.request.contextPath}/assets/plugins/handlebars/handlebars-v4.3.1.js"></script>
    <script type="text/x-handlebars-template" id="list-item-tmpl">
					<div><h3>아이디 찾기 검색 결과</h3>
					</div>
						<div>
							<p>{{name}}님의 ID는 <b>{{user_id}}</b>입니다.</p>
							<p class="center">
								<button type="button" onclick = "location.href = '${pageContext.request.contextPath}/02_Login.do'" class="btn btn-lg btn-block">
									Login하기
								</button>
							</p>
						</div>
	</script>
	<script>
	$("#findBtn").click(function(e) {
		e.preventDefault();
		var email=$("#email").val();
		console.log(email);
		
		if (!regex.value('#email', '이메일을 입력하세요.')) { return false; }
		
		$.ajax( {
			url:'25_find_id_check.do',
			method:'post',
			data:{data:email},
			dataType:'json',
			success:function(req){
				// 핸들바 템플릿 생성
				if (req != null){
					var template = Handlebars.compile($("#list-item-tmpl").html());
					var html = template(req);
					$(".box1").html(html);
				} else  {
					var check_id  = "<div><h3>아이디 찾기 검색 결과</h3></div>"
						check_id += "<div><p>가입된 회원의 Email이 아닙니다. 회원 가입을 해주세요.</p>"
						check_id +=	"<p class='center'><a href = '${pageContext.request.contextPath}/09_Sign_up_a.do'' class='btn btn-lg btn-block'>회원 가입으로 이동</a></p></div>"
						
						$(".box1").html(check_id);
				}		
			}
		})
	})
		
	
	</script>
</body>
</html>