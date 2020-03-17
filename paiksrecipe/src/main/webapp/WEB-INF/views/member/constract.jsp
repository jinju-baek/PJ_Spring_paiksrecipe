<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${path}/resources/css/common.css">
<title>PAIKSRECIPE : 이용약관</title>
<style type="text/css">
/* Common */
/* 기본적으로 태그에 margin 또는 padding */
* {
	box-sizing: border-box;
	/* font-family에 폰트 여러개 쓰면 해당 폰트가 없을 경우 다른 폰트로 대체 */
	font-family: 'Noto Sans KR', sans-serif;
}

ul {
	list-style: none;
}

a {
	text-decoration: none;
	color: inherit;
}

.constract_wrap {
	margin: 130px auto 0;
}

.container {
	position: relative;
}

.paiks_logo {
	font-size: 2em;
}

.p_logo {
	display: block;
	width: 212px;
	height: 40px;
	background: url('${path}/resources/img/logo.png') no-repeat;
	background-size: contain;
	margin: 0 auto;
}

/* Container */
.constract_content {
	width: 520px;
	margin: 40px auto 40px;
	padding : 58px 69px 40px;
	border: 1px solid #dadada;
}

.constract_step {
	padding-bottom: 25px;
}

.terms_p {
	display: block;
	padding: 15px;
	margin: 0px;
	position: relative;
}


.terms_span {
	position: relative;
	display: block;
}

#cbox+label {
	font-size: 19px;
	font-weight: 900;
}

.terms_p>p{
    width: 324px;
    font-size: 12px;
    color: #959595;
    padding: 10px 0 0 25px;
    
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
	height: 27px;
	line-height: 27px;
	padding-left: 30px;
}

.label_allck {
	font-size: 18px;
}

.span_only {
	color: #B22230;
	font-size: 12px;
	font-weight: 400;
}


.terms_span>input {
	position: absolute;
	left: -4px;
    top: 11px;
	width: 23px;
	height:27px;
	margin-top: -11px;
	z-index: 1;
    opacity: .01;
}

.ul_li_span>input {
	position: absolute;
	left: -4px;
    top: 11px;
	width: 23px;
	height:27px;
	margin-top: -11px;
	z-index: 1;
    opacity: .01;
}

.checkbox_img {
	background: url('${path}/resources/img/check_off.png') 100% 50% no-repeat;
	background-size: 25px;
	width: 24px;
	height: 27px;
	position: absolute;
}

.terms_span>input:checked+.checkbox_img {
	background: url('${path}/resources/img/check_on.png') 100% 50% no-repeat;
	background-size: 25px;
}

.ul_li_span>input:checked+.checkbox_img {
	background-image: url('${path}/resources/img/check_on.png');
	background-size: 25px;
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
	margin: 15px;
}

.err_check {
	visibility: hidden;
}

</style>
</head>
<body>
	<div class="constract_wrap">
		<section>
			<!-- div : 내용물이 없으면 자리확보x -->
			<div class="contract_logo">
				<h1 class="paiks_logo">
					<div href="#" class="p_logo"></div>
				</h1>
			</div>
			<div class="container">
				<form class="constract_content" name="" action="" method="">
					<div class="terms">
						<div class="constract_step">
							<h2>PAIK'S RECIPE계정</h2>
							<h2>서비스약관에 동의해주세요</h2>
						</div>
						<span class="terms_p">
							<span class="terms_span"> 
								<input type="checkbox" id="cbox">
								<span class="checkbox_img"></span>
								<label for=cbox class="label1 label_allck">모두 동의합니다.</label>
							</span>
							<p>전체동의는 필수 및 선택정보에 대한 동의도 포함되어 있으며, 개별적으로도 동의를 선택하실 수 있습니다. 선택항목에 대한 동의를 거부하시는 경우에도 서비스는 이용이 가능합니다.</p>
						</span>
						<ul class="terms_ul">
							<li class="terms_ul_li1">
								<span class="ul_li_span"> 
									<input type="checkbox" id="cons_box1" class="ckboxs">
									<span class="checkbox_img"></span>
									<label for="cons_box1" class="label1"> PAIK'S RECIPE 이용악관 동의<span class="span_only"> (필수)</span></label>
								</span>
							</li>
							<li class="terms_ul_li2">
								<span class="ul_li_span">
									<input type="checkbox" id="cons_box2" class="ckboxs"> 
									<span class="checkbox_img"></span>
									<label for="cons_box2" class="label1"> 개인정보 수집 및 이용에 대한 안내<span class="span_only"> (필수)</span></label>
								</span>
							</li>
							<li class="terms_ul_li3">
								<span class="ul_li_span"> 
									<input type="checkbox" id="cons_box3" class="ckboxs"> 
									<span class="checkbox_img"></span>
									<label for="cons_box3" class="label1"> 개인정보 수집 및 이용에 대한 안내<span class="span_select"> (선택)</span></label>
								</span>
							</li>
							<li class="terms_ul_li4">
								<span class="ul_li_span"> 
									<input type="checkbox" id="cons_box4" class="ckboxs">
									<span class="checkbox_img"></span> 
									<label for="cons_box4" class="label1"> 이벤트 등 프로모션 알림 메일 수신<span class="span_select"> (선택)</span></label>
								</span>
							</li>
						</ul>
					</div>
					<div class="err_check">
						<span class="err_check_msg">PAIK'S RECIPE 이용약관과 개인정보 수집 및 이용에 대한 안내 모두 동의해주세요.</span>
					</div>
					<div class="btn_double_area">
						<span>
							<a type="button" id="cons_btn_agree" class="btn-submit">확인</a>
						</span>
					</div>
				</form>
			</div>
		</section>
	</div>
	<%@ include file="../include/footer.jsp"%>
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
			
			ckColorBtn();
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
			
			ckColorBtn();
		});
		
		function ckColorBtn(){
			var agree_one = $('#cons_box1').is(':checked');
			var agree_two = $('#cons_box2').is(':checked');
			
			if(agree_one == true && agree_two == true){
				$('.btn-submit').addClass('btn-primary');
				// $('#btn_join').prop('disabled', false);
				$('.btn-submit').css('cursor', 'pointer');
			} else {
				$('.btn-submit').removeClass('btn-primary');
				// $('#btn_join').prop('disabled', true);
				$('.btn-submit').css('cursor', 'no-drop');
			}
		}

		
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

	});

</script>
</html>