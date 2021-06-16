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
<title>회원가입</title>
<link data-n-head="ssr" rel="icon" type="image/x-icon" href="https://kream.co.kr/favicon.ico">
<link rel="stylesheet" type="text/css" href="/kreamy/resources/css/join.css"/>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="<%=cp %>/resources/js/util.js"></script>


</head>
<body>

<form id="join_form" method="post" action="<%=cp %>/login_ok">

<div class="join_area">
	<h2 class="join_title">회원가입</h2>
	
	<div class="input_box">
		<h3 class="input_title ess">
			이메일 주소
		</h3>
		<div class="input_item">
			<input type="text" placeholder="예) kream@kream.co.kr" autocomplete="off" class="input_txt">
		</div>
		<p class="input_error"> </p>
	</div>
	
	<div class="input_box has button">
		<h3 class="input_title ess">
			비밀번호
		</h3>
		<div class="input_item">
			<input type="password" placeholder="영문, 숫자, 특수문자 조합 8-16자" autocomplete="off" class="input_txt"/>
		</div>
		<p class="input_error"> 영문, 숫자, 특수문자를 조합하여 입력해주세요.(8-16자)</p>
	</div>
	
	<div class="input_box">
		<h3 class="input_title">
			스니커즈 사이즈 (선택)
		</h3>
		<div class="input_item">
			<input type="text" placeholder="선택하세요" disabled="disabled" autocomplete="off" class="input_txt"/>
			<button type="button" class="btn btn_size_select">
				<img src="/kreamy/resources/image/etc/lnr-chevron-right.svg" width="15px" height="15px" style="float: right; padding-right: 2px;">
			</button>
		</div>
	</div>
	
	
	
</div>



</form>


</body>
</html>