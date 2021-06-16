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
<body class>

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
			<input type="text" placeholder="선택하세요" disabled="disabled" autocomplete="off" class="input_txt hover text_fill"/>
			<button type="button" class="btn btn_size_select">
				<img src="/kreamy/resources/image/etc/lnr-chevron-right.svg" width="15px" height="15px" style="float: right; padding-right: 2px;">
			</button>
		</div>
	</div>
	
	<div class="join_terms">
		<div class="terms_box">
			<div class="check_main">
				<div class="checkbox_item">
					<input id="group_check_1" type="checkbox" name class="blind">
					<label for="group_check_1" class="check_label">
						<img src="/kreamy/resources/image/etc/checkmark.svg" width="30px" height="30px">
						<span class="label_txt">[필수] 만 14세 이상이며 모두 동의합니다.</span>
					</label>
				</div>
				<button type="button" class="btn">
					<img src="/kreamy/resources/image/etc/plus.svg" width="28px" height="28px">
				
				</button>
			</div>
			
			<div class="check_sub">
				<div class="checkbox_item">
					<input id="agreement" type="checkbox" name class="blind">
					<label for="agreement" class="checkbox" name class="blind">
						<img src="/kreamy/resources/image/etc/checkmark.svg" width="30px" height="30px">
						<span class="label_txt">이용약관</span>
					</label>
					<a href="#" class="btn_view"> 내용보기 </a>	
				</div>
				
				<div class="checkbox_item">
					<input id="privacy" type="checkbox" name class="blind">
					<label for="privacy" class="check_label">
						<img src="/kreamy/resources/image/etc/checkmark.svg" width="30px" height="30px">
						<span class="label_txt">개인정보처리방침</span>
					</label>
					<a href="#" class="btn_view"> 내용 보기 </a>
				</div>
			</div>
		</div>
		
		<div class="terms_box">
			<div class="check_main">
				<div class="checkbox_item">
					<input id="group_check_2" type="checkbox" name="" class="blind">
					<label for="group_check_2" class="check_label">
						<img src="/kreamy/resources/image/etc/checkmark.svg" width="30px" height="30px">
						<span class="label_txt">[선택] 광고성 정보 수신에 모두 동의합니다.</span>
					</label>
				</div>
				<button type="button" class="btn">
					<img src="/kreamy/resources/image/etc/plus.svg" width="28px" height="28px">
				
				</button>
			</div>
			<div class="check_sub">
				<div class="checkbox_item">
					<input id="allow_marketing" type="checkbox" name="" class="blind">
					<label for="allow_marketing" class="check_label">
						<img src="/kreamy/resources/image/etc/checkmark.svg" width="30px" height="30px">
						<span class="label_txt">앱 푸시</span>
					</label>
				</div>
				<div class="checkbox_item">
					<input id="allow_marketing_sms" type="checkbox" name="" class="blind">
					<label for="allow_marketing_sms" class="check_label">
						<img src="/kreamy/resources/image/etc/checkmark.svg" width="30px" height="30px">
						<span class="label_txt">문자 메시지</span>
					</label>
				</div>
				<div class="checkbox_item">
					<input id="allow_marketing_email" type="checkbox" name="" class="blind">
					<label for="allow_marketing_email" class="check_label">
						<img src="/kreamy/resources/image/etc/checkmark.svg" width="30px" height="30px">
						<span class="label_txt">이메일</span>
					</label>
				</div>
			</div>
		</div>
		
	</div>

	<a href="#" type="button" class="btn btn_join full solid"> 가입하기 </a>
	
	<!-- <a href="#" type="button" class="btn btn_join full solid disabled"> 가입하기 </a> -->
		
</div>

<div class="layer md" style="display: none;">
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
			<a href="#" type="button" class="btn solid medium"> 확인 </a>
			<!-- <a href="#" type="button" class="btn solid disabled medium"> 확인 </a> -->
		</div>
		
		<a class="btn_layer_close">
		
		</a>
	</div>
</div>

</form>


</body>
</html>