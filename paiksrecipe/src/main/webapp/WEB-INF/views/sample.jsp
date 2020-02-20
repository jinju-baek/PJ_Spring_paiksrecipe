<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sample.jsp</title>
</head>
<body>
	<!-- 
		쿼리스트링(GET방식만 허용) : View단에서 Controller단으로 전송 
		URL : localhost:8081/metop/sample/view
		-> ${path}/sample/view?user='배뚱'&pass=1234
		?를 기준으로 ?앞은 주소 ?뒤는 데이터	
	-->
	<a href="${path}/sample/view?user=배뚱&pass=1234">GET</a>
	
	<form action="${path}/sample/view" method="POST">
		<!-- input, textarea, select, radio, checkbox등 사용자가 입력하는 태그들만 controller에 넘김 -->
		<input type="text" name="user">
		<input type="password" name="pass">
		<button type="submit">POST</button>
	</form>
	
	<!-- 동기방식 -->
	<img src="${path}/resources/img/banner.png" style="width: 500px; height:500px;">
	<br>
	<a href="${path}/sample/sync?name=배뚱아">동기방식</a>
	<!-- 비동기방식 -->
	<button type="button" id="ajax_btn">비동기방식(AJAX)</button>
	
	<br>
	<div><span>동기: ${name}</span></div>
	<div><span>비동기: <span id="ajax_txt"></span></div>
</body>
<script type="text/javascript">
	$('#ajax_btn').on('click', function(){
		// type : GET or POST
		// url : 서버단 목적지(RequestMapping으로 받는 요청)
		// contextType : 서버단으로 전송하는 데이터의 타입
		// data : 서버로 전송하는 실제 데이터
		// dateType : 서버단에서 View단으로 전송하는 데이터 타입, (생략할 경우 String)
		// success : AJAX 성공했을 때 작업(DATA: AJAX 서버단 Return값)
		// error : AJAX 실패했을 때 작업
		// {key: value} -> JSON
		
		// 	url: '${path}/sample/ajax', 
		//	data: {name: '뚱깐징어'}
		//  쿼리스트링도 가능 -> url: '${path}/sample/ajax?name=뚱깐징어', 
		$.ajax({
			type: 'POST',
			url: '${path}/sample/ajax', 
			data: {name: '뚱깐징어'},
			success: function(data) {
				console.log(data);
				$('#ajax_txt').text(data);
			},
			error: function(){
				alert('System ERROR :( ');
			}
		});
	});

</script>
</html>