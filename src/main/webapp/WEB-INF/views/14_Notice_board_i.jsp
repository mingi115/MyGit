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

.comment_login {
	border: solid 1px #ccc;
	width: 1100px;
	height: 40px;
	color: #bbb;
	padding-top: 10px;
	padding-left: 5px;
	border-radius: 6px;
}

.comment_login1 {
	color: #888;
	border-bottom: 1px solid #888;
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

							<td><h4>${output.subject}</h4>
								<h6 class="title_info">
									작성자: ${output.writer_name} &nbsp;&nbsp; 작성일: ${output.reg_date}
									&nbsp;&nbsp; <span style='display: none'>${item.fdpmember_id}</span>
									<c:choose>
										<c:when test="${output.edit_date != null}">
							수정일: ${output.edit_date} &nbsp;&nbsp;
								</c:when>
									</c:choose>
									조회수: ${output.hit}
								</h6></td>
						</tr>
						<tr>
							<td>
								<div class="ctt">${output.content}</div>
							</td>
						</tr>
						<c:choose>
							<c:when test="${output4 ne '[]'}">
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
									</h5> <br /> 현재까진 의사의 답변이 없습니다.
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

											<c:choose>
												<c:when test="${PK == item.fdpmember_id}">
													<a
														href="14_Notice_board_docAnswer_delete.do?docAnswer_id=${item.docAnswer_id}&document_id=${output.document_id}"
														title="삭제" class="pull-right bcd"> <i
														class="glyphicon glyphicon-remove"></i>
													</a>
													<a href="${status.index}" title="수정"
														class="pull-right bcd btn4"> <i
														class="glyphicon glyphicon-edit"></i>
													</a>
												</c:when>
											</c:choose>
										</h4>
										<h6>
											전문 분야 :
											<c:choose>
												<c:when test="${item.medical_field == '04' }">외과</c:when>
												<c:when test="${item.medical_field == '05' }">정형외과</c:when>
												<c:when test="${item.medical_field == '06' }">신경외과</c:when>
												<c:when test="${item.medical_field == '08' }">성형외과</c:when>
												<c:when test="${item.medical_field == '01' }">내과</c:when>
												<c:when test="${item.medical_field == '09' }">마취통증의학과</c:when>
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
			<br />
			<h4>
				<b>댓글</b>
			</h4>
			<form method="post" action="14_Notice_board_comment_ok.do">
				<table class="table">
					<tbody>
						<tr>
							<td>
								<div class="input-group">
									<c:choose>
										<c:when test="${PK != null}">
											<input type="text" class="form-control" name="content"
												placeholder="댓글을 입력하세요.">
											<span class="input-group-btn">
												<button class="btn btn-default" type="submit">등록</button>
											</span>
										</c:when>
										<c:otherwise>
											<p class="comment_login">
												댓글을 작성하려면 FDP로 <b><a
													href="02_Login.do?document_id=${output.document_id}"
													class="comment_login1">로그인</a></b>&nbsp;해주세요.
											</p>
										</c:otherwise>
									</c:choose>
									<input type="hidden" value="${Name}"
										name="writer_name" />
									<input type="hidden" value="${output.document_id}" name="document_id" />
									<input type="hidden" value="${PK}" name="fdpmember_id" />
									</div>
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
												<div class="pull-right">
													<c:choose>
														<c:when test="${PK == item1.fdpmember_id}">
															<a
																href="14_Notice_board_comment_delete.do?comment_id=${item1.comment_id}&document_id=${item1.document_id}"
																title="삭제" class="pull-right bcd"> <i
																class="glyphicon glyphicon-remove"></i>
															</a>
															<a href="a${status.index}" title="수정"
																class="pull-right bcd btn6"> <i
																class="glyphicon glyphicon-edit"></i>
															</a>

														</c:when>
													</c:choose>
												</div>
											</div>
											<p id="a${status.index}">${item1.content}</p>
										</li>
									</ul>
								</c:forEach>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
		<div class="clearfix b">
			<ul class="pull-right bottom-button">
				<c:choose>
					<c:when test="${PK == output.fdpmember_id}">
				<li class="a"><input type="button" value="삭제"
					onclick="del(${output.document_id})" class="btn btn-default btn-sm"
					id="btn1" /></li>
				<li class="a"><a
					href="${pageContext.request.contextPath}/15_Notice_board_2.do?document_id=${output.document_id}"
					class="btn btn-default btn-sm">수정</a></li>
					</c:when>
				</c:choose>
				<li class="a"><a
					href="${pageContext.request.contextPath}/13_Notice_board.do"
					class="btn btn-default btn-sm">메뉴</a></li>
				<c:choose>
					<c:when test="${UserGrade == 1}">
						<li class="a"><input type="button" value="의사 글쓰기"
							class="btn btn-default btn-sm doc_a" id="btn2" /></li>
					</c:when>
				</c:choose>
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
			</script>

	<script type="text/javascript"
		src="./assets/plugins/ckeditor/ckeditor.js"></script>
	<script>
			var doc_feedback;
			$("#btn2").click(function(){
					$("#doc_del").empty();	// 의사가 글 작성할 때 아래의 의사 답변 내용이 없습니다 테이블 삭제됨
						doc_feedback = "<tr><td><h5>${Name}의사님 답변</h5></td></tr>"
						doc_feedback +="<tr><td colspan='2' style='border-bottom: 0;'><input type='hidden' value='${output.document_id}' name='document_id' /><input type='hidden' value='${PK}' name='fdpmember_id' /><textarea name='content' id='d_content'></textarea></td></tr>"
						doc_feedback +=	"<tr ><td class='clearfix' style='border-top: 0;'><input type='submit' value='완료' class='btn btn-default btn-sm docA'/><input type='button' value='취소' class='btn btn-default btn-sm docA' id='btn3'/></td></tr>"
						$("#abc").html(doc_feedback);
					CKEDITOR.replace('d_content', {height: 200});

					$("#btn3").click(function() {
						console.log("${output1}");
						if(${output1 == "[]"}){
						$("#abc").empty();
						var doc_origin = "<tr><td colspan='6'><h5><b>전문의 소견</b></h5><br />현재까진 의사의 답변이 없습니다.</td></tr>"
							$("#abc").html(doc_origin);
						}else{
							$("#abc").empty();
						}
						})
			})

			var p = 0;

			$(".btn4").click(function(e){
					e.preventDefault();
					var d;
					var e;
					if(p==0) {
					var c = $(this).attr("href");
					/* console.log(c); */
						d = $("#"+c).html();
						e = $("#DAI"+ c).html();
					/* console.log(d); */
					var doc_feedback1 = "<input type='hidden' name='docAnswer_id' value='"+e+"' />"
						doc_feedback1 += "<tr><td colspan='2' style='border-bottom: 0;'><input type='hidden' value='${output.writer_name}' name='writer_name' />"
						doc_feedback1 += "<input type='hidden' value='${output.document_id}' name='document_id' /><input type='hidden' value='${PK}' name='fdpmember_id' />"
						doc_feedback1 += "<textarea name='content' id='d_content'>"+d+"</textarea></td></tr><tr ><td class='clearfix' style='border-top: 0;'>"
						doc_feedback1 += "<input type='submit' value='완료' class='btn btn-default btn-sm docA' />"
						doc_feedback1 += "<input type='button' value='취소' class='btn btn-default btn-sm docA' id='btn5'></td></tr>"
						$("#"+c).empty();
						$("#"+c).html(doc_feedback1);
					CKEDITOR.replace('d_content', {height: 100});
					p = 1;
					}
					$("#btn5").click(function() {
						$("#"+c).html("<td>"+d+"</td>");
					p = 0;
					})

			})

			$(".btn6").click(function(e){
				e.preventDefault();
				var g;
				var h;
				if(p==0) {
					var f = $(this).attr("href");
						g = $("#"+f).html();
						h = $("#CI"+f).html();
						console.log(h);
					var c_edit = "<input type='hidden' name='comment_id' value='"+h+"' />"
						c_edit += "<input type='text' class='form-control' name='content1' value='"+g+"' /><span class='input-group-btn'><button class='btn btn-default btn7' type='submit'>취소</button><button class='btn btn-default' type='submit'>수정</button></span>"
						/* $("#"+f).empty(); --> append, prepend 쓸때는 이 구문이 필요함*/
						$("#"+f).html(c_edit);
						p = 1;
					}

							$(".btn7").click(function() {
								$("#"+f).html(g);
								p = 0;
							})
				})
			</script>
</body>
</html>
