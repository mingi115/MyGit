<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="ko">
<head>
<jsp:include page="./assets/inc/head.jsp" />
<title>Notice_board</title>
<style type="text/css">
/** 테이블 설정 */
.table {
	width: 1140px;
	margin: auto;
	border: 1px solid #ccc;
}

/** 게시판 thead 색상 설정 */
thead {
	background-color: #ffb011;
}

/** 테이블 상단의 전체 선택과 search가 묶여 있는 박스 -> 테이블 크기와 맞춘 박스(고정시켜 페이지가 줄어도 search와 전체선택이 아래로 내려가지 않도록) */
#h {
	margin: auto;
	width: 1140px;
}

/** 우측 상단 전체 선택 체크박스 설정 */
#all_check {
	display: inline-block;
	margin-top: 40px;
	margin-left: 8px;
}

/** 우측 상단 검색 부분 설정 */
#search {
	padding: 5px 12px;
	border: 1px solid #ccc;
	border-radius: 4px;
	display: inline-block;
}

/** 검색에 placeholder 색상 밑 투명도 조절 */
::placeholder {
	color: #999;
	opacity: 1;
}

/** 하단 페이지 번호 표시 */
.pagination {
	padding-left: 450px;
	display: inline-block;
}

/** 하단 우측 버튼 부분 가로로 정렬 */
.a {
	display: inline-block;
}
 
/** 검색 부분과 하단의 버튼들 위치 조절 */
.pull-right {
	padding: 15px 0;
}

/** 게시판 레스트에 대한 테이블 비율 설정 */
.subject {
	width: 40%;
}

/** 의사 답변 완료 태그 */
.danok {
	background-color: #666;
	padding: 3.5px;
	border-radius: 5px;
	color: white;
	font-size: 12px;
}

/** 게시판리스트 페이지 전체 크기 */
.container {
	min-height: 700px;
}


.bottombox {
	width: 1140px;
}

.searchingbox {
	padding-left: 300px;
}
</style>
</head>

