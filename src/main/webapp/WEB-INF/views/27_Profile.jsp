<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!doctype html>
<html lang="ko">
<head>
<jsp:include page="./assets/inc/head.jsp" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/reset.css " />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/plugins/sweetalert/sweetalert2.min.css" />
<style>
.bbox {
	width: 1170px;
	margin: auto;
	padding: 25px 0;
}

.top {
	text-align: center;
	margin: 20px 0;
}

.top span {
	display: block;
}

.content {
	width: 900px;
	border: 3px solid #ffa500;
	margin: auto;
}

.form-group {
	margin: 15px;
}

.form-group>div>select {
	display: inline-block;
	width: 15%;
}

.form-group>div>input {
	display: inline-block;
	width: 34%;
}

.identify {
	color: #f00;
}

#btn9  {
	padding: 5px;
}

#postcode {
    border: 1.5px solid orange;
	background-color: white;
	color: orange;
	border-radius: 5px;
	height: 30px;
	width: 120px;
}

#btn9 {
	border: 1.5px solid orange;
	background-color: orange;
	color: white;
	border-radius: 5px;
	height: 40px;
	width: 120px;
	margin-bottom: 10px;
}

.form-group>div>.findAdd1 {
	width: 200px;
}
    	
.form-group>div>.findAdd2 {
	width: 700px;
	margin: 5px 0;
}
    	
