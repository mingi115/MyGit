<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
     <jsp:include page="./assets/inc/head.jsp" />
     <link rel="stylesheet" type="text.css" href="./assets/plugins/ajax/ajax_helper.css"> 
     <!-- handlebar plugin -->
     
     <style type="text/css">
     .container {
         position: relative;
      }
       
       #title {
         position: absolute;
         top: 30px;
      }
      
      #subtitle {
      	position: absolute;
      	top: 80px;
      }
      
      .dislist {
      	 /* diaplay: inline-block; */
         position: absolute !important;
         top: -40px;
         left: 0 !important;
         font-weight: bold;
         margin-top: 0;
         width: 150px;
      }
      
      .content {
      	 display: block;
         position: absolute;
         width: 1000px;
      }
      
      #content1 { 
      	top: 170px 
      }
      
      #mytab1 {
      	width: 500px;
      	position: relative;
      	top: 20px;
      }
      
      .a {
      	line-height: 1.5em;
      }
      
      .tab-content {
      	position: absolute;
      	top: 230px;
      	left:-100px;
/*       	border: 1px solid black;
 */      	height: 1260px;
      	width: 1400px;
      }
      
      #dept {
      	position: relative;
      	top: 100px;
      }
      
     #chartname0 {
      	position: relative;
      	left: 100px;
      	top: 30px;
      	width: 500px;
      }
      
      #chartname1 {
      	position: relative;
      	left: 100px;
      	top: 660px;
      	width: 500px;
      }
      
      #chartname2 {
      	position: relative;
      	left: 720px;
      	top: 630px;
      	width: 500px;
      }
      
      #chartname3 {
      	position: relative;
      	left: 100px;
      	top: 1200px;
      	width: 500px;
      }

     </style>
     
