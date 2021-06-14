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
<title>로그인</title>

<link rel="stylesheet" type="text/css" href="/kreamy/resources/css/login.css"/>

<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="<%=cp %>/resources/js/util.js"></script>
<script type="text/javascript">

$(function() {
	$('.input_box').on('input', checkInput);
});

function checkInput() {
	
	var email = $('input[name=email]').val();
	var pwd = $('input[name=pwd]').val();
	
	var e_title = $('.e_input_title');
	var e_txt = $('.e_input_txt');
	var e_error = $('.e_input_error');
	
	var p_title = $('.input_title');
	var p_txt = $('.input_txt');
	var p_error = $('.input_error');
	
	if(!isValidEmail(email)) {
		e_title.addClass('has_error');
		e_txt.addClass('has_error');
		e_error.addClass('has_error');
	} else{
		e_title.removeClass('has_error');
		e_txt.removeClass('has_error');
		e_error.removeClass('has_error');
	}

	if(!isValidPassword(pwd)) {
		alert(pwd);
		p_title.addClass('has_error');
		p_txt.addClass('has_error');
		p_error.addClass('has_error');
	} else{
		alert(pwd);
		p_title.removeClass('has_error');
		p_txt.removeClass('has_error');
		p_error.removeClass('has_error');
	}
	
}

</script>


</head>
<body>

<form id="login_form" method="post" action="<%=cp %>/login_ok">

<div class="login_area">

	<h2 class="login_title">
		::before
	</h2>
	
	<div class="input_box">
		<h3 class="e_input_title">이메일 주소</h3>
		<div class="input_item">
			<input type="text" name="email" value="" placeholder="예) kream@kream.co.kr" autocomplete="off" class="e_input_txt"/>
		</div>
		<p class="e_input_error">이메일 주소를 정확히 입력해주세요.</p>
	</div>
	
	<div class="input_box">
		<h3 class="p_input_title">비밀번호</h3>
		<div class="input_item">
			<input type="password" name="pwd" value="" placeholder autocomplete="off" class="p_input_txt"/>
		</div>
		<p class="p_input_error">영문,숫자,특수문자를 조합해서 입력해주세요. (8~16자)</p>
	</div>
	
	<div class="login_btn_box">
		<a href="#" type="button" onclick="document.getElementById('login_form').submit();" class="btn full solid">로그인</a>
		<!-- <a disabled="disabled" href="" type="button" class="btn full solid disabled">로그인</a> -->
		<div id="naver_id_login" style="text-align:center">
			<a href="${url}">
				<img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/>
			</a>
		</div>
	</div>
	
	<ul class="look_box">
		<li class="look_list">
			<a href="" class="look_link">이메일 가입</a>
		</li>
		<li class="look_list">
			<a href="" class="look_link">이메일 찾기</a>
		</li>
		<li class="look_list">
			<a href="" class="look_link">비밀번호 찾기</a>
		</li>
	</ul>
	
</div>

</form>


</body>
</html>