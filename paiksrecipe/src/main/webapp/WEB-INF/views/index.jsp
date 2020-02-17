<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/common.css">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<style type="text/css">
body {
	background-color: #f1f1f2;
	font-family: 'Noto Sans KR', sans-serif;
}

div.content_wrap {
	width: 100%
}

div.content {
	width: 1400px;
	margin: 0 auto;
	box-sizing: border-box;
}

.banner {
	display: block;
	background-image: url("${path}/resources/img/banner.jpg");
	background-size: contain;
	background-repeat: no-repeat;
	height: 582px;
	background-position: center;
}

.new_video, .best_video {
	border: 1px solid #e9e9e9;
	margin: 20px 0;
	background-color: white;
}

.new_video_header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin: 20px 30px;
}

.new_video_header_name {
	font-size: 25px;
}

.new_video_header_name+a {
	border: 2px solid #B22230;
	padding: 10px 15px;
	font-size: 12px;
	color: #B22230;
	font-weight: bold;
}

.new_video_header_name+a:hover {
	border: 2px solid #6c141c;
	color: #6c141c;
}

.img {
	width: 250px;
	height: auto;
}

.img+div {
	text-align: center;
	font-size: 18px;
}

.new_video_header+ul {
	display: flex;
	justify-content: center;
}

.new_video_header+ul li {
	margin: 0 10px 30px;
	border: 1px solid #e9e9e9;
}

.new_video_header+ul li div {
	width: 250px;
}

.meterial {
	padding: 30px;
	background-color: #B22230;
	color: #e66768;
	text-align: center;
}

.meterial_wrap {
	background-color: white;
	padding: 10px;
}

.meterial_header {
	font-size: 30px;
	font-weight: bold;
}

.meterial_body {
	display: flex;
	justify-content: center;
	padding: 10px 0;
}

.meterial_category {
	overflow: auto;
	display: flex;
	border: 1px solid #e9e9e9;
	height: 190px;
}

.meterial_category ul li {
	text-align: left;
	padding: 10px;
}

.meterial_category ul li:hover {
	background-color: #e66768;
	color: white;
}

.meterial_list {
	overflow: auto;
	position: relative;
	right: -1px;
	display: flex;
	border: 1px solid #e9e9e9;
	margin-right: 15px;
	width: 500px;
	height: 190px;
}

.subclass {
	position: absolute;
	width: auto;
}

.subclass ul {
	display: none;
}

.subclass ul li {
	display: inline;
	padding: 3px;
	float: left;
	font-size: 15px;
}

.meterial_selected {
	border: 1px solid #e9e9e9;
	height: 158px;
	width: 200px;
}

.meterial_selected_header {
	background-color: #B22230;
	color: white;
	padding: 10px;
}

.meterial_selected_header+div {
	padding: 10px;
}

.meterial_btn {
	border: none;
	background-color: #B22230;
	color: white;
	outline: none;
	padding: 5px 10px;
	font-weight: bold;
	width: 200px;
}

.meterial_selected_content {
	overflow: auto;
}
</style>

