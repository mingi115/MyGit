<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!doctype html>
<html lang="ko">
<head>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/animate/animate.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/sweetalert/sweetalert2.min.css" />
	<jsp:include page="./assets/inc/head.jsp" />
	<style>

		/* 전체 박스 */
		.bbox {
			width: 1170px;
			margin: auto;
			min-height: 1000px;
		}

		/* 상단 박스 */
		.mybox {
			width: auto;
			height: 200px;
		}

		/* 중앙 박스 조절 */
		.box1 {
			width: 400px;
			height: 300px;
			font-weight: bold;
			font-size: 20px;
			color: white;
			background-color: #fff;
			text-align: center;
			line-height: 200px;
			position: absolute;
			top: 750px;
			left: 50%;
			margin-top: -100px;
			border-radius: 7px;
			visibility: hidden;
		}

		.box-left {
			margin-left: -450px;
		}

		.box-right {
			margin-left: 50px;
		}
		/* --box css 끝--*/

		/* 박스 별 상단 바 */
		.top {
			height: 50px;
			background: #757575;
			border-radius: 7px 7px 0 0;
		}

		.top .btn {
			position: absolute;
			top: 7px;
			right: 7px;
		}

		.top h4 {
			position: absolute;
			top: 5px;
			left: 15px;
		}

		/* 중앙 박스 안 조절 */
		.loog {
			margin: auto;
			width: 350px;
			height: 70px;
			font-weight: bold;
			font-size: 20px;
			background-color: #757575;
		}

		thead {
			border: 1px solid #ffa500;
		}

		thead tr th {
			font-size: 18px;
			border: 0px !important;
			background: #ffa500 !important;
		}

		tbody {
			border: 1px solid #ffa500;
		}

		tbody tr {
			color: #757575;
		}

		tbody tr td {
			font-size: 16px;
			height: 42px;
			cursor: pointer;
		}

		.imgbox {
			background-image:
			url("${pageContext.request.contextPath}/assets/img/lockicon.png");
			background-size: 100px;
			background-repeat: no-repeat;
			background-position: center top;
		}

		.imgbox2 {
			height: 250px;
			border: solid 1px #ccc;
			background: #f8f8f8;
			background-image:
			url("${pageContext.request.contextPath}/assets/img/xicon.png");
			background-size: 100px;
			background-repeat: no-repeat;
			background-position: 50% 30%;
		}

		.imgbox>.btn {
			position: relative;
			bottom: -50px;
		}

		.imgbox>h3 {
			position: relative;
			bottom: -120px;
		}

		.imgbox2>h3 {
			color: #757575;
			position: relative;
			bottom: -160px;
		}
		
		/* 차트 */
		#chartdiv {
			width: 100%;
			height: 600px;
		}
	</style>
