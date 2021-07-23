<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>KREAMY | 한정판 거래의 FLEX</title>
<link data-n-head="ssr" rel="icon" type="image/x-icon" href="https://kream.co.kr/favicon.ico">
<link rel="stylesheet" type="text/css" href="/kreamy/resources/css/find_password.css"/>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="<%=cp %>/resources/js/util.js"></script>


</head>
<body>

<div class="content md">
	<div class="help_area">
		<div>
			<h2 class="blind">임시 비밀번호 전송</h2>
			
			<div class="temporary_notice">
				<p class="notice_txt"> 임시 비밀번호를 전송하였습니다.<br>전송 받은 임시 비밀번호로 로그인해주세요. </p>
			</div>
			
			<div class="temporary_btn_box">
				<a href="<%=cp %>/login" class="btn nuxt-link-active solid large" type="button"> 로그인 </a>
			</div>
		</div>
	</div>
</div>

















</body>
</html>