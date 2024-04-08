<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script defer src="${path}/resources/js/my/my_loginform.js"></script>
    <style>
    body {
		text-align: center;
	}
	table {
		text-align: left;
	}	
	td{
		height: 70px;
	}
    #btn{
    	padding: 10px;
    	width: 405px;
    	background-color: #e2f0fe;
    }
    #btn:hover{
		background-color: #1e90ff;
		cursor: pointer;
	}    
    a {
		text-decoration: none;
		color: #1a1f27;
		font-weight: bold;
	}
	.fs12px {
		display:inline-block;
		font-size: 12px;
		margin: 10px;
	}
	.password{
		position: relative;
	}
	.password i{
		cursor: pointer;
		position: absolute;
		left: 90%;
		top: 17px;
	}
	.password i:hover{
		color: #b1b8c0;
	}
	
    </style>
</head>
<body>
    <form action="login" method="post">
    	<table align="center">
    		<tr>
    			<td>
    				<input type="text" name="email" style="padding:10px;" size="50" placeholder="이메일" required>
    			</td>
    		</tr>
    		<tr>
    			<td class="password">
    				<input type="password" name="pw" id="pw" style="padding:10px;" size="50" placeholder="비밀번호" required>
    				<span id="togglePwd"><i class="fa-solid fa-eye"></i></span>	<br />
    				<span id="pwResult"></span><br />
    			</td>
    		</tr>
    		<tr>
    			<td>
    				<input id="btn" type="submit" value="로그인">
    			</td>
    		</tr>
    	</table>
    </form>
    <c:out value="${msg }" default="" /> <br />
    <span class="fs12px"><a href="passwordReset">비밀번호재설정</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="joinform">회원가입</a></span><br />
    <span class="fs12px"><a href="nonmember">비회원 견적 및 주문 조회하기</a></span>

</body>
</html>

