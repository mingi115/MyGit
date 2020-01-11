<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="ko">
<style type="text/css">
/** 테이블 설정 */
.table2 {
	width: 1140px;
	margin: auto;
}

/** 테이블 최소 크기 설정 */
.table111 {
	min-height: 500px;
}

/** 하단 버튼들 li를 가로로 정렬하기 */
.a {
	display: inline-block;
}

/** 하단의 버튼들 위치 조절 */
.bottom-button {
	padding: 15px 0 30px 15px;
}

/** 댓글 설정 */
.comment {
	list-style: none;
	padding-left: 0;
	padding-top: 30px;
}

/** 하단 버튼이 있는 박스 크기 설정 */
.b {
	width: 1140px;
}

/** 게시물 상단 타이틀바 설정 */
.subject_content {
	background-color: #eee;
	height: 80px;
}

/** 상세페이지 게시물 상단바 - 제목, 작성자, 작성일, 수정일 */
.title_info {
	margin-bottom: -15px;
}

/** 의사 답변 컨텐츠의 제목 부분 설정 */
.table .doc_ans_title {
	padding: 0 2 0 0;
	border-bottom: 1px dotted;
	font-size: 20px;
}

.docA {
	float: right;
	margin-right: 3px;
}

.qna {
	font-color: orange;
	font-size: 50px;
}

.bcd {
	font-size: 13px;
}
/** 게시글 내용 칸 크기*/
.ctt {
	min-height: 250px;
}

.file {
	display: inline-block;
	margin-right: 30px;
	width:320px !important;
}

.fileimg {
	display: block;
	width: 100%;
	height: 100%;
	align: center;
}

.filediv {
	overflow: hidden;
	width: 320px;
	height: 200px;
}
.fname{
	display:block;
	overflow:hidden;
	white-space:nowrap;
	text-overflow:ellipsis;
	}
</style>
<head>
<jsp:include page="./assets/inc/head.jsp" />
</head>

