<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!doctype html>
<html lang="ko">
  <head>
	<jsp:include page="./assets/inc/head.jsp" />
    <link rel="stylesheet" type="text.css" href="./assets/plugins/ajax/ajax_helper.css">
    <style type="text/css">
    	.line{
    		padding-bottom:20px !important;
    		border-bottom:1px solid #eee ;
    	}
    	.pppp{
    		padding-left : 15px;
    		padding-right :15px;
    	}
    	.accord-item:first-child > .accord-title {
        	margin-top:0;
        }
     	#gmap{	height: 800px;}
     	/* 전체 박스 크기 및 정렬 */
    	.accord { width: auto; margin: auto; }
	
		.accord-item{
			width:255px;
		}
        /* 제목 영역의 배경색상과 태두리 */
    	.accord-title {  background: #eeeeee; border: 1px solid #d5d5d5; }

        /* 제목영역의 링크에 대한 크기, 글자모양 */
    	 .accord-title > a {
    		display: block; width: auto;
    		padding: 10px;
    		color: #222;
    		font-size: 14px; 
    		text-decoration: none
    	} 

        /* 내용영역의 여백, 글자크기, 태두리, 숨김 */
    	.content {
    		padding: 10px 15px;
    		font-size: 12px;
    		border-left: 1px solid #d5d5d5;
    		border-right: 1px solid #d5d5d5;
    		display: none;
    	}

        /* 마지막 내용 박스의 테두리 보정 */
    	.content:last-child { border-bottom: 1px solid #d5d5d5;	}
    </style>
  </head>
  <body>
	<jsp:include page="./assets/inc/top.jsp" />
	<div class='container'>
		<h1 class="line">응급실 찾기</h1>
	</div>
	<br/>
	<div class="container">
		<button class="btn btn-warning gu" value="1">강북 지역</button>
		<button class="btn btn-warning gu" value="2">동서울 지역</button>
		<button class="btn btn-warning gu" value="3">동남 지역</button>
		<button class="btn btn-warning gu" value="4">강남 지역</button>
		<button class="btn btn-warning gu" value="5">남서울 지역</button>
		<button class="btn btn-warning gu" value="6">서남 지역</button>
		<button class="btn btn-warning gu" value="7">서서울 지역</button>
		<button class="btn btn-warning gu" value="8">도심 지역</button>
	</div>
	<div class="container">
		<div class="prog">
			<span class="progtext">지역을 선택해 주세요</span>
		</div>
		<div class="row pppp">
			<div class="col-md-9" id="gmap"></div>
			<div class="col-md-3 accord">
				<div class='accord-item'>
    				<h4 class='accord-title'><a href="#content"></a></h4>
    				<div id="content" class="content">
				
				<a href="tel:{{dutyTel}}"> </a>
			</div>
    	</div>
			</div>
		</div>
	</div>
	
	 
	
	
	<!-- 동적으로 생성될 HTML의 기본틀 -->
	<script type="text/x-handlebars-template" id="list-item-tmpl">
		<div class='accord-item'>
    		<h4 class='accord-title'><a href="#content{{num}}" value="{{num}}">{{dutyName}}</a></h4>
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
	<script src="./assets/plugins/handlebars/handlebars-v4.3.1.js"></script>
	<script type="text/javascript">
    $(function(){
    	var map = new GMaps({
			el: '#gmap',		//지도를 표시할 div의 id값
			lat: 37,		//지도가 표시될 위도
			lng: 127,		//지도가 표시될 경도
			zoom: 9
		});
    	
    	
    	
    	
    	
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
					
					
					if(${list[0].x} != 0){
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
    	if("${gu}" != null){
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