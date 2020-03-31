<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>PAIKSRECIPE : 글작성</title>
<link rel="stylesheet" type="text/css" href="../../css/common.css">
<style type="text/css">
.boardregister_wrap {
	width: 770px;
	margin: 130px auto;
}

table {
	border-collapse: separate;
	border-spacing: 0 10px;
}

.register_table_title {
	padding: 10px;
	text-align: right;
}

.register_table_content {
	padding: 10px;
	border: 1px solid #ebebeb;
	width: 675px;
}

.register_table_content>select {
	width: 653px;
	height: 21px;
	border: none;
}

.content_type, .content_title {
	padding: 5px 10px;
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
		<table>
			<tr>
				<td class="register_table_title">작성자:</td>
				<td class="register_table_content"><strong>${name}</strong>(${userid})</td>
			</tr>
			<tr>
				<td class="register_table_title">종류:</td>
				<td class="register_table_content content_type"><select>
						<option value="free">자유게시판</option>
						<option value="cook">요리게시판</option>
						<option value="cook">Q&A게시판</option>
						<option value="cook">후기게시판</option>
				</select></td>
			</tr>
			<tr>
				<td class="register_table_title">제목:</td>
				<td class="register_table_content content_title">
					<input class="register_title_input" type="text" name="" placeholder="제목을 입력하세요.">
				</td>
			</tr>
			<tr>
				<td class="register_table_title">내용:</td>
				<td class="register_table_content">
					<textarea class="register_content_textarea"></textarea>
				</td>
			</tr>
			<tr>
				<td class="register_table_title">첨부파일:</td>
				<td class="register_table_content content_file"><i class="fas fa-paperclip"></i> 첨부파일을 드래그 해주세요</td>
			</tr>
		</table>
		<div class="boardregister_btn_wrap">
			<button type="button" class="cancel_btn">취소</button>
			<button type="button" class="submit_btn">확인</button>
		</div>
	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
<script type="text/javascript">


</script>
</html>