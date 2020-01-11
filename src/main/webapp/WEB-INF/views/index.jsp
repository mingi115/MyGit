<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!doctype html>
<html lang="ko">
  <head>
	<jsp:include page="./assets/inc/head.jsp" />
    <link rel="stylesheet" type="text.css" href="./assets/plugins/ajax/ajax_helper.css">
    <link rel="stylesheet" href="./assets/plugins/youcover/youCover.css">
    <style type="text/css">
    	#bigbox{
    		min-width:1170px;
    		height:760px;
    		overflow:hidden;
    	}
    	.login_box{
    		background-color: #E0E0E0;
    		padding : 5px;
    		height:150px;
    		border-radius: 10px;
    		
    	}
    	.login_cover{
    		height: 70px;
    		background-color: #5E5E5E;
    		border-radius: 4px;
    		text-align:center;
    		margin:10px;
    		margin-top:30px;
    		vertical-align: middle;
    	}
    	.login_btn{
    		border-radius: 4px;
    		margin-top: 10px;
    		color:white;
    		font-size: 20px;
    		display:block;
    		padding: 20px;
    		text-decoration: none !important;
    	}
    	.find_id{
    		display:inline-block;
    		margin-left: 10px;
    		margin-top: 6px;
    		color:#5e5e5e;
    	}
    	.sign_up{
    		display:inline-block;
    		margin-left: 70px;
    		margin-top: 6px;
    		color:#5e5e5e;
    	}
    	.contentsbox{
    		height:756px;
    	}
    	.find_hos{
    		text-align: center;
    		width:277px;
    		margin:auto;
    		color:#5e5e5e;
    		background-color: #FFB494;
    		font-size:25px;
    		border-radius: 5px;
    	}
    	.e-container{
    		border:1px solid #E0E0E0;
			z-index:10000;
    		background-color:white;
    		height:756px;

    	}
    	.e-btncover{
    		border-top: 1px solid #e0e0e0;
    		height:60px;

    	}
    	.e-title{height:60px;}
    	.rr{ margin-left:5px;}
    	#gmap{
    		height:0;
			width:66.66666% !important;
    	}
    	/* 전체 박스 크기 및 정렬 */
    	.accord { 
    		width: auto; 
    		margin: auto; 
    		transition-delay:0.3s;
    	}
	
		.accord-item{
			width:250px;
		}
        /* 제목 영역의 배경색상과 태두리 */
    	.accord-title {  background: #eeeeee; border: 1px solid #d5d5d5; }

        /* 제목영역의 링크에 대한 크기, 글자모양 */
    	 .accord-title > a {
    		display: block; width: auto;
    		padding: 10px;
    		color: #222;
    		font-size: 14px; 
    		text-decoration: none;
    		transition:0.3;
    	} 

        /* 내용영역의 여백, 글자크기, 태두리, 숨김 */
    	.content {
    		padding: 0px 15px;
    		font-size: 12px;
    		border-left: 1px solid #d5d5d5;
    		border-right: 1px solid #d5d5d5;
    		display: none;
    	}

        /* 마지막 내용 박스의 테두리 보정 */
        .accord-item:first-child > .accord-title {
        	margin-top:0;
        }
    	.content:last-child { border-bottom: 1px solid #d5d5d5;	}
    	#move{
    		position:relative;
    		bottom: 690px;
    		padding:0;
    		left:-15px;
    	}
    	#myer{
    		text-align:center;
    		color:black;
    		border-radius:10px;
    		position:relative;
    		bottom:756px;
    		left:370px;
    		display:block;
    		font-size:50px;
    		width:700px;
    		background-color:#F8A90E;
    		padding:25px;

    	}
    	.mynav{
    		margin:0;
    	}
    	.tl, .tr, .bl, .br{
    		padding: 10px 0 10px 0;
    	}
    	.tl{border-radius: 15px 0 0 0;	}
    	.tr{border-radius: 0 15px 0 0;}
    	.bl{border-radius: 0 0 0 15px;}
    	.br{border-radius: 0 0 15px 0;}
    	
    	.nav-btn{
    		text-align:center;
    		background-color:#F8A90e;
    	}
    	.nav-btn-cent{
    		padding: 10px 0 10px 0;
    		background-color:#FDD25D;
    	}
    	.nav-btn-cent > a{
    		color:black;
    	}
    	.nav-txt{
    		color:black;
    		font-size:30px;
    		font-weight:bold;
    	}
    	.cccc{
    		margin-left: 20px;
    	}
    	.ll{padding:0;}
    	.beinline{
    		display:inline-block;
    		text-align:center;
    		width: 32%;
    	}
    	.thumb{
    		display:block;
    		margin:auto;
    		width:120px;
    		height:110px;
    	}
    	.text{
    		color:black;
    		display:block;
    	}
    	.mymodal{
    		width:1000px;
    	}
    	.bodypart{
    		color:orange;
    	}
    	/** 동영상 영역의 전체 크기를 설정한다. */
        .my-youtube-wrapper { width: 926px; height: 544px; margin: auto; }
        /** 내부적으로 사용되는 <iframe>태그의 border 제거 */
        iframe { border: 0; }
        .aeddesc{
        	width:480px;
        	margin:auto;
        }
        .fi{
        	font-size: 100px;
        	display: inline-block;
        	color:white;
        	background-color:orange;
        	width:180px;
        	border-radius:10px;
        	padding:5px;
        	text-align:center;
        }
        #fipbody{
        	width:460px;
        	margin-top:200px;
        }
        #id{
        	margin-right:50px;
        }
    </style>
  </head>
  <body>
	<jsp:include page="./assets/inc/top.jsp" />
	
	<section>
		  	
		<div class="container blank" style="height:40px;"></div>

		<div class="container" id="bigbox">
			<div class="row contentsbox">
				<div class="col-xs-3">
					<c:choose>
						<c:when test="${fdpCookie != null }">
							<div class="row  login_box">
								<div class="login_cover"><a class="login_btn" href="#">어서오세요 ${Name } 님</a></div>
								<a href="26_Profile_i.do" class="find_id">회원 정보 수정</a>
								<a href="coodel.do" class="sign_up" id="logout">로그아웃</a>
							</div>
						</c:when>
						<c:when test="${session_id != null }">
							<div class="row  login_box">
								<div class="login_cover"><a class="login_btn" href="#">어서오세요 ${session_id } 님</a></div>
								<a href="21_Management.do" class="find_id">관리자 페이지</a>
								<a href="session/delete.do" class="sign_up" id="logout">로그아웃</a>
							</div>
						</c:when>
						<c:otherwise>
							<div class="row  login_box">
								<div class="login_cover"><a class="login_btn" href="02_Login.do">Find Doctor  로그인</a></div>
								<a href="#myModal3"  data-toggle="modal" class="find_id">아이디/비밀번호 찾기</a>
								<a href="09_Sign_up_a.do" class="sign_up">회원 가입</a>
							</div>
						</c:otherwise>
					</c:choose>
					
				</div>
				<div class="col-xs-9 e-container" id="erer">
					<div class="row e-title rr">
						<h2><strong>응급실 찾기</strong><button id="xx"type="button" class="close" aria-hidden="true">&times;&nbsp;&nbsp;</button>	</h2>
					</div>
					<div class="row e-btncover rr">
						<br/>
						<button class="btn btn-warning gu" id="b1" value="1">강북 지역</button>
						<button class="btn btn-warning gu" id="b2" value="2">동서울 지역</button>
						<button class="btn btn-warning gu" id="b3" value="3">동남 지역</button>
						<button class="btn btn-warning gu" id="b4" value="4">강남 지역</button>
						<button class="btn btn-warning gu" id="b5" value="5">남서울 지역</button>
						<button class="btn btn-warning gu" id="b6" value="6">서남 지역</button>
						<button class="btn btn-warning gu" id="b7" value="7">서서울 지역</button>
						<button class="btn btn-warning gu" id="b8" value="8">도심 지역</button>
					</div>
					<div class="row rr">
						<div class="prog">
							<span class="progtext">지역을 선택해 주세요</span>
						</div>
						<div class="mapcover">
							<div class="col-xs-8" id="gmap"></div>
							<div class="col-xs-4 accord">
						
							</div>
						</div>	
					</div>
					
				</div>
			</div>
			<a href="#erer"id="myer"><img src="./assets/img/siren.png" width="100px"> <b>응급실 찾기</b></a>


			<div class="container" id="move">
				<div class="row mynav">
					<div class="col-xs-3 nav-btn tl">
						<a href="07_Statistics.do" class="nav-txt">보건의료 통계
							<br/>
							<img src="./assets/img/chart_o.png" width="150px" height="160px">
						</a>	
					</div>
					<div class="col-xs-6 nav-btn-cent">						
						<span  class="nav-txt cccc">병원찾기</span>
						<br/><br/>
						<ul class="ll">
							<li class="beinline">
								<a class="hos-btn" href="03_Find_h.do">
									<img  class="thumb" src="./assets/img/hosicon.png" >
									<span class="text"><b>일반 병원 찾기</b></span>
								</a>
							</li>
							<li class="beinline">
								<a class="hos-btn" href="05_Find_e.do">
									<img  class="thumb" src="./assets/img/siren1.png" >
									<span class="text"><b>응급실 찾기</b></span>
								</a>
							</li>
							<li class="beinline">
								<a class="hos-btn" href="monitor.do">
									<img  class="thumb" src="./assets/img/monitor.jpg" >
									<span class="text"><b>응급실 상황판</b></span>
								</a>
							</li>
						</ul>
					</div>
					<div class="col-xs-3 nav-btn tr">
						<a href="13_Notice_board.do" class="nav-txt">게시판
						<br/>
						<img src="./assets/img/navlist.png" width="150px" height="160px">
						</a>
					</div>
				</div>
				<div class="row mynav blr">
					<div class="col-xs-3 nav-btn bl">
						<a href="http://dw.nemc.or.kr/nemcMonitoring/mainmgr/Main.do" class="nav-txt">질병 관련 정보
							<br/>
							<img src="./assets/img/virus.png" width="150px" height="160px">
						</a>	
					</div>
					<div class="col-xs-6 nav-btn-cent">						
						<span  class="nav-txt cccc">유용한 정보</span>
						<br/><br/>
						<ul class="ll">
							<li class="beinline">
								<a class="hos-btn" data-toggle="modal" href="#myModal"	>
									<img  class="thumb" src="./assets/img/YouTube.png" >
									<span class="text"><b>체형 교정 운동</b></span>
								</a>
							</li>
							<li class="beinline">
								<a class="hos-btn" data-toggle="modal" href="#myModal2">
									<img  class="thumb" src="./assets/img/AED.png" >
									<span class="text"><b>AED사용 방법</b></span>
								</a>
							</li>
							<li class="beinline">
								<a class="hos-btn" href="http://www.doctorsnews.co.kr/">
									<img  class="thumb" src="./assets/img/news.png" >
									<span class="text"><b>의료 신문</b></span>
								</a>
							</li>
						</ul>
					</div>
					<div class="col-xs-3 nav-btn br">
						<a href="18_Intention.do" class="nav-txt">센터소개
						<br/>
						<img src="./assets/img/center_intro.png" width="150px" height="160px">
						</a>
					</div>
				</div>
				
				<div class="container blank" style="height:40px;"></div>
				
				<!-- .modal -->
				<div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<!-- .modal-dialog -->
					<div class="modal-dialog mymodal">
						<!-- .modal-content -->
						<div class="modal-content">
							<!-- 제목 -->
							<div class="modal-header">
								<!-- 닫기버튼 -->
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
								&times;
								</button>
								<h1 class="modal-title" id="myModalLabel">&nbsp;체형 교정 운동</h1>
							</div>
							<!-- 내용 -->
							<div class="modal-body">
								<!-- 탭 메뉴 시작 -->
								<ul class="nav nav-tabs">
									<li class="active"><a class="bodypart" href="#neck" data-toggle="tab">목</a></li>
									<li><a class="bodypart" href="#pelvis" data-toggle="tab">골반</a></li>
									<li><a class="bodypart" href="#leg" data-toggle="tab">다리</a></li>
									<li><a class="bodypart" href="#shoulder" data-toggle="tab">어께</a></li>
									<li><a class="bodypart" href="#spine" data-toggle="tab">척추</a></li>
								</ul>
								<!--// 탭 메뉴 끝 -->
								<div class="tab-content">
									<div class="tab-pane fade in active" id="neck">
										<div class="panel-group" id="accordion">
											<div class="panel panel-default">
												<div class="panel-heading">
													<h4 class="panel-title"><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseOne"> 거북목 교정 </a></h4>
												</div>
												<div id="collapseOne" class="panel-collapse collapse in">
													<div class="panel-body">
														<!-- 동영상 영역 : 크기 지정을 위한 div -->
    													<div class="my-youtube-wrapper">
        													<!-- 동영상 플레이어 -->
        													<div data-youcover data-id='Io5NYpzfsEU'></div>
														</div>
													</div>
												</div>
												<div class="panel-heading">
													<h4 class="panel-title"><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseEig"> 일자목 및 거북목 교정 </a></h4>
												</div>
												<div id="collapseEig" class="panel-collapse collapse in">
													<div class="panel-body">
														<!-- 동영상 영역 : 크기 지정을 위한 div -->
    													<div class="my-youtube-wrapper">
        													<!-- 동영상 플레이어 -->
        													<div data-youcover data-id='ILbiDeN5GK0'></div>
														</div>
													</div>
												</div>
    										</div>
										</div>
									</div>
									<div class="tab-pane fade" id="pelvis">
										<div class="panel-group" id="accordion">
											<div class="panel panel-default">
												<div class="panel-heading">
													<h4 class="panel-title"><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo"> 골반 전방 경사 교정 </a></h4>
												</div>
												<div id="collapseTwo" class="panel-collapse collapse in">
													<div class="panel-body">
														<!-- 동영상 영역 : 크기 지정을 위한 div -->
    													<div class="my-youtube-wrapper">
        													<!-- 동영상 플레이어 -->
        													<div data-youcover data-id='iQ7MnBxZpN8'></div>
														</div>
													</div>
												</div>
												<div class="panel-heading">
													<h4 class="panel-title"><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseThr"> 골반 후방 경사 교정 </a></h4>
												</div>
												<div id="collapseThr" class="panel-collapse collapse in">
													<div class="panel-body">
														<!-- 동영상 영역 : 크기 지정을 위한 div -->
    													<div class="my-youtube-wrapper">
        													<!-- 동영상 플레이어 -->
        													<div data-youcover data-id='lOvwwhL7UPg'></div>
														</div>
													</div>
												</div>
    										</div>
										</div>
									</div>
									<div class="tab-pane fade" id="leg">
										<div class="panel panel-default">
											<div class="panel-heading">
												<h4 class="panel-title"><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseFou"> O다리 교정 </a></h4>
											</div>
											<div id="collapseFou" class="panel-collapse collapse in">
												<div class="panel-body">
													<!-- 동영상 영역 : 크기 지정을 위한 div -->
    												<div class="my-youtube-wrapper">
        												<!-- 동영상 플레이어 -->
        												<div data-youcover data-id='8a3KwdlNysw'></div>
													</div>
												</div>
											</div>
											<div class="panel-heading">
												<h4 class="panel-title"><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseFiv"> X다리 교정 </a></h4>
											</div>
											<div id="collapseFiv" class="panel-collapse collapse in">
												<div class="panel-body">
													<!-- 동영상 영역 : 크기 지정을 위한 div -->
    												<div class="my-youtube-wrapper">
        												<!-- 동영상 플레이어 -->
        												<div data-youcover data-id='Be-o2hLUt-0'></div>
													</div>
												</div>
											</div>
											<div class="panel-heading">
												<h4 class="panel-title"><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseSix"> 반장슬(back knee) 교정 </a></h4>
											</div>
											<div id="collapseSix" class="panel-collapse collapse in">
												<div class="panel-body">
													<!-- 동영상 영역 : 크기 지정을 위한 div -->
    												<div class="my-youtube-wrapper">
        												<!-- 동영상 플레이어 -->
        												<div data-youcover data-id='lu4QOucD0c4'></div>
													</div>
												</div>
											</div>
    									</div>
									</div>
									<div class="tab-pane fade" id="shoulder">
										<div class="panel panel-default">
											<div class="panel-heading">
												<h4 class="panel-title"><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseSev"> 라운드 숄더 교정 </a></h4>
											</div>
											<div id="collapseSev" class="panel-collapse collapse in">
												<div class="panel-body">
													<!-- 동영상 영역 : 크기 지정을 위한 div -->
    												<div class="my-youtube-wrapper">
        												<!-- 동영상 플레이어 -->
        												<div data-youcover data-id='qMtyhDDmJ-U'></div>
													</div>
												</div>
											</div>
    									</div>
									</div>
									<div class="tab-pane fade" id="spine">
										<div class="panel panel-default">
											<div class="panel-heading">
												<h4 class="panel-title"><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseNin"> 일자 척추 교정 </a></h4>
											</div>
											<div id="collapseNin" class="panel-collapse collapse in">
												<div class="panel-body">
													<!-- 동영상 영역 : 크기 지정을 위한 div -->
    												<div class="my-youtube-wrapper">
        												<!-- 동영상 플레이어 -->
        												<div data-youcover data-id='NO1mncOrbdI'></div>
													</div>
												</div>
											</div>
											<div class="panel-heading">
												<h4 class="panel-title"><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseTen"> 스웨이백 교정 </a></h4>
											</div>
											<div id="collapseTen" class="panel-collapse collapse in">
												<div class="panel-body">
													<!-- 동영상 영역 : 크기 지정을 위한 div -->
    												<div class="my-youtube-wrapper">
        												<!-- 동영상 플레이어 -->
        												<div data-youcover data-id='hMSc3sglcH4'></div>
													</div>
												</div>
											</div>
    									</div>
									</div>
								</div>
								<!-- 하단 -->
								<div class="modal-footer">
									<button type="button" class="btn btn-warning" data-dismiss="modal">
									Close
									</button>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
					<!-- /.modal -->
				</div>
				
				<!-- .modal -->
				<div id="myModal2" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<!-- .modal-dialog -->
					<div class="modal-dialog mymodal">
						<!-- .modal-content -->
						<div class="modal-content">
							<!-- 제목 -->
							<div class="modal-header">
								<!-- 닫기버튼 -->
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
									&times;
								</button>
								<h1 class="modal-title" id="myModalLabel"><strong>자동심장충격기(AED) 사용법</strong></h1>
								<p>자동심장충격기 설명 및 사용방법에 대한 정보를 확인하 실 수 있습니다.</p>
							</div>
							<!-- 내용 -->
							<div class="modal-body">
								<h3><b>자동심장충격기(AED) 란?</b></h3>
								<p>
									자동심장충격기(AED)란 심실세동(심장의 박동에 의해서 심실의 각 부분이 불규칙적으로 수착하는 상태)환자들에게 극히 짧은 순간에 강한 전류를 심장에 통과시켜서 대부분의 심근에 활동전위를 유발하여 
									심실세동이 유지될 수 없도록 함으로써 심실세동을 종료시키고 심장이 다시 정상적인 전기활동을 할 수 있도록 유도하는 것이다.
								</p>
								<hr/>
								<h3><b>자동심장충격기(AED) 사용법</b></h3>
								<div class="aeddesc">
									<img  src="./assets/img/aed1.gif">
									<p>자동심장충격기(AED)를 심폐소생술에 방해가 되지 않는 위치에 놓은 뒤에 전원 버튼을 눌러 전원을 켠다.</p>
									<img  src="./assets/img/aed2.gif">
									<p>준비된 자동심장충격기(AED)의 패드를 부착부위에 정확히 부착한다.</p>

									<p><strong>패드1 : 오른쪽 빗장뼈 바로 아래 부착<br/>
										패드2 : 왼쪽 젖꼭지 옆 겨드랑이 부착</strong></p>

									<p>* 패드와 자동심장충격기 본체가 분리되어 있는 경우 연결하며, 패드 부착부위에 이물질이 있다면 제거한다.</p>
									<img  src="./assets/img/aed3.gif">
									<p>"분석 중...." 이라는 음성 지시가 나오면 심폐소생술을 멈추고 환자에게서 손을 뗀다.</p>

									<p>* 자동심장충격이 필요 없는 경우에는 "환자의 상태를 확인하고, 심폐소생술을 계속 하십시오" 라는 음성 지시가 나온다.</p>
									<img  src="./assets/img/aed4.gif">
									<p>"쇼크 버튼을 누르십시오" 라는 음성 지시가 나오면 점멸하고 있는 쇼크 버튼을 눌러 자동심장충격을 시행한다.</p>

									<p>* 쇼크버튼을 누르기 전에는 반드시 다른 사람이 환자에게서 떨어져 있는지 확인하여야 한다.</p>
									<img  src="./assets/img/aed5.gif">
									<p>자동심장충격을 시행한 뒤에는 즉시 가슴압박과 인공호흡 비율을 30 : 2로 심폐소생술을 다시 시행한다.</p>
									<p>* 자동심장충격기는 2분마다 심장리듬 분석을 반복해서 시행하며, 자동심장충격기 사용과 심폐소생술 시행은 119구급대가 현장에 도착할 때까지 지속되어야 한다.</p>
								</div>
							</div>
							<!-- 하단 -->
							<div class="modal-footer">
								<button type="button" class="btn btn-warning" data-dismiss="modal">
									Close
								</button>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
				<!-- /.modal -->
				<div id="myModal3" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<!-- .modal-dialog -->
					<div class="modal-dialog" id="fipbody">
						<!-- .modal-content -->
						<div class="modal-content">
							<!-- 제목 -->
							<div class="modal-header">
								<!-- 닫기버튼 -->
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
									&times;
								</button>
								<h4 class="modal-title" id="myModalLabel">아이디/비밀번호 찾기</h4>
							</div>
							<!-- 내용 -->
							<div class="modal-body">
								<a href="25_find_id.do" class="fi" id="id">ID</a><a href="25_find_pw.do" class="fi">PW</a>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
			</div>
		</div>
	</section>
	
	<!-- 동적으로 생성될 HTML의 기본틀 -->
	<script type="text/x-handlebars-template" id="list-item-tmpl">
		<div class='accord-item'>
    		<h4 class='accord-title'><a class="hinfo" href="#content{{num}}" value="{{num}}">{{dutyName}}</a></h4>
    		<div id="content{{num}}" class="content">
				주소 : {{dutyAddr}}<br/>
				<a href="tel:{{dutyTel}}"> 전화번호 : {{dutyTel}}</a>
			</div>
    	</div>
	</script>
	
	<jsp:include page="./assets/inc/bottom.jsp" />
	<script src="./assets/plugins/ajax/ajax_helper.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDAYjCPxyhxx8fGlitbS4U2qMUJwWiY6yk"></script>
	<script src="./assets/plugins/gmaps/gmaps.min.js"></script>
	<script src='./assets/plugins/youcover/youCover.js'></script>
	<script src="./assets/plugins/handlebars/handlebars-v4.3.1.js"></script>
	<script type="text/javascript">
	$(function(){
		$("#erer").slideToggle(100);
		$("#logout").click(
			function(){
			e.preventDefault();	
			var result = confirm("정말 로그아웃 하시겠습니까?");
			
			if (result) {
				location.href="coodel.do";
			} else {
				alert("로그아웃이 취소되었습니다.");
			}
			 
			}) //end click
		
		var map = new GMaps({
			el: '#gmap',		//지도를 표시할 div의 id값
			lat: 37,		//지도가 표시될 위도
			lng: 127,		//지도가 표시될 경도
			zoom: 9
		});
		$(".login_btn").hover(
			function(e){
				$(this).css("background-color","#5E5E5E").css("color","#ffa500");
			},
			function(e){
				$(this).css("background-color","#5E5E5E").css("color","white");
			}	
		);
		$("#myer").click(
			function(e){
				e.preventDefault();	

				$("#erer").slideDown(100);
				$("#gmap").css("height","600px");
			}
		);
		$("#xx").click(
				function(e){
					e.preventDefault();		
					$("#erer").slideUp(100);
					$("#gmap").css("height","0");
				}
			);
		
		
		$(".gu").click(function(){
			var gu = $(this).val();
			var place =null;
			if (gu == 1) {
				place="(도봉구, 강북구, 성북구, 노원구)";
			} else if (gu==2){
				place="(동대문구, 중랑구, 성동구, 노원구)";
			} else if (gu==3) {
				place="(강동구, 송파구)";
			} else if (gu==4) {
				place="(서초구, 강남구)";
			} else if (gu==5) {
				place="(동작구, 관악구, 금천구)";
			} else if(gu ==6) {
				place="(강서구, 양천구, 영등포구, 구로구)";
			} else if (gu ==7) {
				place="(은평구, 마포구, 서대문구)";
			} else {
				place="(종로구, 중구, 용산구)";
			}
			console.log(gu);
			$(".prog").html( $(this).html() +" 응급실 위치 " + place);
			$.ajax({
				url:'fer.do',
				method:'get',
				data:{data:gu},
				dataType:'json',
				success:function(req){
					var map = new GMaps({
						el: '#gmap',		//지도를 표시할 div의 id값
						lat: req[0].wgs84Lat,		//지도가 표시될 위도
						lng: req[0].wgs84Lon,		//지도가 표시될 경도
						zoom: 14
					}); // end gmap
					
					$(".accord").empty();
					
					var looc=0;
					var c=0;
					var myhos ="";
					for(var i=0; i <req.length; i++){
						var hosname= req[i].dutyName;
						req[i].dutyName= i+1 + "." + req[i].dutyName;
						var desc = "<h3>";				
						desc += req[i].dutyName;
						desc += "</h3><br/>";
						desc += req[i].dutyAddr;
					
						req[i].num=i+1;
						var template = Handlebars.compile($("#list-item-tmpl").html());
						var html = template(req[i]);
						
						//#list에 읽어온 내용을 추가한다.
						$(".accord").append(html);
						
						
						//if(i == req.length-1){
							
						//} end if
						
						
						map.addMarker({
						//마우스 오버시 노란박스
							title: req[i].dutyName,
							lat: req[i].wgs84Lat,
							lng: req[i].wgs84Lon,
							icon:{
								url:"./assets/plugins/gmaps/map-marker.png",
								scaledSize: new google.maps.Size(50, 50)
							},
							
							infoWindow:{	//클릭시 표시될 말풍선 <-- HTML코딩 가능함.
								content: desc
							}
						})
						
						
						if(${list[0].x != 0 }){
							var xlen = ${list[0].x} - req[i].wgs84Lon;
							console.log(xlen * -1);
							if(xlen * -1){ xlen = xlen * -1;}
							var ylen = ${list[0].y} - req[i].wgs84Lat;
							if(ylen * -1){ ylen = ylen * -1;}
							if(i==0){
								looc= xlen + ylen; 
								c = i+1;
								myhos = hosname;
							}
							if( looc > xlen +ylen){
								looc= xlen + ylen;
								c = i+1;
								myhos = hosname;
							}
						}//end if
					} //end for
					
					
					if(${list[0].x != 0 } && ${ list[0].x != null} ){
						console.log("${list[0].x}");
						var text = "<div class='accord-item'><h4 class='accord-title'><a class='hinfo' href='#content0' value='0'>우리집!</a></h4><div id='content0' class='content'>집</a></div></div>";
						$(".accord").prepend(text);
						map.addMarker({
							//마우스 오버시 노란박스
							title: "우리집!",
							lat: ${list[0].y},
							lng: ${list[0].x},
							icon:{
								url:"./assets/plugins/gmaps/map-marker3.png",
								scaledSize: new google.maps.Size(50, 50)
							},
							
							infoWindow:{	//클릭시 표시될 말풍선 <-- HTML코딩 가능함.
								content: "<h2>우리집!</h2><h4 style='line-height: 122%;'> 제일 가까운 응급실은 <br/><mark>" + myhos +" </mark> <br/>입니다.</h4>"
							}
						})
						
					}// end if
					
					$(".accord-title a").click(function(e) {
			            // 링크의 기본 동작(페이지 이동) 방지
						e.preventDefault();

						var target = $(this).attr('href');
						$(target).slideToggle(100);
						$(".content").not($(target)).slideUp(100);
					
						var title = $(this).html();
						
						
						$("#gmap").find("div[title='"+title+"']").click();

					});	
					
					$(document).on('click','#gmap > div > div > div > div > div > div > div',function(e) {
						var aa= $(this).attr('title');
						
						var num = aa.indexOf(".");
						var key = aa.substring(0, num);
						
						
						$('.accord').animate({scrollTop : 254}, 0);
						$("#content" +key).slideDown(100);
						$(".content").not($("#content" +key)).slideUp(100);
					}); 
					
					if(${list[0].x} != 0){
						$(".accord-title a[value='"+c+"']").parent().css('background-color', '#f0ad4e');
						$(".accord-title a[value='"+c+"']").click();
						var title = $(".accord-title a[value='"+c+"']").html();
						console.log(title);
						$("#gmap").find("div[title='"+title+"']").click();
					}
					
				} 		
			});//end ajax
		}); 
		if(${gu ne null }){
			if("${gu}" == "도봉구" || "${gu}" == "강북구" || "${gu}" == "성북구" || "${gu}" =="노원구"){
				$("button[value='1']").click()
			}else if("${gu}" == "동대문구" || "${gu}" == "중랑구" || "${gu}" == "성동구" || "${gu}" =="광진구"){
				$("button[value='2']").click()
			}else if("${gu}" == "강동구" || "${gu}" == "송파구"){
				$("button[value='3']").click()
			}else if("${gu}" == "서초구" || "${gu}" == "강남구"){
				$("button[value='4']").click()
			}else if("${gu}" == "동작구" || "${gu}" == "관악구" || "${gu}" == "금천구"){
				$("button[value='5']").click()
			}else if("${gu}" == "강서구" || "${gu}" == "양천구" || "${gu}" == "영등포구" || "${gu}" =="구로구"){
				$("button[value='6']").click()
			}else if("${gu}" == "은평구" || "${gu}" == "마포구" || "${gu}" == "서대문구"){
				$("button[value='7']").click()
			}else if("${gu}" == "종로구" || "${gu}" == "중구" || "${gu}" == "용산구"){
				$("button[value='8']").click()
			}	
		}
	});
	</script>
  </body>
</html>