<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!doctype html>
<html lang="ko">
<head>
     <jsp:include page="./assets/inc/head.jsp" />
     <style type="text/css">
	     .container {
		position: relative;
		text-align: center;
		}
		
		.title {
			position: absolute;
			top: 30px;
			left: 85px;
		}
		
		.form-horizontal {
			position: absolute;
			top: 120px;
			left: 85px;
			width: 1000px;
			display: inline-block;
		}
		
		#dupcheck, #dupcheck2 { !important;
			border: 1.5px solid orange;
			background-color: white;
			color: orange;
			border-radius: 5px;
			height: 30px;
		}
		
		#emailcerti { !important;
			border: 1.5px solid orange;
			background-color: white;
			color: orange;
			border-radius: 5px;
			height: 30px;
		}
		
		.col-md-10 {
			text-align: left;
			line-height: 50%;
		}
		
		label {
			font-weight: normal;
		}
		
		.identify {
			color: red;
		}
		
		.birthdate {
			width: 300px;
		}
		
		.form-group {
			text-align: center;
		}
		
		.text-center {
			position: absolute;
			top: 800px;
			left: 400px;
		}
		#addr1, #addr2, #addr3, #addr4, .col-md-10 > input {
		    display: inline;
		}
		
		#joinbutton {
			position: relative;
			top: 0px;
			left: -20px;
		}
		
		#resetbutton {
			position: relative;
			top: 0px;
			right: -20px;
		}
		
		#postcode {
    	border: 1.5px solid orange;
			background-color: white;
			color: orange;
			border-radius: 5px;
			height: 30px;
    	}
		  	
    	.findAdd1 {
    		width: 200px;
    	}
    	
    	.findAdd2 {
    		width: 700px;
    		margin: 5px 0;
    	}
    	
    	.findAdd3 {
    		width: 400px;
    	}
		
     </style>
