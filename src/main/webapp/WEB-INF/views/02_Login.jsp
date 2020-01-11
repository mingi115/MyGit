<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html lang="ko">
  <head>
	<jsp:include page="./assets/inc/head.jsp" />
    <style type="text/css">
    	.lbox{
    		width:600px;
    	}
    	.lo-box{
    		height:430px;
    		width:600px;
    		margin-top:150px;
    		border-radius:10px;
    	 	background-color: #ffa500;
    	}
    	
    	.form-group{
    		width:600px;
    		text-align: center;
    	}
    	.form-group label{
    		font-size:25px;
    	}
    	#user_id, #user_pw{
    		width:400px !important;
    		height:50px;
    	}
    	
    	#li-btn{
    		
    		width:450px;
    		height:100px;
    		margin:auto;
    		background-color: #696969;
    		font-size:50px;
    	}
    	#check{margin-left:25px; font-size: 17px;}
    	input[type=checkbox]{ width:17px; height:17px;}
    	.find_id{ color:black; margin-left:90px; font-size: 17px;}
    	.sign_up{  color:black;  margin-left:130px; font-size: 17px;}
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
		<div class="container lbox" style="height:718px;">
			<form method="post" class="form-inline lo-box" action="coosave.do">
				<fieldset >
				
					<div class="container blank" style="height:30px;"></div>
				
					<!-- 다음예제에서 반복됩니다. -->
					<div class="form-group">
						<label for="user_id">아이디</label>
						<br/>
						<input type="text" id="user_id" name="user_id" class="form-control" value="${id }" placeholder="아이디를 입력하세요."/>
					</div>
					<div class="container blank" style="height:30px;"></div>
					<div class="form-group">
						<label for="user_pw">비밀번호</label>
						<br/>
						<input type="password" id="user_pw" name="user_pw" class="form-control"  placeholder="비밀번호를 입력하세요."/>
					</div>
					<input type="hidden" name="document_id" value="${document_id}" />
					<div class="container blank" style="height:30px;"></div>
				
					<button id="li-btn" type="submit" class="btn btn-primary btn-block">로그인</button>
					<br/>
					<label id="check"><input type="checkbox" name="autologin" value="7">아이디 저장</label>
					<a href="#myModal3" data-toggle="modal" class="find_id">아이디/비밀번호 찾기</a>
					<a href="09_Sign_up_a.do" class="sign_up">회원 가입</a>
					<!-- 여기까지 입니다. -->
				</fieldset>
			</form>
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
	</section>
	<jsp:include page="./assets/inc/bottom.jsp" />
	<script src="./assets/js/regex.js"></script>
	<script type="text/javascript">
	$(function(){
		
		$("#li-btn").hover(
			function(e){
				$(this).css("background-color","#5E5E5E").css("color","#ffa500");
			},
			function(e){
				$(this).css("background-color","#5E5E5E").css("color","white");
			}	
		);
		$("#li-btn").mousedown(
				function(e){
					$(this).css("background-color","white").css("color","#ffa500");
				}		
		);
		$("#li-btn").mouseup(
				function(e){
					$(this).css("background-color","#5E5E5E").css("color","#ffa500");
				}		
		);
		$(".lo-box").submit(function(e){
			//기본동작 수행방식
			/*아이디 검사*/
			if (!regex.value('#user_id', '아이디를 입력하세요.')) {return false;}
			if (!regex.value('#user_pw', '비밀번호를를 입력하세요.')) {return false;}
		});
	});
	</script>
  </body>
</html>