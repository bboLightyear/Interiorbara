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
    <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> -->
    <link rel="stylesheet" href="${path}/resources/css/my/my_style.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script defer src="${path}/resources/js/my/my_script_pwd.js"></script> 
    <script defer src="${path}/resources/js/my/my_script_nickname.js"></script>
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
                <input type="password" id="pw1" name="pw1" size="46" placeholder="영문숫자특수문자를 포함한 8자리 이상" required>
                <span id="togglePwd1"><i class="fa-solid fa-eye"></i></span> <br />
                <span id="pw1Result"></span>
            </td>
        </tr>
        <tr>
            <th><label for="pw2">비밀번호확인</label></th>
        </tr>
        <tr>
            <td>
            	<input type="password" id="pw2" name="pw2" size="46" required>
            	<span id="togglePwd2"><i class="fa-solid fa-eye"></i></span>
            	<br />            	
            	<span id="pw2Result"></span>
            </td>
        </tr>
        <tr>
            <th><label for="nickname">닉네임</label></th>
        </tr>
        <tr>
            <td>
            	<input type="text" id="nickname" name="nickname" height="2em" size="50" placeholder="2~15자 사이의 한글영문숫자" required> <br />
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
