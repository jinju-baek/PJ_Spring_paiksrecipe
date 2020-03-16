<!-- <% %> / scriptlit : 자바코드 입력부분 -->
<!-- include file : 해당 파일을 여기에 include하라는 것 (header + include가 합쳐짐) -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PAIKSRECIPE</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/common.css">

<style type="text/css">
* {
	font-family: 'Noto Sans KR', sans-serif;
}

form {
	margin: 0 auto;
}

.fix_btn {
	z-index: 1000;
	position: fixed;
	right: 40px;
	color: white;
	width: 60px;
	height: 60px;
	border-radius: 50%;
	display: flex;
	/* 가로 정렬 */
	justify-content: center;
	/* 세로 정렬 */
	align-items: center;
	font-size: 30px;
	cursor: pointer;
	box-shadow: 0 4px 10px 0 rgba(0, 0, 0, 0.2), 0 4px 20px 0
		rgba(0, 0, 0, 0.19);
}

.fix_btn>i {
	transition: transform .3s;
}

.fix_btn:hover>i {
	/* 크기를 1.3배 키우기 */
	transform: scale(1.3);
}

.top_btn {
	z-index: 1000;
	bottom: 40px;
	background-color: #2F3138;
	display: none;
}

div.header_wrap {
	position: fixed;
	top: 0;
	z-index: 999;
	width: 100%;
	background-color: white;
	box-shadow: 0 0 1px 1px rgba(20, 23, 28, .1), 0 3px 1px 0
		rgba(20, 23, 28, .1);
}

div.header_content {
	width: 1400px;
	margin: 0 auto;
	height: 80px;
	box-sizing: border-box;
	/*border-left: 1px solid red;
						border-right: 1px solid red;*/
	/* flexbox : 요소배치 */
	display: flex;
	/* jastify-content: space-between 가로 정렬 */
	justify-content: space-between;
	/* align-items: center 세로길이 수평정렬 */
	align-items: center;
}

.frm_search {
	margin: 0 auto;
}

.header_content_search_group {
	display: flex;
	align-items: center;
	background-color: #f2f3f5;
	border-radius: 2px;
}

.header_content_search_input {
	/* transparent : 투명 */
	background-color: transparent;
	font-size: 13px;
	border-color: transparent;
	width: 350px;
	height: 44px;
	border-radius: 2px;
	padding: 10px 12px;
	/* input태그 Focus시 파랑테두리 */
	outline: none;
}

.header_content_search_btn {
	width: 44px;
	height: 44px;
	border-color: transparent;
	background-color: transparent;
	cursor: pointer;
	color: #B22230;
	outline: none;
	border-top-right-radius: 2px;
	border-bottom-right-radius: 2px;
}

.header_content_search_btn:hover {
	background-color: #B22230;
	color: white;
}

.header_content_nav {
	display: flex;
	align-items: right;
	justify-content: space-between;
	width: 300px;
}

.header_content_nav>div {
	/*border: 1px solid red;*/
	
}

.header_content_member {
	/* div안의 button 배치 후 남는 여백을 통해 정렬 */
	/* width: 160px; */
	display: flex;
	align-items: center;
	justify-content: space-between;
	flex-direction: row;
	/* flex-direction : row(가로로 정렬, default, 생략가능) */
}

.header_content_member>div {
	padding: 10px 0px 10px 3px;
}

.header_content_dropdown_group {
	position: relative;
}

.header_content_dropdown_wrqp:hover .header_dropdown {
	display: block;
}

.header_content_dropdown_group>a {
	display: inline-block;
	padding: 15px 15px;
	font-weight: 400;
	border: 1px solid transparent;
	border-radius: 2px;
	height: 45px;
	color: #686f7a;
	line-height: 19px;
	font-weight: bold;
}

.header_content_dropdown_wrqp:hover>div>a, .header_content_member_cart:hover>a
	{
	background-color: rgba(20, 23, 28, .05);
	border-color: rgba(20, 23, 28, .05);
}

.header_content_dropdown_mypage:hover .header_dropdown {
	display: block;
}

.header_content_dropdown_mypage:hover>div>a, .header_content_member_cart:hover>a
{
	background-color: rgba(20, 23, 28, .05);
	border-color: rgba(20, 23, 28, .05);
	border-radius: 50%;
}