</head>

 <body>
 <jsp:include page="./assets/inc/top.jsp" />
   <!-- 자바스크립트 차트 라이브러리 amCharts4 사용 예시 -->
   <div class="container" style="min-height:2500px;">
      <h3 id="title"><strong>국민 관심 보건의료 통계자료</strong></h3>
      <h5 id="subtitle" style="font-style: italic; color: #333;">- 조회를 원하시는 자료의 버튼을 클릭해주세요!</h5>
      <!-- 차트 출력 -->
     <div> 
	      <div class="content" id="content1">
	      	<div>
	      	<form name="searchForm" id="searchForm" method="get">
				<select name="disName" id="disName" class="form-control dislist" style="width: 170px; text-align:center; font-weight:normal;">
		        	<option value="">-------- 질병명 -------</option>
		        	<option value="감기">감기</option>
					<option value="고혈압">고혈압</option>
					<option value="관절병증">관절병</option>
					<option value="비염">비염</option>
					<option value="알레르기성결막염">알레르기성 결막염</option>
					<option value="위식도 역류질환">위식도 역류질환</option>
					<option value="알레르기질환">알레르기질환</option>
					<option value="척추질환">척추질환</option>
					<option value="치아우식증">치아우식증</option>
					<option value="치주질환및치은염">치주질환 및 치은염</option>
	      		</select>
	
				<input type="hidden" name="selectedValue" id="selectedValue" value="${selectedValue}" />
		         <ul class="nav nav-tabs" id="mytab1">
		            <li id="y1" value="2014"><a href="#dept" data-toggle="tab" id="ct1">2014년</a></li>
		            <li id="y2" value="2015"><a href="#dept" data-toggle="tab" id="ct2">2015년</a></li>
		            <li id="y3" value="2016"><a href="#dept" data-toggle="tab" id="ct3">2016년</a></li>
		            <li id="y4" value="2017"><a href="#dept" data-toggle="tab" id="ct4">2017년</a></li>
		            <li id="y5" value="2018"><a href="#dept" data-toggle="tab" id="ct5">2018년</a></li>
		         </ul> 
	      	</form>
			</div>
	     </div> 
	     <!-- 탭 페이지 구성(단일페이지) -->
	     <div class="tab-content">
	     	<div id="chartname0"></div>
	        <div id="chartname1"></div>
	        <div id="chartname2"></div>
	        <div id="chartname3"></div>
	        <div role="tabpanel1" class="tab-pane fade active in" id="dept"></div>
	     </div>
     </div>   
	</div>      

   <jsp:include page="./assets/inc/bottom.jsp" />
   <script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
   
   <script src="./assets/plugins/ajax/ajax_helper.js"></script> 
   
   <!-- Resources -->
   <script src="https://www.amcharts.com/lib/4/core.js"></script>
   <script src="https://www.amcharts.com/lib/4/charts.js"></script>
   <script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>
   <script src="./assets/plugins/handlebars/handlebars-v4.3.1.js"></script>
   <script type="text/javascript">
   

	$(function() {
		$("#disName").change(function() {
			$("#dept").empty();
			
			$("#y2").attr("class", "");
			$("#y3").attr("class", "");
			$("#y4").attr("class", "");
			$("#y5").attr("class", "");
			
			$("#y1").attr("class", "active");
			
			/* var choice2 = $("#y1").attr('value');
            console.log(choice2);
            if (!choice2) {return false;} */
            
     	   searchForm.selectedValue.value=$("#y1").val();
			
			$("#chartname0").empty();
	    	$("#chartname1").empty();
	        $("#chartname2").empty();
	        $("#chartname3").empty();
			
	        var chart0 = "<h4><strong><월별 환자 수 및 진료비용></strong></h4>"
			$("#chartname0").html(chart0);
	        
		    var chart1 = "<h4><strong><성별 환자 수(단위 :명)></strong></h4>"
			$("#chartname1").html(chart1);
					       
			var chart2 = "<h4><strong><연령별 환자수(단위 :명)></strong></h4>"
			$("#chartname2").html(chart2);
				
			var chart3 = "<h4><strong><지역별 환자수(단위 :명)></strong></h4>"
			$("#chartname3").html(chart3);
			
			var queryString = $('form').serializeArray();
			
            $.ajax({
               /** ajax 기본 옵션 */
               url: './assets/api/chart5.do',// 읽어들일 파일의 경로
               data : queryString,// 읽어들일 파일의 경로
               dataType: 'html',   //읽어올 내용 형식(html, xml, json)
               // 통신 성공시 호출될 함수 (파라미터는 읽어온 내용)
               success: function(req) {
                  console.log(">> 성공!!!! >> " + req);
                  // 준비된 요소에게 읽어온 내용을 출력한다.
                  $("#dept").html(req);
               }
            });//end $.ajax	 
			
				$("#ct1").click(function(e) {
		            $("#dept").empty();
					
		            $("#y2").attr("class", "");
					$("#y3").attr("class", "");
					$("#y4").attr("class", "");
					$("#y5").attr("class", "");
					$("#y1").attr("class", "active");
		            
		     	   searchForm.selectedValue.value=$("#y1").val();
					
					$("#chartname0").empty();
			    	$("#chartname1").empty();
			        $("#chartname2").empty();
			        $("#chartname3").empty();
					
			        var chart0 = "<h4><strong><월별 환자 수 및 진료비용></strong></h4>"
					$("#chartname0").html(chart0);
			        
				    var chart1 = "<h4><strong><성별 환자 수(단위 :명)></strong></h4>"
					$("#chartname1").html(chart1);
							       
					var chart2 = "<h4><strong><연령별 환자수(단위 :명)></strong></h4>"
					$("#chartname2").html(chart2);
						
					var chart3 = "<h4><strong><지역별 환자수(단위 :명)></strong></h4>"
					$("#chartname3").html(chart3);
					
					var queryString = $('form').serializeArray();
					
                    $.ajax({
                       /** ajax 기본 옵션 */
                       url: './assets/api/chart5.do',// 읽어들일 파일의 경로
                       data : queryString,// 읽어들일 파일의 경로
                       dataType: 'html',   //읽어올 내용 형식(html, xml, json)
                       // 통신 성공시 호출될 함수 (파라미터는 읽어온 내용)
                       success: function(req) {
                          console.log(">> 성공!!!! >> " + req);
                          // 준비된 요소에게 읽어온 내용을 출력한다.
                          $("#dept").html(req);
                       }
                    });//end $.ajax
				}); // end #ct1 click
				
				$("#ct2").click(function(e) {
					$("#dept").empty();
					
					$("#y1").attr("class", "");
					$("#y3").attr("class", "");
					$("#y4").attr("class", "");
					$("#y5").attr("class", "");
					$("#y2").attr("class", "active");
					
			     	searchForm.selectedValue.value=$("#y2").val();
		            
					$("#chartname0").empty();
			    	$("#chartname1").empty();
			        $("#chartname2").empty();
			        $("#chartname3").empty();
					
			        var chart0 = "<h4><strong><월별 환자 수 및 진료비용></strong></h4>"
					$("#chartname0").html(chart0);
				        
				    var chart1 = "<h4><strong><성별 환자 수(단위 :명)></strong></h4>"
					$("#chartname1").html(chart1);
							       
					var chart2 = "<h4><strong><연령별 환자수(단위: 천원)></strong></h4>"
					$("#chartname2").html(chart2);
						
					var chart3 = "<h4><strong><지역별 환자수(단위: 명)></strong></h4>"
					$("#chartname3").html(chart3);
					
					var queryString = $('form').serialize();
                    $.ajax({
                       /** ajax 기본 옵션 */
                       url: './assets/api/chart5.do',// 읽어들일 파일의 경로
                       data : queryString,// 읽어들일 파일의 경로
                       dataType: 'html',   //읽어올 내용 형식(html, xml, json)
                       // 통신 성공시 호출될 함수 (파라미터는 읽어온 내용)
                       success: function(req) {
                          console.log(">> 성공!!!! >> " + req);
                          // 준비된 요소에게 읽어온 내용을 출력한다.
                          $("#dept").html(req);
                       }
                    });//end $.ajax
				}); // end #ct2 click
				
				$("#ct3").click(function(e) {
					$("#dept").empty();
					
					$("#y1").attr("class", "");
					$("#y2").attr("class", "");
					$("#y4").attr("class", "");
					$("#y5").attr("class", "");
					$("#y3").attr("class", "active");
					
		            searchForm.selectedValue.value=$("#y3").val();
		            
					$("#chartname0").empty();
			    	$("#chartname1").empty();
			        $("#chartname2").empty();
			        $("#chartname3").empty();
					
			        var chart0 = "<h4><strong><월별 환자 수 및 진료비용></strong></h4>"
					$("#chartname0").html(chart0);
				        
				    var chart1 = "<h4><strong><성별 환자 수(단위 :명)></strong></h4>"
					$("#chartname1").html(chart1);
							       
					var chart2 = "<h4><strong><연령별 환자수(단위: 천원)></strong></h4>"
					$("#chartname2").html(chart2);
						
					var chart3 = "<h4><strong><지역별 환자수(단위: 명)></strong></h4>"
					$("#chartname3").html(chart3);
					
					var queryString = $('form').serialize();
                    $.ajax({
                       /** ajax 기본 옵션 */
                       url: './assets/api/chart5.do',// 읽어들일 파일의 경로
                       data : queryString,// 읽어들일 파일의 경로
                       dataType: 'html',   //읽어올 내용 형식(html, xml, json)
                       // 통신 성공시 호출될 함수 (파라미터는 읽어온 내용)
                       success: function(req) {
                          console.log(">> 성공!!!! >> " + req);
                          // 준비된 요소에게 읽어온 내용을 출력한다.
                          $("#dept").html(req);
                       }
                    });//end $.ajax
				}); // end #ct3 click
				
				$("#ct4").click(function(e) {
					$("#dept").empty();
					
					$("#y1").attr("class", "");
					$("#y2").attr("class", "");
					$("#y3").attr("class", "");
					$("#y5").attr("class", "");
					$("#y4").attr("class", "active");
					
		            searchForm.selectedValue.value=$("#y4").val();
		            
					$("#chartname0").empty();
			    	$("#chartname1").empty();
			        $("#chartname2").empty();
			        $("#chartname3").empty();
					
			        var chart0 = "<h4><strong><월별 환자 수 및 진료비용></strong></h4>"
					$("#chartname0").html(chart0);
				        
				    var chart1 = "<h4><strong><성별 환자 수(단위 :명)></strong></h4>"
					$("#chartname1").html(chart1);
							       
					var chart2 = "<h4><strong><연령별 환자수(단위: 천원)></strong></h4>"
					$("#chartname2").html(chart2);
						
					var chart3 = "<h4><strong><지역별 환자수(단위: 명)></strong></h4>"
					$("#chartname3").html(chart3);
					
					var queryString = $('form').serialize();
                    $.ajax({
                       /** ajax 기본 옵션 */
                       url: './assets/api/chart5.do',// 읽어들일 파일의 경로
                       data : queryString, // 읽어들일 파일의 경로
                       dataType: 'html',   //읽어올 내용 형식(html, xml, json)
                       // 통신 성공시 호출될 함수 (파라미터는 읽어온 내용)
                       success: function(req) {
                          console.log(">> 성공!!!! >> " + req);
                          // 준비된 요소에게 읽어온 내용을 출력한다.
                          $("#dept").html(req);
                       }
                    });//end $.ajax
				}); // end #ct4 click
				
				$("#ct5").click(function(e) {
					$("#dept").empty();
					
					$("#y1").attr("class", "");
					$("#y2").attr("class", "");
					$("#y3").attr("class", "");
					$("#y4").attr("class", "");
					$("#y5").attr("class", "active");
					
					var choice2 = $("#y5").attr('value');
		            console.log(choice2);
		            if (!choice2) {return false;}
					
		            searchForm.selectedValue.value=$("#y5").val();
		            
					$("#chartname0").empty();
			    	$("#chartname1").empty();
			        $("#chartname2").empty();
			        $("#chartname3").empty();
					
			        var chart0 = "<h4><strong><월별 환자 수 및 진료비용></strong></h4>"
					$("#chartname0").html(chart0);
				        
				    var chart1 = "<h4><strong><성별 환자 수(단위 :명)></strong></h4>"
					$("#chartname1").html(chart1);
							       
					var chart2 = "<h4><strong><연령별 환자수(단위: 천원)></strong></h4>"
					$("#chartname2").html(chart2);
						
					var chart3 = "<h4><strong><지역별 환자수(단위: 명)></strong></h4>"
					$("#chartname3").html(chart3);
					
					var queryString = $('form').serialize();
                    $.ajax({
                       /** ajax 기본 옵션 */
                       url: './assets/api/chart5.do',// 읽어들일 파일의 경로
                       data : queryString,// 읽어들일 파일의 경로
                       dataType: 'html',   //읽어올 내용 형식(html, xml, json)
                       // 통신 성공시 호출될 함수 (파라미터는 읽어온 내용)
                       success: function(req) {
                          console.log(">> 성공!!!! >> " + req);
                          // 준비된 요소에게 읽어온 내용을 출력한다.
                          $("#dept").html(req);
                       }
                    });//end $.ajax
				}); // end #ct5 click
				
			//}) //end $.get (abc.do)
		})
	})
		
		
			    	
			       
			      

      
   
   </script>
   
</body>
</html>