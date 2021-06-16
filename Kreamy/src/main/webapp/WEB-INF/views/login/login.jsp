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
<link data-n-head="ssr" rel="icon" type="image/x-icon" href="https://kream.co.kr/favicon.ico">
<link rel="stylesheet" type="text/css" href="/kreamy/resources/css/login.css"/>

<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="<%=cp %>/resources/js/util.js"></script>
<script type="text/javascript">

$(function() {
	$('.e_input_box').on('input', checkEInput);
	$('.p_input_box').on('input', checkPInput);
	
	$('.p_input_box').on('input', function(){
		
		var email = $('input[name=email]').val();
		var pwd = $('input[name=pwd]').val();
		
		if(isValidEmail(email)==true && isValidPassword(pwd)==true){
			$(".btn_disabled").attr('class','btn');
		}else{
			$(".btn").attr('class','btn_disabled');
		}
	});
	
	$('input[name=email]').focus(function(){
		
		var email = $('input[name=email]').val();
		var pwd = $('input[name=pwd]').val();
		
		if(email.length == 0){
			$('.e_input_txt').attr('class','eunder_input_txt');
		}else if(isValidEmail(email)==true){
			$('.e_input_txt').attr('class','eunder_input_txt');
		}else{
			$('.eunder_input_txt').attr('class','e_input_txt_has_error');
		}
		
	});

	$('input[name=email]').blur(function(){

		var email = $('input[name=email]').val();
		var pwd = $('input[name=pwd]').val();
		
		if(isValidEmail(email)==true){
			$('.e_input_title_has_error').attr('class','eunder_input_txt');
		}else if(email.length != 0){
			$('.eunder_input_txt').attr('class','e_input_title_has_error');
		}else{
			$('.eunder_input_txt').attr('class','e_input_txt');
		}
		
	});
	
	$('input[name=pwd]').focus(function(){
		
		var email = $('input[name=email]').val();
		var pwd = $('input[name=pwd]').val();
		
		if(pwd.length == 0){
			$('.p_input_txt').attr('class','punder_input_txt');
		}else if(isValidPassword(pwd)==true){
			$('.p_input_txt').attr('class','punder_input_txt');
		}else{
			$('.punder_input_txt').attr('class','p_input_txt_has_error');
		}
		
	});

	$('input[name=pwd]').blur(function(){
		
		var email = $('input[name=email]').val();
		var pwd = $('input[name=pwd]').val();
		
		if(isValidPassword(pwd)==true){
			$('.p_input_title_has_error').attr('class','punder_input_txt');
		}else if(pwd.length != 0){
			$('.punder_input_txt').attr('class','p_input_title_has_error');
		}else{
			$('.punder_input_txt').attr('class','p_input_txt');
		}
		
	});
	
});

function checkEInput() {
	
	var email = $('input[name=email]').val();
	var pwd = $('input[name=pwd]').val();

	if(!isValidEmail(email)) {
		jQuery('.e_input_error').show();
		$(".e_input_title").attr('class','e_input_title_has_error');
		$(".eunder_input_txt").attr('class','e_input_txt_has_error');
		$(".e_input_error").attr('class','e_input_error_has_error');
	} else{
		$(".e_input_title_has_error").attr('class','e_input_title');
		$(".e_input_txt_has_error").attr('class','eunder_input_txt');
		$(".e_input_error_has_error").attr('class','e_input_error');
		jQuery('.e_input_error').hide();
	}
}

function checkPInput() {
	
	var email = $('input[name=email]').val();
	var pwd = $('input[name=pwd]').val();
	
	if(!isValidPassword(pwd)) {
		jQuery('.p_input_error').show();
		$(".p_input_title").attr('class','p_input_title_has_error');
		$(".punder_input_txt").attr('class','p_input_txt_has_error');
		$(".p_input_error").attr('class','p_input_error_has_error');
	} else{
		$(".p_input_title_has_error").attr('class','p_input_title');
		$(".p_input_txt_has_error").attr('class','punder_input_txt');
		$(".p_input_error_has_error").attr('class','p_input_error');
		jQuery('.p_input_error').hide();
	}
	
}

function init(){
	jQuery('.e_input_error').hide();
	jQuery('.p_input_error').hide();
}

</script>


</head>
<body onload="init();">

<form id="login_form" method="post" action="<%=cp %>/login_ok">

<div class="login_area">

	<h2 class="login_title">
	</h2>
	
	<div class="e_input_box">
		<h3 class="e_input_title">이메일 주소</h3>
		<div class="input_item">
			<input type="text" name="email" value="" placeholder="예) kream@kream.co.kr" autocomplete="off" class="e_input_txt"/>
		</div>
		<p class="e_input_error">이메일 주소를 정확히 입력해주세요.</p>
	</div>
	
	<div class="p_input_box">
		<h3 class="p_input_title">비밀번호</h3>
		<div class="input_item">
			<input type="password" name="pwd" value="" placeholder autocomplete="off" class="p_input_txt"/>
		</div>
		<p class="p_input_error">영문,숫자,특수문자를 조합해서 입력해주세요. (8~16자)</p>
	</div>
	
	<div class="login_btn_box">
		<a href="#" type="button" onclick="document.getElementById('login_form').submit();" class="btn_disabled">로그인</a>
		<div id="naver_id_login" style="text-align:center">
			<a href="${url}" class="btn_naver">
				<img src="/kreamy/resources/image/etc/naver_logo.png" width="50px" height="48px" style="float: left; margin-right: -50px; padding-left: 2px; padding-top: 4px;">
				네이버 로그인
			</a>
		</div>
	</div>
	
	<ul class="look_box">
		<li class="look_list">
			<a href="<%=cp %>/join" class="look_link">이메일 가입</a>
		</li>
		<li class="look_list">
			<a href="<%=cp %>/find_email" class="look_link">이메일 찾기</a>
		</li>
		<li class="look_list">
			<a href="<%=cp %>/find_password" class="look_link">비밀번호 찾기</a>
		</li>
	</ul>
	
</div>

</form>


</body>
</html>