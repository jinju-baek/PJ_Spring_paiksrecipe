<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="now" class="java.util.Date"/><!-- 접속날짜 -->
	<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today"/><!-- 접속날짜를 변환 -->
 	<div class="view_reply_list_wrap">
		<div class="view_reply_header">
			<i class="fas fa-comment-dots"></i> 댓글 (${list.size()})
		</div>
		<div class="view_reply_input_wrap">

			<div class="view_reply_input" > 
				<textarea name="" placeholder="로그인이 필요한 서비스 입니다."></textarea>
			</div> 
			<a class="view_reply_input_btn" href="#">댓글쓰기</a>
		</div>

		<c:forEach items="${list}" var="reply">
			<div class="view_reply_wrap">
				<div class="view_reply_title">
					<div>${reply.writer}</div>
					<div>
						<div>
							<c:choose>
								<%-- JSTL 주석은 이렇게 써야 에러 안뜸--%>
								<c:when test="${today == regdate}">
									<fmt:formatDate value="${reply.regdate}" pattern="HH:mm:ss" />		
								</c:when>
								<c:otherwise>
									<fmt:formatDate value="${reply.regdate}" pattern="yyyy-MM-dd" />
								</c:otherwise>
							</c:choose>
						</div>
						<div>
							<a href="#"><i class="fas fa-heart"></i> 25</a>
						</div>
					</div>
				</div>
				<div class="view_reply_content">
					<div>${reply.content}</div>
				</div>
			</div>		
		</c:forEach>	
	</div>
</body>
</html>