<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.0/css/all.css" integrity="sha384-REHJTs1r2ErKBuJB0fCK99gCYsVjwxHrSU0N7I1zl9vZbggVJXRMsv/sLlOAGb4M" crossorigin="anonymous">
	<style type="text/css">
		*{
			font-family: 'Noto Sans KR', sans-serif;
		}
		body{
			padding: 0; margin: 0;
		}
		a{
			text-decoration: none;
		}

		/* 모달창 */
		.basic_modal_wrap{
			display: none;
			position: fixed;
			background-color: rgba(0,0,0,0.4);
			width: 100%;
			height: 100%;
			overflow: auto;
			z-index: 1000;
			top: 0;
		}
		.basic_modal_content_wrap{
			position: absolute;
			display: flex;
			left: 40%;
			top: 35%
		}
		.basic_modal_content{
			position: relative;
			text-align: center;
			background-color: white;
			border-radius: 5px 5px;
			width: 400px;
		}		
		.basic_modal_header_wrap{
			border-top-left-radius: 5px 5px;
			border-top-right-radius: 5px 5px;
			padding: 8px 10px;
			display: flex;
			justify-content: space-between;
			
		}
		.basic_modal_message{
			font-weight: bold;
			font-size: 15px;
			heigth: 25px;
			color: #B22230;
		}
		.basic_modal_close button{
			cursor: pointer;
			border: none;
			outline: none;
			background: none;
		}
		.basic_modal_close button i{
			font-size: 20px;
			color: rgb(142, 142, 142);
		}
		.basic_modal_close button>i:hover {
			color: #B22230;
		}
		.basic_modal_content_check{
			height: 100%;
			padding: 15px;
		}
		.basic_modal_maintext{
			font-size: 20px;
		}
		.basic_modal_subtext{
			font-size: 13px;
		}
		.basic_modal_button{
			display: flex;
			justify-content: space-around;
		}
		.y_btn, .n_btn{
			margin: 5px 20px;
			padding: 10px 35px;
			background-color: #B22230;
			color: white;
			border-radius: 5px 5px;
			font-weight: bold;
		}


	</style>
</head>
<body>
	<div class="basic_modal_wrap">
		<div class="basic_modal_content_wrap">
			<div class="basic_modal_content">
				<div class="basic_modal_header">
					<div class="basic_modal_header_wrap">
						<div class="basic_modal_message"> PAIKS' RECIPE 알림</div>
						<div class="basic_modal_close">
						<button><i class="fas fa-times"></i></button>
						</div>
					</div>
				</div>
				<div class="basic_modal_content_check">
			 		<div class="basic_modal_recheck">
						<div class="basic_modal_maintext">내용</div>
						<div class="basic_modal_subtext">내용</div>
					</div>
					<div class="basic_modal_button">
						<a href="#" class="n_btn">취  소</a>
						<a href="#" class="y_btn">확  인</a>
					</div>
				</div>	
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function(){
		var id = '${id}';
		var email = '${email}';
		var key = '${key}';
		
		var join_main_txt = id + '님 회원가입을 축하드립니다.';
		var join_sub_txt = email + '으로 인증메일을 보냈습니다. 인증하셔야만 사이트 활동이 가능합니다.';
		var auth_main_txt = id + '님 이메일 인증되셨습니다.';
		var auth_sub_txt = '지금부터 사이트 활동이 가능합니다. 감사합니다.';
		
		if(key == 'join'){
			$('.basic_modal_maintext').text(join_main_txt); // 메인텍스트
			$('.basic_modal_subtext').text(join_sub_txt); // 서브텍스트
			$('.n_btn').css('display', 'none'); // 취소버튼 제거
			$('.basic_modal_wrap').css('display', 'flex'); // 모달창 출력
		} else if(key == 'auth'){
			$('.basic_modal_maintext').text(auth_main_txt);
			$('.basic_modal_subtext').text(auth_sub_txt);
			$('.n_btn').css('display', 'none');
			$('.basic_modal_wrap').css('display', 'flex');
		}
		
		$('.y_btn').on('click', function(){
			$('.basic_modal_wrap').css('display', 'none');
		});
		$('.basic_modal_close').on('click', function(){
			$('.basic_modal_wrap').css('display', 'none');
		});
	})	
</script>
</html>