</head>
<body>
<jsp:include page="./assets/inc/top.jsp" />
	<div class="container" style="height: 1000px;">
		<h3 class="title">
			<strong>회원가입 - 일반인</strong>
		</h3>
		
		<form class="form-horizontal" name="join_form" id="join_form" method = "post"  action="11_Sign_up_i_add.do" >
			<div class="form-group">
				<label for='user_id' class="col-md-2">아이디 <span class='identify'>*</span></label>
				<div class="col-md-10">
					<input type="text" name="user_id" id="user_id" class="form-control" />
					<br />
					<br />
					<button type="button" id="dupcheck" value="0">아이디 중복검사</button>
					<br />
				</div>
			</div>
			<br />
			<div class="form-group">
				<label for='user_pw' class="col-md-2">비밀번호 <span class='identify'>*</span></label>
				<div class="col-md-10">
					<input type="password" name="user_pw" id="user_pw" class="form-control" />
				</div>
			</div>
			<br />
			<div class="form-group">
				<label for='user_pw' class="col-md-2">비밀번호 확인 <span class='identify'>*</span></label>
				<div class="col-md-10">
					<input type="password" name="user_pw_re" id="user_pw_re" class="form-control" />
				</div>
			</div>
			<br />
			<div class="form-group">
				<label for='user_name' class="col-md-2">이름 <span class='identify'>*</span></label>
				<div class="col-md-10">
					<input type="text" name="name" id="name" class="form-control" />
				</div>
			</div>
			<br />
			<div class="form-group">
				<label for='gender1' class="col-md-2">성별 <span class='identify'>*</span></label>
				<div class="col-md-10">
					<label><input type='radio' name='gender' id='gender1' value='1'>남자</label> 
					&nbsp; 
					<label><input type='radio' name='gender' id='gender2' value='2'>여자</label>
				</div>
			</div>
			<br />
			<div class="form-group">
				<label for='birthdate' class="col-md-2">생년월일 <span	class='identify'>*</span></label>
				<div class="col-md-10">
					<input type="date" id="birthdate" name="birthdate" class="form-control">
				</div>
			</div>
    		<br />
			<div class="form-group">
				<label for='email' class="col-md-2">이메일 <span class='identify'>*</span></label>
				<div class="col-md-10">
					<input type="email" name="email" id="email" class="form-control" />
					<br />
					<br />
					<button type="button" id="dupcheck2" value="0">이메일 중복검사</button>
					<br />
				</div>
			</div>
			<br />
			<br />
			<div class="form-group">
            <label for='address' class="col-md-2">주소 <span class='identify'>*</span></label>
            <div class="col-md-10">
            <input type="text" id="sample6_postcode" name="addr1" class="form-control findAdd1" placeholder="우편번호">
			<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" id="postcode"><br>
			<input type="text" id="sample6_address" name="addr2" class="form-control findAdd2" placeholder="주소"><br>
			<input type="text" id="sample6_detailAddress" name="addr3" class="form-control findAdd3" placeholder="상세주소">
			<input type="text" id="sample6_extraAddress" name="addr4" class="form-control findAdd3" placeholder="참고항목">
				<br/>
				<br/>
				<p style="font-style:italic; font-size: 13px;">입력하신 주소는 '병원찾기' 및 '응급실찾기' 이용 시 기본 주소로 사용됩니다.</p>            
            </div>
        </div>
			
			<div class="form-group">
				<label for='tel' class="col-md-2">연락처 <span class='identify'>*</span></label>
				<div class="col-md-10">
					<input type="tel" name="tel" id="tel" class="form-control" />
				</div>
			</div>
			<br /> 
			<div class="form-group">
				<div class="text-center">
					<button type="submit" id="joinbutton" class="btn btn-warning btn-lg">가입하기</button>
					&nbsp;
					<button type="reset" id="resetbutton" class="btn btn-warning btn-lg">다시작성</button>
				</div>
			</div>
		</form>
	</div>
	<jsp:include page="./assets/inc/bottom.jsp" /> 
	<script src="./assets/plugins/ajax/ajax_helper.js"></script>
	
	<script type="text/javascript">
	$(function() {
		$("#dupcheck").click(function() {
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
				console.log(req);
				
				if (req == 'OK') {
					alert("사용 가능한 아이디 입니다.");
					$("#dupcheck").attr("value", 1);
					
				} else {
					alert("사용할 수 없는 아이디 입니다.");
					$("#dupcheck").attr("value", 0);
					$("#user_id").val("");
					$("#user_id").focus();
				}
			});
		});
		
		$("#dupcheck2").click(function() {
			var eamil_val = $("#email").val();
			
			if(!eamil_val) {
				alert("이메일을 입력하세요!!!");
				$("#email").focus();
				return false;
			} 
			
			$.post('eamilCheck.do', {email: eamil_val}, function(req) {
				//사용 가능한 이메일인 경우 --> req = {status: "OK"}
				//사용 불가능한 이메일인 경우 --> req = {status: "FAIL"}
				
				if (req == 'OK') {
					alert("사용 가능한 이메일 입니다.");
					$("#dupcheck2").attr("value", 1);
					
				} else {
					alert("사용할 수 없는 이메일 입니다.");
					$("#dupcheck2").attr("value", 0);
					$("#email").val("");
					$("#email").focus();
				}
			});
		});
	});
	
	$(function() {
		/** 가입폼의 submit 이벤트 */
		$("#join_form").submit(	function(e) {
			// 기본동작 수행 방식
			//e.preventDefault();
	
			var complete = $("#dupcheck").val();
			
			if (complete == 0) {
				alert("아이디 중복검사를 실행해주세요");
				return false;
			} 
			
			/** 아이디 검사 */
            if (!regex.value('#user_id', '아이디를 입력하세요.')) { return false; }
            if (!regex.eng_num('#user_id', '아이디는 영어와 숫자 조합만 입력 가능합니다.')) { return false; }
            if (!regex.min_length('#user_id', 4, '아이디는 최소 4자 이상 입력 가능합니다.')) { return false; }
            if (!regex.max_length('#user_id', 20, '아이디는 최대 20자 까지만 입력 가능합니다.')) { return false; }

            /** 비밀번호 검사 */
            if (!regex.value('#user_pw', '비밀번호를 입력하세요.')) { return false; }
            if (!regex.min_length('#user_pw', 4, '비밀번호는 최소 4자 이상 입력 가능합니다.')) { return false; }
            if (!regex.max_length('#user_pw', 20, '비밀번호는 최대 20자 까지만 입력 가능합니다.')) { return false; }
            if (!regex.compare_to('#user_pw', '#user_pw_re', '비밀번호 확인이 잘못되었습니다.')) { return false; }
            
            /** 이름 검사 */
            if (!regex.value('#name', '이름을 입력하세요.')) { return false; }
            if (!regex.kor('#name', '이름은 한글만 입력 가능합니다.')) { return false; }
            if (!regex.min_length('#name', 2, '이름은 최소 2자 이상 입력 가능합니다.')) { return false; }
            if (!regex.max_length('#name', 20, '이름은 최대 20자 까지만 입력 가능합니다.')) { return false; }

            /* 성별 검사 */
            if (!regex.check('input[name=gender]', '성별을 선택하세요.')) {return false;}
            
            /* 생년월일 */
            if (!regex.value('#birthdate', '생년월일을 선택하세요.')) { return false; }
            
            /** 이메일 검사 */
            if (!regex.value('#email', '이메일을 입력하세요.')) { return false; }
            if (!regex.email('#email', '이메일 주소가 잘못되었습니다.')) { return false; }
            
            /* 주소 검사 */
             if (!regex.value('input[name=addr1]', '우편번호를 입력하세요.')) { return false; }
            if (!regex.value('input[name=addr2]', '주소를 입력하세요.')) { return false; }
            if (!regex.value('input[name=addr3]', '상세 주소를 입력하세요.')) { return false; }
       
            
            /** 연락처 검사 */
            if (!regex.value('#tel', '연락처를 입력하세요.')) { return false; }
            if (!regex.phone('#tel', '연락처가 잘못되었습니다.')) { return false; }
            
			// 처리 완료
			/* alert("회원정보 입력이 완료되었습니다."); */
			});
	});
	</script>
<script src="./assets/js/regex.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
</body>
</html>