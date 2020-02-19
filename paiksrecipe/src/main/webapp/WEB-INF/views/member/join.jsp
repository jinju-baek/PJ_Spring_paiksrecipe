<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>PAIKSRECIPE : 회원가입</title>
		<link rel="stylesheet" type="text/css" href="${path}/resources/css/common.css">
		<style type="text/css">
			* {
				font-family: 'Noto Sans KR', sans-serif;
				box-sizing: border-box;
			}
			
			body, h1, h2, h3, h4, h5, h6, ul, p {
				margin: 0;
				padding: 0;
			}
			
			body {
				background-color: #f5f6f7;
				font-size: 12px;
			}
			
			ul {
				list-style: none;
			}
			
			a {
				text-decoration: none;
				/* inherit : 상속받은 색을 사용 */
				color: inherit;
			}
			
			.wrap {
				width: 768px;
				margin: 0 auto;
			}
			
			.header {
				padding: 62px 0px 20px;
				position: relative;
			}
			
			.p_logo {
				display: block;
				/* 
							display: block으로 설정한 후 가로를 다 차지하여 
							남는 가로를 margin: auto로 가운데 정렬 함 
						*/
				margin: auto;
				width: 280px;
				height: 64px;
				background: url("${path}/resources/img/logo.png") 50% 50% no-repeat;
				background-size: contain;
			}
			
			.join_content {
				width: 460px;
				margin: 0 auto;
			}
			
			.row_group {
				overflow: hidden;
				width: 100%;
			}
			
			.join_title {
				margin: 19px 0 8px;
				font-size: 14px;
				font-weight: 700;
				color: black;
			}
			
			.ps_box {
				display: flex;
				align-items: center;
				position: relative;
				width: 100%;
				height: 51px;
				border: 1px solid #dadada;
				padding: 10px 14px 10px 14px;
				background: #fff;
				vertical-align: top;
			}
			
			#uemail, #email_url, .at {
				margin: 5px;
			}
			
			.email_box {
				width: 80%;
				height: 30px;
				border: none;
				outline-color: #8e8e8e;
				/*셀렉트 태그의 화살표 제거 */
				-webkit-appearance: none;
				background: url('${path}/resources/img/sel_arr.gif') 100% 50% no-repeat;
				background-color: white;
			}
			
			.int_pass {
				padding-right: 40px;
			}
			
			.int {
				display: block;
				position: relative;
				width: 100%;
				height: 29px;
				padding-right: 25px;
				line-height: 29px;
				border: none;
				background: #fff;
				font-size: 15px;
				z-index: 10;
				outline: none;
			}
			
			.step_url {
				position: absolute;
				right: 13px;
				font-size: 15px;
				color: #8e8e8e;
			}
			
			.error_next_box {
				display: block;
				margin: 9px 0 -2px;
				font-size: 12px;
				line-height: 14px;
				color: red;
				height: 15px;
				visibility: hidden;
			}
			
			.pw_lock, .repw_lock1 {
				background-image: url('${path}/resources/img/m_icon_pw_step.png');
				background-repeat: no-repeat;
				background-size: 125px 75px;
				background-position: 0px 0px;
				cursor: pointer;
				width: 24px;
				height: 24px;
				display: inline-block;
			}
			
			.repw_lock2 {
				background-image: url('${path}/resources/img/m_icon_pw_step.png');
				background-repeat: no-repeat;
				background-size: 125px 75px;
				background-position: -27px 0;
				cursor: pointer;
				width: 24px;
				height: 24px;
				display: inline-block;
			}
			
			.bir_wrap {
				/* 
							<table> -> display:table
							<td> -> display:table-cell;
							<div> -> display:block;
						; */
				display: table;
				width: 100%;
			}
			
			.choice {
				font-size: 12px;
				font-weight: 400;
				color: #8e8e8e;
			}
			
			.btn_double_area {
				margin: 30px 0 9px;
			}
			
			.btn_type {
				display: block;
				width: 100%;
				padding: 21px 0 17px;
				font-size: 20px;
				font-weight: 700;
				text-align: center;
				cursor: no-drop;
				outline: none;
				border: none;
			}
			
			.find_address {
				width: 130px;
				height: 30px;
			}
			
			#footer {
				padding: 15px 0;
				margin: 65px 0 0 0;
			}
			
			#footer>ul {
				margin: 0 auto 9px;
				text-align: center;
			}
			
			#footer * {
				font-size: 11px;
				line-height: normal;
				list-style: none;
				color: #333;
			}
			
			#footer>ul>li {
				display: inline;
				padding: 0 5px 0 7px;
				border-left: 1px solid #dadada;
			}
			
			#footer>ul>li a:hover {
				color: #B22230;
				text-decoration: underline;
			}
			/* footer의 모든 ul태그 중 모든 li에서 첫번째 자식만 */
			#footer ul li:first-child {
				/* !important : 우선순위 가장 최상위(왠만하면 안씀) */
				border-left: 0px !important;
			}
			
			#addr_logo {
				width: 75px;
				height: 14px;
			}
			
			#address {
				margin: 0 auto;
				text-align: center;
			}
			
			#address * {
				font: 9px verdana;
			}
			
			#address a {
				font-weight: bold;
			}
			
			#address a:hover {
				color: #B22230;
			}
		</style>
	</head>
	<body>
		<div class="wrap">
			<header>
				<div class="header">
					<h1 class="paiks_logo">
						<a href="#" class="p_logo"></a>
					</h1>
				</div>
			</header>
	
			<section>
				<form name="frm_join" action="" method="POST">
					<div class="container">
						<div class="join_content">
							<div class="row_group">
								<div class="join_row">
									<h3 class="join_title">
										<label for="id">아이디</label>
	
									</h3>
									<div class="ps_box int_id">
										<input type="email" id="uid" name="uid" class="int" placeholder="이메일주소 입력">
									</div>
									<div class="error_next_box">필수 정보입니다.</div>
								</div>
	
								<div class="join_row">
									<h3 class="join_title">
										<label for="pwsd1">비밀번호</label>
									</h3>
									<div class="pw_wrap">
										<div class="ps_box int_pass">
											<input type="text" id="upw" name="upw" class="int" placeholder="비밀번호 입력"> 
												<span class="step_url">
													<span class="pw_lock"></span>
												</span> 
												<span class="step_url">
													<span class="repw_lock1"></span>
												</span>
										</div>
										<div class="ps_box int_pass">
											<input type="text" id="urpw" name="urpw" class="int" placeholder="비밀번호 재입력"> 
											<span class="step_url">
												<span class="repw_lock2"></span>
											</span>
										</div>
									</div>
									<div class="error_next_box">필수 정보입니다.</div>
								</div>
							</div>
	
							<div class="row_group">
								<div class="join_row">
									<h3 class="join_title">
										<label for="name">이름</label>
									</h3>
									<div class="ps_box">
										<input type="text" id="uname" name="uname" class="int" placeholder="이름 입력">
									</div>
									<div class="error_next_box">필수 정보입니다.</div>
								</div>
	
								<div class="join_row">
									<h3 class="join_title">
										<label for="email_id">본인 확인 이메일</label>
									</h3>
									<div class="ps_box">
										<input type="text" id="uemail" class="int" name="uemail"
											placeholder="이메일 ID 입력">
									</div>
									<div class="error_next_box">필수 정보입니다.</div>
								</div>
	
								<div class="join_row">
									<h3 class="join_title">
										<label for="phone">휴대전화</label>
									</h3>
									<div class="ps_box">
										<input type="tel" id="phone" name="phone" class="int" placeholder="-없이 입력 예)01012345678">
									</div>
									<div class="error_next_box">필수 정보입니다.</div>
								</div>
	
								<div class="join_row">
									<h3 class="join_title">
										<label for="">주소</label>
									</h3>
									<span class="ps_box"> 
										<input type="text" value="1234" id="sample6_postcode" class="int addr_only" placeholder="우편번호" readonly> 
										<input type="button" class="find_address" id="btn_post" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
									</span> 
									<span class="ps_box"> 
										<input type="text" value="1234" id="sample6_address" class="int addr_only" placeholder="주소" readonly>
									</span> 
									<span class="ps_box"> 
										<input type="text" id="sample6_detailAddress" class="int" placeholder="상세주소">
									</span> 
									<span class="error_next_box">필수 정보입니다.</span>
								</div>
							</div>
	
	
							<div class="btn_double_area">
								<span>
									<button type="button" href="#" id="btn_join" class="btn_type">가입하기</button>
								</span>
							</div>
	
	
						</div>
					</div>
				</form>
			</section>
	
			<footer>
				<div id="footer">
					<ul>
						<li><a href="#">이용약관</a></li>
						<li><strong><a href="#">개인정보처리방침</a></strong></li>
						<li><a href="#">책임의 한계와 법적고지</a></li>
						<li><a href="#">회원정보 고객센터</a></li>
					</ul>
	
					<div id="address">
						<span> <a href="#"> <img id="addr_logo"
								src="${path}/resources/img/logo.png">
						</a>
						</span> <span>Copyright</span> <span>ⓒ</span> <span><strong><a href="#">PAIK'S RECIPE Corp.</a></strong></span> <span>All Rights Reserved.</span>
					</div>
				</div>
			</footer>
		</div>
	</body>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="../../../js/validation.js"></script>
	<script type="text/javascript">
		// $(document).ready(function(){
	
		// });
		$(function() {
			//비밀번호가 유효한 값인지 체크해주는 Flag값
			var pwFlag = false;
	
			// 유효성체크 여부를 알려주는 배열
			var checkArr = new Array(6).fill(false);
			// printCheckArr(checkArr);
	
			// 유효성 체크 모두 통과 or 불통 여부
			var checkAll = true;
	
			// id 유효성체크
			// >> #uid인 input태그의 값을 가져와서 체크
			$('#uid').keyup(function() {
				// 사용자가 입력한 값의 좌우여백을 제거하고 id에 입력
				var id = $(this).val().trim(); // 사용자가 입력한 값
				// validation.js의 checkId로 유효성체크를 실행 후
				// 결과를 result에 담음(code, desc)
				var result = joinValidate.checkId(id);
	
				if (result.code == 0) {
					checkArr[0] = true;
				} else {
					checkArr[0] = false;
				}
	
				// 유효성체크 결과로 테두리색과 err메세지를 출력하는 
				// 함수 실행
				ckDesign(result.code, result.desc, 0, 0);
			});
	
			// pw 유효성체크
			$('#upw').keyup(function() {
				// 1. 사용자가 입력한 값 받기
				var pw = $.trim($(this).val());
				var rpw = $.trim($('#urpw').val());
	
				// 2. 유효성 체크하기
				var result = joinValidate.checkPw(pw, rpw);
				if (result.code == 0 || result.code == 10 || result.code == 6) {
					pwFlag = true;
				} else {
					pwFlag = false;
				}
	
				if (result.code == 10) {
					checkArr[1] = true;
					$('.ps_box:eq(1)').css('border', '2px solid #3885CA');
					// $('.pw_lock').css('background-position', '-54px 0px');
				} else if (result.code == 6) {
					checkArr[1] = false;
					$('.ps_box:eq(1)').css('border', '2px solid #d95339');
				} else {
					checkArr[1] = false;
				}
	
				// 3. 체크 결과에 따라 디자인하기
				ckDesign(result.code, result.desc, 1, 1);
	
			});
	
			// 비밀번호 재확인 유효성체크
			$('#urpw').keyup(function() {
				var pw = $.trim($('#upw').val());
				var rpw = $.trim($(this).val());
	
				var result = joinValidate.checkRpw(pw, rpw, pwFlag);
	
				if (result.code == 10) {
					checkArr[1] = true;
				} else if (result.code == 6) {
					checkArr[1] = false;
				} else {
					checkArr[1] = false;
				}
	
				ckDesign(result.code, result.desc, 2, 1);
			});
	
			// 이름 유효성 체크
			$('#uname').keyup(function() {
				var name = $.trim($(this).val());
	
				var result = joinValidate.checkName(name);
	
				if (result.code == 0) {
					checkArr[2] = true;
				} else {
					checkArr[2] = false;
				}
	
				ckDesign(result.code, result.desc, 3, 2);
			});
	
			// 이메일 유효성 체크
			$('#uemail').keyup(function() {
				var email = $.trim($(this).val());
	
				var result = joinValidate.checkEmail(email);
	
				if (result.code == 0) {
					checkArr[3] = true;
	
				} else {
					checkArr[3] = false;
	
				}
	
				ckDesign(result.code, result.desc, 4, 3);
			});
	
			// 휴대폰 유효성 체크
			$('#phone').keyup(function() {
				var phone = $.trim($(this).val());
	
				var result = joinValidate.checkPhone(phone);
	
				if (result.code == 0) {
					checkArr[4] = true;
	
				} else {
					checkArr[4] = false;
	
				}
	
				ckDesign(result.code, result.desc, 5, 4);
			});
	
			// 사용자가 우편번호 또는 주소 input을 클릭했을 때
			$('.addr_only').click(function() {
				$('#btn_post').click();
			});
	
			//상세주소를 클릭시
			$('#sample6_detailAddress').click(function() {
				var addrPost = $('#sample6_postcode').val();
				if (addrPost == '' || addrPost.length == 0) {
					$('#btn_post').click();
				}
			});
	
			// 주소 유효성 체크
			$('#sample6_detailAddress').keyup(function() {
				var addrDetail = $.trim($(this).val());
				var addrPost = $('#sample6_postcode').val();
				// console.log('우편번호=' + addrPost + ', 상세주소' + addrDetail);
	
				var result = joinValidate.checkAddr(addrDetail, addrPost);
	
				if (result.code == 3) { // 우편번호 & 주소 x
					checkArr[5] = false;
					ckDesign(result.code, result.desc, 6, 5);
					ckDesign(result.code, result.desc, 7, 5);
				} else if (result.code == 0) { // 성공
					checkArr[5] = true;
					ckDesign(result.code, result.desc, 6, 5);
					ckDesign(result.code, result.desc, 7, 5);
					ckDesign(result.code, result.desc, 8, 5);
				} else { // 상세주소 통과 x한 모든 경우
					checkArr[5] = false;
					ckDesign(result.code, result.desc, 8, 5);
				}
			});
	
			// 버튼 활성화
			$('.int').blur(function() {
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
			});
	
			// 회원가입 버튼 클릭
			$('#btn_join').click(
					function() {
						printCheckArr(checkArr);
						var invalidAll = true;
						for (var i = 0; i < checkArr.length; i++) {
							if (!checkArr[i]) {
								invalidAll = false;
								$('.error_next_box:eq(' + i + ')').css( 'visibility', 'visible')
																  .css('color', '#d95339');
							}
						}
						if (invalidAll) {
							alert('회원가입 성공!');
						} else {
							alert('유효성체크를 진행해주세요.');
						}
					});
		});
	
		function ckDesign(code, desc, line, msg) {
			if (code == 0 || code == 10) { // 통과 o
				$('.ps_box:eq(' + line + ')').css('border', '2px solid #3885CA');
				$('.error_next_box:eq(' + msg + ')').css('visibility', 'visible')
													.text(desc)
													.css('color', '#3885CA');
				return true;
			} else { // 통과 x
				$('.ps_box:eq(' + line + ')').css('border', '2px solid #d95339');
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
	
		// 다음 주소 API
		function sample6_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
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
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName : data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = '(' + extraAddr + ')';
								}
	
							}
	
							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('sample6_postcode').value = data.zonecode;
							document.getElementById("sample6_address").value = addr
									+ extraAddr;
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById("sample6_detailAddress")
									.focus();
						}
					}).open();
		}
	</script>
</html>