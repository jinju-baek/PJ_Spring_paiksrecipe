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
</body>
</html>