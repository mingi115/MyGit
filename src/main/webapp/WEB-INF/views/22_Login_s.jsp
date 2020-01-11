<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!doctype html>
<html lang="ko">
<head>
<jsp:include page="./assets/inc/head.jsp" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/plugins/sweetalert/sweetalert2.min.css" />

<style>
.bbox {
	width: 1170px;
	margin: auto;
	padding-top: 50px;
}

.top {
	text-align: center;
	margin: 20px 0;
}

.top span {
	display: block;
}

.content {
	margin: auto;
	width: 600px;
	height: 400px;
	margin-bottom: 50px;
	border-radius: 10px;
	text-align: center;
}

.content label {
	display: block;
	font-size: 20px;
}

#login-form {
	padding-top: 30px;
}

.content input {
	width: 75%;
	height: 50px;
	margin: auto;
	margin-bottom: 30px;
}

.content>.form-block>.btn {
	margin: auto;
	width: 80%;
}

#login-form #btn8 {
	width: 450px;
	height: 100px;
	margin: auto;
	background-color: #696969;
	font-size: 50px;
}
</style>

</head>
<body>
	<jsp:include page="./assets/inc/top.jsp" />
	<div class="bbox">
		<div class="container" style="min-height: 700px;">
			<div class="top">
				<span> <img
					src="${pageContext.request.contextPath}/assets/img/user.png">
				</span> <span> 관리자 로그인 </span>
			</div>
			<div class="content" style="background: #ffa500;">

				<form id="login-form" class="form-block" method="post"
					action="${pageContext.request.contextPath}/check.do">
					<label for="user_id"> 아이디 </label> 
					<input type="text" name="user_id" id="user_id" class="form-control"
						placeholder="관리자용 ID를 입력해주세요." />
					<label for="user_pw"> 비밀번호 </label> 
					<input type="password" name="user_pw" id="user_pw" class="form-control"
						placeholder="비밀번호를 입력해주세요. " />
					<button type="submit" id="btn8"
						class="btn btn-primary btn-lg btn-block">로그인</button>
				</form>

			</div>
		</div>

	</div>
	<jsp:include page="./assets/inc/bottom.jsp" />
	<script src="${pageContext.request.contextPath}/assets/js/regex.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/plugins/sweetalert/sweetalert2.all.min.js"></script>
	<script>
		$(function() {
			$("#btn8").click(function(e) {
				e.preventDefault();

				if (!regex.value('#user_id', '아이디를 입력하세요.')) {
					return false;
				}

				if (!regex.value('#user_pw', '비밀번호를 입력하세요.')) {
					return false;
				}

				swal({
					title : '접속', // 제목
					text : "로그인 하시겠습니까?", // 내용
					type : 'success', // 종류
					confirmButtonText : 'Yes', // 확인버튼 표시 문구
					showCancelButton : true, // 취소버튼 표시 여부
					cancelButtonText : 'No', // 취소버튼 표시 문구
				})

				$('.swal2-confirm').click(function() {
					$('form').submit();
				});

			});
		});
	</script>
</body>
</html>