.header_content_member_cart>a {
	display: inline-block;
	width: 45px;
	height: 45px;
	border-radius: 50%;
	color: #686f7a;
	border: 1px solid transparent;
	text-align: center;
	padding: 15px;
	line-height: 19px;
}

.header_content_logo_img {
	max-width: 200px;
	vertical-align: middle;
}

.header_content_logo_text {
	/* 
	font-size: 35px;
	font-weight: bold;
	vertical-align: middle;
	*/
	
}

.header_dropdown_menu {
	border-bottom-left-radius: 2px;
	border-bottom-right-radius: 2px;
	box-shadow: 0 4px 16px rgba(20, 23, 28, .25);
	background-color: white;
	padding: 10px 0;
}

.header_dropdown_menu a {
	display: inline-block;
	font-size: 15px;
	color: #505763;
	text-align: center;
	padding: 5px 15px;
	width: 130px;
	font-weight: 400;
	position: relative;
	z-index: 100;
}

.header_dropdown_menu a:hover {
	color: #B22230;
	background-color: #f2f3f5;
}

.header_dropdown {
	position: absolute;
	top: 52px;
	left: 0;
	display: none;
}

.arrow {
	position: absolute;
	top: -6px;
	left: 16px;
	width: 15px;
	height: 15px;
	transform: rotate(45deg);
	background-color: white;
	border: -color: transparent transparent #fff transparent;
	z-index: 99;
}

.header_content_nav>div {
	padding: 10px 0;
}
.logout_wrap {
	display: flex;
	justify-content: space-between;
}
.logout_wrap div {
	margin: 0 5px;
}

.username {
	line-height: 44px;
}

/* 모달 로그인 창 */
.modal_wrap {
	top: 0;
	position: fixed;
	z-index: 1000;
	background-color: rgba(0, 0, 0, 0.4);
	overflow: auto;
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	display: none;
}

.modal_content {
	position: relative;
	width: 400px;
	background-color: white;
	box-shadow: 0 4px 10px 0 rgba(0, 0, 0, 0.2), 0 4px 20px 0
		rgba(0, 0, 0, 0.19);
	border-radius: 2px;
	overflow: hidden;
}

.modal_container {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 15px 18px;
}

.modal_logo {
	background: url('${path}/resources/img/logo.png') no-repeat;
	background-position: center;
	background-size: contain;
	width: 200px;
	height: 38px;
	
}

.login_close>button {
	color: rgb(142, 142, 142);
	border: none;
	background: white;
	font-size: 30px;
	cursor: pointer;
	outline: none;
}

.login_close>button:hover {
	color: #B22230;
}

.login_wrap {
	padding: 0 6px;
}

.form_wrap {
	padding: 5px 12px;
}

.label {
	margin: 37px 0 0;
	padding: 0 6px;
}

.label>div {
	font-size: 14px;
	font-weight: bold;
}

#login_id, #login_pw {
	width: 100%;
	height: 38px;
	border: none;
	border-bottom: 2px solid #e9e9e9;
	outline: none;
}

.input_pw {
	position: relative;
}

.pw_eye {
	position: absolute;
	color: #AAA;
	font-size: 17px;
	top: 0px;
	right: 7px;
	cursor: pointer;
	height: 38px;
	line-height: 38px;
	width: 30px;
	text-align: center;
}

.modal_error_next_box {
	visibility: hidden;
	color: rgb(217, 83, 57);
	font-size: 13px;
	padding: 6px 6px 0;
}

.login_check {
	color: #AAA;
	padding-bottom: 5px;
	align-items: center;
	position: relative;
}

.login_check>label {
	background: url('${path}/resources/img/ic-check-off.svg') no-repeat;
	display: block;
	height: 26px;
	line-height: 26px;
	padding-left: 30px;
}

.login_check>input {
	visibility: hidden;
	position: absolute;
	right: 1px;
	width: 22px;
	height: 22px;
	margin-top: -11px;
}

.login_check>label:hover {
	cursor: pointer;
}

.login_check>input:checked+label {
	background-image: url('${path}/resources/img/ic-check-on.svg');
	color: black;
}

.fa-check-circle {
	font-size: 26px;
	font-weight: 50px;
	padding-right: 5px;
}

.login_btn {
	display: block;
	background-color: #B22230;
	font-weight: bold;
	color: white;
	width: 100%;
	height: 54px;
	border-radius: 10px;
	text-align: center;
	line-height: 54px;
	outline: none;
	border: none;
	margin: 5px 0;
}

