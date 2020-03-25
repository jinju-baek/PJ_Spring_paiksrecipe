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

.view_info_writer {
	font-weight: bold;
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
	<%@ include file="../include/modal.jsp"%>
	<jsp:useBean id="now" class="java.util.Date"/><!-- 접속날짜 -->
	<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today"/><!-- 접속날짜를 변환 -->
	<div class="board_view_wrap">
		<div class="board_title_wrap">
			<h2>자유게시판</h2>
		</div>
		<div class="view_content_wrap">
			<!-- <div class="view_title">제목</div> -->
			<div class="view_info_wrap">
				<div class="view_info_title">${one.title}</div>
				<div class="view_info">
					<div class="view_info_writer">${one.writer}</div>
					<div>
						<c:choose>
						<%-- JSTL 주석은 이렇게 써야 에러 안뜸--%>
							<c:when test="${today == regdate}">
								<fmt:formatDate value="${one.regdate}" pattern="HH:mm:ss" />		
							</c:when>
							<c:otherwise>
								<fmt:formatDate value="${one.regdate}" pattern="yyyy-MM-dd" />
							</c:otherwise>
						</c:choose>
					</div>
					<div>
						<i class="far fa-eye"></i> ${one.viewcnt}
					</div>
					<div>
						<i class="far fa-thumbs-up"></i> ${one.goodcnt}
					</div>
				</div>
			</div>
			<div class="view_content">${one.content}</div>
			<a class="thumbs_up" href="#"><i class="far fa-thumbs-up"></i>추천</a>
		</div>
		<div class="view_info_btn_wrap">
			<div>
				<a href="${header.referer}">목록</a> 
				<a href="#">답글</a>
			</div>
			<c:if test="${name == one.writer}">
				<div>
					<a href="#">수정</a> 
					<a href="#" class="btn_delete">삭제</a>
				</div>
			</c:if>
		</div>
		
		<!-- 댓글창 -->
		<!-- 여기서 forEach문을 쓸 경우 댓글 수정 삭제시 
		동적으로 보여지지않고 새로 페이지를 띄워야만 바뀜 -->
		<div id="listReply"></div>
			
	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
<script type="text/javascript">
	$(function(){		
		
		listReply();
		
		$('.btn_delete').click(function(){
			$('.basic_modal_wrap').css('display', 'flex');
		});
		
		$('.modal_btn_yes').click(function(){
			location.href="${path}/board/delete?bno=${one.bno}";
		});
	});
	
	// 댓글 목록 출력 함수
	function listReply(){
		$.ajax({
			type: "get",
			url: "${path}/reply/list?bno=${one.bno}",
			success: function(result){
				//result: responseText 응답텍스트(html)
				$('#listReply').html(result);
			}
		});
	}
</script>
</html>