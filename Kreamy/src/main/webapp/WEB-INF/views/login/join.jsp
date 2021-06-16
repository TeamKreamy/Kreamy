<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<link data-n-head="ssr" rel="icon" type="image/x-icon" href="https://kream.co.kr/favicon.ico">
<link rel="stylesheet" type="text/css" href="/kreamy/resources/css/join.css"/>

<script src="https://cdn.linearicons.com/free/1.0.0/svgembedder.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="<%=cp %>/resources/js/util.js"></script>


</head>
<body>

회원가입창~

<form id="join_form" method="post" action="<%=cp %>/login_ok">

<div class="join_area">
	<h2 class="join_title">회원가입</h2>
	
	<div class="input_box">
		<h3 class="input_title_ess">
			"이메일 주소"
			::after
		</h3>
		<div class="input_item">
			<input type="text" placeholder="예) kream@kream.co.kr" autocomplete="off" class="input_txt">
		</div>
		<p class="input_error"> </p>
	</div>
	
	<div class="input_box has button">
		<h3 class="input_title ess">
			"비밀번호"
			::after
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
				<svg class="lnr lnr-chevron-right"><use xlink:href="#lnr-chevron-right"></use></svg>
			</button>
		</div>
	</div>
	
	
	
</div>

dddd

<svg xmlns="http://www.w3.org/2000/svg" class="ico-arr-right icon sprite-icons"><use href="/_nuxt/91e1223d82ae15dcdada670ee3ffdaf6.svg#i-ico-arr-right" xlink:href="/_nuxt/91e1223d82ae15dcdada670ee3ffdaf6.svg#i-ico-arr-right"></use></svg>







</form>


</body>
</html>