</head>
<body>
<body>
	<div class="content_wrap">
		<div class="content">
			<div class="banner"></div>
			<div class="new_video">
				<div class="new_video_header">
					<div class="new_video_header_name">
						<b>최신 동영상레시피</b>
					</div>
					<a href="#">더보기</a>
				</div>
				<ul>
					<li><a class="video_list"
						href="https://www.youtube.com/watch?v=HSPOnMZNoY4&t=33s"> <img
							class="img" src="${path}/resources/img/만두피튀김.webp">
							<div>떡볶이와 같이 먹으면 환상!</div>
					</a></li>
					<li><a class="video_list"
						href="https://www.youtube.com/watch?v=t4Es8mwdYlE&t=358s"> <img
							class="img" src="${path}/resources/img/떡볶이.webp">
							<div>분식집st 떡 볶 이☆</div>
					</a></li>
					<li><a class="video_list"
						href="https://www.youtube.com/watch?v=udirCMIxs_c"> <img
							class="img" src="${path}/resources/img/고추장찌개.webp">
							<div>얼큰한 고추장 찌개! 밥 한 공기 뚝딱!</div>
					</a></li>
					<li><a class="video_list"
						href="https://www.youtube.com/watch?v=F3C8-uEMixU"> <img
							class="img" src="${path}/resources/img/돼지마늘버거.webp">
							<div>햄버거 패티가 바삭 바삭!</div>
					</a></li>
					<li><a class="video_list"
						href="https://www.youtube.com/watch?v=WneiVYnZgHo"> <img
							class="img" src="${path}/resources/img/마늘탕수육.webp">
							<div>부먹, 찍먹 다 맛있는 탕수육! 바삭 바삭~</div>
					</a></li>
				</ul>
			</div>
			<div class="best_video">
				<div class="new_video_header">
					<div class="new_video_header_name">
						<b>BEST 음식</b>
					</div>
					<a href="#">더보기</a>
				</div>
				<ul>
					<li><a class="video_list"
						href="https://www.youtube.com/watch?v=HSPOnMZNoY4&t=33s"> <img
							class="img" src="${path}/resources/img/김치찌개.webp">
							<div>초간단ver 김치찌개</div>
					</a></li>
					<li><a class="video_list"
						href="https://www.youtube.com/watch?v=t4Es8mwdYlE&t=358s"> <img
							class="img" src="${path}/resources/img/제육볶음100인분.webp">
							<div>제육볶음 100인분</div>
					</a></li>
					<li><a class="video_list"
						href="https://www.youtube.com/watch?v=udirCMIxs_c"> <img
							class="img" src="${path}/resources/img/김치밥.webp">
							<div>강식당2 화제의 메뉴!</div>
					</a></li>
					<li><a class="video_list"
						href="https://www.youtube.com/watch?v=F3C8-uEMixU"> <img
							class="img" src="${path}/resources/img/만능양파볶음1.webp">
							<div>양파 농가를 응원합니다! 만능양파볶음 대작전1</div>
					</a></li>
					<li><a class="video_list"
						href="https://www.youtube.com/watch?v=WneiVYnZgHo"> <img
							class="img" src="${path}/resources/img/만능양파볶음2.webp">
							<div>양파 농가를 응원합니다! 만능양파볶음 대작전2</div>
					</a></li>
				</ul>
			</div>





			<form name="" method="get" action="">
				<div class="meterial">
					<div class="meterial_wrap">


						<div class="meterial_header">내가 가진 재료로 레시피 추천받기</div>


						<div class="meterial_body">


							<div class="meterial_category">
								<!-- 재료선택 -->
								<ul>
									<li data-role="1"><a>카테고리1</a></li>
									<li data-role="2"><a>카테고리2</a></li>
									<li data-role="3"><a>카테고리3</a></li>
									<li data-role="4"><a>카테고리4</a></li>
									<li data-role="5"><a>카테고리5</a></li>
									<li data-role="6"><a>카테고리6</a></li>
								</ul>
							</div>


							<div class="meterial_list">
								<div class="subclass">
									<ul>
										<li><input type="checkbox" name="" id="1"><label
											for="1">1목록-1</label></li>
										<li><input type="checkbox" name="" id="2"><label
											for="2">1목록-2</label></li>
										<li><input type="checkbox" name="" id="3"><label
											for="3">1목록-3</label></li>
										<li><input type="checkbox" name="" id="4"><label
											for="4">1목록-4</label></li>
										<li><input type="checkbox" name="" id="5"><label
											for="5">1목록-5</label></li>
									</ul>
								</div>
								<div class="subclass">
									<ul>
										<li><input type="checkbox" name="" id=""><label
											for="">2목록-1</label></li>
										<li><input type="checkbox" name="" id=""><label
											for="">2목록-2</label></li>
										<li><input type="checkbox" name="" id=""><label
											for="">2목록-3</label></li>
										<li><input type="checkbox" name="" id=""><label
											for="">2목록-4</label></li>
										<li><input type="checkbox" name="" id=""><label
											for="">2목록-5</label></li>
									</ul>
								</div>
								<div class="subclass">
									<ul>
										<li><input type="checkbox" name="" id=""><label
											for="">3목록-1</label></li>
										<li><input type="checkbox" name="" id=""><label
											for="">3목록-2</label></li>
										<li><input type="checkbox" name="" id=""><label
											for="">3목록-3</label></li>
										<li><input type="checkbox" name="" id=""><label
											for="">3목록-4</label></li>
										<li><input type="checkbox" name="" id=""><label
											for="">3목록-5</label></li>
									</ul>
								</div>
								<div class="subclass">
									<ul>
										<li><input type="checkbox" name="" id=""><label
											for="">4목록-1</label></li>
										<li><input type="checkbox" name="" id=""><label
											for="">4목록-2</label></li>
										<li><input type="checkbox" name="" id=""><label
											for="">4목록-3</label></li>
										<li><input type="checkbox" name="" id=""><label
											for="">4목록-4</label></li>
										<li><input type="checkbox" name="" id=""><label
											for="">4목록-5</label></li>
									</ul>
								</div>
								<div class="subclass">
									<ul>
										<li><input type="checkbox" name="" id=""><label
											for="">5목록-1</label></li>
										<li><input type="checkbox" name="" id=""><label
											for="">5목록-2</label></li>
										<li><input type="checkbox" name="" id=""><label
											for="">5목록-3</label></li>
										<li><input type="checkbox" name="" id=""><label
											for="">5목록-4</label></li>
										<li><input type="checkbox" name="" id=""><label
											for="">5목록-5</label></li>
									</ul>
								</div>
								<div class="subclass">
									<ul>
										<li><input type="checkbox" name="" id=""><label
											for="">6목록-1</label></li>
										<li><input type="checkbox" name="" id=""><label
											for="">6목록-2</label></li>
										<li><input type="checkbox" name="" id=""><label
											for="">6목록-3</label></li>
										<li><input type="checkbox" name="" id=""><label
											for="">6목록-4</label></li>
										<li><input type="checkbox" name="" id=""><label
											for="">6목록-5</label></li>
									</ul>
								</div>
							</div>


							<!-- 내가 선택한 재료 -->
							<div class="meterial_submit">
								<div class="meterial_selected">
									<div class="meterial_selected_header">내가 선택한 재료</div>
									<div class="meterial_selected_content"></div>
								</div>
								<div>
									<input class="meterial_btn" type="button" name=""
										value="이 재료로 추천받기">
								</div>
							</div>


						</div>


					</div>
				</div>
			</form>
		</div>
	</div>
