<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<jsp:include page="./assets/inc/head.jsp" />
<link rel="stylesheet" href="./assets/css/bootstrap.min.css" />

<!-- ajax-helper -->
<link rel="stylesheet" href="./assets/plugins/ajax/ajax_helper.css" />

<style type="text/css">

/* 전체 박스 */
/* 차트 */
.tab-content {
	padding: 100px 0;
	margin: auto;
}

/** 탭 */
.nav-tabs>li>a {
	width: 110px;
	text-align: center;
	font-size: 16px;
	font-weight: bold;
	color: #757575;
}
</style>
</head>

<body>
	<jsp:include page="./assets/inc/top.jsp" />
	
	<div class="container" style="min-height: 750px;">

		<h1 class="page-header">회원 정보 통계</h1>
		<div>
			<!-- 탭 버튼 구성 -->
			<ul class="nav nav-tabs" id="mytab">
				<li><a href="#dept" id="gr1" data-toggle="tab">지역</a></li>
				<li><a href="#dept" id="gr2" data-toggle="tab">성별</a></li>
				<li><a href="#dept" id="gr3" data-toggle="tab">나이</a></li>
				<li><a href="#dept" id="gr4" data-toggle="tab">나이+성별</a></li>
				<li><a href="#dept" id="gr5" data-toggle="tab">의사</a></li>
			</ul>

			<div class="tab-content">
				<div role="tabpanel" class="tab-pane" id="dept"></div>
				<div id="chartdiv"></div>
			</div>
			<!-- 탭 박스 끝 -->
		</div>
	<input type="hidden" id="check" value="${my_session_id}" />
	</div>
	<jsp:include page="./assets/inc/bottom.jsp" />
	
	<script src="./assets/js/jquery.min.js"></script>
	<script src="./assets/js/bootstrap.min.js"></script>
	<script src="./assets/plugins/ajax/ajax_helper.js"></script>

	<!-- amcharts -->
	<script src="https://www.amcharts.com/lib/4/core.js"></script>
	<script src="https://www.amcharts.com/lib/4/charts.js"></script>
	<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>

	<script>
		// 세션 없을 때는 21로 
		$(document).ready(function() {
			var sessionCheck = $('#check').attr('value');
			console.log(sessionCheck)
			if(sessionCheck == '') {
			location.href="${pageContext.request.contextPath}/21_Management.do";
			alert("세션이 만료 되었습니다. 로그인 후 이용하세요.");
			}   
		});
			
		$(function() {
			
			$("#gr1").click(function(e) {
				$.ajax({
					url : './assets/api/chart0.do',// 읽어들일 파일의 경로
					dataType : 'html', 				//읽어올 내용 형식(html, xml, json)
					// 통신 성공시 호출될 함수 (파라미터는 읽어온 내용)
					success : 
						function(req) {
						console.log(">> 성공!!! >> " + req);
						$("#dept").html(req);
					}
				});		//end $.ajax
			});		// end #gr1 click
			
			$("#gr2").click(function(e) {
				$.ajax({
					url : './assets/api/chart1.do',// 읽어들일 파일의 경로
					dataType : 'html', 				//읽어올 내용 형식(html, xml, json)
					// 통신 성공시 호출될 함수 (파라미터는 읽어온 내용)
					success : 
						function(req) {
						console.log(">> 성공!!! >> " + req);
						$("#dept").html(req);
					}
				});		//end $.ajax
			});	// end #gr2 click
			
			$("#gr3").click(function(e) {
				$.ajax({
					url : './assets/api/chart2.do',// 읽어들일 파일의 경로
					dataType : 'html', 				//읽어올 내용 형식(html, xml, json)
					// 통신 성공시 호출될 함수 (파라미터는 읽어온 내용)
					success : 
						function(req) {
						console.log(">> 성공!!! >> " + req);
						$("#dept").html(req);
					}
				});		//end $.ajax
			});	// end #gr3 click
			
			$("#gr4").click(function(e) {
				$.ajax({
					url : './assets/api/chart3.do',// 읽어들일 파일의 경로
					dataType : 'html', 				//읽어올 내용 형식(html, xml, json)
					
					// 통신 성공시 호출될 함수 (파라미터는 읽어온 내용)
					success : 
						function(req) {
						console.log(">> 성공!!! >> " + req);
						$("#dept").html(req);
					}
				});		//end $.ajax
			});	// end #gr4 click
			
			$("#gr5").click(function(e) {
				$.ajax({
					url : './assets/api/chart4.do',// 읽어들일 파일의 경로
					dataType : 'html', 				//읽어올 내용 형식(html, xml, json)
					// 통신 성공시 호출될 함수 (파라미터는 읽어온 내용)
					success : 
						function(req) {
						console.log(">> 성공!!! >> " + req);
						$("#dept").html(req);
					}
				});		//end $.ajax
			});	// end #gr5 click
		});
	</script>

</body>
</html>