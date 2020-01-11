<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!doctype html>
<html lang="ko"> 
 <head>
     <jsp:include page="./assets/inc/head.jsp" />
     <style type="text/css">
     	.container {
    		position: relative;
    		text-align: center;
    	}
    	
    	.title {
    		position: absolute;
    		left: 25px;
    		top: 10px;
    	}
    	
    	 	
    	#box1 {
			position: absolute;
			top: 50px;
			left: 380px;
			width: 370px;
			height: 500px;  
			/* background-color: #E0E0E0; */
			border-radius: 10px;	
    	}
    
    	.b {
    		position: absolute;
    		top: 180px;
    		left: 300px;
    		line-height: 220%;
    	}
    	
   		li {
    		list-style: none;
    		font-size: 16px;
    	}
    	
    	#joinbutton {
    		position: absolute;
    		bottom: 100px;
    		left: 490px;
    	}
    	.complete{
    		display: inline-block;
    		position: absolute;
    		bottom: 200px;
    		left: 380px;
    	}
    	
    	.table {
    		position: relative;
    		top: 400px;
    	}
    	
    	#welcome {
    		display: inline;
    		position: relative;
    		top: 100px;
    		left: -60px;
    		width: 500px;
    		height: 350px;
    	}
    	
    	#title1 {
    		position: relative;
    		top: 50px;
    		right: 15px;
    	}
    	
     </style>
 </head>
 <body>
 <jsp:include page="./assets/inc/top.jsp" />
	<div class="container"style="height:1100px;">
	<form name="myform" id="myform" action="index.do">
		<div id="box1">
			<h3 class="title"><strong>회원가입이 완료되었습니다!</strong></h3>	
			<h3 id="title1"><strong>입력하신 정보를 확인해주세요.</strong></h3>	
			<span><img id="welcome" alt="가입환영" src="./assets/img/welcome.png"></span>
		</div>
		 <div class="b">
		
		 <table class="table table-bordered table-hover">
		 	<tbody>
					<tr>
						<td class="text-center active" style="font-weight:bold;" width="130px;">아이디</td>
						<td class="text-left" width="400px;">${output.user_id}</td>
					</tr>
					<tr>
						<td class="text-center active" style="font-weight:bold;">이름</td>
						<td class="text-left">${output.name}</td>
					</tr>
					<tr>
						<td class="text-center active" style="font-weight:bold;">성별</td>
						<td class="text-left">
							<c:choose>
								<c:when test="${output.gender == 1}">남자</c:when>
								<c:when test="${output.gender == 2}">여자</c:when>
								<c:otherwise>${output.gender}</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr>
						<td class="text-center active" style="font-weight:bold;">생년월일</td>
						<td class="text-left">${output.birthdate}</td>
					</tr>
					<tr>
						<td class="text-center active" style="font-weight:bold;">이메일</td>
						<td class="text-left">${output.email}</td>
					</tr>
					<tr>
						<td class="text-center active" style="font-weight:bold;">주소</td>
						<td class="text-left">
							${output.addr1}&nbsp;
							${output.addr2}&nbsp;
							${output.addr3}&nbsp;
							${output.addr4}</td>
					</tr>
					<tr>
						<td class="text-center active" style="font-weight:bold;">연락처</td>
						<td class="text-left">${output.tel}</td>
					</tr>
			</tbody>
		 </table>
	 	</div>
	 <!-- <h4 class='complete'>'가입완료' 버튼을 누르시면 가입이 완료됩니다!</h4> -->
	 <button type="submit" id="joinbutton" class="btn btn-warning btn-lg" >메인페이지로</button>
	 </form>
	 
	</div>
	<jsp:include page="./assets/inc/bottom.jsp" /> 
</body>
</html>