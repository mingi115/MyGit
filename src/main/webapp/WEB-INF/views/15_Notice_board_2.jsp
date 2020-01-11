<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="ko">
<style type="text/css">
/** 하단 버튼 가로로 정렬 */
.a {
	display: inline-block;
}

/** 하단 버튼 부분 박스 설정 */
.b {
	width: 1140px;
}

/** 테이블을 감싸는 박스로 테이블 크기 고정 (반응형 x)*/
.table1 {
	width: 1140px;
}

/** 댓글 부분 설정 */
.c {
	list-style: none;
	padding-left: 0;
}

/** 테이블 최소 크기 설정 */
.table {
	min-height: 400px;
}

.table1 .table .d {
	vertical-align: middle;
}

/** ckeditor 박스 크기 설정 */
#cke_1_contents {
	min-height: 600px "WebContent/pages/15_Notice_board_2.jsp" !important;
}

.aaa {
	width: 100px;
	height: 10px;
}
/** 게시물 상단 타이틀바 설정 */
.subject_content {
	background-color: #eee;
}

.file {
	display: inline-block;
	margin-right: 20px;
}

.fileimg {
	display: block;
	min-width: 50%;
	min-height: 50%;
	align: center;
}

.filediv {
	overflow: hidden;
	width: 320px;
	height: 200px;
}

.file1 {
	border: 1px solid #ddd;
	border-radius: 20px;
}
</style>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="//cdn.ckeditor.com/4.12.1/basic/ckeditor.js"></script>
<head>
<jsp:include page="./assets/inc/head.jsp" />
</head>

<body>
	<jsp:include page="./assets/inc/top.jsp" />
	<div class="container" style="min-height: 720px;">
		<h1 id="title">Q &amp; A</h1>
		<p id="description">자유로운 질문과 전문의의 답변을 확인하실 수 있습니다.</p>
		<div class="table1">
			<form enctype='multipart/form-data' method="post" action="${pageContext.request.contextPath}/15_Notice_board_2_ok.do">
				<input type="hidden" name="document_id" value="${output.document_id}" />
				<table class="table table-bordered">
					<tbody>
						<tr>
							<td class="aaa">
								<h5 align="center">작성자</h5>
							</td>
							<td>
								<h5>${output.writer_name}</h5> <input type="hidden"
								name="writer_name" value="${output.writer_name}" />
							</td>
						</tr>
						<tr>
							<td class="subject1 aaa">
								<h5 class="subject1" align="center">제목</h5> <input type="hidden"
								name="hit" value="${output.hit}" /> <input type="hidden"
								name="reg_date" value="${output.reg_date}" /> <input
								type="hidden" name="edit_date" value="${output.edit_date}" />
<%-- 								<input
								type="hidden" name="docA_ok" value="${output.docA_ok}" /> --%>
							</td>

							<td><input type="text" name="subject" class="subject"
								value="${output.subject}" /></td>
						</tr>
						<tr>
							<td colspan="2"><textarea name="content" class="ckeditor"> ${output.content}</textarea>
							</td>
						</tr>

					</tbody>
				</table>
				<table>
					<tbody>
						<c:set var="s" value="1" />
						<tr>
							<td>
								<ul>
									<c:forEach var="item" items="${output4}" varStatus="status">
										<li class="file" id="${status.index}"><span
											style='display: none' id="a${status.index}">${item.file_id}</span>
											<button type="button" value="${status.index}" class="close"
												aria-hidden="true">&times;</button>
											<div class="filediv">
												<a href="${pageContext.request.contextPath}/download.do?file=${item.filePath}">
													<img src="${pageContext.request.contextPath}/download.do?file=${item.filePath}" class="fileimg" />
												</a>											
											</div> ${item.originName}</li>
										<c:set var="s" value="${s+1}" />
									</c:forEach>
									<c:forEach var="i" begin="${s}" end="3" step="1"
										varStatus="status">
										<li class="file file1">
											<div class="filediv">
												<label for="photo">첨부파일${i}</label>
												<input type="file" name="photo" class="newf" />
											</div>
										</li>
									</c:forEach>
								</ul>
							</td>
						</tr>

					</tbody>


					<!-- <label for="photo">첨부파일</label>
					<input type="file" name="photo" id="photo" /> -->
				</table>

				<div class="b">
					<ul class="pull-right">
						<li class="a"><a href="13_Notice_board.do"
							class="btn btn-default btn-sm">취소</a></li>
						<li class="a"><button type="submit"
								class="btn btn-default btn-sm">완료</button></li>
					</ul>
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="./assets/inc/bottom.jsp" />
	<script>


		$(".close").click(
						function() {
							var result = confirm("정말  삭제하시겠습니까?");
							if (result) {
								var x = $(this).attr("value");
								var y = $("#a" + x).html();
								var add_op = "<li class='file file1'><div class='filediv'><label for='photo'>첨부파일</label><input type='hidden' name='file_id' value='"+y+"' /><input type='hidden' name='dou' value='0'/><input type='file' name='photo' class='fcl'/></div></li>";
								$("#" + x).html(add_op);
								$(".fcl").change(function() {
									$(this).prev().attr("value", 1);
								});
							};
						})

		$(".newf").change(
			function() {
				var a = "<input type='hidden' name='dou' value='2'/>";
				$(this).parent("div").append(a);
			}
		)
	</script>
</body>
</html>