</head>
<body>
	<jsp:include page="./assets/inc/top.jsp" />

	<div class="bbox">
		<div id="box2" class="header mybox">
			<h1>관리자 페이지</h1>
			<h4>회원관리 및 사이트 정보수정이 가능합니다.</h4>
			<hr />
		</div>
		<div class="page" id="page">
			<div class="box1 box-left" style="position: absolute; top: 375px; background: #ffa500;">
				<div class="top">
					<h4>Find Doctor를 더 안전하고 편리하게 관리하세요.</h4>
				</div>

				<c:if test="${empty session_id && empty session_pw}">
					<button type="button" class="btn loog" onclick="location.href ='22_Login_s.do'">
						Find Doctor 관리자 로그인
					</button>
				</c:if>
				
				<c:if test="${not empty session_id && not empty session_pw}">
					<div class="imgbox">
						<h3>관리자 ${my_session_name} 로그인</h3>
						<button type="button" id="btn6" class="btn btn-primary">
							로그아웃
						</button>
					</div>
				</c:if>

			</div>
			<div class="box1 box-right" style="position: absolute; top: 375px;">
				<div class="top">
					<h4 class="pull-left">게시판 관리</h4>
					<c:if test="${not empty session_id && not empty session_pw}">
						<button type="button" class="btn btn-primary pull-right" onclick="location.href ='23_Notice_board_s.do'">
							더보기
						</button>
					</c:if>
				</div>
				
				<c:if test="${empty session_id && empty session_pw}">
					<div class="imgbox2">
						<h3>관리자 로그인을 해주세요.</h3>
					</div>
				</c:if>

				<c:if test="${not empty session_id && not empty session_pw}">
					<table class="table table-hover">
						<thead>
							<tr>
								<th class="text-center">글 번호</th>
								<th class="text-center">제목</th>
								<th class="text-center">작성자</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
							
								<c:when test="${output == null || output.size() == 0}">
									<tr>
										<td class="text-center" colspan="3">게시물이 없습니다.</td>
									</tr>
								</c:when>
								
								<c:otherwise>
									<c:forEach var="i" begin="0" end="4" step="1">
										<tr onclick="location.href ='24_Notice_board_s_2.do?document_id=${output.get(i).document_id}'">
											<td class="text-center">
												${output.get(i).document_id}
											</td>
											<c:choose>
												<c:when test="${fn:length(output.get(i).subject) > 15}">
													<td class="text-center">
														${fn:substring(output.get(i).subject,0,15)}&nbsp;· · ·
													</td>
												</c:when>
												<c:otherwise>
													<td class="text-center">
														${output.get(i).subject}
													</td>
												</c:otherwise>
											</c:choose>
											<td class="text-center">
												${output.get(i).writer_name}
											</td>
										</tr>
									</c:forEach>
								</c:otherwise>
								
							</c:choose>
						</tbody>
					</table>
				</c:if>
				
			</div>
			<div class="box1 box-left">
				<div class="top">
					<h4 class="pull-left">누적 접속회원 통계</h4>
					<c:if test="${not empty session_id && not empty session_pw}">
						<button type="button" class="btn btn-primary pull-right" onclick="location.href ='29_User_stasis2.do'">
							더보기
						</button>
					</c:if>
				</div>
				
				<c:if test="${empty session_id && empty session_pw}">
					<div class="imgbox2">
						<h3>관리자 로그인을 해주세요.</h3>
					</div>
				</c:if>
				
				<c:if test="${not empty session_id && not empty session_pw}">
					<table class="table table-hover">
						<thead>
							<tr>
								<th class="text-center">회원 정보 통계</th>
							</tr>
						</thead>
						<tbody>
							<tr id="gr1" data-toggle="modal" data-target="#myModal">
								<td class="text-center">지역별</td>
							</tr>
							<tr id="gr2" data-toggle="modal" data-target="#myModal">
								<td class="text-center">남여별</td>
							</tr>
							<tr id="gr3" data-toggle="modal" data-target="#myModal">
								<td class="text-center">나이별</td>
							</tr>
							<tr id="gr4" data-toggle="modal" data-target="#myModal">
								<td class="text-center">나이 + 성별</td>
							</tr>
							<tr id="gr5" data-toggle="modal" data-target="#myModal">
								<td class="text-center">의사별</td>
							</tr>
						</tbody>
					</table>
				</c:if>
				
			</div>
			<div class="box1 box-right">
				<div class="top">
					<h4 class="pull-left">회원 관리</h4>
					<c:if test="${not empty session_id && not empty session_pw}">
						<button type="button" class="btn btn-primary pull-right" onclick="location.href ='28_User_stasis.do'">더보기</button>
					</c:if>
				</div>
				
				<c:if test="${empty session_id && empty session_pw}">
					<div class="imgbox2">
						<h3>관리자 로그인을 해주세요.</h3>
					</div>
				</c:if>
				<c:if test="${not empty session_id && not empty session_pw}">
					<table class="table table-hover">
						<thead>
							<tr>
								<th class="text-center">회원 번호</th>
								<th class="text-center">회원 이름</th>
								<th class="text-center">아이디</th>
								<th class="text-center">등급</th>
							</tr>
						</thead>
						<tbody>
						
							<c:choose>
								<c:when test="${output2 == null || output2.size() == 0}">
									<tr>
										<td class="text-center" colspan="3">게시물이 없습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="i" begin="0" end="4" step="1">
										<tr>
											<td class="text-center">${output2.get(i).fdpmember_id}</td>
											<td class="text-center">${output2.get(i).name}</td>
											<td class="text-center">${output2.get(i).user_id}</td>
											<td class="text-center">${output2.get(i).member_grade}</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>

						</tbody>
					</table>
				</c:if>
				
			</div>
		</div>

		<!-- .modal -->
		<div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<!-- .modal-dialog -->
			<div class="modal-dialog">
				<!-- .modal-content -->
				<div class="modal-content">
					<!-- 제목 -->
					<div class="modal-header">
						<!-- 닫기버튼 -->
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title" id="myModalLabel">
							통계
						</h4>
					</div>
					
					<!-- 내용 -->
					<div class="modal-body"></div>
					<div id="chartdiv"></div>
					
					<!-- 하단 -->
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">
							Close
						</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->
	</div>
	<jsp:include page="./assets/inc/bottom.jsp" />

	<script src="https://www.amcharts.com/lib/4/core.js"></script>
	<script src="https://www.amcharts.com/lib/4/charts.js"></script>
	<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>

	<script src="${pageContext.request.contextPath}/assets/plugins/animate/jquery.animatecss.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/plugins/sweetalert/sweetalert2.all.min.js"></script>
	<script type="text/javascript">
	
		$(function() {
			
			$("#gr1").click(function() {
				$.ajax({
					url : './assets/api/chart0.do',// 읽어들일 파일의 경로
					dataType : 'html', 				//읽어올 내용 형식(html, xml, json)
					// 통신 성공시 호출될 함수 (파라미터는 읽어온 내용)
					success : 
						function(req) {
						console.log(">> 성공!!! >> " + req);
						$(".modal-body").html(req);
					}
				});		//end $.ajax
			});		// end #gr1 click
			
			$("#gr2").click(function() {
				$.ajax({
					url : './assets/api/chart1.do',// 읽어들일 파일의 경로
					dataType : 'html', 				//읽어올 내용 형식(html, xml, json)
					// 통신 성공시 호출될 함수 (파라미터는 읽어온 내용)
					success : 
						function(req) {
						console.log(">> 성공!!! >> " + req);
						$(".modal-body").html(req);
					}
				});		//end $.ajax
			});		// end #gr2 click
			
			$("#gr3").click(function() {
				$.ajax({
					url : './assets/api/chart2.do',// 읽어들일 파일의 경로
					dataType : 'html', 				//읽어올 내용 형식(html, xml, json)
					// 통신 성공시 호출될 함수 (파라미터는 읽어온 내용)
					success : 
						function(req) {
						console.log(">> 성공!!! >> " + req);
						$(".modal-body").html(req);
					}
				});		//end $.ajax
			});		// end #gr3 click
			
			$("#gr4").click(function() {
				$.ajax({
					url : './assets/api/chart3.do',// 읽어들일 파일의 경로
					dataType : 'html', 				//읽어올 내용 형식(html, xml, json)
					// 통신 성공시 호출될 함수 (파라미터는 읽어온 내용)
					success : 
						function(req) {
						console.log(">> 성공!!! >> " + req);
						$(".modal-body").html(req);
					}
				});		//end $.ajax
			});		// end #gr4 click
			
			$("#gr5").click(function() {
				$.ajax({
					url : './assets/api/chart4.do',// 읽어들일 파일의 경로
					dataType : 'html', 				//읽어올 내용 형식(html, xml, json)
					// 통신 성공시 호출될 함수 (파라미터는 읽어온 내용)
					success : 
						function(req) {
						console.log(">> 성공!!! >> " + req);
						$(".modal-body").html(req);
					}
				});		//end $.ajax
			});		// end #gr5 click

			/** 페이지 열린 직후의 처리*/
			var box = $(".page").find(".box1"); 	// 0번째 `.page`요소에 있는 .box 얻기

			box.eq(0).animateCSS('fadeInLeft', {
				duration : 1500
			});

			box.eq(1).animateCSS('fadeInRight', {
				duration : 1500
			});

			box.eq(2).animateCSS('fadeInLeft', {
				duration : 1500
			});

			box.eq(3).animateCSS('fadeInRight', {
				duration : 1500
			});

			$("#btn6").click(function(e) {
				e.preventDefault();

				swal({
					title : '로그아웃', // 제목
					text : "로그아웃을 완료하시겠습니까?", // 내용
					type : 'warning', // 종류
					confirmButtonText : 'Yes', // 확인버튼 표시 문구
					showCancelButton : true, // 취소버튼 표시 여부
					cancelButtonText : 'No', // 취소버튼 표시 문구
				}).then(function(result) {
					if (result.value) {
						swal('완료', '로그아웃이 완료되었습니다.', 'success')
						$('.swal2-confirm').click(function() {
							parent.location.replace('session/delete.do')
						});
					} else if (result.dismiss === 'cancel') {
						swal('취소', '로그아웃이 취소되었습니다.', 'error');
					}
				});
			}); // btn6 끝
			
		}); // 끝
	</script>
</body>
</html>