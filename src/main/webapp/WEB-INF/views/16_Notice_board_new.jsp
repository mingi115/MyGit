<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="ko">
<style type="text/css">
/** 버튼 가로 정렬 */
.a {
	display: inline-block;
}
/** 버튼 박스 고정 */
.b {
	width: 1140px;
}

/** 테이블 박스 고정 */
.table1 {
	width: 1140px;
}

/** 상단 제목 설정 */
.subject {
	width: 500px;
	height: 30px;
}

/** 상단 '제목' 글씨 크기 설정 */
.subject1 {
	width: 50px;
}
</style>
<script src="./assets/plugins/ckeditor/ckeditor.js"></script>
<!-- <script src="http://code.jquery.com/jquery-3.2.1.min.js"></script> -->
<head>
<jsp:include page="./assets/inc/head.jsp" />
</head>
<body>
	<jsp:include page="./assets/inc/top.jsp" />

	<div class="container" style="min-height: 720px;">

		<h1 id="title">Q &amp; A</h1>
		<p id="description">자유로운 질문과 전문의의 답변을 확인하실 수 있습니다.</p>
		<div class="table1">
			<form id="new_ok">
				<table class="table table-bordered">
					<tbody>
						<tr>
							<td>
								<h5>작성자</h5>
							</td>
							<td>
								<h5>${Name}</h5> <input type="hidden"
								value="${Name}" name="writer_name" />
							</td>
						</tr>
						<tr>
							<td align="center" class="subject1">
								<h5 class="subject1">제목</h5>

							</td>

							<td><textarea name="subject" class="subject"></textarea></td>
						</tr>
						<tr>
							<td colspan="2"><textarea id="ck" class="ckeditor">
							</textarea></td>
						</tr>
					</tbody>
				</table>


				<div>
					<label for="photo">첨부파일1</label> 
					<input type="file" name="phopho1"/> 
					<label for="photo">첨부파일2</label> 
					<input type="file" name="phopho2"/> 
					<label for="photo">첨부파일3</label> 
					<input type="file" name="phopho3"/>
				</div>
				<div class="b">
					<ul class="pull-right">
						<li class="a"><a href="13_Notice_board.do"
							class="btn btn-default btn-sm">취소</a></li>
						<li class="a"><button type="button" id="button_ok"
								class="btn btn-default btn-sm">완료</button></li>
					</ul>
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="./assets/inc/bottom.jsp" />
	<script>
/* 	var ck1 = CKEDITOR.replace('ck'); */

	$(function(){
		$("#button_ok").click(function(e){
			var content = CKEDITOR.instances.ck.getData();
		
	/* 	var ckdata = $('.cke_editable').html(); */
	var form = new FormData(document.getElementById('new_ok'));
	form.append('content', content);
	/** 일반 ajax */
	$.ajax({
		type: "POST",
		url: "16_Notice_board_new_ok.do",
		dataType: "json",
		processData: false,
		contentType: false,
		data: form,
		success: function(data) {
			console.log(data);
			window.location = "14_Notice_board_i.do?document_id="+data.document_id;
			
			console.log("success");
		}
	});
		});
	});
	</script>

</body>
</html>