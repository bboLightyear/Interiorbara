<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script defer src="${path}/resources/js/my/my_script_pwd.js"></script>
</head>
<body>
<h3>passwordReset.jsp</h3>

	<form action="passReset" method="post">
		<input type="email" id="email" name="email" required />	
		<input type="submit" value="이메일인증하기" />
	</form>
	<c:out value="${msg }" default=""/>	

	<c:if test="${nickname !=null }">
	<h3>${nickname }님 변경하실 비밀번호를 입력해주세요</h3>
	<form action="passeditMC" id="passeditMC" method="post">
		<input type="hidden" name="nickname" id="nickname" value="${nickname}" />	
		<div class="myPage-row">
	        <label for="pw1">새 비밀번호<br /></label>
	        <p><input type="password" name="pw1" id="pw1" required />
	        <span id="togglePwd1"><i class="fa-solid fa-eye"></i></span> <br />
	        <span id="pw1Result"></p>
	    </div>
	    <div class="myPage-row">
	        <label for="pw2">새 비밀번호 확인<br /></label>
	        <p><input type="password" name="pw2" id="pw2" required />
	        <span id="togglePwd2"><i class="fa-solid fa-eye"></i></span> <br />
	        <span id="pw2Result"></p>
	    </div>
   	    <div>
	    	<input type="submit" value="확인" />
	    </div>
    </form>	    
    
    </c:if>

</body>
</html>