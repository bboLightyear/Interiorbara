<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
</head>
<body>
    <form action="login" method="post">
        <input type="text" name="email" placeholder="이메일"> <br>
        <input type="text" name="pw" placeholder="비밀번호"> <br>
        <input type="submit" value="로그인">
    </form>
    <a href="#">비밀번호 재설정</a><a href="joinform">회원가입</a>
    <a href="nonmember">비회원 견적 및 주문 조회하기</a>
<hr />
<c:out value="${msg }" default="" />

</body>
</html>

