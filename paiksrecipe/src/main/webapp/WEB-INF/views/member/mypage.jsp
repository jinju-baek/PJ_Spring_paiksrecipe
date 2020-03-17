<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/common.css">
<meta charset="UTF-8">
<title>PAIKSRECIPE : 마이페이지</title>
<style type="text/css">
.mypage_wrap {
	width: 500px;
	margin: 130px auto 0;
}

.wrap_info {
	padding: 5px;
	font-size: 25px;
}

.mypage_info {
	border: 1px solid #e1e1e1;
	padding: 25px 35px;
}

.mypage_info_wrap {
	display: flex;
}

.info_img > img{
	margin: 27px 20px;
}

th {
	text-align: left;
	width: 70px;
}

td {
	text-align: left;
	font-size: 14px;
}

.btn_wrap {
	display: flex;
	justify-content: center;
	margin-top: 20px;
}

.btn_wrap>a {
	margin: 0 10px;
	width: 110px;
	height: 46px;
	border-radius: 5px 5px;
	border: 1px solid #e1e1e1;
	text-decoration: none;
	text-align: center;
	line-height: 46px;
}

.btn_memUpdate {
	background-color: #B22230;
	color: white;
}

.btn_pwUpdate {
	background-color: #B22230;
	color: white;
}

.btn_drop {
	background-color: #B22230;
	color: white;
}
</style>
</head>
<body>
	<div class="mypage_wrap">
		<div class="wrap_info"><h3>내 정보</h3></div>
		<div class="mypage_info">
			<div class="mypage_info_wrap">
				<div class="info_img">
					<img src="${path}/resources/img/icons8-chef-hat-64.png">
				</div>
				<table class="info">
					<tr class="info_list">
						<th class="info_title">아이디:</th>
						<td class="info_content">${user.id}</td>
					</tr>
					<tr class="info_list">
						<th class="info_title">이름:</th>
						<td class="info_content">${user.name}</td>
					</tr>
					<tr class="info_list">
						<th class="info_title">전화번호:</th>
						<td class="info_content">${user.phone}</td>
					</tr>
					<tr class="info_list">
						<th class="info_title">이메일:</th>
						<td class="info_content">${user.email}</td>
					</tr>
					<tr class="info_list">
						<th class="info_title">주소: </th>
						<td class="info_content">${user.addr1} ${user.addr2}</td>
					</tr>
				</table>
			</div>
			<div class="btn_wrap">
				<a href="${path}/member/update" class="btn-primary btn_memUpdate">회원정보수정</a> 
				<a href="${path}/member/pwupdate" class="btn-primary btn_pwUpdate">비밀번호변경</a> 
				<a href="${path}/member/drop" class="btn-primary btn_drop">회원탈퇴</a>
			</div>

		</div>
	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>