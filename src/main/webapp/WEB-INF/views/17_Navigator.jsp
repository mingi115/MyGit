<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!doctype html>
<html lang="ko">
<head>
 <%-- <%@ include file="../inc/head.jsp" %> --%>
 <jsp:include page="./assets/inc/head.jsp" />
  <%-- <%@ include file="../inc/remote_css.jsp" %> --%>
<style type="text/css">

.box {
	position:relative;
	right:15px;
	padding:0 0 0 20px;
	margin: 0 0 0 0;
	background:#eee;
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
	padding: 150px 80px 0 80px;
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
	width: 80%;
	position: relative;
	left:22px;
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
	color: #777;
	font-size: 20px;
}
/* 작은 텍스트 영역 처리
 * -------------------------------------- */
#gallery .comment {
	width: 100%;
	height: 35px;
	margin: auto;
	text-align: center;
	padding-top: 10px;
	padding-bottom: 20px;
	color: #777;
	font-size: 12px;
}

/* 게시물의 마우스 오버
 * -------------------------------------- */
#gallery li a:hover {
	background-color: #eee;
}
</style>
</head>
<body>
<%-- <%@ include file="../inc/top.jsp" %> --%>
<%-- <%@ include file="../inc/remote.jsp" %> --%>
<jsp:include page="./assets/inc/top.jsp" />
	<div class="container" style="min-height: 500px;">

	


		<div class="box" style="height: 900px;">
			<ul id="gallery">
				<li><a href="03_Find_h.do"> <span class="thumb"> <img
							src="./assets/img/hospital1.png" alt="병원찾기" />
					</span> <span class="text">병원찾기</span><span class="comment">서울시 병원 위치 찾기 서비스 입니다.<br />전문분야 선택 및 지역구 선택이<br />가능합니다.</span>
				</a></li>
				<li><a href="05_Find_e.do"> <span class="thumb"> <img
							src="./assets/img/emergecy1.png" alt="응급실 찾기" />
					</span> <span class="text">응급실 찾기</span><span class="comment">서울 응급실 위치 찾기 서비스 입니다.<br />응급실 위치를 통해 응급환자의 <br />골든 타임을 지키기위해<br /> 노력하겠습니다.</span>
				</a></li>
				<li><a href="monitor.do"> <span class="thumb"> <img
							src="./assets/img/monitoring1.png" alt="응급실 모니터링" />
					</span> <span class="text">응급실 모니터링</span><span class="comment">서울 응급실 현황입니다.<br />실시간 가용 병실 수를 나타냅니다.<br />응급한 순간 헛된 걸음이 되지 않도록<br />정확한 정보를 제공하겠습니다.</span>
				</a></li>
				<li><a href="07_Statistics.do"> <span class="thumb"> <img
							src="./assets/img/graph1.png" alt="질병 통계 현황" />
					</span> <span class="text">질병 통계 현황</span><span class="comment">질병통계현황 입니다.<br />년도, 나이, 성별, 지역구 등으로<br />분류한 질병통계를 한눈에<br />확인 할 수 있습니다.</span>
				</a></li>
				<li><a href="13_Notice_board.do"> <span class="thumb"> <img
							src="./assets/img/board1.png" alt="게시판" />
					</span> <span class="text">게시판</span><span class="comment">게시판 입니다.<br />간단한 질병 및 외상 관련 <br />질문 및 답변을 확인 할 수 있습니다.</span>
				</a></li>
				<li><a href="19_Team_introduction.do"> <span class="thumb"> <img
							src="./assets/img/developer1.png" alt="개발자들" />
					</span> <span class="text">개발자들</span><span class="comment">개발자 소개 페이지 입니다.<br />제작에 참여한 인원들의<br />의도를 파악할 수 있습니다.</span>
				</a></li>
			</ul>
		</div>
	</div>
	<%-- <%@ include file="../inc/bottom.jsp" %> --%>
	<jsp:include page="./assets/inc/bottom.jsp" />
</body>
</html>