<body>
	<jsp:include page="./assets/inc/top.jsp" />
	<div class="container" style="min-height: 500px;">
		<h1 id="title">Q &amp; A</h1>
		<p id="description">자유로운 질문과 전문의의 답변을 확인하실 수 있습니다.</p>
		<div class="table2">
			<form method="post" action="14_Notice_board_docAns_ok.do">
				<table class="table table-bordered table111">
					<tbody>
						<tr class="subject_content">
							<td>
								<h4>${output.subject}</h4>
								<h6 class="title_info">
									작성자:${output.writer_name} &nbsp;&nbsp; 작성일: ${output.reg_date}
									&nbsp;&nbsp; <span style='display: none'>${item.fdpmember_id}</span>
									<c:choose>
										<c:when test="${output.edit_date != null}">
											수정일: ${output.edit_date} &nbsp;&nbsp;
										</c:when>
									</c:choose>
									조회수: ${output.hit}
								</h6>
							</td>
						</tr>
						<tr>
							<td>
								<div class="ctt">${output.content}</div>
							</td>
						</tr>
						<c:choose>
							<c:when test="${output4 != null}">
								<tr>
									<td>
										<ul>
											<c:forEach var="item" items="${output4}" varStatus="status">
												<li class="file">
													<div class="filediv">
														<a href="${pageContext.request.contextPath}/download.do?file=${item.filePath}">
															<img src="${pageContext.request.contextPath}/download.do?file=${item.filePath}" class="fileimg" />
														</a>
													</div> <span class="fname">${item.originName}</span>
												</li>
											</c:forEach>
										</ul>
									</td>
								</tr>
							</c:when>
						</c:choose>
				</table>
			</form>

			<form method="post" action="14_Notice_board_docAns_ok.do">
				<table class="table table-bordered">
					<c:choose>
						<%-- 의사 답변이 없는 경우 --%>
						<c:when test="${output1 == null || fn:length(output1) == 0}">
							<tr id="doc_del">
								<td colspan="6">
									<h5>
										<b>전문의 소견</b>
									</h5> <br />
									관리할 의사의 답변이 없습니다.
								</td>
							</tr>
						</c:when>
						<%-- 조회 결과가 있는 경우 --%>
						<c:otherwise>
							<%-- 출력을 위해 준비한 의사답변..., 내용, 제목 --%>
							<c:forEach var="item" items="${output1}" varStatus="status">
								<%-- 출력을 위해 준비한 의사답변 작성자명, 내용, 제목 --%>
								<tr>
									<td>
										<h4>${item.writer_name}
											의사님 처방 <span style='display: none' id="DAI${status.index}">${item.docAnswer_id}</span>
													<span class="docmng">
													</span>
										</h4>
										<h6>
											전문 분야 :
											<c:choose>
												<c:when test="${item.medical_field == '4' }">외과</c:when>
												<c:when test="${item.medical_field == '5' }">정형외과</c:when>
												<c:when test="${item.medical_field == '6' }">신경외과</c:when>
												<c:when test="${item.medical_field == '8' }">성형외과</c:when>
												<c:when test="${item.medical_field == '1' }">내과</c:when>
												<c:when test="${item.medical_field == '9' }">마취통증의학과</c:when>
												<c:when test="${item.medical_field == '10' }">산부인과</c:when>
												<c:when test="${item.medical_field == '11' }">소아청소년과</c:when>
												<c:when test="${item.medical_field == '12' }">안과</c:when>
												<c:when test="${item.medical_field == '13' }">이비인후과</c:when>
												<c:when test="${item.medical_field == '14' }">피부과</c:when>
												<c:when test="${item.medical_field == '15' }">비뇨기과</c:when>
												<c:when test="${item.medical_field == '21' }">재활의학과</c:when>
												<c:when test="${item.medical_field == '49' }">치과</c:when>
												<c:when test="${item.medical_field == '80' }">한의학과</c:when>
											</c:choose>
											&nbsp;&nbsp; 답변일: ${item.reg_date}&nbsp;&nbsp;
											<c:choose>
												<c:when test="${item.edit_date != null}">
													수정일: ${item.edit_date}
												</c:when>
											</c:choose>
										</h6>
									</td>
								</tr>
								<tr>
									<td id="${status.index}"><div>${item.content}</div></td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
					</tbody>
					<tbody id="abc"></tbody>
				</table>
			</form>

			<form method="post" action="14_Notice_board_comment_ok.do">
				<table class="table table-bordered">
					<tbody>
						<tr>
							<td>
								<h5>
									<b>댓글</b>
								</h5> <br />
									<input type="hidden" value="${Name}"
										name="writer_name" />
									<input type="hidden" value="${output.document_id}" name="document_id" />
									<input type="hidden" value="${PK}" name="fdpmember_id" />
								<c:choose>
									<c:when test="${output3 == null || fn:length(output3) == 0}">관리할 댓글이 없습니다.</c:when>
								<c:otherwise>
								<c:forEach var="item1" items="${output3}" varStatus="status">
									<span style='display: none' id="CIa${status.index}">${item1.comment_id}</span>
									<ul class="comment">
										<!-- 목록의 개별 항목이 웹진 박스로 구성됩니다. -->
										<li>
											<!-- 제목영역의 float 처리를 위한 마감제 박스 -->
											<div class="clearfix">
												<!-- 제목에 float: left 적용 - pull-left -->
												<h5 class="pull-left">${item1.writer_name}&nbsp;&nbsp;
													<c:choose>
														<c:when test="${item1.edit_date == null}">
															<small>${item1.reg_date}</small>
														</c:when>
														<c:otherwise>
															<small>${item1.edit_date}</small>
														</c:otherwise>
													</c:choose>
												</h5>
												<!-- 제목에 float: right 적용 - pull-right -->
												<div class="pull-right cmtmng">
												</div>
											</div>
											<p id="a${status.index}">${item1.content}</p>
										</li>
									</ul>
									</c:forEach>
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
		<div class="clearfix b">
			<ul class="pull-right bottom-button">
				<li class="a"><input type="button" value="삭제"
					onclick="del(${output.document_id})" class="btn btn-default btn-sm"
					id="btn1" /></li>
				<c:choose>
					<c:when test="${fn:length(output1) != 0 || fn:length(output3) != 0}">
				<li class="a">
					<input type="button" value="수정" class="btn btn-default btn-sm btn3" />
				</li>
					</c:when>
				</c:choose>
