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
		height: 300px;
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
	
	.idInput {
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
			<form>
				<div id="result">
					<h3>비밀번호 찾기</h3>
					<p>
						<label>ID</label>
						<input class="idInput" type="text" id="user_id" name="user_id" placeholder="ID를 입력하세요." required />
					</p>
					<p>
						<label>Email</label>
						<input class="emailInput" type="text" id="email" name="email" placeholder="이메일을 입력하세요." required />
					</p>
					<p class="center">
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
		
	<script>
	$("#findBtn").click(function(e) {
		e.preventDefault();
		var email=$("#email").val();
		var user_id=$("#user_id").val();
		console.log(email);
		console.log(user_id);
		
		if (!regex.value('#user_id', '아이디를 입력하세요.')) { return false; }
        if (!regex.value('#email', '이메일을 입력하세요.')) { return false; }
        if (!regex.email('#email', '이메일 주소가 잘못되었습니다.')) { return false; }
		
		$.ajax( {
			url:'25_find_pw_check.do',
			method:'post',
			data:{data:email, data1:user_id},
			dataType:'json',
			success:function(req){
				console.log(req);
				if(req == 1) {
					alert("존재하지 않는 이메일입니다.")
				} else if (req == 2) {
					alert("존재하지 않는 아이디입니다.")
				} else if (req == 3) {
					alert("아이디와 이메일이 존재하지 않습니다.")
				} else {
				pwd	 = "<h3>비밀번호 찾기 검색 결과</h3></div><div><p>해당 이메일로 임시 비밀번호를 전송하였습니다.</p>"
				pwd	+= "<p class='center'><a href='index.do' class='btn btn-lg btn-block'>Home</a</p>"
				
				$("#result").html(pwd);
			}
			}
		})
	})
	</script>
</body>
</html>