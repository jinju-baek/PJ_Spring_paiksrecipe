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
<script type="text/javascript">
	
	//Handlebars 파일템플릿 컴파일
	var fileTemplate = Handlebars.compile($("#fileTemplate").html());
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
			
			// 로컬 드라이브에 저장돼있는 해당게시글
			// 첨부파일 삭제
			/* if(deleteFileList.length > 0) {
				$.post('${path}/upload/deleteAllFile', {files:deleteFileList}, function(){});
			} */
			
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
				printFiles(data) // 첨부파일 출력 메서드 호출
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
			
		}
	});
	
	// 파일 정보 처리
	function getFileInfo(fullName) {
		var originalFileName; // 화면에 출력할 파일명
		var imgSrc; // 썸네일 or 파일아이콘 이미지 파일
		var originalFileUrl; // 원본파일 요청 URL
		var uuidFileName; // 날짜경로를 제외한 나머지 파일명(UUID)
		var basicFileName = fullName; // 삭제시 값을 전달하기 위한 파일
		
		// 이미지 파일이면
		if (checkImageType(fullName)) {
			imgSrc = "${path}/upload/displayFile?fileName=" + fullName; // 썸네일 이미지 링크
			uuidFileName = fullName.substr(14);
			var originalImg = fullName.substr(0, 12) + fullName.substr(14);
			// 원본 이미지 요청 링크
			originalFileUrl = "${path}/upload/displayFile?fileName=" + originalImg;
		} else {
			imgSrc = "${path}/resources/img/file-icon.png"; // 파일 아이콘 이미지 링크
			uuidFileName = fullName.substr(12);
			// 파일 다운로드 요청 링크
			originalFileUrl = "${path}/upload/displayFile?fileName=" + fullName;
		}
		originalFileName = uuidFileName.substr(uuidFileName.indexOf("_") + 1);
		// 전체 파일명의 크기가 14보다 작으면 그대로 이름 출력,
		// 14보다 크면 실행
		if(originalFileName.length > 14) {
			// 앞에서부터 11글자 자름
			var shortName = originalFileName.substr(0, 10);
			// .을 기준으로 배열 생성
			var formatVal = originalFileName.split(".");
			// formatVal = originalFileName.substr(originalFileName.length-3)
			// 파일명에 .이 여러개 들어가 있을수도 있음
			// 배열크기를 구해와서 무조건 맨 마지막 확장자부분 출력되게 함
			var arrNum = formatVal.length - 1;
			// 맨 처음 문자열 10글자 + ... + 확장자
			originalFileName = shortName + "..." + formatVal[arrNum];
		}
		return {originalFileName: originalFileName, imgSrc: imgSrc, originalFileUrl: originalFileUrl, fullName: fullName, basicFileName: basicFileName};
	}
	
	function printFiles(data) {
		// 파일 정보 처리
		var fileInfo = getFileInfo(data);
		// console.log(fileInfo);
		// Handlebars 파일 템플릿에 파일 정보들을 바인딩하고 HTML 생성
		var html = fileTemplate(fileInfo);
		html += "<input type='hidden' class='file' value='" + fileInfo.fullName + "'>";
		// Handlebars 파일 템플릿 컴파일을 통해 생성된 HTML을 DOM에 주입
		$(".uploadedList").append(html);
		// 이미지 파일인 경우 aaaaaaaaaa파일 템플릿에 lightbox 속성 추가
		if(fileInfo.fullName.substr(12,2) === "s_") {
			// 마지막에 추가된 첨부파일 템플릿 선택자
			var that = $(".uploadedList li").last();
			// lightbox 속성 추가
			that.find(".mailbox-attachment-name").attr("data-lightbox", "uploadImages");
			// 파일 아이콘에서 이미지 아이콘으로 변경
			that.find(".fa-paperclip").attr("class", "fa fa-camera");
		}
	} 
	
	function getOriginalName(fileName) {
		if(checkImageType(fileName)) { //이미지 파일이면 skip
			return;
		}
		var idx=fileName.indexOf("_") + 1; // uuid를 제외한 파일이름
		return fileName.substr(idx);
	}
	
	function getImageLink(fileName) {
		if(!checkImageType(fileName)) { // 이미지 파일이 아니면 skip
			return;
		}
		var front = fileName.substr(0,12); // 연월일 경로
		var end = fileName.substr(14); // s_ 제거
		return front + end;
	}
	
	function checkImageType(fileName) {
		var pattern = /jpg|gif|png|jpeg/i; // 정규표현식(대소문자 무시)
		return fileName.match(pattern); // 규칙에 맞으면 true
	}
	
	// 첨부파일 리스트를 출력하는 함수
	function listAttach(){
		var listCnt = 0;
		$.ajax({
			type: "post",
			url: "${path}/board/getAttach/${one.bno}",
			async: false,
			success: function(list){
				//list: json
				// console.log(list);
				listCnt = list.length;
				
					// console.log(list.length);
				/*
					jQuery each()는 반복문
					i와 e는 index와 element로
					json에서 {0: "apple.png"}일 때
					index는 0, element는 apple.png가 됨
				*/
				$(list).each(function(i, e){
					// console.log(list);
					printFiles(e); //첨부파일 출력 메서드 호출
				});
			}
		});
		return listCnt;
	}
	
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