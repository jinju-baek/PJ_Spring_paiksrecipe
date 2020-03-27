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
 	<div class="view_reply_list_wrap">
		<div class="view_reply_header">
			<input type="hidden" class="replyListCnt" value="${list.size()}">
			<i class="fas fa-comment-dots"></i> 댓글 (${list.size()}) 
			<button type="button" class="refresh_btn"><i class="fas fa-sync-alt"></i></button>
		</div>
		<div class="view_reply_input_wrap">
		<c:choose>
			<c:when test="${empty userid}">
				<div class="view_reply_input" > 
					<textarea class="reply_textarea" name="" placeholder="로그인이 필요한 서비스 입니다." readonly></textarea>
				</div>
			</c:when>
			<c:otherwise>
				<form class="frm_reply">
					<input type="hidden" name="bno" class="reply_bno">
					<input type="hidden" name="type" class="reply_type">
					<input type="hidden" name="writer" class="reply_writer">
					<div class="view_reply_input" > 
						<textarea class="reply_textarea_on" name="content" placeholder="댓글을 등록해주세요."></textarea>
					</div>
				</form>				
			</c:otherwise>
		</c:choose> 
			<button type="button" class="view_reply_input_btn">댓글쓰기</button>
		</div>
		<div class="view_error_box">텍스트를 입력해주세요.</div>

		<c:forEach items="${list}" var="reply">
			<div class="view_reply_wrap">
				<div class="view_reply_title">
					<div>
						<div>${reply.writer}</div>
						<c:if test="${name == reply.writer}">
							<div class="reply_update_btn_wrap">
								<button type="button" class="reply_update_btn">수정</button>
							</div>
							<div class="reply_delete_btn_wrap">
								<button type="button" class="reply_delete_btn" data_num="${reply.rno}">삭제</button>
							</div>
						</c:if>
					</div>
					<div>
						<div>
							<fmt:formatDate value="${reply.regdate}" pattern="yyyy-MM-dd HH:mm:ss" />	
						</div>
						<div>
							<button type="button" class="heart_btn"><i class="fas fa-heart"></i></button>
							<span>25</span>
						</div>
					</div>
				</div>
				<div class="view_reply_content">
					<div>${reply.content}</div>
				</div>
			</div>		
		</c:forEach>	
		
		<jsp:useBean id="now" class="java.util.Date"/><!-- 접속날짜 -->
		<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today"/><!-- 접속날짜를 변환 -->
		
		<c:if test="${list.size() == 0}">
			<div class="view_reply_wrap">
				<div class="view_reply_title">
					<div>관리자</div>
					<div>
						<div>
							<fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" />		
						</div>
					</div>
				</div>
				<div class="view_reply_content">
					<div>등록된 게시글이 없습니다 :(</div>
				</div>
			</div>	
		</c:if>
	</div>
</body>
</html>