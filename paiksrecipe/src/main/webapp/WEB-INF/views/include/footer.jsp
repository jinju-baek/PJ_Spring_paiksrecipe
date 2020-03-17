<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${path}/resources/css/common.css">
<title></title>
<style type="text/css">
.footer_wrap{
	bottom: 0;
	border-top: 1px solid #888;
	width: 100%;
	height: 200px;
	color: #888;
	background-color: white;
}
.footer_content_wrap{
	padding: 32px 20px;
	width: 1400px;
	margin: 0 auto;
}
.footer_logo{
	width: 150px; 
	height: 30px;
	background: url('${path}/resources/img/logo.png') no-repeat;
	background-size: contain;
}
.footer_terms{
	display: flex;
	margin-bottom: 8px;
}
.privacy, .terms_of_use{
	margin-top: 10px;
}
.footer_info{
	padding: 0 5px;
	font-size: 13px;
}
.footer_info>div{
	margin-bottom: 8px;

}
</style>
</head>
<body>
	<footer>	
		<div class="footer_wrap">
			<div class="footer_content_wrap">
				<div class="footer_terms">
					<a href="${path}/"><div class="footer_logo"></div></a>
					<a href="#" class="privacy"><strong> ㅣ</strong><strong style="color: #B22230;"> 개인정보취급방침</strong></a>
					<a href="#" class="terms_of_use"><strong> ㅣ 이용약관</strong></a>
				</div>
				<div class="footer_content">
					<div class="footer_info">
						<div class="footer_info_title">(주)PAIK'S RECIPE 사업자 정보</div>
						<div class="footer_info_content">
							<p>(주)PAIK'S RECIPE | 대표자 : 징구 | 사업자번호 : 499-81-12345 | 개인정보보호책임자 : 징구 | 통신판매업 : 2020-광주광산A-0028</p>
							<p>주소 : 제리시 족발동 417 926동 1004호 | 이메일 : whitepearl0926@naver.com</p>
						</div>
						<div>©PAIK'S RECIPE. ALL RIGHTS RESERVED</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
</body>
</html>