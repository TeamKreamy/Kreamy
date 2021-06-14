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
<title>Insert title here</title>

<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

</head>
<body>

<c:choose>

	<c:when test="${sessionId != null}">
		<h2> 네이버 아이디 로그인 성공하셨습니다!! </h2>
		<h3>'${sessionId}' 님 환영합니다! </h3>
		<h3>
			<a href="logout">로그아웃</a>
		</h3>
	</c:when>
	
	<c:otherwise>
		네이버 로그인 말고 로그인 성공했을때 페이지
	</c:otherwise>
	
</c:choose>



</body>
</html>