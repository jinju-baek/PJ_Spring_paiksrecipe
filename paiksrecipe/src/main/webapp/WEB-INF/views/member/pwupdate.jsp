<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PAIKSRECIPE : 비밀번호 재설정</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/common.css">
<style>
.wrap {
	width: 768px;
	margin: 80px auto 0;
}

/* 헤더 */
.intro {
	display: flex;
	align-items: center;
}

.intro_logo {
	width: 128px;
	height: 147px;
	background-image: url('${path}/resources/img/bg_tit_150917.gif');
	background-position: 0 -600px;
	background-repeat: no-repeat;
	overflow: hidden;
}

.content_logo {
	height: 26px;
	font-size: 23px;
}

/* 사이드 */
.info_id_content {
	border: 1px solid #e1e1e1;
	background-color: #fbfbfb;
	padding: 42px 50px 29px;
}

.input_wrap {
	position: relative;
	width: 345px;
	height: 41px;
	border: 1px solid black;
	border-radius: 5px 5px;
	background-color: white;
}

.pw_wrap {
	display: flex;
}

.up_pw {
	margin-bottom: 5px;
}

.content {
	width: 150px;
	height: 40px;
	line-height: 40px;
	text-align: center;
	font-weight: bold;
}

.pw {
	position: relative;
	width: 280px;
	height: 39px;
	top: 0;
	left: 15px;
	border: none;
	outline: none;
	background: none;
}

.error_next_box {
	display: block;
	margin: 1px 0 10px 155px;
	height: 20px;
	font-size: 12px;
	line-height: 25px;
	color: red;
	visibility: hidden;
}

.info_id_button {
	display: flex;
	justify-content: center;
	margin: 20px 0 70px 0;
}

.tip_list_wrap {
	border-top: 1px solid #e1e1e1;
	padding-top: 20px;
	display: flex;
	justify-content: center;
}

.tip_img {
	width: 63px;
	height: 73px;
	margin-right: 38px;
	background-position: 9px -787px;
	background-image: url('${path}/resources/img/ico_comm_141001.png');
}

.tip_list {
	font-size: 11px;
	margin: 8px;
}

</style>
</head>
<body>
	<div class="wrap">
		<div class="intro">
			<span class="intro_logo"></span> <span class="intro_content">
				<h3 class="content_logo">주기적인 비밀번호 변경을 통해 개인정보를 안전하게 보호하세요</h3>
			</span>
		</div>
		<form:form id="frm_member" modelAttribute="memberDTO" autocomplete="on">
		<!-- <form method="" action="" id="frm_member"> -->
			<div class="pw_input_wrap">
				<div class="info_id_content">
					<div class="user_info_wrap">
						<div class="pw_info_wrap">
							<div class="pw_wrap now_pw">
								<div class="content">현재 비밀번호</div>
								<div class="input_wrap">
									<input class="pw_input pw int" type="password" placeholder="비밀번호 입력">
								</div>
							</div>
							<span class="error_next_box">필수 정보입니다.</span>

							<div class="pw_wrap up_pw">
								<div class="content">수정할 비밀번호</div>
								<div class="input_wrap">
									<input class="next_pw_input pw int" name="pw" type="password" placeholder="비밀번호 입력">
								</div>
							</div>
							<div class="pw_wrap re_pw">
								<div class="content">비밀번호 재확인</div>
								<div class="input_wrap">
									<input class="next_repw_input pw int" type="password" placeholder="비밀번호 입력">
								</div>
							</div>
							<span class="error_next_box">필수 정보입니다.</span>

						</div>
						<div class="tip_list_wrap">
							<div class="tip_img"></div>
							<ul style="list-style-type: disc;">
								<li class="tip_list">비밀번호는 영문 대/소문자, 숫자, 특수문자를 조합하여 사용하실 수
									있습니다.</li>
								<li class="tip_list">쉬운 비밀번호나 자주 쓰는 사이트의 비밀번호가 같을 경우, 도용되기
									쉬워 주기적으로 변경하여 사용하는 것이 좋습니다.</li>
								<li class="tip_list">비밀번호에 특수문자를 추가하여 사용하시면 기억하기도 쉽고, 비밀번호
									안전도가 높아져 도용의 위험이 줄어듭니다.</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="info_id_button">
					<button href="#" class="btn-submit" id="btn_join" >
						<strong>수정하기</strong>
					</button>
				</div>
			</div>
		<!-- </form> -->
		</form:form>
	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