<!-- 				<li class="a"><a href="23_Notice_board_s.do"
					class="btn btn-default btn-sm" id="btn2">공지등록 </a></li> -->
				<li class="a"><a href="23_Notice_board_s.do"
					class="btn btn-default btn-sm">메뉴</a></li>
			</ul>
		</div>
	</div>
	<jsp:include page="./assets/inc/bottom.jsp" />
	<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="./assets/plugins/sweetalert/sweetalert2.all.min.js"></script>
	<script>
	function del(document_id) {
		var chk = confirm("정말 게시글을 삭제하시겠습니까?");
		if(chk) {
			location.href='15_Notice_board_delete.do?document_id=' + ${output.document_id};
		}
	}

		/* $(function() {
			$("#btn1").click(function(e) {
				e.preventDefault();
				// 확인, 취소버튼에 따른 후속 처리 구현
				swal({
					title : '확인', // 제목
					text : "정말 게시글을 삭제하시겠습니까?", // 내용
					type : 'warning', // 종류
					confirmButtonText : 'Yes', // 확인버튼 표시 문구
					showCancelButton : true, // 취소버튼 표시 여부
					cancelButtonText : 'No', // 취소버튼 표시 문구
				}).then(function(result) { // 버튼이 눌러졌을 경우의 콜백 연결
					if (result.value) { // 확인 버튼이 눌러진 경우
						swal('삭제 ', '삭제가 취소 되었습니다.', 'error');
						$('.swal2-confirm').click(function() {
							parent.location.replace('23_Notice_board_s.jsp');
						});
					}
				});
			});
		}); */

		$(function() {
			$("#btn2").click(function(e) {
				e.preventDefault();
				// 확인, 취소버튼에 따른 후속 처리 구현
				swal({
					title : '확인', // 제목
					text : "공지사항으로 등록하시겠습니까?", // 내용
					type : 'warning', // 종류
					confirmButtonText : 'Yes', // 확인버튼 표시 문구
					showCancelButton : true, // 취소버튼 표시 여부
					cancelButtonText : 'No', // 취소버튼 표시 문구
				}).then(function(result) { // 버튼이 눌러졌을 경우의 콜백 연결
					if (result.value) { // 확인 버튼이 눌러진 경우
						swal('삭제', '성공적으로 등록되었습니다.', 'success');
					} else if (result.dismiss === 'cancel') { // 취소버튼이 눌러진 경우
						swal('취소', '공지사항 등록이 취소되었습니다.', 'error');
					}
				});
			});
		});

		$(".btn3").click(
				function() {
					var mng1  = "<a href='14_Notice_board_comment_delete.do?comment_id=${item1.comment_id}&document_id=${item1.document_id}' title='삭제' class='pull-right bcd'>"
						mng1 += "<i class='glyphicon glyphicon-remove'></i></a>"
						mng1 += "<a href='a${status.index}' title='수정' class='pull-right bcd btn6'>"
						mng1 += "<i class='glyphicon glyphicon-edit'></i></a>"

					var	mng2  = "<a href='14_Notice_board_docAnswer_delete.do?docAnswer_id=${item.docAnswer_id}&document_id=${output.document_id}' title='삭제' class='pull-right bcd'>"
						mng2 += "<i class='glyphicon glyphicon-remove'></i></a>"
						mng2 += "<a href='${status.index}' title='수정' class='pull-right bcd btn4'>"
						mng2 += "<i class='glyphicon glyphicon-edit'></i></a>"
						$(".cmtmng").html(mng1);
						$(".docmng").html(mng2);
				})


	</script>
</body>
</html>