</body>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	// 카테고리 선택시 하위 목록 나타남
	$('.meterial_category ul li').click(function() {
		for (var i = 0; i < 6; i++) {
			$('.subclass ul:eq(' + i + ')').css('display', 'none');
		}
		var index = $(this).attr('data-role');
		$('.subclass ul:eq(' + (index - 1) + ')').css('display', 'block');
	});

	// 선택된 체크박스 비교할 때 쓸 배열
	var arr = new Array();
	$('input').change(function() {
		// 체크박스 선택시
		if ($(this).is(':checked') == true) {
			// 선택한 값의 다음 값인 label값을 변수 selval에 담음
			var selval = $(this).next().text();
			// arr에 selval이 있는지 확인후 없으면 
			if ($.inArray(selval, arr) == -1) {
				// arr에 selval을 넣고
				arr.push(selval);
				// 내가 선택한 재료 항목에 추가한다.
				$('.meterial_selected_content').append(selval + ' ');
			}
			// 체크박스 선택해체시
		} else {
			// 내가 선택한 재료 항목의 텍스트값 초기화 후
			$('.meterial_selected_content').empty();
			// 배열에서 체크박스 해제한 값을 삭제
			var test = arr.splice(arr.indexOf($(this).next().text()), 1);
			// 배열에 있는 값(체크하여 추가한 값)을 다시 추가한다.
			for (var i = 0; i < arr.length; i++) {
				$('.meterial_selected_content').append(arr[i] + ' ');
			}
		}
	});
</script>
</html>