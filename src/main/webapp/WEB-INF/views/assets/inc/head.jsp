<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!doctype html>
<html lang="ko">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<!-- <meta name="viewport"content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />  -->

<!-- Bootstrap CSS -->
<link href="./assets/css/bootstrap.min.css" rel="stylesheet"
	media="screen">
<title>Find Doctor</title>
<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon" href="./assets/img/tab_icon.png">
<link rel="apple-touch-icon-precomposed"
	href="./assets/ico/apple-touch-icon-144-precomposed.png" />
<!-- bootstrap -->
<link rel="stylesheet" type="text/css"
	href="./assets/css/bootstrap.min.css" />
<!-- 나눔고딕 웹 폰트 적용 -->
<link rel="stylesheet" type="text/css"
	href="./assets/css/nanumfont.css" />
<link rel="stylesheet" type="text/css" href="./assets/css/grid.css">
<style type="text/css">
.container {
	
}

/* 최상단 바 블록 */
.topbox {
	width: 100%;
	background-color: #757575;
}

/* 최상단 바 */
.topbar {
	width: 1170px;
	margin: auto;
	background-color: #757575;
	height: 30px;
}

/* 최상단 메뉴바 글자 */
.header-btn {
	color: #fff;
	font-size: small;
	float: right;
	display: inline-block;
	padding: 3px;
	margin-top: 2px;
	margin-right: 12px;
}

/* 메뉴바 밑줄 */
.head-border {
	border-bottom: 1px solid #E0E0E0;
	width: 100%;
}

/* 메뉴바 */
.topm {
	width: 1170px;
	height: 61px;
	margin: auto;
	display: block;
}

/* 로고박스 */
.ww {
	height: 60px;
	padding: 0;
}

.logo {
	display: block;
	width: 240px;
	height: 55px;
	margin: 0;
	padding: 0;
	position: relative;
	top: 5px;
}

.btn-cover {
	margin: 0;
	display: table;
	width: 100%;
	height: 50px;
}
/* 메뉴 버튼 */
#droph a {
	width: 150px;
	height: 40px;
	padding: 10px 0 0 0;
	margin: 0;
	position: relative;
	top: 9px;
	font-size:23px;
	font-weight: 300px;
}

.navbar-nav>li>.dropdown-menu {
	height: 120px;
	padding: 0;
	text-align: center;
}
#droph .dropdown li {
display:block;
width:100%;
height:30px;
margin:0;


}
/* 드롭다운 메뉴 버튼 */
#droph .dropdown li a {
	display: block;
	width: 130px;
	height: 30px;
	margin: auto;
	font-size: 17px;
}

#droph .dropdown #divider {
	border-bottom: 1px solid #E0E0E0;
	width: 100%;
	height:9px;
}

/* 메뉴버튼 */
.page-move1 , .page-move2 {
	text-align: center;
	height: 70px;
	vertical-align: middle;
	font-size: 25px;
	font-weight: bold;
	color: #ffa500;
	text-decoration: none !important;
}

.qq, .rr {
	height: 150px;
}

.ee {
	height: 300px;
}

.blogo {
	width: 140px;
	display: block;
	position: relative;
	top: 15px;
}

#droph {
	list-style: none;
	padding: 0;
	width: 100%;
}

#gnb {
	padding: 0;
}

#droph li {
	width: 20%;
}

.kfc{
	z-index:10000000000;
	min-width: 150px !important;
	width: 150px !important;
	position:relative;
	top:9px;
}

.kfc >li > a , .bbq > li > a{
	padding-top:0 !important;
}

.bbq{
	z-index:10000000000;
	height:160px !important;
	min-width: 150px !important;
	width: 150px !important;
	position:relative;
	top:9px;
}

/* 최하단 바 박스 */
.bottom-box {
	width: 100%;
	background-color: #E0E0E0;
}

/* 최 하단 바 */
.row-fottt {
	height: 130px;
	width: 1170px;
	margin: auto;
	background-color: #E0E0E0;
}

/* 하단바 좌측 로고 박스 */
.fottt {
	float: left;
	width: 200px;
	height: 103px;
	padding: 5px 15px;
}


/* 주소 및 연락처 */
address {
	padding: 10px 0 0 0;
	width: 700px;
	float: left;
}
/* 이젠 아카데미 로고 */
.bottom-img img {
	dispaly: inline-block;
	height: 90px;
	position: relative;
	top: 15px;
	left: 65px;
}
</style>
</head>