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
	padding: 2px 0;
	font-weight: bold;

}
.search_list>a:hover{
	border-bottom: 2px solid #B22230;
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

.board_count_info{
	display: flex;

}

.clear_btn{
	padding: 0px 5px;
    background: #B22230;
    color: white;
    border-radius: 5px;
    margin-left: 5px;
    font-size: 12px;
}

.total_count, .clear_btn{
	line-height: 20px;
}

.board{
	border-collapse: collapse;
	width: 770px;
	margin: 20px auto;
}
.board_first{
	border-bottom: 1px solid black;
	color: #8a8a8a;
}

.board_bno, .board_viewcnt, .board_goodcnt{
	width: 50px;
}

.board_title{
	width: 430px;
}

.board_writer{
 	width: 75px;
}

.board_regdate {
	width: 90px;
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
	margin: 0 3px;
}

.page_btn_wrap>a>i{
	line-height: 23px;
}

.page_num{
	display: inline-block;
	width: 30px;
	height: 30px;
	padding: 3px;
	color: #8a8a8a;
	border: 1px solid #ccc;
}

.page_num:hover{
	color: #B22230;
	border: 1px solid #B22230;
}

#check_color{
	color: white;
	background-color: #B22230;
	border: 1px solid #B22230;
}
strong{
	color: #B22230;
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
				<a href="${path}/board/list?sort_option=new&keyword=${map.keyword}" class="sort_li" id="sort_new">최신순</a>
				<a href="${path}/board/list?sort_option=cnt&keyword=${map.keyword}" class="sort_li" id="sort_cnt">조회순</a>
				<a href="${path}/board/list?sort_option=reply&keyword=${map.keyword}" class="sort_li" id="sort_reply">댓글순</a>
				<a href="${path}/board/list?sort_option=good&keyword=${map.keyword}" class="sort_li" id="sort_good">추천순</a>
			</div>
			
			<form action="${path}/board/list" method="GET">
				<div class="search_box">
					<select name="search_option">
						<option value="all">전체</option>
						<option value="title">제목</option>
						<option value="content">내용</option>
						<option value="writer">작성자</option>
					</select>
					<div class="search_input"><input type="text" name="keyword" placeholder="검색어를 입력해주세요." value="${map.keyword}"></div>
					<button type="submit" class="search_submit">조회</button>
				</div>
			</form>
		</div>
		<div class="board_wrap">
			<div class="board_count_info">
				<c:choose>
					<c:when test="${empty map.keyword}">
						<div class="total_count">총  <strong>${map.count}</strong>  건의 글이 있습니다.</div>
					</c:when>
					<c:otherwise>
						<div class="total_count"><strong>"${map.keyword}"</strong> 검색결과 <strong>${map.count}</strong>건 검색되었습니다.</div>
						<a class="clear_btn" href="${path}/board/list">CLEAR <i class="far fa-times-circle"></i></a>
					</c:otherwise>
				</c:choose>
			</div>

			
			<table class="board">
				<tr class="board_first">
					<th class="board_bno">NO</th>
					<th class="board_title">제목</th>
					<th class="board_writer">작성자</th>
					<th class="board_regdate">작성일</th>
					<th class="board_viewcnt">조회수</th>
					<th class="board_goodcnt">추천</th>
				</tr>
				<c:forEach items="${map.list}" var="list">
				<fmt:formatDate value="${list.updatedate}" pattern="yyyy-MM-dd" var="regdate"/>
					<tr class="board_list">
						<td class="board_bno">${list.bno}</td>
						<td class="board_title">
							<a href="#">${list.title}  [${list.replycnt}]  </a>
							<div><i class="fas fa-paperclip"></i></div>
							<c:if test="${today == regdate}">
								<div class="new_img"></div>
							</c:if>
						</td>
						<td class="board_writer">${list.writer}</td>
						<td class="board_regdate">
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
						<td class="board_viewcnt">${list.viewcnt}</td>
						<td class="board_goodcnt">${list.goodcnt}</td>
					</tr>
				</c:forEach>
			</table>
			<div class="write_btn_wrap"><a href="#" class="write_btn">글쓰기</a></div>
			<div class="page_btn_wrap"> 
			
				<c:if test="${map.pager.curBlock > 1}">
					<a class="page_num" href="${path}/board/list?curPage=${map.pager.blockBegin-10}&sort_option=${map.sort_option}&keyword=${map.keyword}"><i class="fas fa-angle-left"></i></a>
					<a class="page_num" href="${path}/board/list?curPage=1&sort_option=${map.sort_option}&keyword=${map.keyword}">1</a>
					<a class="page_num" href="#">...</a>
				</c:if>
					
				<c:forEach var="num" begin="${map.pager.blockBegin}" end="${map.pager.blockEnd}">
					<c:choose>
						<c:when test="${num == map.pager.curPage}">
							<a class="page_num" id="check_color" href="${path}/board/list?curPage=${num}&sort_option=${map.sort_option}&keyword=${map.keyword}">${num}</a>
						</c:when>
						<c:otherwise>
							<a class="page_num" href="${path}/board/list?curPage=${num}&sort_option=${map.sort_option}&keyword=${map.keyword}">${num}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				<c:if test="${map.pager.curBlock < map.pager.totBlock}">
					<a class="page_num" href="#">...</a>
					<a class="page_num" href="${path}/board/list?curPage=${map.pager.totPage}&sort_option=${map.sort_option}&keyword=${map.keyword}">${map.pager.totPage}</a>
					<a class="page_num" href="${path}/board/list?curPage=${map.pager.blockEnd + 1}&sort_option=${map.sort_option}&keyword=${map.keyword}"><i class="fas fa-angle-right"></i></a>
				</c:if>
				
			</div>
		</div>
	</div>
	<%@ include file="../include/footer.jsp"%>	
</body>
<script type="text/javascript">
	$(function() {
		var sort_option = '${map.sort_option}';
		if(sort_option == 'new') {
			$('.sort_li:eq(0)').css('color', '#B22230');
		} else if(sort_option == 'cnt') {
			$('.sort_li:eq(1)').css('color', '#B22230');
		} else if(sort_option == 'reply') {
			$('.sort_li:eq(2)').css('color', '#B22230');
		} else {
			$('.sort_li:eq(3)').css('color', '#B22230');
		}
	});
</script>
</html>