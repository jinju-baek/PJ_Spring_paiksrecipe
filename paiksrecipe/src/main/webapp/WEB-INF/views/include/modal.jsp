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
			background-color: white;
			border-radius: 5px 5px;
			width: 400px;
			height: 180px;
		}		
		.basic_modal_close button{
			position: absolute;
			top: 10px;
			right: 10px;
			cursor: pointer;
			border: none;
			outline: none;
			background-color: white;
		}
		.basic_modal_close button i{
			font-size: 20px;
		}
		.basic_modal_recheck{
			font-weight: bold;
			font-size: 20px;
			display: flex;
			justify-content: center;
			margin-top: 40px;

		}
		.basic_modal_button{
			display: flex;
			justify-content: center;
		}
		.y_btn, .n_btn{
			margin: 20px 20px;
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
				<div class="basic_modal_close">
					<button><i class="fas fa-times"></i></button>
				</div>
				<div class="basic_modal_content_check">
					<span class="basic_modal_recheck">내용</span>
					<div class="basic_modal_button">
						<a href="#" class="n_btn">취소</a>
						<a href="#" class="y_btn">확인</a>
					</div>
				</div>	
			</div>
		</div>
	</div>
</body>
</html>