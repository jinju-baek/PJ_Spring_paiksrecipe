<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>PAIKSRECIPE : 글작성</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.min.js"></script>
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

.board_div {
	border: 2px dashed #ebebeb;
	text-align: center;
	color: #c5c5c5;
	margin-bottom: 10px;
}

.board_div>p {
	padding: 38px;
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

.uploadedList > li {
    border-radius: 2px;
    margin-right: 5px;
    box-shadow: 0 2px 2px 0 rgba(0,0,0,.14), 0 3px 1px -2px rgba(0,0,0,.2), 0 1px 5px 0 rgba(0,0,0,.12);
}

.mailbox-attachments {
	display: flex;
}

.mailbox-attachment-icon {
    padding: 5px 5px 0px;
}

.mailbox-attachment-info {
    padding: 5px 10px;
    background: #303740;
    color: white;
}

.s_img {
	width: 50px;
    height: 50px;
    margin: 10px;
}

.delBtn > .fa-times{
	cursor: pointer;
}

</style>
</head>
<body>
	<div class="boardregister_wrap">
		<div class="board_title_wrap">
			<c:choose>
				<c:when test="${empty one}">
					<h2 class="board_title">게시글 등록</h2>
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
						<textarea class="register_content_textarea" id="board_content" name="view_content" style="min-width: 766px">${one.view_content}</textarea>
					</td>
				</tr>				
			</table>
			<div class="input_wrap form-group">
				<div class="board_div fileDrop">
					<p><i class="fas fa-paperclip"></i> 첨부파일을 드래그 해주세요</p>
				</div>
				<ul class="mailbox-attachments clearfix uploadedList"></ul>
			</div>
			
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
<script id="fileTemplate" type="text/x-handlebars-template">
	<li>
		<div class="mailbox-attachment-icon has-img">
			<center><img src="{{imgSrc}}" alt="Attachment" class="s_img"></center>
		</div>
		<div class="mailbox-attachment-info">
			<a href="{{originalFileUrl}}" class="mailbox-attachment-name">
				<i class="fa fa-paperclip"></i> {{originalFileName}}
			</a>
			<span class="btn btn-default btn-xs pull-right delBtn" data-src="{{basicFileName}}">
				<i class="fas fa-times"></i>
			</span>
		</div>
	</li>
</script>
<script src="${path}/resources/js/fileAttach.js"></script>
<script type="text/javascript">
	
	// Handlebars 파일템플릿 컴파일
	var fileTemplate = Handlebars.compile($("#fileTemplate").html());
	
	// 수정시 로컬에서 삭제할 기존 첨부파일 목록
	var deleteFileList = new Array();
	
	$(function(){
		// register -> 게시글 등록과 게시글 수정
		// ${one}에 값이 있으면 수정페이지 로딩
		if('${one}' != ''){
			// 수정페이지로 디자인 변경
			
			// SelectBox 값으로 Selected
			$('.board_type').val('${one.type}').attr('selected', 'selected');
			
			listAttach('${path}', '${one.bno}');
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
		
		if(title == '' || title.length == 0){
			// 에러메세지 '제목을 입력해주세요'
			alert('제목을 입력해주세요');
			$('.register_title_input').focus();
			return false;
		} else {
			// 스마터에디터 값을 board_content에 입력
			oEditors.getById["board_content"].exec("UPDATE_CONTENTS_FIELD", []);
	
			var view_content = $('#board_content').val();
			
			// 정규식을 통해 HTML태그를 제거 후 순수 Text만 추출
			var search_content = view_content.replace(/(<([^>]+)>)/ig, "").replace("&nbsp;","");
			
			// append : form태그의 맨 마지막에 추가
			$('#frm_board').append('<textarea id="search_content" name="search_content"></textarea>');
			$('#search_content').val(search_content);			
			
			// 첨부파일 목록[배열]도 추가
			var str = '';
			// uploadedList 내부의 .file 태그 각각 반복
			// each : 선택자수만큼 반복 (foreach랑 같은 기능)
			$('.uploadedList .file').each(function(i){
				console.log(i);
				// hidden 태그 구성
				str += "<input type='hidden' name='files[" + i + "]' value='" + $(this).val()+"'>";
			});
			
			// 삭제 첨부파일 목록에 있는 첨부파일들 Local에서 삭제
			if(deleteFileList.length > 0) {
				$.post('${path}/upload/deleteAllFile', {files:deleteFileList}, function(){});
			}
			
			// 폼에 hidden 태그들을 붙임
			$('#frm_board').append(str);
			
			// 서버로 전송
			$('#frm_board').submit();
			
			// 서버로 전송
			$('#frm_board').submit();
		}
	});
	
	// 1. 웹브라우저에 drag&drop시 파일이 열리는 문제(기본 효과)
	// -> 기본 효과 막음
	$('.fileDrop').on('dragenter dragover', function(e){
		e.preventDefault();
	});
	
	// 2. 사용자가 파일을 drop했을 때
	$('.fileDrop').on('drop', function(e){
		e.preventDefault();
		
		var files = e.originalEvent.dataTransfer.files; // 드래그에 전달된 파일
		var file = files[0]; // 그 중 하나만 꺼내옴
		
		var formData = new FormData(); // 폼 객체 생성
		formData.append('file', file); // 폼에 파일 1개 추가
		
		// 서버에 파일 업로드
		$.ajax({
			// 멀티파트(확장팩 개념) : 타입의 한 종류로 원래는 텍스트만 보낼 수 있지만 
			// 멀티파트로하면 이미지 등을 포함한 파일을 전송 가능
			// <form action="${path}/board/insert" method="POST" enctype="multipart-form">
			// 		<input type="file">
			// </form>
			url: '${path}/upload/uploadAjax',
			data: formData,
			datatype: "text", // 서버에서 받을 때 데이터 타입
			// 에이젝스는 쿼리스트링으로 만들어서 보내는데(default) 
			// 데이터의 길이가 길 경우 url에 다 담지 못함
			// ->false할 경우 쿼리스트링 방식 사용x 
			processData: false, 
			contentType: false, // 보낼 때 데이터 타입 false할 경우 멀티파트로 보낼 수 있음
			type: 'POST', // 첨부파일은 GET으로 전송 불가
			success: function(data){
				console.log(data);
				// data : 업로드한 파일 정보와 http 상태 코드
				printFiles(data, '${path}') // 첨부파일 출력 메서드 호출
			}
		});
	});
	
	$('.uploadedList').on('click', '.delBtn', function(event){
		var bno = '${one.bno}';
		var that = $(this);
		
		if(bno == '') { // 게시글 등록
			$.ajax({
				url: '${path}/upload/deleteFile',
				type: 'POST',
				data: {fileName: $(this).attr('data-src')},
				success: function(data) {
					if(data == 'deleted') {
						// parents 부모들 중에서 찾음
						that.parents('li').remove();
					}
				}, error: function(){
					alert('System Error');
				}	
			});
		} else { // 게시글 수정
			var arr_size = deleteFileList.length;
			deleteFileList[arr_size] = $(this).attr('data-src');
			$(this).parents('li').next('input').remove();
			$(this).parents('li').remove();
			
			for(var i = 0; i < deleteFileList.length; i++)
				console.log(deleteFileList[i]);
		
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