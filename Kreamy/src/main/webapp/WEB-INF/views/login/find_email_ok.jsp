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
<link rel="stylesheet" type="text/css" href="/kreamy/resources/css/find_email.css"/>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="<%=cp %>/resources/js/util.js"></script>

</head>
<body>


<div class="content md">
	<div class="help_area">
		<div>
			<h2 class="help_title success">
				<span>이메일 주소 찾기에</span> <span>성공하였습니다.</span>
			</h2>
			
			<div class="success_notice">
				<dl>
					<dt class="notice_title">이메일 주소</dt>
					<dd class="notice_txt"> ${email } </dd>
				</dl>
			</div>
			
			<div class="success_btn_box">
				<a href="<%=cp %>/find_password" class="btn outline large" type="button"> 비밀번호 찾기 </a>
				<a href="<%=cp %>/login" class="btn nuxt-link-active solid large" type="button"> 로그인 </a>
			</div>
		</div>
	</div>
</div>




</body>
</html>