<script src="${path}/resources/js/validation.js"></script>
<script type="text/javascript">

	// 단독으로 사용할 경우
	// $(document).on('keyup', '.pw_input', function() {
	// });

	$(function() {
		//비밀번호가 유효한 값인지 체크해주는 Flag값
		var pwFlag = false;

		// 유효성체크 여부를 알려주는 배열
		var checkArr = new Array(2).fill(false);
		// printCheckArr(checkArr);

		// 유효성 체크 모두 통과 or 불통 여부
		var checkAll = true;

		// 공유하여 쓸 경우(전역변수를 쓸 것인지의 유무/메서드 호출 유무X)
		// 반드시 (document).ready(function(){}); 안에서만 사용 가능
		$('.pw_input').keyup(function() {
			var nowpw = $(this).val();
			
			var result = joinValidate.checkNowpw(nowpw);
			
			console.log("code: " + result.code);
			ckDesign(result.code, result.desc, 0, 0);
			
			if(result.code == 100) {
				checkArr[0] = true;
			} else {
				checkArr[0] = false;
			}
		});
		
		// pw 유효성체크
		$('.next_pw_input').keyup(function() {
			// 현재 비밀번호
			var nowpw = $.trim($('.pw_input').val());
			// 1. 사용자가 입력한 값 받기
			var pw = $.trim($(this).val());
			var rpw = $.trim($('.next_repw_input').val());

			// 2. 유효성 체크하기
			var result = joinValidate.checkPw(nowpw, pw, rpw);
			if (result.code == 0 || result.code == 10 || result.code == 6) {
				pwFlag = true;
			} else {
				pwFlag = false;
			}

			// 3. 체크 결과에 따라 디자인하기
			ckDesign(result.code, result.desc, 1, 1);

			if (result.code == 10) {
				checkArr[1] = true;
				$('.input_wrap:eq(1)').css('border', '2px solid #3885CA');
				// $('.pw_lock').css('background-position', '-54px 0px');
			} else if (result.code == 6) {
				checkArr[1] = false;
				$('.input_wrap:eq(1)').css('border', '2px solid #d95339');
			} else {
				checkArr[1] = false;
			}
		});

		// 비밀번호 재확인 유효성체크
		$('.next_repw_input').keyup(function() {
			var pw = $.trim($('.next_pw_input').val());
			var rpw = $.trim($(this).val());

			var result = joinValidate.checkRpw(pw, rpw, pwFlag);
			ckDesign(result.code, result.desc, 2, 1);

			if (result.code == 10) {
				checkArr[1] = true;
			} else if (result.code == 6) {
				checkArr[1] = false;
			} else {
				checkArr[1] = false;
			}
		});
		
		// 버튼 활성화
		$('.int').keyup(function() {
			printCheckArr(checkArr);
			ckColorBtn();
		});
		
		function ckColorBtn(){
			var checkAll = true;
			for (var i = 0; i < checkArr.length; i++) {
				if (!checkArr[i]) {
					checkAll = false;
				}
			}
			if (checkAll) {
				$('#btn_join').addClass('btn-primary');
				// $('#btn_join').prop('disabled', false);
				$('#btn_join').css('cursor', 'pointer');
			} else {
				$('#btn_join').removeClass('btn-primary');
				// $('#btn_join').prop('disabled', true);
				$('#btn_join').css('cursor', 'no-drop');
			}
		}
		
		$('#btn_join').click(function(){
			 var invalidAll = true;
			 for(var i = 0; i < checkArr.length; i++){
				 if(!checkArr[i]) {
					 invalidAll = false;
					 $('.join_err_msg:eq('+i+')').css('visibility', 'visible')
					 							 .css('color', '#d95339');
				 }
			 }
			 if(invalidAll) {
				$('#frm_member').submit(); 
			 } else{
				 alert('유효성체크를 진행해주세요!');
			 }
		});
		
	});
	
	function ckDesign(code, desc, line, msg) {
		if (code == 0 || code == 10 || code == 100) { // 통과 o
			$('.input_wrap:eq(' + line + ')').css('border', '2px solid #3885CA');
			$('.error_next_box:eq(' + msg + ')').css('visibility', 'visible')
												.text(desc)
												.css('color', '#3885CA');
			return true;
		} else { // 통과 x
			console.log("line" + line + ", msg" + msg);
			$('.input_wrap:eq(' + line + ')').css('border', '2px solid #d95339');
			$('.error_next_box:eq(' + msg + ')').css('visibility', 'visible')
												.text(desc)
												.css('color', '#d95339');
			return false;
		}
	}
	
	// 개발시 사용 : 유효성체크 전체 여부를 출력해주는 함수(true, false)
	function printCheckArr(checkArr) {
		for (var i = 0; i < checkArr.length; i++) {
			console.log(i + '번지: ' + checkArr[i]);
		}
	}
	
</script>
</html>