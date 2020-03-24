<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PAIKSRECIPE : 회원탈퇴</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/common.css">
<style type="text/css">
.wrap {
	width: 768px;
	margin: 80px auto;
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

.ckboxes {
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
	padding: 27px 37px 27px 45px;
	margin-bottom: 20px;
	position: relative;
}

.user_info {
	margin-top: 50px;
}

.id_wrap, .pw_wrap {
	display: flex;
}

.content {
    width: 150px;
    height: 40px;
    line-height: 40px;
    text-align: center;
    font-weight: bold;
}

.content_id {
	line-height: 40px;
	font-weight: bold;
}

.content_wrap {
    line-height: 30px;
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
	line-height: 20px;
	color: red;
	visibility: hidden;
}

.all_error_box {
	display: block;
	margin: 5px 0 5px;
	height: 20px;
	font-size: 12px;
	line-height: 20px;
	color: red;
	visibility: hidden;
}

.info_id_button {
	display: flex;
	justify-content: center;
	margin: 20px 0 70px 0;
}

</style>
</head>

<body>
	<%@ include file="../include/modal.jsp"%>
	<div class="wrap">
		<header>
			<div class="header">
				<div class="intro">
					<span class="intro_logo"></span> <span class="intro_content">
						<h3 class="content_logo">
							회원탈퇴에 앞서 <span style="color: #B22230">유의사항 및 안내</span>를 반드시 읽고 진행해 주세요!
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
							<div class="content_wrap">
								<strong>PAIK'S RECIPE 아이디는 재사용 및 복구 불가 안내</strong>
								<p>
									회원탈퇴 진행 시 본인을 포함한 타인 모두 <span style="color: red">아이디
										재사용이나 복구가 불가능합니다.</span>
								</p>
								<p>신중히 선택하신 후 결정해주세요.</p>
							</div>
							<span class="agree_box"> 
								<input type="checkbox" class="ckboxes" id="ckbox1"> <label for="ckbox1">동의</label>
							</span>
						</div>
						<div class="info_id_delete info_id">
							<div class="content_wrap">
								<strong>내정보 및 개인형 서비스 이용 기록 삭제 안내</strong>
								<p>
									내정보 및 개인형 서비스 이용기록이 모두 삭제되며, <span style="color: red">삭제된 데이터는 복구되지 않습니다.</span>
								</p>
								<p>삭제되는 서비스를 확인하시고, 필요한 데이터는 미리 백업을 해주세요.</p>
							</div>
							<span class="agree_box"> 
								<input type="checkbox" class="ckboxes" id="ckbox2"> <label for="ckbox2">동의</label>
							</span>
						</div>
						<div class="info_id_delete info_id">
							<div class="content_wrap">
								<strong>게시판형 서비스에 등록한 게시글 삭제 불가 안내</strong>
								<p>삭제를 원하는 게시글이 있다면 반드시 회원탈퇴 전 비공개 처리하거나 삭제하시기 바랍니다.</p>
								<p>
									탈퇴 후에는 회원정보가 삭제되어 본인 여부를 확인할 수 있는 방법이 없어, 
									<span style="color: red">게시글을 임의로</span>
								</p>
								<p>
									<span style="color: red"> 삭제해드릴 수 없습니다.</span>
								</p>
							</div>
							<span class="agree_box"> 
								<input type="checkbox" class="ckboxes" id="ckbox3"> <label for="ckbox3">동의</label>
							</span>
						</div>
						<div class="info_id_delete info_id user_info">
							<div class="content_wrap">
								<div class="id_wrap">
									<div class="content">아이디</div>
									<div class="content_id">${id}</div>
								</div>
								<div class="pw_wrap">
									<div class="content">비밀번호</div>
									<div class="pw_input_wrap">
										<input class="pw_input" type="password" placeholder="비밀번호 입력">
									</div>
								</div>
								<span class="error_next_box">필수 정보입니다.</span>
							</div>
						</div>
						<span class="error_next_box all_error_box">탈퇴약관에 동의해주세요.</span>
					</div>
					<div class="info_id_button">
						<a href="#" class="btn-submit"><strong>탈퇴하기</strong></a>
					</div>
				</div>
			</form>
		</section>
	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
<script src="${path}/resources/js/validation.js"></script>
<script type="text/javascript">
	$(function(){		
		var checkArr = new Array(2).fill(false);
		
		$('.pw_input').keyup(function() {
			var pw = $(this).val();
			var result = joinValidate.checkNowpw(pw);
			var color = '';
			
			if(result.code == 100) {
				color = '#3885CA';
				checkArr[0] = true;
			} else {
				color = '#d95339';
				checkArr[0] = false;
			}
			
			$('.pw_input_wrap:eq(0)').css('border', '2px solid ' + color);
			$('.error_next_box:eq(0)').css('visibility', 'visible')
									  .text(result.desc)
									  .css('color', color);
			ckColorBtn();
		});	
		
		$('.ckboxes').click(function(){
			var ckLen = $('.ckboxes:checkbox:checked').length;
			if(ckLen == 3) {
				checkArr[1] = true;
				$('.error_next_box:eq(1)').css('visibility', 'hidden');
			} else {
				checkArr[1] = false;
			}
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
				$('.btn-submit').addClass('btn-primary');
				// $('#btn_join').prop('disabled', false);
				$('.btn-submit').css('cursor', 'pointer');
			} else {
				$('.btn-submit').removeClass('btn-primary');
				// $('#btn_join').prop('disabled', true);
				$('.btn-submit').css('cursor', 'no-drop');
			}
		}
		
		$('.btn-submit').click(function(){
			var checkAll = true;
			
			for(var i = 0; i < checkArr.length; i++) {
				if(checkArr[i] == false) {
					$('.error_next_box:eq(' + i + ')').css('visibility', 'visible');
					checkAll = false;
				}
			}
			
			if(checkAll) {
				$('.basic_modal_wrap').css('display', 'flex');
			} else {
				return false;
			}
		});
		
		$('.modal_btn_yes').click(function(){
			location.href='${path}/member/dropAction';
		});
	});
</script>
</html>