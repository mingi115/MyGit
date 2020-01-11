<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!doctype html>
<html lang="ko">
<head>

<%-- <%@ include file="../inc/head.jsp"%> --%>
<%-- <%@ include file="../inc/remote_css.jsp"%> --%>
<jsp:include page="./assets/inc/head.jsp" />
<style type="text/css">
body {
background-color: eee;
}
.box1 {
	position:relative;
	right:15px;
	padding:0 0 0 0px;
	margin: 0 0 0 200px;
	background:#fff;
	width:800px;
}
.box2 {
	position:relative;
	right:15px;
	padding:0 0 0 20px;
	margin: auto;
	background:#fff;
	width:1170px;
}

/* 갤러리 영역 박스
 * -------------------------------------- */
#gallery {
	width: 1400px;
	margin: auto;
}

/* 한 줄에 3개씩, 가로 배치
 * -------------------------------------- */
#gallery li {
	list-style: none;
	width: 350px;
	float: left;
	padding: 100px 80px 0 80px;
}

/* 링크의 영역 확장 (공식)
 * - 크기와 여백을 주기 위하여 block으로 설정 후, 가로 가득
 * -------------------------------------- */
#gallery li a {
/* 	display: block; */
	width: auto;
	padding: 0px;
}

/* 링크 안의 span을 block으로 처리
 * -------------------------------------- */
#gallery li a span {
	display: block;
	width: auto;
}

/* 이미지는 가득 채움
 * -------------------------------------- */
#gallery .thumb img {
	width: 100%;
	border-radius: 70px;
	
}

/* 텍스트 영역 처리
 * -------------------------------------- */
#gallery .text {
	width: 95%;
	height: 35px;
	margin: auto;
	text-align: center;
	padding-top: 10px;
	padding-bottom: 20px;
	color: #000;
	font-size: 25px;
}

#gallery .text p{
 font-size: 18px;
}

/* 게시물의 마우스 오버
 * -------------------------------------- */
#gallery li a:hover {
	background-color: #eee;
}
</style>
</head>
<body>
	<%-- <%@ include file="../inc/top.jsp"%> --%>
	<jsp:include page="./assets/inc/top.jsp" />

	<div class="container" style="min-height: 1000px;">
	<%-- <%@ include file="../inc/remote.jsp"%> --%>

		<div class="box1" style="height: 400px;">
			<ul id="gallery">
				<li><a><span class="thumb"> <img
							src="./assets/img/kcr.jpg" alt="병원찾기" />
					</span> <span class="text">김체리<p>게시판 장인!</p></span>
				</a></li>
				<li><a><span class="thumb"> <img
							src="./assets/img/pkh.jpg" alt="응급실 찾기" />
					</span> <span class="text">박기협<p>이것이 관리자다!</p></span>
				</a></li>
			</ul>
		</div>
		<div class="box2" style="height: 400px;">
			<ul id="gallery">
				<li><a><span class="thumb"> <img
							src="./assets/img/lss.jpg" alt="응급실 모니터링" />
					</span> <span class="text">이승석 <p>프로젝트를 조율하는 자</p></span>
				</a></li>
				<li><a><span class="thumb"> <img
							src="./assets/img/jmk.jpg" alt="질병 통계 현황" />
					</span> <span class="text">정민기<p>코드는 머릿속에 있다!</p></span>
				</a></li>
				<li><a><span class="thumb"> <img
							src="./assets/img/jjh.jpg" alt="게시판" />
					</span> <span class="text">조지현<p>통계란 이런것이다!</p></span>
				</a></li>
			</ul>
		</div>
	</div>

	<%-- <%@ include file="../inc/bottom.jsp"%> --%>
	<jsp:include page="./assets/inc/bottom.jsp" />
</body>
</html>