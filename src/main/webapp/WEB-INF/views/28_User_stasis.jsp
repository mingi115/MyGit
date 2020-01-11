<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!doctype html>
<html lang="ko">
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/animate/animate.css" />
<jsp:include page="./assets/inc/head.jsp" />


<style>
	.bbox {
		width: 1170px;
		min-height: 770px;
		margin: auto;
		position: relative;
	}
	.table-main {
	width: 1170px;
	margin: auto;
	border: 1px solid #ddd;
	}

	#memberView {
		height: 750px;
		width: 30%;
		position: absolute;
		box-shadow: -20px 20px 30px -15px gray;
		background: #fff;
		right: 0;
		top: 0;
		visibility: hidden;
	}	
	
	.center { 
		width: 1170px;
		margin: auto;
	}
	
	.pagination {
 		padding-top: 10px;
		padding-left: 450px;
	}
	
	.search {
		padding-left: 300px;
	}
	
	thead > tr {
		background: #ffa500;
	}
	
	.btn {
		margin-left: 1px;
	}
	
	.btndel {
		margin-top: 15px;
	}
	
	/* 핸들바 CSS */

	#htop1 {
		height: 50px;
		width: auto;
	}
	
	#htop1 .cbtn {
		padding: 10px;
	}

	#htop2 {
		height: 60px;
		width: auto;
	}
	
	#htop2 h4 {
		margin: 15px;
	}
	
	#htop2 button {
		margin: 10px 5px;
	}
	
	#htop2 hr {
		width: 380px;
	}
	
	#htop3 {
		height: 640px;
		width: auto;
		padding-left: 15px;
	}
	
	#bbl {
		width: 65%;
		height: 50px;
	}
	
	#bbr {
		width: 35%;
		height: 150px;
	}
	
	#hheader {
		width: 200px;
		height: 50px;
		margin-bottom: 10px;
	}
	
	thead > tr > td {
		background-color: #fff;
	}
	
</style>
</head>

