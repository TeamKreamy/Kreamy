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
<script type="text/javascript">





</script>

</head>
<body>

<form id="find_password_form" method="post" action="<%=cp %>/find_password_ok">

<div class="content md">
	<div class="help_area">
		<div>
			<h2 class="help_title">비밀번호 찾기</h2>
			
			<div class="help_notice">
				<p class="notice_txt"> 가입 시 등록하신 휴대폰 번호와 이메일을 입력하시면,<br>휴대폰으로 임시 비밀번호를 전송해 드립니다. </p>
			</div>
			
			<div class="input_box">
				<h3 class="input_title">휴대폰 번호</h3>
				<div class="input_item">
					<input type="text" placeholder="가입하신 휴대폰 번호" autocomplete="off" value="" class="input_txt">
				</div>
				<p class="input_error">휴대폰 번호를 정확히 입력해주세요.</p>
			</div>
			
			<div class="input_box">
				<h3 class="input_title">이메일 주소</h3>
				<div class="input_item">
					<input type="text" placeholder="예) kream@kream.co.kr" autocomplete="off" value="" class="input_txt">
				</div>
				<p class="input_error">이메일 주소를 정확히 입력해주세요.</p>
			</div>
			
			<div class="help_btn_box">
				<a disabled="disabled" href="#" type="button" class="btn full solid disabled"> 문자 발송하기 </a>
			</div>
		</div>
	</div>
</div>


</form>


</body>
</html>