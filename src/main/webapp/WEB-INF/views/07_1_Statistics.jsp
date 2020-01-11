<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<jsp:include page="./assets/inc/head.jsp" />

</head>
<body>
<jsp:include page="./assets/inc/top.jsp" />
	<div class="container" style="min-height: 1000px;">
<h1>질병</h1>

	<c:forEach var='item' items='${output}' varStatus='status'>
		<table class="table table-bordered table-hover" style='width:1000px;'>
			<thead>
				<tr>
					<th>번호</th>
					<th>년월</th>
					<th>질병명</th>
					<th>지역</th>
					<th>환자수</th>
					<th>진료비용</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${item.id}</td>
					<td>${item.disMomth}</td>
					<td>${item.disName}</td>
					<td>${item.disRegion}</td>
					<td>${item.patientSum}</td>
					<td>${item.costSum}</td>
				</tr>
			</tbody>
		</table>
	</c:forEach>
	
	<h3>${regionStr}</h3>
	<h3>${patientCntStr}</h3>
	
	<div class="form-group">
		<label for="user_id">아이디</label>
		<div class="input-group">
			<input type="text" class="form-control" id="user_id" />
			<span class="input-group-btn">
				<button class="btn btn-primary" type="button" id="id_uniq_check">
				중복검사
				</button>		
			</span>
		</div>
	</div>
	
	
	
	    <!-- 그래프를 표시할 위치 -->
    <div id="barChart" style="width: 1024px; height: 600px"></div>

    <!-- 데이터 시각화 구현 -->
    <script src="//d3js.org/d3.v5.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/plugins/billboard/billboard.min.js"></script>
   
   <script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
   <script src="./assets/plugins/ajax/ajax_helper.js"></script> 

    <script type="text/javascript">
    	
	$(function() {
		$("#id_uniq_check").click(function() {
			var user_id_val = $("#user_id").val();
			
			if(!user_id_val) {
				alert("아이디를 입력하세요!!!");
				$("#user_id").focus();
				return false;
			} 
			
			$.post('idcheck.do', {user_id: user_id_val}, function(req) {
				//사용 가능한 아이디인 경우 --> req = {status: "OK"}
				//사용 불가능한 아이디인 경우 --> req = {status: "FAIL"}
				
				console.log(user_id_val);
				console.log(${json});
				console.log(req);
				
				if (req.status == 'OK') {
					alert("사용 가능한 아이디 입니다.");
				} else {
					alert("사용할 수 없는 아이디 입니다.");
					$("#user_id").val("");
					$("#user_id").focus();
				}
			});
		});
	});
    
    
    
        var chart = bb.generate({
            /** 그래프가 표시될 HTML 태그의 id값 지정 */
            bindto: "#barChart",
            /** 데이터 설정 */
            data: {
                // 데이터들 설정 [이름, 값1, 값2, 값3 ... 값n]
                columns: [
                    ['지역', ${regionStr}],
                    ['환자수', ${patientCntStr}]
                ],
                x: '지역',              // x축으로 사용할 데이터의 이름
                types: {                    // 그래프 종류 (데이터이름: 종류 )
                    "환자수": "bar"
                }
            },
            /** x, y축의 특성 설정 */
            axis: {
                // x축 설정
                x: {
                    type: "category",       // 종류 (timeseries, category, indexed)
                    height: 50,            // x축 텍스트 영역의 높이
                    tick: {                 // x축의 텍스트 속성
                        rotate: -45,
                        multiline: false
                    }
                }
            }
        });
    </script>
	
</div>
	<jsp:include page="./assets/inc/bottom.jsp" /> 
</body>
</html>