.form-group>div>.findAdd3 {
	width: 400px;
}
</style>
</head>
<body>
	<jsp:include page="./assets/inc/top.jsp" />
	<div class="bbox">
		<div class="container" style="min-height: 800px;">
			<div class="top">
				<span> <img
					src="${pageContext.request.contextPath}/assets/img/user.png">
				</span> <span> <b>회원 정보 수정</b>
				</span>
			</div>
			<!-- 가입폼 시작 -->


			<form class="content" name="join_form" id="join_form"
				action="edit_ok.do">	
				<input type="hidden" name="fdpmember_id" value="${output.fdpmember_id}" /> 
				<input type="hidden" name="member_grade" value="${output.member_grade}" /> 
				<input type="hidden" name="reg_date" value="${output.reg_date}" />
				<input type="hidden" name="user_pw" id="pwCheck" value="${output.user_pw}" disabled />
				
				<div class="form-row">
					<div class="form-group">
						<label for='user_id'>아이디</label> <input type="text"
							class="form-control" id="user_id" name="user_id"
							value="${output.user_id}" placeholder="${output.user_id}"
							readonly />
					</div>
					<div class="form-group">
						<label for='user_name'>이름</label> <input type="text"
							class="form-control" id="name" name="name" value="${output.name}"
							placeholder="${output.name}" readonly />
					</div>
				</div>
				<div class="form-row" id="changePw">
					<div class="form-group">
						<label for='user_pw'><a id="btn8">비밀번호 수정</a></label>
						<input type='password' class='form-control' id='user_pw' name='user_pw' placeholder='비밀번호 수정 클릭' readonly/>
					</div>
				</div>

				<div class="form-row">
					<div class="form-group">
						<label for='tel'>연락처</label> <input type="tel"
							class="form-control" id="tel" name="tel" value="${output.tel}">
					</div>
					<div class="form-group">
						<label for='email'>이메일</label> <input type="email"
							class="form-control" id="email" name="email"
							value="${output.email}">
					</div>
				</div>

				<div class="form-row">
					<div class="form-group">
		            <label for='address'>주소</label>
			            <div>
				            <input type="text" id="sample6_postcode" name="addr1" class="form-control findAdd1" placeholder="우편번호" value="${output.addr1}" >
							<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" id="postcode" ><br>
							<input type="text" id="sample6_address" name="addr2" class="form-control findAdd2" placeholder="주소" value="${output.addr2}" ><br>
							<input type="text" id="sample6_detailAddress" name="addr3" class="form-control findAdd3" placeholder="상세주소" value="${output.addr3}" >
							<input type="text" id="sample6_extraAddress" name="addr4" class="form-control findAdd3" placeholder="참고항목" value="${output.addr4}">
							<br/>
							<br/>
								<p style="font-style:italic; font-size: 13px;">입력하신 주소는 '병원찾기' 및 '응급실찾기' 이용 시 기본 주소로 사용됩니다.</p>            
				    	</div>
			        </div>
				</div>

				<div class="form-group">
					<label for='birthdate'>생년월일</label>
					<div>
						<input type="date" name="birthdate" id="birthdate"
							class="form-control" value="${output.birthdate}" />
					</div>

				</div>

				<div class="form-group">
					<label for='gender'>성별</label>
					<div>
						<label> 
							<input type='radio' name='gender' id='gender1' value=1 
							<c:if test="${output.gender == 1}">checked</c:if> />남자
						</label> 
						<label> 
							<input type='radio' name='gender' id='gender2' value=2 
							<c:if test="${output.gender == 2}">checked</c:if> />여자
						</label>
					</div>
				</div>
				<c:if test="${1 eq output.member_grade}">
					<input type="hidden" id="check" value="${output.member_grade}" />
					<div class="form-group">
						<label for='medical_field'>전공분야</label>
						<div>
							<select name="medical_field" id="medical_field" class="form-control">
								<option value="">-----선택하세요-----</option>
								<option value="01"
									<c:if test="${output.medical_field.equals('01')}">selected</c:if>>내과</option>
								<option value="03"
									<c:if test="${output.medical_field.equals('03')}">selected</c:if>>정신건강의학과</option>
								<option value="04"
									<c:if test="${output.medical_field.equals('04')}">selected</c:if>>외과</option>
								<option value="05"
									<c:if test="${output.medical_field.equals('05')}">selected</c:if>>정형외과</option>
								<option value="06"
									<c:if test="${output.medical_field.equals('06')}">selected</c:if>>신경외과</option>
								<option value="08"
									<c:if test="${output.medical_field.equals('08')}">selected</c:if>>성형외과</option>
								<option value="09"
									<c:if test="${output.medical_field.equals('09')}">selected</c:if>>마취통증의학과</option>
								<option value="10"
									<c:if test="${output.medical_field.equals('10')}">selected</c:if>>산부인과</option>
								<option value="11"
									<c:if test="${output.medical_field.equals('11')}">selected</c:if>>소아청소년과</option>
								<option value="12"
									<c:if test="${output.medical_field.equals('12')}">selected</c:if>>안과</option>
								<option value="13"
									<c:if test="${output.medical_field.equals('13')}">selected</c:if>>이비인후과</option>
								<option value="14"
									<c:if test="${output.medical_field.equals('14')}">selected</c:if>>피부과</option>
								<option value="15"
									<c:if test="${output.medical_field.equals('15')}">selected</c:if>>비뇨기과</option>
								<option value="21"
									<c:if test="${output.medical_field.equals('21')}">selected</c:if>>재활의학과</option>
								<option value="49"
									<c:if test="${output.medical_field.equals('49')}">selected</c:if>>치과</option>
								<option value="80"
									<c:if test="${output.medical_field.equals('80')}">selected</c:if>>한의학과</option>
							</select>
						</div>
					</div>
				</c:if>
				<div class="text-center">
					<button type="submit" name="btn9" id="btn9">수정하기</button>
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="./assets/inc/bottom.jsp" />

	<script src="${pageContext.request.contextPath}/assets/js/regex.js"></script>
	<script src="${pageContext.request.contextPath}/assets/plugins/sweetalert/sweetalert2.all.min.js"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
		$(function() {
			
			$("#btn8").click(function(e) {
				e.preventDefault
				var changeForm  = "<div class='form-group'><label for='user_pw'>비밀번호 수정</label><input type='password' class='form-control' id='user_pw' name='user_pw' placeholder='비밀번호' /></div>"
				    changeForm += "<div class='form-group'><label for='user_pw'>비밀번호 수정 확인</label><input type='password' class='form-control' id='user_pw_re' name='user_pw_re' placeholder='비밀번호 확인' /></div>"
				    
				    $("#changePw").html(changeForm);
			})
			
			$("#btn9").click(function(e) {
						e.preventDefault();

						if (!regex.phone('#tel', '연락처가 잘못되었습니다.')) {
							return false;
						}

						if (!regex.email('#email', '이메일이 잘못되었습니다.')) {
							return false;
						}
			            
			            if (!regex.value('input[name=addr1]', '우편번호를 입력하세요.')) {
			            	return false; 
			            }
			            
			            if (!regex.value('input[name=addr2]', '주소를 입력하세요.')) { 
			            	return false; 
			            }
			            
			            if (!regex.value('input[name=addr3]', '상세 주소를 입력하세요.')) { 
			            	return false; 
			            }
						
						if (!regex.value('#birthdate', '생년월일을 입력해주세요.')) {
							return false;
						}
						
						if ($('#check').val() == '1') {
							if(!regex.value('#medical_field', '전공분야를 선택해주세요.')) {
								return false;
							}
						}
						
						if ($('#user_pw').val() != "") {
							
							if (!regex.value('#user_pw', '비밀번호를 입력하세요.')) {
								return false;
							}

							if (!regex.min_length('#user_pw', 4,
									'비밀번호는 최소 4자 이상 입력 가능합니다.')) {
								return false;
							}

							if (!regex.max_length('#user_pw', 20,
									'비밀번호는 최대 20자 까지만 입력 가능합니다.')) {
								return false;
							}

							if (!regex.compare_to('#user_pw', '#user_pw_re',
									'비밀번호 확인이 잘못되었습니다.')) {
								return false;
							}
							
							$("#pwCheck").attr("disabled", true);
							$("#user_pw").attr("disabled", false);
							
						} else {
							$("#pwCheck").attr("disabled", false);
							$("#user_pw").attr("disabled", true);
						}

						swal({
							title : '확인', // 제목
							text : "회원정보 수정을 완료하시겠습니까?", // 내용
							type : 'warning', // 종류
							confirmButtonText : 'Yes', // 확인버튼 표시 문구
							showCancelButton : true, // 취소버튼 표시 여부
							cancelButtonText : 'No', // 취소버튼 표시 문구
						}).then(function(result) { // 버튼이 눌러졌을 경우의 콜백 연결
							if (result.value) { // 확인 버튼이 눌러진 경우
								swal('완료', '회원정보 수정이 완료되었습니다.', 'success')
								$('.swal2-confirm').click(function() {
									$('form').submit();
								});
							} else if (result.dismiss === 'cancel') {
								swal('취소', '수정이 취소되었습니다.', 'error');
								/* parent.location.replace('27_Profile.do'); */
							}
						}) // swal 끝
					});
		});
		
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