.login_btn:hover {
	cursor: pointer;
	background-color: #871a24;
}

.mem_wrap {
	display: flex;
	justify-content: center;
}

.login_sns_wrap {
	display: flex;
	justify-content: space-between;
	align-items: center;
	background-color: #F9F9F9;
	height: 72px;
	line-height: 50%;
	padding: 0 18px 0;
	bottom: 0px;
}

.sns_face {
	padding-right: 15px;
}
</style>
</head>
<body>
	<div class="modal_wrap">
		<div class="modal_content">
			<div class="modal_container">
				<div class="modal_logo"></div>
				<div class="login_close">
					<button>
						<i class="fas fa-times"></i>
					</button>
				</div>
			</div>
			<div class="login_wrap">
				<div class="form_wrap">
					<!-- type submit을 주면 enter키를 눌렀을 때 알아서 전달 -->
					<form class="frm_login" name="from_login" onsubmit="return false;">
						<div class="label">
							<div>
								아이디<br>
							</div>
							<input type="text" class="login_input" id="login_id" placeholder="아이디를 입력해주세요" required>
						</div>
						<div class="label">
							<div>
								비밀번호<br>
							</div>
							<div class="input_pw">
								<input type="password" class="login_input" id="login_pw" placeholder="비밀번호" required minlength="6" maxlength="18">
								<span class="pw_eye"><i class="fas fa-eye-slash"></i></span>
							</div>
						</div>
						<div class="modal_error_next_box">입력정보를 확인해 주세요.</div>
						<div class="login_check">
							<input type="checkbox" id="loginck" class="login_check_btn">
							<label for="loginck" class="label1">&nbsp;로그인 상태 유지</label>
						</div>
						<!-- 
								버튼(submit 기능)을 클릭하면 id, pw값을 loginCheck로 전달 
								<a href="#">로그인</a> -> 효율성 떨어짐
								$(document).on('click', '#btn', function(){
									$('#frm_login').submit();
								});
								<button type="submit">로그인</button>
								<input type="submit" value="로그인">
							-->
						<div>
							<input type="submit" class="login_btn" id="btn_login" value="로그인"></input>
						</div>
						<br>
					</form>
					<div class="mem_wrap">
						<a href="#">아이디 찾기</a>&nbsp;
						<span>ㅣ</span>&nbsp; 
						<a href="#">비밀번호 찾기</a>&nbsp;
						<span>ㅣ</span>&nbsp; 
						<a href="#">회원가입</a>
						<br>
					</div>
				</div>
			</div>
			<div class="login_sns_wrap">
				<div>SNS 계정으로 시작하기</div>
				<div>
					<a class="sns_face" href="#"> <img src="${path}/resources/img/ic-facebook-new.svg" width="45px"></a> 
					<a href="#"><img src="${path}/resources/img/ic-kakao.svg" width="45px"></a>
				</div>
			</div>
		</div>
	</div>

	<header>
		<div class="top_btn fix_btn">
			<i class="fas fa-chevron-up"></i>
		</div>
		<div class="header_wrap">
			<div class="header_content">
				<div class="header_content_logo">
					<a href="${path}/"><img class="header_content_logo_img" src="${path}/resources/img/logo.png"></a>
				</div>

				<div class="header_content_nav">
					<!-- 가로로 정렬하는 방법
							1. display : inline-block
							2. float : left
							3. display : flex (부모에게 줘야함)
					-->
					<div class="header_content_dropdown_group">
						<a href="#" class="magicline">홈</a>
					</div>

					<div class="header_content_dropdown_wrqp">
						<div class="header_content_dropdown_group">
							<a href="#" class="magicline">레시피</a>
							<div class="header_dropdown">
								<div class="arrow"></div>
								<ul class="header_dropdown_menu">
									<li><a href="#">ALL</a></li>
									<li><a href="#">반찬</a></li>
									<li><a href="#">국/탕/찌개</a></li>
									<li><a href="#">밥</a></li>
									<li><a href="#">양식</a></li>
								</ul>
							</div>
						</div>
					</div>

					<div class="header_content_dropdown_wrqp">
						<div class="header_content_dropdown_group">
							<a href="#" class="magicline">커뮤니티</a>
							<div class="header_dropdown">
								<div class="arrow"></div>
								<ul class="header_dropdown_menu">
									<li><a href="#">자유게시판</a></li>
									<li><a href="#">요리게시판</a></li>
								</ul>
							</div>
						</div>
					</div>

				</div>

				<div class="header_content_search">
					<form name="frm_search" action="" method="GET">
						<div class="header_content_search_group">
							<input type="text" placeholder="어떤 요리를 원하세요?" name="keyword" class="header_content_search_input">
							<button type="button" class="header_content_search_btn">
								<i class="fas fa-search"></i>
							</button>
						</div>
					</form>
				</div>

				<div class="header_content_member">
					<div class="header_content_dropdown_mypage">
						<div class="header_content_dropdown_group">
							<!-- 네비게이션 -->
							<a href="#"><i class="fas fa-user"></i></a>
							<!-- dropdown 메뉴 -->
							<div class="header_dropdown">
								<div class="arrow"></div>
								<ul class="header_dropdown_menu">
									<c:if test="${not empty userid}">
										<li><a href="#">레시피 보관함</a></li>
									</c:if>	
									<li><a href="#">고객센터</a></li>
									<li><a href="${path}/member/mypage">내 정보</a></li>
								</ul>
							</div>
						</div>
					</div>

					<div>
						<div class="header_content_member_cart">
							<a href="#"><i class="fas fa-shopping-bag"></i></a>
						</div>
					</div>
						<!--
						 	div 기본속성 : bolck
							button 기본속성 : inline-block 
						-->
					<div>
						<!-- 
							sessionScope.userid : session영역에서 userid를 꺼내옴 
							empty : 값이 비었는지 확인
							c:choose / when / otherwise -> else if문
						-->
						<c:choose>
							<c:when test="${empty userid}">
								<button type="button" id="header_btn_login" class="btn btn-basic login_open">로그인</button>
								<button type="button" id="header_btn_join" class="btn btn-primary">회원가입</button>
							</c:when>
							<c:otherwise>
								<div class="logout_wrap">
									<div class="username">${name}님</div>
									<div><button type="button" id="header_btn_logout" class="btn btn-basic">로그아웃</button></div>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</header>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		
		var message = '${message}';
		if(message == 'nologin'){
			$('.modal_wrap').css('display', 'flex');
			$('#login_id').focus();
			$('.modal_error_next_box').css('visibility', 'visible')
									  .text('로그인이 필요한 기능입니다.');
		}
		
		// find('') = ''내용을 찾음,
		// each() = 앞에서 찾은 갯수(bar_fill의 갯수)만큼 반복 돌음 
		$('.bar_wrap').find('.bar_fill').each(function() {
		// this = 나 자신(bar_fill)
		// .text = 텍스트(70%)를 가져옴
		// Javascript는 타입을 정하지 x(스크립트가 자동으로 읽음)
		var widthVal = $(this).text();
		// 1000m/s = 1초
		$(this).animate({ 
			width : widthVal
		}, 1000);
	});
	// Scroll Top버튼 생성 및 TOP로 이동
		$(window).scroll(
			function() { // 스크롤이 움직이면
				// scrollTop : scrollTop기준(윈도우 상단바 끝부분)으로 scroll이 맨 위에 있을 경우 0
				if (document.body.scrollTop > 80 || document.documentElement.scrollTop > 80) {
					// fadeIn : 잔상효과처럼 나타남
					// fadeIn은 기본적으로 display : block으로 나타나기때문에 flex로 바꿔줌
					$('.top_btn').fadeIn().css("display", "flex");
				} else {
					$('.top_btn').fadeOut();
				}
			});
		$('.top_btn').click(function() {
			$('html, body').animate({
				scrollTop : 0
			}, 800);
		});

	});

	$(document).on('click', '.login_open', function() {
		// 로그인 버튼 클릭시 modal창 open
		$('.modal_wrap').css('display', 'flex');
		$('#login_id').focus();
	});

	// 로그인 input(id, pw)에 focus되면 테두리색 변경
	$(document).on('focus', '.login_input', function() {
		$(this).css('border-bottom', '2px solid #7c7c7c');
	});
	$(document).on('blur', '.login_input', function() {
		$(this).css('border-bottom', '2px solid #e9e9e9');
	});

	// modal창의 x버튼을 클릭하면 modal창 close
	$(document).on('click', '.login_close', function() {
		$('.modal_wrap').css('display', 'none');
		$('.frm_login')[0].reset();
		// $('.login_input').val('');
		$('.pw_eye').prev().attr('type', 'password');
		$('.pw_eye').html('<i class="fas fa-eye-slash"></i>')
					.css('color', '#666');
		$('.modal_error_next_box').css('visibility', 'hidden');
	});

	// 값을 가져오는 방법
	// <span class="aaa">동토리</span>
	// <input type="text class="dobby">동비</input>

	// 서버단으로 값을 보낼 때 사용하는 태그들이 대부분
	// input태그 값 가져오는 방법 
	// $('.dobby').val(); 
	// input태그 값 넣는 방법
	// $('.dobby').val('메롱');

	// input태그 이외의 값 가져오는 방법
	// $('.aaa').text();
	// input태그 이외의 값 넣는 방법
	// $('.aaa').text('뭐시여??');

	//태그의 옵션(attribute)을 가져오고 싶을 때
	// $('.dobby').attr('type');
	// $('.dobby').attr('class');

	// prev() : 형제중 위에 있는 태그
	// next() : 형제중 아래에 있는 태그

	// login modal창 암호 보이기 or 숨기기
	$(document).on('click', '.pw_eye', function() {
		var code = $(this).prev().attr('type');
		if (code == 'password') {
			$(this).prev().attr('type', 'text');
			// 체이닝 기법 : .찍고 옵션쓰고 .찍고 옵션쓰는 것
			$(this).html('<i class="fas fa-eye"></i>')
				   .css('color', '#666');
		} else {
			$(this).prev().attr('type', 'password');
			$(this).html('<i class="fas fa-eye-slash"></i>')
				   .css('color', '#666');
		}
	});

	// LOGIN 버튼 클릭시 AJAX 동작
	$(document).on('click', '#btn_login', function() {

		// id와 pw 값 받아와서 null이면 작동X
		var id = $('#login_id').val();
		var pw = $('#login_pw').val();

		// 유효성체크 (id, pw) null 체크
		if (id != '' && pw != '' && id.length != 0 && pw.length != 0) {
			$.ajax({
				url : '${path}/login/in',
				type : 'POST',
				data : 'id=' + id + '&pw=' + pw,
				success : function(data) {
					console.log(data);
					if (data == 0 || data == 3) {
						$('.modal_error_next_box').css('visibility', 'visible')
											.text('아이디 또는 비밀번호를 확인해주세요.');
					} else if (data == 1) {
						console.log('로그인 성공');
						location.reload(); // 새로고침
					} else if (data == 2) {
						$('.modal_error_next_box').css('visibility', 'visible')
											.text('이메일 인증 후에 이용하실 수 있습니다.');
					}
				},
				error : function() {
					alert('System Error:/');
				}
			});
		}
	});
	
	/* 로그아웃 기능 */
	$(document).on('click', '#header_btn_logout', function(){
		$.ajax({
			url: '${path}/login/out',
			type: 'POST',
			success: function() {
				console.log('Logout Success:)');
				location.reload();
			},
			error: function() {
				alert('System Error:/');
			}
		});
	});

	
	/* Header 가입하기 버튼 클릭시 동의 페이지 이동 */
	$(document).on('click', '#header_btn_join', function() {
		location.href = "${path}/member/constract";
	});

	// jQuery 문법
	// $('선택자').옵션();
	// $('#test').css('color', 'green');
	// $ = jquery
	// ('#test') = 선택자(id가 text)
	// .css() = 옵션(글자색을 녹색)

	// jQeury 이벤트 문법(클릭, 포커스, 블러 등)
	// $(document).on('이벤트', '선택자', function(){
	// 	이벤트 발생시 동작할 내용들
	// });

	//$(document).on('click', '#test', function(){
	// 		$(this).css('color', 'blue');
	// });
	//$(document).on() = 문서전체에서
	// ('click') = 클릭 이벤트가 발생하면
	// ('#test') = 아이디가 text인
	// function() {} = 익명함수(이름이 없는 함수)
	// $(this) = 나 자신(여기서는 #test)
	// 해석 : 문서 전체에서 id가 test인 태그가 클릭되면 나를(#test) 글자색을 blue로 변경해라

	// alert : 경고창
	// alert('text');
</script>
</html>