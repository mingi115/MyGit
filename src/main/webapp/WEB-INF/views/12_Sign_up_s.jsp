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
    	
    	#welcome {
    		display: inline;
    		position: absolute;
    		top: 100px;
    		left: 200px;
    		width: 400px;
    		height: 400px;
    	}
    	
    	h1 {
    		display: inline;
    		position: absolute;
    		top: 180px;
    		left: 650px;
    	}
    	
    	#move {
    		position: absolute;
    		top: 300px;
    		left: 670px;
    		color: #273347;
    		width: 270px;
    		height: 60px;
    		letter-spacing: 1px;
    		font-size: 20px;
    	}
    	
    	#move:hover {
    		text-decoration: underline;
    	}
    </style>   
</head>
  <body>
  <jsp:include page="./assets/inc/top.jsp" />
	<div class="container"style="height:700px;">
		<span><img id="welcome" alt="가입환영" src="./assets/img/welcome.png"></span>
		<h1>가입을 환영합니다!!</h1>
		<button type="button" id="move" class="btn btn-lg" onclick="location.href='index.do'"><strong>메인페이지로 이동</strong></button>
	 </div>
	 
	 <jsp:include page="./assets/inc/bottom.jsp" /> 
</body>
</html>