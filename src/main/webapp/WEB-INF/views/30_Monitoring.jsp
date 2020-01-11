<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="./assets/inc/head.jsp" />
<link rel="stylesheet" type="text.css" href="./assets/plugins/ajax/ajax_helper.css">
	<!-- handlebar plugin -->
<script src="./assets/plugins/handlebars/handlebars-v4.3.1.js"></script>
<style type="text/css">
.ththth {
	font-size: 12px;
	vertical-align: middle !important;
	font-weight: normal;
	text-align: center;
	line-height: 1;
	background: #eeeeee;
}

.tdtdtd {
	font-size: 12px;
	vertical-align: middle !important;
	font-weight: normal;
	text-align: center;
	line-height: 1;
}

h5 {
	margin: 0px;
}
#chartdiv {
  width: 100%;
  height: 500px;
}
</style>

</head>
<body>
	<jsp:include page="./assets/inc/top.jsp" />
	<div class="container" style="min-height: 1000px;">
		<header>
			<h1 style="padding: 15px 15px 0 15px;">서울시 응급실 현황</h1>
			<h2 id="timer" style="padding: 9px 15px 15px 15px; color: red; margin: 10px 0 10px 0;"></h2>
		</header>
		<div class="table-responsive">
			<br/>
			<br/>
			<ul class="nav nav-tabs">
				<li class="active"><a href="#home" data-toggle="tab" id="board">응급실 상황판</a></li>
				<li><a href="#graph" data-toggle="tab" id="erg">응급실 그래프</a></li>
			</ul>
			<div class="tab-content">
				<div class=" tab-pane fade in active" id="home">
					<table class="table table-bordered table-hover"	style="width: 1140px;" id="erer">	</table>
				</div>
				<div class=" tab-pane fade" id="graph">
					<form class="form-inline">
						<div class="form-group">
							<select id="parent" class="form-control">
								<option value="">-------------- 병원 --------------</option>
								<option id="no1" class="hosp" value="인제대학교서울백병원" selected>인제대학교서울백병원</option>
								<option class="hosp" value="의료법인풍산의료재단동부제일병원">의료법인풍산의료재단동부제일병원</option>
								<option class="hosp" value="녹색병원">녹색병원</option>
								<option class="hosp" value="서울특별시서울의료원">서울특별시서울의료원</option>
								<option class="hosp" value="연세대학교의과대학강남세브란스병원">연세대학교의과대학강남세브란스병원</option>
								<option class="hosp" value="삼성서울병원">삼성서울병원</option>
								<option class="hosp" value="강동경희대학교의대병원">강동경희대학교의대병원</option>
								<option class="hosp" value="성심의료재단강동성심병원">성심의료재단강동성심병원</option>
								<option class="hosp" value="한국보훈복지의료공단중앙보훈병원">한국보훈복지의료공단중앙보훈병원</option>
								<option class="hosp" value="이화여자대학교의과대학부속서울병원">이화여자대학교의과대학부속서울병원</option>
								<option class="hosp" value="부민병원">부민병원</option>
								<option class="hosp" value="에이치플러스양지병원">에이치플러스양지병원</option>
								<option class="hosp" value="건국대학교병원">건국대학교병원</option>
								<option class="hosp" value="혜민병원">혜민병원</option>
								<option class="hosp" value="구로성심병원">구로성심병원</option>
								<option class="hosp" value="고려대학교의과대학부속구로병원">고려대학교의과대학부속구로병원</option>
								<option class="hosp" value="희명병원">희명병원</option>
								<option class="hosp" value="한국원자력의학원원자력병원">한국원자력의학원원자력병원</option>
								<option class="hosp" value="인제대학교상계백병원">인제대학교상계백병원</option>
								<option class="hosp" value="노원을지대학교병원">노원을지대학교병원</option>
								<option class="hosp" value="의료법인한전의료재단한일병원">의료법인한전의료재단한일병원</option>
								<option class="hosp" value="경희대학교병원">경희대학교병원</option>
								<option class="hosp" value="삼육서울병원">삼육서울병원</option>
								<option class="hosp" value="서울특별시동부병원">서울특별시동부병원</option>
								<option class="hosp" value="서울성심병원">서울성심병원</option>
								<option class="hosp" value="서울특별시보라매병원">서울특별시보라매병원</option>
								<option class="hosp" value="중앙대학교병원">중앙대학교병원</option>
								<option class="hosp" value="학교법인연세대학교의과대학세브란스병원">학교법인연세대학교의과대학세브란스병원</option>
								<option class="hosp" value="의료법인동신의료재단동신병원">의료법인동신의료재단동신병원</option>
								<option class="hosp" value="학교법인가톨릭학원가톨릭대학교서울성모병원">학교법인가톨릭학원가톨릭대학교서울성모병원</option>
								<option class="hosp" value="한양대학교병원">한양대학교병원</option>
								<option class="hosp" value="(학)고려중앙학원고려대학교의과대학부속병원(안암병원)">(학)고려중앙학원고려대학교의과대학부속병원(안암병원)</option>
								<option class="hosp" value="경찰병원">경찰병원</option>
								<option class="hosp" value="재단법인아산사회복지재단서울아산병원">재단법인아산사회복지재단서울아산병원</option>
								<option class="hosp" value="홍익병원">홍익병원</option>
								<option class="hosp" value="서울특별시서남병원">서울특별시서남병원</option>
								<option class="hosp" value="이화여자대학교의과대학부속목동병원">이화여자대학교의과대학부속목동병원</option>
								<option class="hosp" value="가톨릭대학교여의도성모병원">가톨릭대학교여의도성모병원</option>
								<option class="hosp" value="명지성모병원">명지성모병원</option>
								<option class="hosp" value="대림성모병원">대림성모병원</option>
								<option class="hosp" value="한림대학교강남성심병원">한림대학교강남성심병원</option>
								<option class="hosp" value="성애의료재단성애병원">성애의료재단성애병원</option>
								<option class="hosp" value="순천향대학교 부속 서울병원">순천향대학교 부속 서울병원</option>
								<option class="hosp" value="가톨릭대학교 은평성모병원">가톨릭대학교 은평성모병원</option>
								<option class="hosp" value="의료법인 청구성심병원">의료법인 청구성심병원</option>
								<option class="hosp" value="서울대학교병원">서울대학교병원</option>
								<option class="hosp" value="강북삼성병원">강북삼성병원</option>
								<option class="hosp" value="서울적십자병원">서울적십자병원</option>
								<option class="hosp" value="세란병원">세란병원</option>
								
							</select>
						</div>
					</form>
					<h3 id="hosname"></h3>
					<div id="chartdiv"></div>
				</div>
			</div>
			
		</div>
	</div>
	<!-- Ajax로 읽어온 내용을 출력하는데 사용될 HTML 템플릿 -->
	<script id="list-item-tmpl" type="text/x-hendlebars-template">
	
		<thead>
			<tr>
				<td colspan="10" class="text-left"
					style="line-height: 1; font-size: 22px; padding: 15px 0px; border-bottom: 0;">&nbsp;
					{{dutyName}}</td>
			</tr>
			<tr>
				<td colspan="10" class="text-left"
					style="line-height: 1; font-size: 13px; padding: 15px 0px; border-bottom: 0;">&nbsp;&nbsp;
										{{addr}}
								&nbsp;&nbsp;&nbsp;연락처: {{tel}}</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th class="text-center ththth">응급실</th>
				<th class="text-center ththth">내과 중환자실</th>
				<th class="text-center ththth">외과 중환자실</th>
				<th class="text-center ththth">외과입원실</th>
				<th class="text-center ththth">신경과입원실</th>
				<th class="text-center ththth">신경외과 중환자실</th>
				<th class="text-center ththth">인큐베이터 유무</th>
				<th class="text-center ththth">외상중환자</th>
				<th class="text-center ththth">신경 중환자실</th>
				<th class="text-center ththth">신생아중환자실</th>
			</tr>
			<tr>
				<td class="tdtdtd">{{hvec}}</td>
				<td class="tdtdtd">{{hv2}}</td>
				<td class="tdtdtd">{{hv3}}</td>
				<td class="tdtdtd">{{hv4}}</td>
				<td class="tdtdtd">{{hv5}}</td>
				<td class="tdtdtd">{{hv6}}</td>
				<td class="tdtdtd">{{hv11}}</td>
				<td class="tdtdtd">{{hv9}}</td>
				<td class="tdtdtd">{{hvcc}}</td>
				<td class="tdtdtd">{{hvncc}}</td>
			</tr>
		</tbody>	
	</script>
	<jsp:include page="./assets/inc/bottom.jsp" />
	<script src="./assets/plugins/ajax/ajax_helper.js"></script>
	<!-- Resources -->
	<script src="https://www.amcharts.com/lib/4/core.js"></script>
	<script src="https://www.amcharts.com/lib/4/charts.js"></script>
	<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>
	<script type="text/javascript">
	
	function getBoard(){
		$.ajax( {
			url:'getErInfo.do',
			method:'get',
			dataType:'json',
			success: function(er) {
				$("#erer").empty();
				console.log(er)
				for(var i=0; i<49; i++){
					var template = Handlebars.compile($("#list-item-tmpl").html());
					var html = template(er[i]);
				
					$("#erer").append(html);
				}
			}
		});
	}
	var itv =setInterval(getBoard, 60000);
	function getGraph(pp){
		$.ajax({
			url:'ErGraph.do',
			method:'post',
			data:{hos:pp},
			dataType:'json',
			success: function(hos) {
				for(var t = 0 ; t < hos.length; t++){
					hos[t].inserttime= new Date(hos[t].inserttime);
				}
				am4core.disposeAllCharts();
				am4core.ready(function() {
					// Themes begin
					am4core.useTheme(am4themes_animated);
					// Themes end

					// Create chart instance
					var chart = am4core.create("chartdiv", am4charts.XYChart);
					chart.paddingRight = 20;
					// Add data
					chart.data = hos;

					// Create axes
					 var dateAxis = chart.xAxes.push(new am4charts.DateAxis());
					 dateAxis.renderer.minGridDistance = 30;
					 dateAxis.skipEmptyPeriods = true;
					// 
					 dateAxis.dateFormats.setKey("minute", "mm'분'");
					 dateAxis.periodChangeDateFormats.setKey("minute", "[bold]HH'시'");
					 dateAxis.periodChangeDateFormats.setKey("hour", "MMM dd"); 
					 dateAxis.tooltipDateFormat = { month: "long", day: "numeric", hour:"numeric", minute:"numeric"  };
					 
					// Create value axis
					var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
					valueAxis.baseValue = 0;

					// Create series
					var series = chart.series.push(new am4charts.LineSeries());
					series.dataFields.valueY = "hvec";
					series.dataFields.dateX = "inserttime";
					series.strokeWidth = 2;
					series.tensionX = 0.77;

					// bullet is added because we add tooltip to a bullet for it to change color
					var bullet = series.bullets.push(new am4charts.Bullet());
					bullet.tooltipText = "{valueY}";
					bullet.adapter.add("fill", function(fill, target){
					    if(target.dataItem.valueY < 0){
					        return am4core.color("#FF0000");
					    }
					    return fill;
					});
					
					var range = valueAxis.createSeriesRange(series);
					range.value = 0;
					range.endValue = -1000;
					range.contents.stroke = am4core.color("#FF0000");
					range.contents.fill = range.contents.stroke;
					
					// Add scrollbar
					 var scrollbarX = new am4charts.XYChartScrollbar();
					scrollbarX.series.push(series);
					chart.scrollbarX = scrollbarX; 

					chart.cursor = new am4charts.XYCursor();
				}); // end am4core.ready()	
			}
		}); //end ajax
	};
	
		$(function(){
			 $.ajax({
				url:'getErInfo.do',
				method:'get',
				dataType:'json',
				success: function(er) {
					$("#erer").empty();
					console.log(er)
					for(var i=0; i<49; i++){
						var template = Handlebars.compile($("#list-item-tmpl").html());
						var html = template(er[i]);
					
						$("#erer").append(html);
					}
				}
			}); //end ajax

			
			
			
			$("#parent").change(function(e){
				var subj = $("#parent").find("option:selected").val();
				$("#hosname").html(subj + " 의  응급실 포화도 변화 추이 입니다.");
				getGraph(subj);
			});
			
			$("#board").click(function(){
				itv = setInterval(getBoard, 60000);
			});
			
			$("#erg").click(function(){
				clearInterval(itv);
				var subj = $("#no1").val();
				$("#hosname").html(subj + " 의  응급실 포화도 변화 추이 입니다.");
				getGraph(subj);
				
			});
		});
		
		
	
	
	</script>

	<script type="text/javascript">
	function printTime() {
		// 현재 시각을 구한다.
		var days = [ "일", "월", "화", "수", "목", "금", "토" ];
		var mydate = new Date();

		var yy = mydate.getFullYear();
		var mm = mydate.getMonth() + 1;
		var dd = mydate.getDate();
		var i = mydate.getDay();
		var day = days[i];
		var hh = mydate.getHours();
		var mi = mydate.getMinutes();
		var ss = mydate.getSeconds();

		// 완성된 현재 시각
		var result = yy + "-" + mm + "-" + dd + " " + day + "요일 " + hh + ":"
				+ mi + ":" + ss;

		// id속성값이 timer인 요소에게 결과를 출력한다.
		document.getElementById("timer").innerHTML = result;
	}

	function startTimer() {
		// printTime 함수를 1초에 한번씩 반복해서 자동 호출한다.
		setInterval(printTime, 100);
	}
	jQuery(startTimer);
</script>
</body>
</html>