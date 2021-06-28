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


$(function() {
	
	$('.e_input_box').on('input', checkEInput);
	$('.p_input_box').on('input', checkPInput);
	
	$('.e_input_box').on('input', function(){
		
		var phone = $('input[name=phone]').val();
		var email = $('input[name=email]').val();
		
		if(isValidPhone(phone)==true && isValidEmail(email)==true){
			$("#find_pwd").attr('class','btn full solid');
		}else{
			$("#find_pwd").attr('class','btn full solid disabled');
		}
	});
	
	$('.p_input_box').on('input', function(){
		
		var phone = $('input[name=phone]').val();
		var email = $('input[name=email]').val();
		
		if(isValidPhone(phone)==true && isValidEmail(email)==true){
			$("#find_pwd").attr('class','btn full solid');
		}else{
			$("#find_pwd").attr('class','btn full solid disabled');
		}
	});
	
	

	$('input[name=email]').focus(function(){
		
		var email = $('input[name=email]').val();
		var phone = $('input[name=phone]').val();
		
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
		var phone = $('input[name=phone]').val();
		
		if(isValidEmail(email)==true){
			$('.e_input_title_has_error').attr('class','eunder_input_txt');
		}else if(email.length != 0){
			$('.eunder_input_txt').attr('class','e_input_title_has_error');
		}else{
			$('.eunder_input_txt').attr('class','e_input_txt');
		}
		
	});
	
	$('input[name=phone]').focus(function(){
		
		var email = $('input[name=email]').val();
		var phone = $('input[name=phone]').val();
		
		if(phone.length == 0){
			$('.p_input_txt').attr('class','punder_input_txt');
		}else if(isValidPhone(phone)==true){
			$('.p_input_txt').attr('class','punder_input_txt');
		}else{
			$('.punder_input_txt').attr('class','p_input_txt_has_error');
		}
		
	});

	$('input[name=phone]').blur(function(){
		
		var email = $('input[name=email]').val();
		var phone = $('input[name=phone]').val();
		
		if(isValidPhone(phone)==true){
			$('.p_input_title_has_error').attr('class','punder_input_txt');
		}else if(phone.length != 0){
			$('.punder_input_txt').attr('class','p_input_title_has_error');
		}else{
			$('.punder_input_txt').attr('class','p_input_txt');
		}
		
	});

});

function checkEInput() {
	
	var email = $('input[name=email]').val();
	var phone = $('input[name=phone]').val();

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
	var phone = $('input[name=phone]').val();
	
	if(!isValidPhone(phone)) {
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

function phoneCheck(){
	
	var phone = $('input[name=phone]').val();
	
	var data = {phone : phone}
	
	$.ajax({
		type : "post",
		url : "<%=cp%>/phoneChk",
		data : data,
		success : function(result){
			if(result=="success"){
				alert("일치하는 사용자 정보를 찾을 수 없습니다.");
				document.getElementById('find_password_form').phone.value='';
				document.getElementById('find_password_form').email.value='';
				$('.eunder_input_txt').attr('class','e_input_txt');
				document.getElementById('find_password_form').phone.focus();
				return;
			}else{
				emailCheck();
			}
		}
	});
}

function emailCheck(){
	
	var email = $('input[name=email]').val();
	
	var data = {email : email}
	
	$.ajax({
		type : "post",
		url : "<%=cp%>/emailChk",
		data : data,
		success : function(result){
			if(result=="success"){
				alert("일치하는 사용자 정보를 찾을 수 없습니다.");
				document.getElementById('find_password_form').phone.value='';
				document.getElementById('find_password_form').email.value='';
				$('.eunder_input_txt').attr('class','e_input_txt');
				document.getElementById('find_password_form').phone.focus();
				return;
			}else{
				document.getElementById('find_password_form').submit();
			}
		}
	});
}

function init(){
	jQuery('.e_input_error').hide();
	jQuery('.p_input_error').hide();
}

</script>

</head>
<body onload="init();">

<form id="find_password_form" method="post" action="<%=cp %>/find_password_ok">

<div class="content md">
	<div class="help_area">
		<div>
			<h2 class="help_title">비밀번호 찾기</h2>
			
			<div class="help_notice">
				<p class="notice_txt"> 가입 시 등록하신 휴대폰 번호와 이메일을 입력하시면,<br>휴대폰으로 임시 비밀번호를 전송해 드립니다. </p>
			</div>
			
			<div class="p_input_box">
				<h3 class="p_input_title">휴대폰 번호</h3>
				<div class="p_input_item">
					<input type="text" name="phone" placeholder="가입하신 휴대폰 번호" autocomplete="off" value="" class="p_input_txt" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
				</div>
				<p class="p_input_error">휴대폰 번호를 정확히 입력해주세요.</p>
			</div>
			
			<div class="e_input_box">
				<h3 class="e_input_title">이메일 주소</h3>
				<div class="e_input_item">
					<input type="text" name="email" placeholder="예) kream@kream.co.kr" autocomplete="off" value="" class="e_input_txt">
				</div>
				<p class="e_input_error">이메일 주소를 정확히 입력해주세요.</p>
			</div>
			
			
			<div class="help_btn_box">
				<a id="find_pwd" onclick="phoneCheck();" href="#" type="button" class="btn full solid disabled"> 문자 발송하기 </a>
			</div>
		</div>
	</div>
</div>

</form>


</body>
</html>