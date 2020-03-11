<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PAIKSRECIPE : 이용약관</title>
<style type="text/css">
/* Common */
/* 기본적으로 태그에 margin 또는 padding */
* {
	box-sizing: border-box;
	/* font-family에 폰트 여러개 쓰면 해당 폰트가 없을 경우 다른 폰트로 대체 */
	font-family: 'Noto Sans KR', sans-serif;
}

body {
	background-color: #f5f6f7;
}

ul {
	list-style: none;
}

a {
	text-decoration: none;
	color: inherit;
}

.wrap {
	width: 768px;
	margin: 80px auto 0;
}

/* Header */
#header {
	height: 169px;
	padding-top: 62px;
	position: relative;
}

#container {
	position: relative;
}

#footer {
	height: 81px;
	text-align: center;
	padding: 30px 0px 15px 0px;
}

.paiks_logo {
	font-size: 2em;
}

.p_logo {
	display: block;
	width: 300px;
	height: 64px;
	background: url('${path}/resources/img/logo.png') no-repeat;
	margin: 0 auto;
}

.lang {
	position: absolute;
	top: 14px;
	right: 0px;
}

.langselect {
	font-size: 12px;
	font-weight: 400;
	height: 30px;
	padding: 6px 8px 5px 7px;
	min-width: 98px;
	color: #333;
	border: 1px solid #ccc;
}

.lang>select {
	/* 셀렉트 태그의 화살표 제거 */
	-webkit-appearance: none;
	background: url('${path}/resources/img/sel_arr.gif') 100% 50% no-repeat;
	background-color: white;
}

/* Container */
.join_content {
	width: 460px;
	margin: 0 auto;
}

.terms {
	margin-bottom: 20px;
	background-color: white;
	border: 1px solid #dadada;
}

.terms_span>input {
	position: absolute;
	right: 1px;
	top: 50%;
	width: 22px;
	margin-top: -11px;
	visibility: hidden;
}

.terms_p {
	display: block;
	padding: 15px;
	margin: 0px;
	position: relative;
}

.terms_span>label {
	background: url('${path}/resources/img/check_off.png') 100% 50% no-repeat;
	background-size: 25px;
	display: block;
	line-height: 20px;
	height: 58px;
	top: -1px;
	font-style: 14px;
	font-weight: 700;
}

.terms_span {
	position: relative;
	display: block;
	height: 58px;
}

.terms_span>input:checked+label {
	background: url('${path}/resources/img/check_on.png') 100% 50% no-repeat;
	background-size: 25px;
}

.terms_ul {
	padding-bottom: 7px;
}

.terms_ul_li1 {
	border-top: 1px solid #f0f0f0;
}

ul.terms_ul>li {
	display: block;
	padding: 13px 15px 7px;
}

.ul_li_span {
	position: relative;
	display: block;
	height: 24px;
}

.label1 {
	height: 24px;
	font-size: 14px;
	font-weight: 700;
	line-height: 24px;
	position: absolute;
	color: #333;
	top: 0px;
	left: 0px;
	width: 100%
}

.span_only {
	color: #B22230;
	font-size: 12px;
	font-weight: 400;
}

.ul_li_span>input {
	visibility: hidden;
	position: absolute;
	right: 1px;
	width: 22px;
	height: 22px;
	margin-top: -11px;
	top: 50%;
}

.ul_li_span>label {
	background: url('${path}/resources/img/check_off.png') 100% 50% no-repeat;
	background-size: 25px;
	display: block;
}

.ul_li_span>input:checked+label {
	background-image: url('${path}/resources/img/check_on.png');
	background-size: 25px;
}

.terms_box {
	position: relative;
	box-sizing: border-box;
	height: 88px;
	margin-top: 11px;
	padding: 8px 10px;
	border: 1px solid #f0f0f0;
	background-color: #f7f7f7;
	overflow: auto;
}

h3.article_title {
	font-size: 12px;
	font-weight: 700;
	line-height: 16px;
	color: #666;
}

.article>p {
	display: block;
	font-size: 12px;
	line-height: 16px;
	color: #666;
}

.span_select {
	color: #969696;
	font-size: 12px;
	font-weight: 400;
}

.err_check_msg {
	height: 24px;
	font-size: 12px;
	line-height: 14px;
	color: #f46665;
	display: block;
}

.err_check {
	visibility: hidden;
}

.btn_double_area {
	overflow: hidden;
}

.btn_double_area>span {
	display: block;
	float: left;
	width: 50%;
}

.btn_type {
	width: 225px;
	margin: 0px auto;
	font-size: 20px;
	font-weight: 600;
	line-height: 61px;
	display: block;
	box-sizing: border-box;
	height: 61px;
	padding-top: 1px;
	text-align: center;
	outline: none;
	cursor: pointer;
}

.btn_default {
	color: #333;
	border: 1px solid #e7e7e7;
	background-color: #fff;
}

.btn_agree {
	color: #fff;
	border: 1px solid #e7e7e7;
	background-color: #B22230;
}

