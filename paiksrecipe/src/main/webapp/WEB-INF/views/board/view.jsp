<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PAIKSRECIPE : 자유게시판</title>
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/common.css">
<style type="text/css">
.board_view_wrap {
	width: 768px;
	margin: 130px auto;
}

.board_title_wrap>h2{
	font-size: 40px;
	margin-bottom: 40px;

}

.view_content_wrap {
	border-bottom: 1px solid black;
}
/* 
.view_title {
	font-size: 25px;
	padding: 10px;
}
 */
.view_info_wrap {
	display: flex;
	justify-content: space-between;
	background-color: #F1F1F1;
	border-top: 1px solid black;
	padding: 10px;
}

.view_info_title{
	font-size: 20px;
    font-weight: bold;
}

.view_info {
	display: flex;
	line-height: 29px;
}

.view_info>div {
	padding: 0 5px;
}

.thumbs_up {
	display: block;
	padding: 5px 10px;
	margin: 10px auto;
	width: 70px;
	border: 1px solid #B22230;
	color: #B22230;
	border-radius: 5px;
	text-align: center;
}

.thumbs_up:hover {
	border: 1px solid #B22230;
	background-color: #B22230;
	color: white;
}

.thumbs_up>i:hover {
	position: relative;
	animation-duration: 1s;
	animation-name: bounce;
	animation-iteration-count: infinite;
}

@keyframes bounce {
    0%, 20%, 50%, 80%, 100% {transform: translateY(0);}
    40% {transform: translateY(-10px);}
    60% {transform: translateY(-5px);}
}
.view_content {
	padding: 10px;
}

.view_info_btn_wrap {
	display: flex;
	justify-content: space-between;
	margin: 10px 10px 40px;
}

.view_info_btn_wrap>div>a {
	display: inline-block;
	width: 65px;
	padding: 5px 10px;
	margin: 0 3px;
	border: 1px solid #B22230;
	background-color: #B22230;
	color: white;
	border-radius: 5px;
	text-align: center;
}

.view_reply_header {
	margin: 10px;
}

.view_reply_wrap {
	margin: 20px 0 40px;
}

.view_reply_title {
	display: flex;
	justify-content: space-between;
	background-color: #F1F1F1;
	padding: 5px 10px;
}

.view_reply_title>div {
	display: flex;
}

.view_reply_title>div>div {
	margin: 0 5px;
}

.fa-heart {
	color: #B22230;
	transition: all ease 0.3s;
}

.fa-heart:hover {
	transform: scale(1.5);
}

.view_reply_content {
	margin: 10px;
}

.view_reply_input_wrap {
	display: flex;
	justify-content: center;
}

.view_reply_input {
	border: 1px solid black;
	height: 80px;
	width: 610px;
}

.view_reply_input>textarea {
	border: none;
	outline: none;
	padding: 15px 0 0 15px;
	width: 100%;
	height: 78px;
	overflow: auto;
	resize: none;
}

.view_reply_input_btn {
	display: inline-block;
	border: 1px solid #B22230;
	background-color: #B22230;
	color: white;
	height: 80px;
	text-align: center;
	padding: 29px;
	margin-left: 10px;
}
</style>
</head>
<body>
	<jsp:useBean id="now" class="java.util.Date"/><!-- 접속날짜 -->
	<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today"/><!-- 접속날짜를 변환 -->
	<div class="board_view_wrap">
		<div class="board_title_wrap">
			<h2>자유게시판</h2>
		</div>
		<div class="view_content_wrap">
			<!-- <div class="view_title">제목</div> -->
			<div class="view_info_wrap">
				<div class="view_info_title">${view.title}</div>
				<div class="view_info">
					<div>${view.writer}</div>
					<div>
						<c:choose>
						<%-- JSTL 주석은 이렇게 써야 에러 안뜸--%>
							<c:when test="${today == regdate}">
								<fmt:formatDate value="${view.regdate}" pattern="HH:mm:ss" />		
							</c:when>
							<c:otherwise>
								<fmt:formatDate value="${view.regdate}" pattern="yyyy-MM-dd" />
							</c:otherwise>
						</c:choose>
					</div>
					<div>
						<i class="far fa-eye"></i> ${view.viewcnt}
					</div>
					<div>
						<i class="far fa-thumbs-up"></i> ${view.goodcnt}
					</div>
				</div>
			</div>
			<div class="view_content">${view.content}</div>
			<a class="thumbs_up" href="#"><i class="far fa-thumbs-up"></i>추천</a>
		</div>
		<div class="view_info_btn_wrap">
			<div>
				<a href="#">목록</a> <a href="#">답글</a>
			</div>
			<div>
				<a href="#">수정</a> <a href="#">삭제</a>
			</div>
		</div>
		<div class="view_reply_list_wrap">
			<div class="view_reply_header">
				<i class="fas fa-comment-dots"></i> 댓글
			</div>
			<div class="view_reply_input_wrap">

				<div class="view_reply_input" > 
					<textarea name="" placeholder="로그인이 필요한 서비스 입니다."></textarea>
				</div> 
				<a class="view_reply_input_btn" href="#">댓글쓰기</a>
			</div>

			<div class="view_reply_wrap">
				<div class="view_reply_title">
					<div>징구</div>
					<div>
						<div>2020-03-21</div>
						<div>
							<a href="#"><i class="fas fa-heart"></i> 25</a>
						</div>
					</div>
				</div>
				<div class="view_reply_content">
					<div>댓글 내용1</div>
				</div>
			</div>

			<div class="view_reply_wrap">
				<div class="view_reply_title">
					<div>징구</div>
					<div>
						<div>2020-03-21</div>
						<div>
							<a href="#"><i class="fas fa-heart"></i> 38</a>
						</div>
					</div>
				</div>
				<div class="view_reply_content">
					<div>댓글 내용2</div>
				</div>
			</div>
			
		</div>
	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>