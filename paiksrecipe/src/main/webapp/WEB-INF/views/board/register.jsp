<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>PAIKSRECIPE : 글작성</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/common.css">
<style type="text/css">
.boardregister_wrap {
	width: 770px;
	margin: 130px auto;
}
.board_title{
	font-size: 40px;
	margin-bottom: 10px;
}
table {
	border-collapse: separate;
	border-spacing: 0 10px;
	width: 100%;
}

.register_table_content {
	padding: 5px 15px;
	border: 1px solid #ebebeb;
}

.register_table_content>select {
	width: 100%;
	height: 21px;
	border: none;
}

.textarea_wrap {
	padding: 0;
}

.content_file {
	border: 2px dashed #ebebeb;
	text-align: center;
	height: 100px;
	color: #c5c5c5;
}

.register_title_input {
	width: 653px;
	height: 21px;
	border: none;
	outline: none;
}

.register_content_textarea {
	border: none;
	outline: none;
	resize: none;
	height: 300px;
	width: 650px;
}

.boardregister_btn_wrap {
	padding: 10px 20px;
	display: flex;
	justify-content: space-between;
}

.cancel_btn {
	display: inline-block;
	width: 65px;
	padding: 5px 10px;
	margin: 0 3px;
	border: 1px solid #B22230;
	background-color: white;
	color: #B22230;
	border-radius: 5px;
	text-align: center;
	outline: none;
	cursor: pointer;
}

.submit_btn {
	display: inline-block;
	width: 65px;
	padding: 5px 10px;
	margin: 0 3px;
	border: 1px solid #B22230;
	background-color: #B22230;
	color: white;
	border-radius: 5px;
	text-align: center;
	outline: none;
	cursor: pointer;
}
</style>
</head>
<body>
	<div class="boardregister_wrap">
		<div class="board_title_wrap">
			<c:choose>
				<c:when test="${empty one}">
					<h2 class="board_title">게시글 작성</h2>
				</c:when>
				<c:otherwise>
					<h2 class="board_title">게시글 수정</h2>
				</c:otherwise>
			</c:choose>
		</div>
		<form:form id="frm_board">
			<table>
				<tr>
					<td class="register_table_content"><strong>${name}</strong><input type="hidden" value="${name}" name="writer"></td>
				</tr>
				<tr>
					<td class="register_table_content content_type">
						<select name="type" class="board_type">
							<option value="free">자유게시판</option>
							<option value="cook">요리게시판</option>
							<option value="qna">Q&A게시판</option>
							<option value="review">후기게시판</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="register_table_content content_title">
						<input class="register_title_input" type="text" name="title" placeholder="제목을 입력하세요." value="${one.title}">
					</td>
				</tr>
				<tr>
					<td class="register_table_content textarea_wrap">
						<script type="text/javascript" src="${path}/resources/smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
						<textarea class="register_content_textarea" id="board_content" name="content" style="min-width: 766px">${one.content}</textarea>
					</td>
				</tr>
				<tr>
					<td class="register_table_content content_file"><i class="fas fa-paperclip"></i> 첨부파일을 드래그 해주세요</td>
				</tr>
			</table>
			
			<div class="boardregister_btn_wrap">
				<button type="button" class="cancel_btn">취소</button>
				<c:choose>
					<c:when test="${empty one}">
						<button type="button" class="submit_btn">글쓰기</button>
					</c:when>
					<c:otherwise>
						<button type="button" class="submit_btn">수정</button>
					</c:otherwise>
				</c:choose>
			</div>	
		</form:form>
	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
<script type="text/javascript">
	$(function(){
		// register -> 게시글 등록과 게시글 수정
		// ${one}에 값이 있으면 수정페이지 로딩
		if('${one}' != ''){
			// 수정페이지로 디자인 변경
			
			// SelectBox 값으로 Selected
			$('.board_type').val('${one.type}').attr('selected', 'selected');
			
		}
	});
	
	$(document).on('click', '.cancel_btn', function(){
		var referer = '${header.referer}';
		
		if(referer.indexOf('board/list') != -1) {
			location.href = '${header.referer}';
		} else {
			location.href = '${path}/board/list'
		}
	});
	
	$(document).on('click', '.submit_btn', function(){
		var title = $('.register_title_input').val();
		var content = $('.register_content_textarea').val();
		
		if(title == '' || title.length == 0){
			// 에러메세지 '제목을 입력해주세요'
			alert('제목을 입력해주세요');
			$('.register_title_input').focus();
			return false;
		} else {
			// 서버로 전송
			oEditors.getById["board_content"].exec("UPDATE_CONTENTS_FIELD", []);
			$('#frm_board').submit();
		}
	});
</script>
<script type="text/javascript">
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
		 oAppRef: oEditors,
		 elPlaceHolder: "board_content",
		 sSkinURI: "${path}/resources/smarteditor/SmartEditor2Skin.html",
		 fCreator: "createSEditor2"
	});
</script>
</html>