<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html lang="ko">
  <head>
    <%-- <%@ include file="../inc/head.jsp" %> --%>
    <%-- <%@ include file="../inc/remote_css.jsp"%> --%>
     <jsp:include page="./assets/inc/head.jsp" />
    
    <style type="text/css">

.box {
	position:relative;
	right:15px;
	padding:0 0 0 20px;
	margin: 0 0 0 0;
	background:#fff;
	width:1170px;
}

h1 {
	padding: 50px 0 10px 0;
	margin:0 0 4px 40px;
	font-size:50px;
}

h5 {
	padding: 0 0 80px 0;
	margin:0 0 0 50px;
	font-size:25px;
}

/* 이미지 박스 */
div#box1 {
	width: 400px;
	height: 600px;
	margin: 0 40px 0 5px;
	border-color: #fff;
	background: url(./assets/img/heart_c2.jpg) no-repeat;
	background-size: 100% 100%;
	float: left;
		}
		
p {
	font-size:17px;
}

</style>
 </head>
  <body>
	<%-- <%@ include file="../inc/top.jsp" %> --%>
	<jsp:include page="./assets/inc/top.jsp" />
	
	<div class="container"style="min-height:500px;">
	
	<%-- <%@ include file="../inc/remote.jsp"%> --%>
	
				<div class="box" style="height: 950px;">
				<h1> 사이트 소개 </h1>
				<h5> Find Doctor의 현재와 미래를 함께해 주세요! </h5>
			<div id="box1"></div>

	<p> 응급의료는 국민의 생존권을 보장하기 위한 기본적이고 공공성이 높은 보건의료 서비스입니다.</p>
	<p> 생활 양상과 질병 구조의 변화로 인해 응급환자는 지속적으로 증가하고 있는 추세이며 경제수준 및 생활여건의 변화에 따라 전문화된 양질의 응급의료에 대한 국민의 요구와 기대가 높아지고 있습니다.</p>
	<p> 2019년 10월 20일에 설립된 Find Doctor는 모든 국민의 성별, 연령, 민족, 종교, 사회적 신분 또는 경제적 사정 등을 이유로 차별받지 아니하고 응급의료를 받을 권리를 보장하기 위해 응급체계의 서포팅 사이트로서의 역할을 수행할 예정에 있습니다.</p>
	<p> 현장 및 병원 응급의료의 질 향상 및 상호연계강화와 첨단 IT기술의 접목한 각종 정보화사업의 확대를 통해 국민들이 응급의료 서비스를 보다 신속하고 편리하게 이용할 수 있도록 응급실 및 병원 위치 찾기 시스템을 추진하고 있으며, 응급실에 시설, 인력, 장비 등을 확인하여 응급의료서비스의 질을 향상시키는데 노력하고 있습니다.</p>
	<p> 그간 응급의료체계 구축을 위한 지속적인 노력으로 외상환자 예방 가능한 사망률이 1998년에 50.4%, 2004년 39.6%, 2010년 35.2%로 점차 감소하고 있는 추세입니다. 이와 같은 결과는 응급의료의 질적 수준이 점차 향상되고 있다는 증거라고 생각 됩니다.</p>
	<p> 대한민국 응급의료 체계 시스템에서 2012년 4팀 1실, 서울 등 16개 지역에 응급의료정보센터를 확대운영하였고, 보건복지부「'18~'22 응급의료기본계획」 수립∙시행에 따라 2019년 7팀 2실 17개 지역센터 체계로 조직을 개편하고 새로운 도약을 준비하고 있습니다.</p>
	<p> 이에 따라 저희 Find Doctor 팀 또한 응급 환자 및 병원을 내방해야하는 국민의 상황에 손쉽게 찾아 볼 수 있도록 병원 찾기 시스템을 도입할 예정입니다.</p>
	<p> Find Doctor는
		우리 나라 응급의료체계의 장기 비전과 전략을 기반으로 도출할 수 있는 지표를 제시할 것이며,
		국민이 치료에 있어 가장 최선의 방향을 제시함으로써
		한층 더 질 높은 응급의료서비스를 국민여러분께 제공할 수 있도록 항상 함께 하겠습니다.</p>
	</div>
	</div>
	
	<%-- <%@ include file="../inc/bottom.jsp" %> --%>
	<jsp:include page="./assets/inc/bottom.jsp" />
  </body>
</html>