</style>
</head>
<body>
	<div class="wrap">
		<header>
			<!-- div : 내용물이 없으면 자리확보x -->
			<div id="header">
				<h1 class="paiks_logo">
					<a href="${path}/" class="p_logo"></a>
				</h1>
				<div class="lang">
					<select class="langselect">
						<option>한국어</option>
						<option>English</option>
						<option>中文(简体)</option>
						<option>中文(台灣)</option>
					</select>
				</div>
			</div>
		</header>
		<section>
			<div id="container">
				<form class="join_content" name="" action="" method="">
					<div class="terms">
						<p class="terms_p">
							<span class="terms_span"> 
							<input type="checkbox" id="cbox">
								<label for=cbox> 이용약관, 개인정보 수집 및 이용, 위치정보 이용약 <br>관(선택), 프로모션 안내 메인 수신(선택)에 모두 동<br>의합니다.</label>
							</span>
						</p>
						<ul class="terms_ul">
							<li class="terms_ul_li1">
								<span class="ul_li_span"> 
									<input type="checkbox" id="cons_box1" class="ckboxs"> 
									<label for="cons_box1" class="label1"> PAIK'S RECIPE 이용악관 동의<span class="span_only">(필수)</span></label>
								</span>
								<div class="terms_box">
									<div class="article">
										<h3 class="article_title">여러분을 환영합니다.</h3>
										<p>PAIK'S RECIPE 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은
											다양한 PAIK'S RECIPE 서비스의 이용과 관련하여 PAIK'S RECIPE 서비스를 제공하는
											PAIK'S RECIPE 주식회사(이하 ‘PAIK'S RECIPE’)와 이를 이용하는 PAIK'S RECIPE
											서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 PAIK'S RECIPE 서비스
											이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.</p>
									</div>
								</div>
							</li>
							<li class="terms_ul_li2">
								<span class="ul_li_span">
									<input type="checkbox" id="cons_box2" class="ckboxs"> 
									<label for="cons_box2" class="label1"> 개인정보 수집 및 이용에 대한 안내<span class="span_only">(필수)</span></label>
								</span>
								<div class="terms_box">
									<div class="article">
										<p>정보통신망법 규정에 따라 PAIK'S RECIPE에 회원가입 신청하시는 분께 수집하는 개인정보의
											항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간을 안내 드리오니 자세히 읽은 후 동의하여
											주시기 바랍니다.</p><br>
										<h3 class="article_title">1. 수집하는 개인정보</h3><br>
										<p>이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 PAIK'S RECIPE
											서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 메일, 캘린더, 카페, 블로그 등과 같이 개인화 혹은
											회원제 서비스를 이용하기 위해 회원가입을 할 경우, PAIK'S RECIPE는 서비스 이용을 위해 필요한
											최소한의 개인정보를 수집합니다.</p>
									</div>
								</div>
							</li>
							<li class="terms_ul_li3">
								<span class="ul_li_span"> 
									<input type="checkbox" id="cons_box3" class="ckboxs"> 
									<label for="cons_box3" class="label1"> 개인정보 수집 및 이용에 대한 안내<span class="span_select">(선택)</span></label>
								</span>
								<div class="terms_box">
									<div class="article">
										<p>위치정보 이용약관에 동의하시면, <b>위치를 활용한 광고 정보 수신</b> 등을 포함하는 PAIK'S
											RECIPE 위치기반 서비스를 이용할 수 있습니다.</p>
										<h3 class="article_title">제 1 조 (목적)</h3>
										<p>이 약관은 PAIK'S RECIPE 주식회사 (이하 “회사”)가 제공하는 위치정보사업 또는
											위치기반서비스사업과 관련하여 회사와 개인위치정보주체와의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을
											목적으로 합니다.</p>
									</div>
								</div>
							</li>
							<li class="terms_ul_li4">
								<span class="ul_li_span"> 
									<input type="checkbox" id="cons_box4" class="ckboxs"> 
									<label for="cons_box4" class="label1"> 이벤트 등 프로모션 알림 메일 수신<span class="span_select">(선택)</span></label>
								</span>
							</li>
						</ul>
					</div>
					<div class="err_check">
						<span class="err_check_msg">PAIK'S RECIPE 이용약관과 개인정보 수집 및 이용에 대한 안내 모두 동의해주세요.</span>
					</div>
					<div class="btn_double_area">
						<span>
							<button type="button" id="cons_btn_cancel" class="btn_type btn_default">취소</button>
						</span> 
						<span>
							<button type="button" id="cons_btn_agree" class="btn_type btn_agree">확인</button>
						</span>
					</div>
				</form>
			</div>
		</section>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		/* 전체선택 체크시 전체 체크 or 전체 체크 해제 */
		$('#cbox').on('click', function() {
			var flag = $(this).is(':checked');
			if (flag == true) {
				$('.ckboxs').prop('checked', true);
			} else {
				$('.ckboxs').prop('checked', false);
			}
		});

		/* 
			선택체크가 모두 체크되면 전체체크버튼 true
			선택체크가 하나라도 체크해제되면 전체체크버튼 false 
		*/

		$('.ckboxs').on('click', function() {
			var ckLen = $('.ckboxs:checkbox:checked').length;
			if (ckLen != 4) {
				$('#cbox').prop('checked', false);
			} else {
				$('#cbox').prop('checked', true);
			}
		});

		/* 확인버튼 클릭시 필수체크(2개) 체크유무 유효성 체크 */
		$('#cons_btn_agree').on('click', function() {
			var agree_one = $('#cons_box1').is(':checked');
			var agree_two = $('#cons_box2').is(':checked');
			var agree_three = $('#cons_box3').is(':checked');
			var agree_four = $('#cons_box4').is(':checked');

			if (agree_one == false || agree_two == false) {
				$('.err_check').css('visibility', 'visible');
				return false;
			}
			
			// 유효성체크 통과시 회원가입 페이지로 이동
			location.href = "${path}/member/join?useon=" + agree_one 
										 + "&primaryon=" + agree_two
											 + "&locon=" + agree_three 
										   + "&eventon=" + agree_four 
														 + "&flag=1";
			
		});

		
		/* 취소버튼 클릭시 INDEX페이지로 이동 */
		$('#cons_btn_cancel').on('click', function() {
			location.href = '${path}/';
		});
	});
</script>
</html>