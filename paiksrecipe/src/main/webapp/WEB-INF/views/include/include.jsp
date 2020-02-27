<!-- 모든페이지에서 자주 사용하는 기능을 미리 선언해놓은 곳 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- JSTL태그 기능 사용하기 전 선언부 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- Path 설정 -->
<c:set var="path" value="${pageContext.request.contextPath}" />
<!-- favicon -->
<!-- font awesome -->
<script src="https://kit.fontawesome.com/4d344f8121.js" crossorigin="anonymous"></script>
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 구글웹폰트 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">