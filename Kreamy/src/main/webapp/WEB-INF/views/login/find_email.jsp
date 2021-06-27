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
<script type="text/javascript">

$(function() {
	
	$('.input_box').on('input', function(){
		
		var phone = $('input[name=phone]').val();
		
		if(isValidPhone(phone)==true){
			$("#find_email").attr('class','btn full solid');
		}else{
			$("#find_email").attr('class','btn full solid disabled');
		}
	});

});


function phoneCheck(){
	
	var phone = $('input[name=phone]').val();
	var flag='no';
	
	$('.phone_check .phone_check_list').each(function (index, item) {
		if(item.value==phone){
			flag='yes'
			document.getElementById('find_email_form').submit();
			
		}
		
	});	
	
	if(flag=='no'){
		alert("일치하는 사용자 정보를 찾을 수 없습니다.");
		document.getElementById('find_email_form').phone.value='';
		document.getElementById('find_email_form').phone.focus();
		return;
	}
	
}


</script>

</head>
<body>

<form id="find_email_form" method="post" action="<%=cp %>/find_email_ok">

<div class="content md">
	<div class="help_area">
		<div>
			<h2 class="help_title">이메일 아이디 찾기</h2>
			
			<div class="help_notice">
				<p class="notice_txt"> 가입 시 등록한 휴대폰 번호를 입력하면<br> 이메일 주소의 일부를 알려드립니다. </p>
			</div>
			
			<div class="input_box">
				<h3 class="input_title">휴대폰 번호</h3>
				<div class="input_item">
					<input type="text" name="phone" value placeholder="가입하신 휴대폰 번호" autocomplete="off" class="input_txt" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
				</div>
			</div>
			
			<div class="phone_check">
				<c:forEach var="phones" items="${plists}">
					<input type="hidden" class="phone_check_list" value="${phones }">
		
				</c:forEach>
			</div>
			
			<div class="help_btn_box">
				<a id="find_email" onclick="phoneCheck();" href="#" type="button" class="btn full solid disabled"> 이메일 아이디 찾기 </a>
			</div>
			
			
		</div>
	</div>
</div>








</form>



</body>
</html>