<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<header class="header-box">
<div class="topbox">
<div class= "topbar">
	<c:choose>
		<c:when test="${session_id != null }">
			<a href="session/delete.do" class="header-btn">로그아웃</a>
			<p class="header-btn">어서오세요 ${session_id} 관리자님</p>
		</c:when>
		<c:when test="${fdpCookie != null }">
			<a href="coodel.do" class="header-btn">로그아웃</a>
			<a href="26_Profile_i.do" class="header-btn">회원 정보 수정</a>
			<p class="header-btn">어서오세요 ${Name} 님 </p>
		</c:when>
		<c:otherwise>
			<a href="02_Login.do" class="header-btn">로그인</a>
			<a href="09_Sign_up_a.do" class="header-btn">회원가입</a>
		</c:otherwise>
	</c:choose>
				
</div>
</div>
		<div class="topm head-border">
			<div class="col-xs-3 ww"><img src="./assets/img/FindDoctor1.png" class="logo "></div>
			<div class="col-xs-9 ww">
				<div class="btn-cover collapse navbar-collapse" id="gnb">
				<ul class="nav navbar-nav" id="droph">
					<li><a href="index.do"class="page-move1">홈</a></li>
					<li><a href="07_Statistics.do" class="page-move1">보건의료 통계</a></li>
					<li class="dropdown" id="d1">
						<a href="#" class="page-move2 dropdown-toggle fdp" data-toggle="dropdown">병원 검색<b class="caret"></b></a>
						<ul class="dropdown-menu kfc">
								<li><a href="03_Find_h.do">일반 병원 찾기</a></li>
								<li id="divider"></li>
								<li><a href="05_Find_e.do">응급실 찾기</a></li>
								<li id="divider"></li>
								<li><a href="monitor.do">응급실 현황</a></li>
						</ul>
					</li>
					<li><a href="13_Notice_board.do" class="page-move1">게시판</a></li>
					<li class="dropdown" id="d2">
						<a href="#" class="page-move2 dropdown-toggle intro" data-toggle="dropdown">센터 소개<b class="caret"></b></a>
						<ul class="dropdown-menu bbq">
								<li><a href="20_Strong_point.do">주요사업</a></li>
								<li id="divider"></li>
								<li><a href="17_Navigator.do">사이트맵</a></li>
								<li id="divider"></li>
								<li><a href="18_Intention.do">사이트소개</a></li>
								<li id="divider"></li>
								<li><a href="19_Team_introduction.do">팀원소개</a></li>
						</ul>
					</li>
				</ul>
				</div>
			</div>
		</div>
	</header>