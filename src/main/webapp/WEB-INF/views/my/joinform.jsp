<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" href="${path}/resources/css/my/my_style.css" />
    <script src="${path}/resources/js/my/my_script.js"></script>
</head>
<body>
    <h3>회원가입</h3>

	<form id="myjoin" action="join" method="post">
	    <table align="center">
        <tr>
            <th id="line1"><label for="user_email">이메일</label></th>
        </tr>
        <tr>
            <td>
                <input type="text" id="user_email" name="user_email" required><span id="middle">@</span>
                <input type="text" id="email_address" name="email_address" list="user_email_address">
                    <datalist id="user_email_address">
                        <option value="naver.com"></option>
                        <option value="gmail.com"></option>
                        <option value="직접입력"></option>
                    </datalist>
            </td>
        </tr>
        <tr>
            <th><label for="pw1">비밀번호</label></th>
        </tr>
        <tr>
            <td>
                <input type="text" id="pw1" name="pw1" placeholder="영문숫자특수문자를 포함한 8자리 이상" required>
            </td>
        </tr>
        <tr>
            <th><label for="pw2">비밀번호확인</label></th>
        </tr>
        <tr>
            <td>
            	<input type="text" id="pw2" name="pw2" required><br />
            	<span id="pwResult"></span>
            </td>
        </tr>
        <tr>
            <th><label for="nickname">닉네임</label></th>
        </tr>
        <tr>
            <td>
            	<input type="text" id="nickname" name="nickname" placeholder="2~15자 사이의 한글영문숫자" required>
            	<span id="nicknameResult"></span>
            </td>
        </tr>
        <tr>
            <td>
            	<input type="submit" id="btnstyle" value="회원가입">
            </td>
        </tr>

    </table>
	</form>
	<c:out value="${joinmsg }" default=""/> <br />

	<span id="fs10px">이미 아이디가 있으신가요?&nbsp;&nbsp;&nbsp;&nbsp;<a href="loginform">로그인</a></span>
</body>
</html>
