<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PAIKSRECIPE : 커뮤니티</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/common.css">
<style type="text/css">
.board_title_wrap{
	width: 768px;
	margin: 130px auto 0;
}
h2{
	font-size: 40px;
}
.board_menu_wrap>a{
	font-size: 20px;
	margin: 0 5px;
}
.search_wrap{
	width: 900px;
	margin: 40px auto 60px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 20px 30px;
	border: 2px solid black;
}
.search_list>a{
	margin: 0 5px;
	padding: 5px 0;

}
.search_list>a:hover{
	border-bottom: 1px solid #B22230;
	color: #B22230;
}
.search_box{
	display: flex;
	align-items: center;
}
.search_box>select{
	height: 35px;
	width: 100px;
	padding: 5px;
	border: #f0f0f0;
	background-color: #f0f0f0;
	outline: none;
}
option{
	background-color: white;
}
.search_input{
	height: 35px;
	width: 250px;
	border: #f0f0f0;
	background-color: #f0f0f0;
	outline: none;
	margin: 0 10px;
}.search_input>input{
	width: 235px;
	height: 25px;
	margin: 5px;
	outline: none;
	border: none;
	background-color: #f0f0f0;
}
.search_box>button{
	border:#B22230;
	background-color: #B22230;
	color: white;
	height: 35px;
	width: 60px;
	cursor: pointer;
	outline: none;
	border-radius: 2px;
	margin-left: 10px;
}
.board_wrap{
	width: 768px;
	margin: 0 auto;
}
.board{
	border-collapse: collapse;
	width: 100%;
	margin: 20px 0;
}
.board_first{
	border-bottom: 1px solid black;
	color: #8a8a8a;
}
.board_list{
	border-bottom: 1px solid #ebebeb;
}
.board_list>td>a{
 	padding: 1px 0;
}
.board_list>td>a:hover{
	border-bottom: 1px solid black;
}
th, td{
	text-align: center;
	padding: 15px 1px 15px 5px;
}
.board_list>td div{
	margin-right: 3px;
	display: inline-block;
}
.new_img{
	background: url('${path}/resources/img/icons8-new-24.png') no-repeat;
	background-size: cover;
	height: 20px;
 			width: 24px;
	/* 설정할 애니메이션 이름 */
	animation-name: twinkle;
	/* 애니메이션 반복 횟수 */
	animation-iteration-count: infinite;
	/* 애니메이션 실행 시간 */
	animation-duration: 3s;
}
@keyframes twinkle{
	0%		{opacity: 0;}
	100%	{opacity: 1;}

	/*from{opacity: 0;}
	to{opacity: 1;}*/
}
.write_btn_wrap{
	display: flex;
	justify-content: flex-end;
	margin-right: 5px;
}
.write_btn{
	display: block;
	position: relative;
	border:#B22230;
	background-color: #B22230;
	color: white;
	height: 35px;
	width: 70px;
	outline: none;
	border-radius: 2px;
	text-align: center;
	line-height: 35px;

}
.page_btn_wrap{
	display: flex;
	justify-content: center;
	align-items: center;
	text-align: center;
	margin: 20px 0;
}
.page_btn_wrap>a{
	margin: 0 1px;
}
.page_arrow{
	display: flex;
	justify-content: center;
	align-items: center;
	width: 40px;
	height: 40px;
	color: #8a8a8a;
	border: 1px solid #ccc;
}
.page_arrow>img{
	width: 15px;
}
.page_num{
	display: inline-block;
	width: 40px;
	height: 40px;
	padding: 8px;
	color: #8a8a8a;
border: 1px solid #ccc;
}
</style>

</head>
<body>
	<jsp:useBean id="now" class="java.util.Date"/><!-- 접속날짜 -->
	<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today"/><!-- 접속날짜를 변환 -->
	<div class="wrap">
		<div class="board_title_wrap">
			<h2>커뮤니티</h2>
			<div class="board_menu_wrap">
				<a href="#">자유게시판</a>
				<a href="#">요리게시판</a>
			</div>
		</div>
		<div class="search_wrap">
			<div class="search_list">
				<a href="#">최신순</a>	
				<a href="#">조회순</a>
				<a href="#">댓글순</a>
				<a href="#">추천순</a>
			</div>
			<div class="search_box">
				<select>
					<option>전체</option>
					<option>제목</option>
					<option>내용</option>
				</select>
				<div class="search_input"><input type="search" name="" placeholder="검색어를 입력해주세요."></div>
				<button class="search_submit">조회</button>
			</div>
		</div>
		<div class="board_wrap">
			<div class="total_count">총  <strong style="color: #B22230;">${map.listCnt}</strong>  건의 글이 있습니다.</div>
			<table class="board">
				<tr class="board_first">
					<th>NO</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
					<th>추천</th>
				</tr>
				<c:forEach items="${map.list}" var="list">
				<fmt:formatDate value="${list.updatedate}" pattern="yyyy-MM-dd" var="regdate"/>
					<tr class="board_list">
						<td>${list.bno}</td>
						<td>
							<a href="#">${list.title}  (${list.replycnt})  </a>
							<div><i class="fas fa-paperclip"></i></div>
							<c:if test="${today == regdate}">
								<div class="new_img"></div>
							</c:if>
						</td>
						<td>${list.writer}</td>
						<td>
							<c:choose>
							<%-- JSTL 주석은 이렇게 써야 에러 안뜸--%>
								<c:when test="${today == regdate}">
									<fmt:formatDate value="${list.updatedate}" pattern="HH:mm:ss" />		
								</c:when>
								<c:otherwise>
									<fmt:formatDate value="${list.updatedate}" pattern="yyyy-MM-dd" />
								</c:otherwise>
							</c:choose>
						</td>
						<td>${list.viewcnt}</td>
						<td>${list.goodcnt}</td>
					</tr>
				</c:forEach>
			</table>
			<div class="write_btn_wrap"><a href="#" class="write_btn">글쓰기</a></div>
			<div class="page_btn_wrap"> 
				<a class="page_arrow" href="#"><img src="${path}/resources/img/icons8-chevron-doubleLeft-24.png"></a>
				<a class="page_arrow" href="#"><img src="${path}/resources/img/icons8-chevron-left-24.png"></a>
				<a class="page_num" href="#">1</a>
				<a class="page_num" href="#">2</a>
				<a class="page_num" href="#">3</a>
				<a class="page_num" href="#">4</a>
				<a class="page_num" href="#">5</a>
				<a class="page_num" href="#">6</a>
				<a class="page_num" href="#">7</a>
				<a class="page_num" href="#">8</a>
				<a class="page_num" href="#">9</a>
				<a class="page_num" href="#">10</a>
				<a class="page_arrow" href="#"><img src="${path}/resources/img/icons8-chevron-right-24.png"></a>
				<a class="page_arrow" href="#"><img src="${path}/resources/img/icons8-chevron-doubleRight-24.png"></a>
			</div>
		</div>
	</div>
	<%@ include file="../include/footer.jsp"%>	
</body>
</html>