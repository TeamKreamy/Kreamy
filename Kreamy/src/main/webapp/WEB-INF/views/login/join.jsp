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
<link rel="stylesheet" type="text/css" href="/kreamy/resources/css/imagecheck.css"/>

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
			$(".btn_join_disabled").attr('class','btn_join');
		}else{
			$(".btn_join").attr('class','btn_join_disabled');
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

	// 스니커즈 사이즈 선택 클릭시
	$('.input_item').click(function() {
		
		$('body').attr('class','fixed');
		$('#size_container').attr('style','');
	});
	
	// 팝업창 내 사이즈 클릭
	$('.size_item').click(function() {		
		
		$('.size_item').attr('class','size_item');
		$(this).addClass('on');

		$('#layer_detail_size_select').attr('class','hide');
		
	});
	
	//선택버튼 클릭
	$('#size_select').click(function() {
		
		$('body').attr('class','');
		$('#size_container').attr('style','display: none;');
		$('input[name=select_size]').html($(this).find('.info_txt').text());
		
	});
	
	$('input[type=checkbox]').click(function() {
		
		if($('#agreement').prop('checked') && $('#privacy').prop('checked')){
			$("input:checkbox[id='group_check_1']").prop('checked', true)
		}
		
		if($('#allow_marketing').prop('checked') && $('#allow_marketing_sms').prop('checked') && $('#allow_marketing_email').prop('checked')){
			$("input:checkbox[id='group_check_2']").prop('checked', true)
		}
		
		
	 	if ($("input:checkbox[id='group_check_1']").is(':checked')) {

	    	$("input:checkbox[id='agreement']").prop('checked', false)
	    	$("input:checkbox[id='privacy']").prop('checked', false)
	    	
	    } else {
	    	
	    	$("input:checkbox[id='agreement']").prop('checked', true)
	    	$("input:checkbox[id='privacy']").prop('checked', true)
	    }
		
	 	if ($("input:checkbox[id='group_check_2']").is(':checked')) {

	    	$("input:checkbox[id='marketing']").prop('checked', false)
	    	$("input:checkbox[id='marketing_sms']").prop('checked', false)
	    	$("input:checkbox[id='marketing_email']").prop('checked', false)
	    	
	    } else {
	    	
	    	$("input:checkbox[id='marketing']").prop('checked', true)
	    	$("input:checkbox[id='marketing_sms']").prop('checked', true)
	    	$("input:checkbox[id='marketing_email']").prop('checked', true)
	    }
	 	

		if($("input:checkbox[id='agreement']").is(':checked')){
			$("input:checkbox[id='group_check_1']").prop('checked', false)
			
		}else if($("input:checkbox[id='privacy']").is(':checked')){
			$("input:checkbox[id='group_check_1']").prop('checked', false)
			
		}
		
		if($("input:checkbox[id='allow_marketing']").is(':checked')){
			$("input:checkbox[id='group_check_2']").prop('checked', false)
			
		}else if($("input:checkbox[id='allow_marketing_sms']").is(':checked')){
			$("input:checkbox[id='group_check_2']").prop('checked', false)
			
		}else if($("input:checkbox[id='allow_marketing_email']").is(':checked')){
			$("input:checkbox[id='group_check_2']").prop('checked', false)
			
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

function clickBtn1(){
	
	if($('#terms_box1').hasClass('open')){
		$('#terms_box1').attr('class','terms_box');
		document.getElementById("click1").src = "/kreamy/resources/image/etc/plus.svg";
	}else{
		$('#terms_box1').attr('class','terms_box open');
		document.getElementById("click1").src = "/kreamy/resources/image/etc/minus.svg";
	}
}

function clickBtn2(){
	
	if($('#terms_box2').hasClass('open')){
		$('#terms_box2').attr('class','terms_box');
		document.getElementById("click2").src = "/kreamy/resources/image/etc/plus.svg";
	}else{
		$('#terms_box2').attr('class','terms_box open');
		document.getElementById("click2").src = "/kreamy/resources/image/etc/minus.svg";
	}
	
}

function init(){
	jQuery('.e_input_error').hide();
	jQuery('.p_input_error').hide();
}

</script>

</head>
<body onload="init();" class>


<form id="join_form" method="post" action="<%=cp %>/login_ok">

<div class="join_area">
	<h2 class="join_title">회원가입</h2>
	
	<div class="e_input_box">
		<h3 class="e_input_title ess">
			이메일 주소
		</h3>
		<div class="e_input_item">
			<input type="text" name="email" placeholder="예) kream@kream.co.kr" autocomplete="off" class="e_input_txt">
		</div>
		<p class="e_input_error"> 이메일 주소를 정확히 입력해주세요. </p>
	</div>
	
	<div class="p_input_box">
		<h3 class="p_input_title ess">
			비밀번호
		</h3>
		<div class="p_input_item">
			<input type="password" name="pwd" placeholder="영문, 숫자, 특수문자 조합 8-16자" autocomplete="off" class="p_input_txt"/>
		</div>
		<p class="p_input_error"> 영문, 숫자, 특수문자를 조합하여 입력해주세요.(8-16자) </p>
	</div>
	
	<div class="input_box">
		<h3 class="input_title">
			스니커즈 사이즈 (선택)
		</h3>
		<div class="input_item">
			<input type="text" name="select_size" placeholder="선택하세요" disabled="disabled" autocomplete="off" class="input_txt hover text_fill"/>
			<button type="button" class="btn btn_size_select">
				<img src="/kreamy/resources/image/etc/lnr-chevron-right.svg" width="15px" height="15px" style="float: right; padding-right: 2px;">
			</button>
		</div>
	</div>
	
	<div class="join_terms">
		<div class="terms_box" id="terms_box1">
			<div class="check_main">
				<div class="checkbox_item">
					<input id="group_check_1" type="checkbox" name="cbox1" class="blind">
					<label for="group_check_1" class="check_label">
						<span class="label_txt">[필수] 만 14세 이상이며 모두 동의합니다.</span>
					</label>
				</div>
				<button type="button" class="btn" onclick="clickBtn1();">
					<img id="click1" src="/kreamy/resources/image/etc/plus.svg" width="28px" height="28px">
				
				</button>
			</div>
			
			<div class="check_sub">
				<div class="checkbox_item">
					<input id="agreement" type="checkbox" name class="blind">
					<label for="agreement" class="check_label">
						<span class="label_txt">이용약관</span>
					</label>
					<a href="#" class="btn_view"> 내용보기 </a>	
				</div>
				
				<div class="checkbox_item">
					<input id="privacy" type="checkbox" name class="blind">
					<label for="privacy" class="check_label">
						<span class="label_txt">개인정보처리방침</span>
					</label>
					<a href="#" class="btn_view"> 내용 보기 </a>
				</div>
			</div>
		</div>
		
		<div class="terms_box" id="terms_box2">
			<div class="check_main">
				<div class="checkbox_item">
					<input id="group_check_2" type="checkbox" name="cbox2" class="blind">
					<label for="group_check_2" class="check_label">
						<span class="label_txt">[선택] 광고성 정보 수신에 모두 동의합니다.</span>
					</label>
				</div>
				<button type="button" class="btn" onclick="clickBtn2();">
					<img id="click2" src="/kreamy/resources/image/etc/plus.svg" width="28px" height="28px">
				
				</button>
			</div>
			<div class="check_sub">
				<div class="checkbox_item">
					<input id="allow_marketing" type="checkbox" class="blind">
					<label for="allow_marketing" class="check_label">
						<span class="label_txt">앱 푸시</span>
					</label>
				</div>
				<div class="checkbox_item">
					<input id="allow_marketing_sms" type="checkbox" class="blind">
					<label for="allow_marketing_sms" class="check_label">
						<span class="label_txt">문자 메시지</span>
					</label>
				</div>
				<div class="checkbox_item">
					<input id="allow_marketing_email" type="checkbox" class="blind">
					<label for="allow_marketing_email" class="check_label">
						<span class="label_txt">이메일</span>
					</label>
				</div>
			</div>
		</div>
		
	</div>

	<a href="#" type="button" class="btn_join_disabled"> 가입하기 </a>

		
</div>

<div class="layer md" id="size_container" style="display: none">
	<div class="layer_container">
		<div class="layer_header">
			<h2 class="title">사이즈 선택</h2>
		</div>
		
		<div class="layer_content">
		
			<div class="size_list_area">
				<div class="size_item">
					<a href="#" type="button" class="btn outlinegrey medium">
						<span class="info_txt">220</span>
					</a>
				</div>
				
				<div class="size_item">
					<a href="#" type="button" class="btn outlinegrey medium">
						<span class="info_txt">225</span>
					</a>
				</div>
				
				<div class="size_item">
					<a href="#" type="button" class="btn outlinegrey medium">
						<span class="info_txt">230</span>
					</a>
				</div>
				
				<div class="size_item">
					<a href="#" type="button" class="btn outlinegrey medium">
						<span class="info_txt">235</span>
					</a>
				</div>
				
				<div class="size_item">
					<a href="#" type="button" class="btn outlinegrey medium">
						<span class="info_txt">240</span>
					</a>
				</div>
				
				<div class="size_item">
					<a href="#" type="button" class="btn outlinegrey medium">
						<span class="info_txt">245</span>
					</a>
				</div>
				
				<div class="size_item">
					<a href="#" type="button" class="btn outlinegrey medium">
						<span class="info_txt">250</span>
					</a>
				</div>
				
				<div class="size_item">
					<a href="#" type="button" class="btn outlinegrey medium">
						<span class="info_txt">255</span>
					</a>
				</div>
				
				<div class="size_item">
					<a href="#" type="button" class="btn outlinegrey medium">
						<span class="info_txt">260</span>
					</a>
				</div>
				
				<div class="size_item">
					<a href="#" type="button" class="btn outlinegrey medium">
						<span class="info_txt">265</span>
					</a>
				</div>
				
				<div class="size_item">
					<a href="#" type="button" class="btn outlinegrey medium">
						<span class="info_txt">270</span>
					</a>
				</div>
				
				<div class="size_item">
					<a href="#" type="button" class="btn outlinegrey medium">
						<span class="info_txt">275</span>
					</a>
				</div>
				
				<div class="size_item">
					<a href="#" type="button" class="btn outlinegrey medium">
						<span class="info_txt">280</span>
					</a>
				</div>
				
				<div class="size_item">
					<a href="#" type="button" class="btn outlinegrey medium">
						<span class="info_txt">285</span>
					</a>
				</div>
				
				<div class="size_item">
					<a href="#" type="button" class="btn outlinegrey medium">
						<span class="info_txt">290</span>
					</a>
				</div>
				
				<div class="size_item">
					<a href="#" type="button" class="btn outlinegrey medium">
						<span class="info_txt">295</span>
					</a>
				</div>
				
				<div class="size_item">
					<a href="#" type="button" class="btn outlinegrey medium">
						<span class="info_txt">300</span>
					</a>
				</div>
			</div>
			
			
		</div>
		
		<div class="layer_btn">
			<a href="#" type="button" id="size_select" class="btn solid medium"> 확인 </a>
			<!-- <a href="#" type="button" class="btn solid disabled medium"> 확인 </a> -->
		</div>
		
		<a class="btn_layer_close">
		
		</a>
	</div>
</div>

<!-- 
<div class="layer md layer_agreement">
	<div class="layer_container">
		<div class="layer_header"></div>
		
		<div class="layer_content"></div>
		
		<a class="btn_layer_close">
		
		</a>
	</div>
</div>

 -->






</form>


</body>
</html>