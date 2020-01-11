<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!doctype html>
<html lang="ko">
<head>
<jsp:include page="./assets/inc/head.jsp" />

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

.content span {
	display: block;
	font-size: 20px;
	margin: 20px;
	padding-top: 20px;
}

.content label {
	font-size: 20px;
}

#login-form {
	padding-top: 50px;
}

.content input {
	width: 75%;
	height: 50px;
	margin: auto;
	margin-bottom: 30px;
}

.content>.form-block>.btn {
	margin: auto;
	margin-top: 75px;
	width: 80%;
}

#login-form #btn7 {
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
				<span> <img src="${pageContext.request.contextPath}/assets/img/user.png">
				</span> <span> <b>회원 정보 수정</b>
				</span>
			</div>
			<div class="content" style="background: #ffa500;">
				<span> <strong>개인정보 보호를 위해 한번 더 비밀번호를 입력해주세요.</strong>
				</span>
				<form id="login-form" class="form-block" method="post"
					action="${pageContext.request.contextPath}/check2.do">
					<label for="user_pw">비밀번호</label> <input type="password"
						name="user_pw" id="user_pw" class="form-control"
						placeholder="비밀번호를 입력하세요." />
					<button type="submit" class="btn btn-primary btn-lg btn-block"
						id="btn7">로그인</button>
				</form>
			</div>

		</div>
	</div>
	<jsp:include page="./assets/inc/bottom.jsp" />
	<script src="${pageContext.request.contextPath}/assets/js/regex.js"></script>
	<script>
		$(function() {
			$("#btn7").click(function(e) {
				e.preventDefault();

				if (!regex.value('#user_pw', '비밀번호를 입력하세요.')) {
					return false;
				}

				$('form').submit();

			});
		});
	</script>
</body>
</html>