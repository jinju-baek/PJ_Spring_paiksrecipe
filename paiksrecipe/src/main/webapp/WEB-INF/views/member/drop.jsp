<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PAIKSRECIPE : 회원탈퇴</title>
<style type="text/css">

/* 모달창 */
.modal_wrap {
	position: fixed;
	background-color: rgba(0, 0, 0, 0.4);
	width: 100%;
	height: 100%;
	overflow: auto;
	display: flex;
	justify-content: center;
	align-items: center;
	z-index: 1000;
	display: none;
}

.modal_content {
	position: relative;
	background-color: white;
	border-radius: 5px 5px;
	width: 400px;
	height: 180px;
}

.modal_close button {
	position: absolute;
	top: 10px;
	right: 10px;
	cursor: pointer;
	border: none;
	outline: none;
	background-color: white;
}

.modal_recheck {
	font-weight: bold;
	font-size: 20px;
	display: flex;
	justify-content: center;
	margin-top: 40px;
}

.modal_button {
	display: flex;
	justify-content: center;
}

.y_btn, .n_btn {
	margin: 20px 20px;
	padding: 10px 35px;
	background-color: #B22230;
	color: white;
	border-radius: 5px 5px;
	font-weight: bold;
}

.wrap {
	width: 768px;
	margin: 0 auto;
}

.header {
	width: 100%;
	height: 147px;
	position: relative;
}

/* 헤더 */
.intro {
	display: flex;
	align-items: center;
}

.intro_logo {
	width: 130px;
	height: 147px;
	background-image: url('${path}/resources/img/bg_tit_150917.gif');
	background-position: -160px -600px;
	background-repeat: no-repeat;
	overflow: hidden;
}

.content_logo {
	height: 26px;
	font-size: 23px;
}

/* 사이드 */
.agree_box {
	position: absolute;
	top: 63px;
	right: 37px;
}

.agree_box>label {
	background-image: url('${path}/resources/img/check_off.png');
	background-repeat: no-repeat;
	background-size: 30px 30px;
	font-weight: bold;
	padding-top: 30px;
}

.agree_box>input:checked+label {
	background-image: url('${path}/resources/img/check_on.png');
	background-repeat: no-repeat;
	background-size: 30px 30px;
	color: #B22230;
	font-weight: bold;
}

.cbox {
	visibility: hidden;
	position: absolute;
}

.info_id_wrap {
	font-size: 14px;
}

.info_id_content {
	border: 1px solid #e1e1e1;
	background-color: #fbfbfb;
	padding: 42px 50px 29px;
}

.info_id {
	border: 1px solid #e1e1e1;
	background-color: white;
	padding: 27px 37px 40px 45px;
	margin-bottom: 20px;
	position: relative;
}

.user_info {
	margin-top: 50px;
}

.user_info_table th, td {
	padding: 10px 20px;
	text-align: left;
}

.pw_input_wrap {
	position: relative;
	width: 345px;
	height: 41px;
	border: 1px solid black;
	border-radius: 5px 5px;
	background-color: white;
}

.pw_input {
	position: absolute;
	width: 280px;
	height: 39px;
	top: 0;
	left: 15px;
	border: none;
	outline: none;
}

.info_id_button {
	display: flex;
	justify-content: center;
	margin: 20px 0 70px 0;
}

.button1, .button2 {
	margin: 0 5px;
	width: 93px;
	height: 46px;
	border-radius: 5px 5px;
	border: 1px solid #e1e1e1;
	text-decoration: none;
	text-align: center;
	line-height: 46px;
}

.button1 {
	background-color: white;
	color: #B22230;
}

.button2 {
	background-color: #B22230;
	color: white;
}

/* 푸터 */
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

	<div class="modal_wrap">
		<div class="modal_content">
			<div class="modal_close">
				<button>
					<i class="fas fa-times"></i>
				</button>
			</div>
			<div class="modal_content_check">
				<span class="modal_recheck">정말 탈퇴하시겠습니까?</span>
				<div class="modal_button">
					<a href="#" class="n_btn">취소</a> <a href="#" class="y_btn">확인</a>
				</div>
			</div>
		</div>
	</div>

	<div class="wrap">
		<header>
			<div class="header">
				<div class="intro">
					<span class="intro_logo"></span> <span class="intro_content">
						<h3 class="content_logo">
							회원탈퇴에 앞서 <span style="color: #B22230">유의사항 및 안내</span>를 반드시 읽고
							진행해 주세요!
						</h3>
					</span>
				</div>
			</div>
		</header>



		<section>
			<form name="" method="" action="">
				<div class="info_id_wrap">
					<div class="info_id_content">
						<div class="info_id_reuse info_id">
							<div class="id_content">
								<strong>PAIK'S RECIPE 아이디는 재사용 및 복구 불가 안내</strong>
								<p>
									회원탈퇴 진행 시 본인을 포함한 타인 모두 <span style="color: red">아이디
										재사용이나 복구가 불가능합니다.</span>
								</p>
								<p>신중히 선택하신 후 결정해주세요.</p>
							</div>
							<span class="agree_box"> 
								<input type="checkbox" class="cbox" id="cbox1"> <label for="cbox1">동의</label>
							</span>
						</div>
						<div class="info_id_delete info_id">
							<div class="id_content">
								<strong>내정보 및 개인형 서비스 이용 기록 삭제 안내</strong>
								<p>
									내정보 및 개인형 서비스 이용기록이 모두 삭제되며, <span style="color: red">삭제된 데이터는 복구되지 않습니다.</span>
								</p>
								<p>삭제되는 서비스를 확인하시고, 필요한 데이터는 미리 백업을 해주세요.</p>
							</div>
							<span class="agree_box"> 
								<input type="checkbox" class="cbox" id="cbox2"> <label for="cbox2">동의</label>
							</span>
						</div>
						<div class="info_id_delete info_id">
							<div class="id_content">
								<strong>게시판형 서비스에 등록한 게시글 삭제 불가 안내</strong>
								<p>삭제를 원하는 게시글이 있다면 반드시 회원탈퇴 전 비공개 처리하거나 삭제하시기 바랍니다.</p>
								<p>
									탈퇴 후에는 회원정보가 삭제되어 본인 여부를 확인할 수 있는 방법이 없어, 
									<span style="color: red">게시글을 임의로 삭제해드릴 수 없습니다.</span>
								</p>
							</div>
							<span class="agree_box"> 
								<input type="checkbox" class="cbox" id="cbox3"> <label for="cbox3">동의</label>
							</span>
						</div>
						<div class="info_id_delete info_id user_info">
							<div class="id_content">
								<table class="user_info_table">
									<tr>
										<th>아이디</th>
										<td><strong>pjj0647</strong></td>
									</tr>
									<tr>
										<th>비밀번호</th>
										<td>
											<div class="pw_input_wrap">
												<input class="pw_input" type="password" placeholder="비밀번호 입력">
											</div>
										</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
					<div class="info_id_button">
						<a href="#" class="button1"><strong>탈퇴 취소</strong></a> <a href="#" class="button2"><strong>탈퇴 확인</strong></a>
					</div>
				</div>
			</form>
		</section>
	</div>
</body>
<script type="text/javascript">
	$(document).on('click', '.button2', function() {
		$('.modal_wrap').css('display', 'flex');
	});
	$(document).on('click', '.modal_close', function() {
		$('.modal_wrap').css('display', 'none');
	});
</script>
</html>