<body>
	<jsp:include page="./assets/inc/top.jsp" />
	<div class="container">
		<h1 id="title">Q &amp; A</h1>
		<p id="description">자유로운 질문과 전문의의 답변을 확인하실 수 있습니다.</p>

		<!-- 조회 결과 목록 -->
		<div class="table1">
			<table class="table table-hover">
				<thead>
					<tr>
						<th class="text-center numbering">#</th>
						<th class="subject">제목</th>
						<th></th>
						<th class="text-center writer">작성자</th>
						<th class="text-center reg_date">조회수</th>
						<th class="text-center hit">작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<%-- 조회결과가 없는 경우 --%>
						<c:when test="${output == null || fn:length(output) == 0}">
							<tr>
								<td colspan="6" align="center">조회 결과가 없습니다.</td>
							</tr>
						</c:when>
						<%-- 조회 결과가 있는 경우 --%>
						<c:otherwise>
							<%-- 조회 결과에 따른 반복 처리 --%>
							<c:forEach var="item" items="${output}" varStatus="status">
								<%-- 출력을 위해 준비한 게시판 작성자명, 내용, 제목 --%>
								<c:set var="subject" value="${item.subject}" />
								<c:set var="writer_name" value="${item.writer_name}" />
								<c:set var="content" value="${item.content}" />
								<c:set var="hit" value="${item.hit}" />
								<c:set var="reg_date" value="${item.reg_date}" />
								<c:set var="edit_date" value="${item.edit_date}" />
								<c:set var="fdpmember_id" value="${item.fdpmember_id}" />
								<c:set var="docA_ok" value="${item.docA_ok}"></c:set>
								<%-- 검색어가 있다면? --%>
								<c:if test="${keyword != ''}">
									<%-- 검색어에 <mark> 태그를 적용하여 형광팬 효과 준비 --%>
									<c:set var="mark" value="<mark>${keyword}</mark>" />

									<%-- 출력을 위해 준비한 학과이름과 위치에서 검색어와 일치하는 단어를 형광팬 효과로 변경 --%>
									<c:set var="writer_name"
										value="${fn:replace(writer_name, keyword, mark)}" />
									<c:set var="subject"
										value="${fn:replace(subject, keyword, mark)}" />
								</c:if>

								<%-- 상세페이지로 이동하기 위한 URL --%>
								<c:url value="/14_Notice_board_i.do" var="viewUrl">
									<c:param name="document_id" value="${item.document_id}" />
									<c:param name="fdpmember_id" value="${PK}" />
								</c:url>

								<tr>
									<td align="center">${item.document_id}</td>
									<td><a href="${viewUrl}" id="sub1">${subject}</a></td>	
									<td>
										<c:choose>
											<c:when test="${docA_ok != 0}">
											<span class="danok">답변 완료</span>
											</c:when>
										</c:choose>
									</td>
									<td align="center">${writer_name}</td>
									<td align="center">${hit}</td>
									<td align="center">${reg_date}</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		<div class="bottombox">
		<!-- 페이지 번호 구현 div 시작-->
				<ul class="pagination">			 
					<li class="disabled">
					<%-- 이전 그룹에 대한 링크 --%>
					<c:choose>
						<c:when test="${pageData.prevPage > 0}">
							<%-- 이동할 URL 생성 --%>
							<c:url value="/13_Notice_board.do" var="prevPageUrl">
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
						<c:url value="/13_Notice_board.do" var="pageUrl">
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
							<c:url value="/13_Notice_board.do" var="nextPageUrl">
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
			<!-- 페이지 번호구현 div 끝 -->
			
			<!-- 로그인 시 글쓰기 버튼 활성화 -->
			<c:choose>
				<c:when test="${PK != null}">
					<ul class="clearfix pull-right">
						<li class="a"><a
							href="${pageContext.request.contextPath}/16_Notice_board_new.do?document_id="
							class="btn btn-default btn-sm">글쓰기</a>
						</li>
					</ul>
				</c:when>
			</c:choose>
			
				<!-- 검색폼 -->
			<form method="get"
				action="${pageContext.request.contextPath}/23_Notice_board_s.do">
				<fieldset class="searchingbox">
					<input type="search" name="keyword" id="keyword search"
						class="form-control pull-left" style="width: 500px;"
						placeholder="작성자명 or 제목 검색" value="${keyword}" />
					<button class="btn btn-default pull-left" type="submit">검색</button>
				</fieldset>
			</form>
			</div>
		</div>
	</div>
	<jsp:include page="./assets/inc/bottom.jsp" />
	<script src="./assets/plugins/sweetalert/sweetalert2.all.min.js"></script>
	<script>
		$(function() {
			$("#btn1").click(function(e) {

				e.preventDefault();

				// 확인, 취소버튼에 따른 후속 처리 구현
				swal({
					title : '확인', // 제목
					text : "정말 선택하신 항목을 삭제하시겠습니까?", // 내용
					type : 'warning', // 종류
					confirmButtonText : 'Yes', // 확인버튼 표시 문구
					showCancelButton : true, // 취소버튼 표시 여부
					cancelButtonText : 'No', // 취소버튼 표시 문구
				}).then(function(result) { // 버튼이 눌러졌을 경우의 콜백 연결
					if (result.value) { // 확인 버튼이 눌러진 경우
						swal('삭제', '성공적으로 삭제되었습니다.', 'success');
					} else if (result.dismiss === 'cancel') { // 취소버튼이 눌러진 경우
						swal('취소', '삭제가 취소되었습니다.', 'error');
					}
				});
			});
		});

		$(function() {
			/* `#all_check`의 선택 상태가 변경되었을 때의 이벤트 */
			$("#all_check").change(function() {
				// 모든 `.hobby`의 선택 상태를 `#all_check`와 동일하게 맞춘다.
				$(".all").prop('checked', $(this).prop('checked'));
			});
		});

		var hit = 0;

		$(function() {
			$("#sub1").click(function() {
				hit++;
				console.log(hit);
			});
		});
	</script>
</body>
</html>