<body>
	<jsp:include page="./assets/inc/top.jsp" />
		<div class="bbox">
		<div class="hhheader">
			<h2><b>&nbsp;&nbsp;&nbsp;회원관리 페이지</b></h2>
		</div>
		<hr />
		

		<div class="center">
			
				<table class="table table-main table-hover">
					<thead>
						<tr>
							<th class="text-center" style="width: 50px;">
								<input type='checkbox' id="all_check">
							</th>
							<th class="text-center">회원번호</th>
							<th class="text-center">이름</th>
							<th class="text-center">아이디</th>
							<th class="text-center">이메일</th>
							<th class="text-center">전화번호</th>
							<th class="text-center">성별</th>
							<th class="text-center">지역</th>
							<th class="text-center">회원등급</th>
							<th class="text-center">가입일</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<%-- 조회결과가 없는 경우 --%>
							<c:when test="${output == null || fn:length(output) ==0 }">
								<tr>
									<td colspan="11" align="center">조회결과가 없습니다.</td>
								</tr>
							</c:when>
							<%-- 조회결과가 있는 경우 --%>
							<c:otherwise>
								<%-- 조회 결과에 따른 반복 처리 --%>
								<c:forEach var="item" items="${output}" varStatus="status">
									<%-- 출력을 위해 준비한 검색어 변수 --%>
									<c:set var="name" value="${item.name}" />
									<c:set var="user_id" value="${item.user_id}" />
									<c:set var="addr2" value="${item.addr2}" />
	
									<%-- 검색어가 있다면? --%>
									<c:if test="${keyword != ''}">
										<%-- 검색어에 <mark> 태그를 적용하여 형광펜 효과 준비 --%>
										<c:set var="mark" value="<mark>${keyword}</mark>" />
										
										<%-- 출력을 위해 준비한 이름에서 검색어와 일치하는 단어를 형광펜 효과로 변경 --%>
										<c:set var="name"
										value="${fn:replace(name, keyword, mark)}" />
										<c:set var="user_id"
										value="${fn:replace(user_id, keyword, mark)}" />
										<c:set var="addr2"
										value="${fn:replace(addr2, keyword, mark)}" />
									</c:if>
	
									<tr>
										<th class="text-center">
											<input type='checkbox' class="checkBtn" name="checkBtn" value="${item.fdpmember_id}">
										</th>
										<td align="center">${item.fdpmember_id}</td>
										<td align="center"><a class="bbttnn" href="${item.fdpmember_id}">${name}</a></td>
										<td align="center">${user_id}</td>
										<td align="center">${item.email}</td>
										<td align="center">${item.tel}</td>
										<td align="center">
											<c:if test="${item.gender eq 1}">남</c:if>
											<c:if test="${item.gender eq 2}">여</c:if>
										</td>
										<td align="center">${addr2}</td>
										<td align="center">
											<c:if test="${item.member_grade eq 0}">관리자</c:if>
											<c:if test="${item.member_grade eq 1}">의사</c:if>
											<c:if test="${item.member_grade eq 2}">일반인</c:if>
										</td>
										<td align="center">${item.reg_date}</td>
									</tr>
	
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
				
			<!-- 페이지 번호 구현 div 시작-->
			<button type='button' class="btn btn-default pull-right btndel" id="checkbtn">선택 삭제</button>
			<div id="pageBottom">
				<ul class="pagination">			 
					<li class="disabled">
					<%-- 이전 그룹에 대한 링크 --%>
					<c:choose>
						<c:when test="${pageData.prevPage > 0}">
							<%-- 이동할 URL 생성 --%>
							<c:url value="/28_User_stasis.do" var="prevPageUrl">
								<c:param name="page" value="${pageData.prevPage}" />
								<c:param name="keyword" value="${keyword}" />
							</c:url>
							<li><a href="${prevPageUrl}">&lt;</a></li>
						</c:when>
						<c:otherwise>
							<li class="disabled"><a>&lt;</a></li>
						</c:otherwise>
					</c:choose>
					</li>
					
					<%-- 페이지 번호 (시작 페이지 부터 끝 페이지까지 반복) --%>
					<c:forEach var="i" begin="${pageData.startPage}"
						end="${pageData.endPage}" varStatus="status">
						<%-- 이동할 URL 생성 --%>
						<c:url value="/28_User_stasis.do" var="pageUrl">
							<c:param name="page" value="${i}" />
							<c:param name="keyword" value="${keyword}" />
						</c:url>
	
						<%-- 페이지 번호 출력 --%>
						<c:choose>
							<%-- 현재 머물고 있는 페이지 번호를 출력할 경우 링크 적용 안함 --%>
							<c:when test="${pageData.nowPage == i}">
								<li class="active"><a>${i}</a></li>
							</c:when>
							<%-- 나머지 페이지의 경우 링크 적용함 --%>
							<c:otherwise>
								<li><a href="${pageUrl}">${i}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					
					<%-- 다음 그룹에 대한 링크 --%>
					<c:choose>
						<%-- 다음 그룹으로 이동 가능하다면? --%>
						<c:when test="${pageData.nextPage > 0}">
							<%-- 이동할 URL 생성 --%>
							<c:url value="/28_User_stasis.do" var="nextPageUrl">
								<c:param name="page" value="${pageData.nextPage}" />
								<c:param name="keyword" value="${keyword}" />
							</c:url>
							<li><a href="${nextPageUrl}">&gt;</a></li>
						</c:when>
						<c:otherwise>
							<li class="disabled"><a>&gt;</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			
			<!-- 검색폼 -->
			<form method="get" class="search"
				action="${pageContext.request.contextPath}/28_User_stasis.do">
				<label for="keyword"></label> <input type="search" class="form-control pull-left" style="width: 500px;"
					name="keyword" id="keyword" placeholder="이름/아이디/지역 검색" value="${keyword}" />
				<button type="submit" class="btn btn-default pull-left">검색</button>
			</form>
			
			</div>
			<!-- 페이지 번호구현 div 끝 -->
			
			<input type="hidden" id="check" value="${my_session_id}" />		
		</div>
		
		<aside>
			<div id="memberView"></div>
		</aside>
	</div>

	<!-- 동적으로 생성될 HTML의 기본틀 -->
	<script type="text/x-handlebars-template" id="list-item-tmpl">
		<div class='membertmpl clearfix'>

			<div id="htop1">
				<div>
					<button type="submit" class="close cbtn" aria-hidden="true">&times;&nbsp;닫기</button>
				</div>
			</div>
			<div id="htop2">
				<h4 class="pull-left"><strong>회원 상세정보</strong></h4>
				<button type="submit" class="btn btn-default pull-right" id="btn5">
					회원탈퇴
				</button>
				<button type="submit" class="btn btn-default pull-right"
					onclick = "location.href = '${pageContext.request.contextPath}/27_Profile.do?fdpmember_id={{fdpmember_id}}'">
					회원수정
				</button>
				<hr />
			</div>
			<div id="htop3">
				<div id="hheader">
					<div id="bbl" class="pull-left">
						<h3><strong>{{name}}</strong></h3>
					</div>
				</div>
				<div id="hfooter">
					<table class="table table-hover">
						<thead>
							<tr>
								<th class="text-center">회원번호</th>
								<td align="center">{{fdpmember_id}}</td>
							</tr>
							<tr>
								<th class="text-center">아이디</th>
								<td align="center">{{user_id}}</td>
							</tr>
							<tr>
								<th class="text-center">비밀번호</th>
								<td align="center">{{user_pw}}</td>
							</tr>
							<tr>
								<th class="text-center">이메일</th>
								<td align="center">{{email}}</td>
							</tr>
							<tr>
								<th class="text-center">성별</th>
								<td align="center">{{convertGender gender}}</td>
							</tr>
							<tr>
								<th class="text-center">생년월일</th>
								<td align="center">{{birthdate}}</td>
							</tr>
							<tr>
								<th class="text-center">우편번호</th>
								<td align="center">{{addr1}}</td>
							</tr>
							<tr>
								<th class="text-center">주소</th>
								<td align="center">{{addr2}}</td>
							</tr>
							<tr>
								<th class="text-center">상세주소</th>
								<td align="center">{{addr3}}</td>
							</tr>
							<tr>
								<th class="text-center">참고항목</th>
								<td align="center">{{addr4}}</td>
							</tr>
							<tr>
								<th class="text-center">회원 가입일</th>
								<td align="center">{{reg_date}}</td>
							</tr>
							<tr>
								<th class="text-center">회원 정보 수정일</th>
								<td align="center">{{edit_date}}</td>
							</tr>
							<tr>
								<th class="text-center">회원 등급</th>
								<td align="center">{{convertMember_grade member_grade}}</td>
							</tr>
							<tr>
								<th class="text-center">전공분야</th>
								<td align="center">{{convertMedical_field medical_field}}</td>
							</tr>
						</thead>
					</table>
				</div>
			</div>

    	</div>
	</script>
	<jsp:include page="./assets/inc/bottom.jsp" />
	<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/plugins/animate/jquery.animatecss.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/plugins/sweetalert/sweetalert2.all.min.js"></script>
	<!-- ajax-helper -->
	<script src="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.js"></script>
	<script src="${pageContext.request.contextPath}/assets/plugins/handlebars/handlebars-v4.3.1.js"></script>
	
	<script>
		// 세션 없을 때는 21로 
		$(document).ready(function(){
				var sessionCheck = $('#check').attr('value');
				console.log(sessionCheck)
			    if(sessionCheck == '') {
					location.href="${pageContext.request.contextPath}/21_Management.do";
			        alert("세션이 만료 되었습니다. 로그인 후 이용하세요.");
			}   
		});

		/** handlebars 플러그인 안에 convertGender 함수 추가 */
		Handlebars.registerHelper('convertGender', function(g) {
			if (g == 1) {
				return "남자";
			} else {
				return "여자";
			}
		});
		
		/** handlebars 플러그인 안에 convertMember_grade 함수 추가 */
		Handlebars.registerHelper('convertMember_grade', function(m) {
			if (m == 0) {
				return "관리자";
			} else if (m == 1) {
				return "의사";
			} else {
				return "일반인";
			}
		});
		
		/** handlebars 플러그인 안에 convertMedical_field 함수 추가 */
 		Handlebars.registerHelper('convertMedical_field', function(d) {
			if (d == "01") {
				return "내과";
			} else if (d == '03') {
				return "정신건강의학과";
			} else if (d == '04') {
				return "외과";
			} else if (d == '05') {
				return "정형외과";
			} else if (d == '06') {
				return "신경외과";
			} else if (d == '08') {
				return "성형외과";
			} else if (d == '09') {
				return "마취통증의학과";
			} else if (d == '10') {
				return "산부인과";
			} else if (d == '11') {
				return "소아청소년과";
			} else if (d == '12') {
				return "안과";
			} else if (d == '13') {
				return "이비인후과";
			} else if (d == '14') {
				return "피부과";
			} else if (d == '15') {
				return "비뇨기과";
			} else if (d == '21') {
				return "재활의학과";
			} else if (d == '49') {
				return "치과";
			} else if (d == '80') {
				return "한의학과";
			}
		});
		
		$(function() {
			/* #all_check의 선택 상태가 변경되었을 때의 이벤트 */
			$("#all_check").change(function() {
				// 모든 .checkBtn의 선택 상태를 `#all_check`와 동일하게 맞춘다.
	            $(".checkBtn").prop('checked', $(this).prop('checked'));
			});
			
			/* 체크박스 버튼 클릭 시 전체 체크 버튼 끄기 */
			$(".checkBtn").click(function() {
				$("#all_check").prop('checked', false);
			});
			
			/* 선택 삭제 클릭 */
			$("#checkbtn").click(function() {
				
				var check_list = $(".checkBtn:checked");
				
                // 배열의 길이가 0이라면 선택된 항목이 없다는 의미이므로 중단
                if (check_list.length == 0) {
                    alert("선택된 항목이 없습니다.");
                    return false
                }
                
				var checkboxValues = [];
			    $("input[name='checkBtn']:checked").each(function() {
			        checkboxValues.push($(this).val());
			    });	
			    
			    var allData = { 'fdpmember_id': checkboxValues };
			    console.log(allData);
			    
				swal({
					title : '확인', // 제목
					text : "선택한 회원들을 모두 탈퇴 시키시겠습니까?", // 내용
					type : 'question', // 종류
					confirmButtonText : 'Yes', // 확인버튼 표시 문구
					showCancelButton : true, // 취소버튼 표시 여부
					cancelButtonText : 'No', // 취소버튼 표시 문구
				}).then(function(result) { // 버튼이 눌러졌을 경우의 콜백 연결
					if (result.value) { // 확인 버튼이 눌러진 경우
						swal('완료', '회원 탈퇴가 완료 되었습니다.', 'success')
						$('.swal2-confirm').click(function() {
							
			                $.ajax({
			                    url : "allDelete_ok.do",
			                    type : "post",
			                    dataType : "text",
			                    data : allData,
			                    success     :
									function(data) {
										console.log(">> 성공!!! >> " + data);
										window.location = "${pageContext.request.contextPath}/28_User_stasis.do";
			                    }
			                }); // ajax 끝
			                
						});
					} else if (result.dismiss === 'cancel') {
						swal('취소', '탈퇴가 취소되었습니다.', 'error');
					}
				}) // swal 끝
			   
			});
			
			/* 회원 상세 정보 버튼 */
			$(".bbttnn").click(function(e) {
				e.preventDefault();
				
				var src = $(this).attr('href');
				
				$("#memberView").animateCSS('fadeInRight')
	
				console.log(src)
				
				$.ajax({
					url: "GMember.do",
					method: 'post',
					dataType: 'json',
					data: {fdpmember_id : src},
					success: function(req) {
							
						// 핸들바 템플릿 생성
						var template = Handlebars.compile($("#list-item-tmpl").html());
						var html = template(req);
						$("#memberView").html(html);
						
						$("#btn5").click(function(e) {
							e.preventDefault();
							if (!confirm("정말 " + req.name + " 님을(를) 탈퇴시키시겠습니까?")) {
								return false;
							} else {
								window.location = "ddelete_ok.do?fdpmember_id="+ req.fdpmember_id;
							}
						});
						
						// 닫기 버튼
						$('.cbtn').click(function(e) {
							e.preventDefault();
							$("#memberView").animateCSS('fadeOutRight')
							setTimeout(function() {
								$("div[id='memberView']").css("visibility","hidden")
							}, 1000);
						}); // 닫기 끝
					}
				});		// ajax	끝
			});		// click 끝
		});
	</script>
</body>
</html>