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
<style>
table{
	text-align: left;
}
label{
	padding: 5px;
}
#resetForm{
	margin-top: 30px;
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
#smbtn{
	background-color: #e2f0fe;
	padding: 10px;
}
#smbtn:hover{
	background-color: #1e90ff;
	cursor: pointer;
}
.password{
	position: relative;
}
.password i{
	cursor: pointer;
	position: absolute;
	left: 90%;
	top: 20%;
}
.password i:hover{
	color: #b1b8c0;
}


</style>
</head>
<body>
<h3>passwordReset.jsp</h3>
	<form action="passReset" id="resetForm" method="post">
		<div align="center">
			<input type="email" id="email" name="email" style="padding:10px;" size="35" placeholder="email address" required />	
			<input id="smbtn" type="submit" value="이메일인증하기" style="padding:10px;" />
		</div>
	</form>
		

	<c:if test="${nickname !=null }">
	<form action="passeditMC" id="passeditMC" method="post">
		<input type="hidden" name="nickname" id="nickname" value="${nickname}" />
		<table align="center">
			<tr>
				<td> <br /><c:out value="${msg }" default=""/><br /> <br /> </td>
			</tr>
			<tr>
				<th><h3>${nickname }님 변경하실 비밀번호를 입력해주세요</h3></th>
			</tr>
			
			<tr>
				<th>
					<label for="pw1">새 비밀번호</label>	
				</th>
			</tr>
			<tr>
				<td class="password">
					<input type="password" name="pw1" id="pw1" style="padding:10px;" size="50" required />
	        		<span id="togglePwd1"><i class="fa-solid fa-eye"></i></span> <br />
	        		<span id="pw1Result"></p>					
				</td>
			</tr>
			<tr>
				<th>
					<label for="pw2">새 비밀번호 확인</label>	
				</th>
			</tr>
			<tr>
				<td class="password">
					<input type="password" name="pw2" id="pw2" style="padding:10px;" size="50" required />
	        		<span id="togglePwd2"><i class="fa-solid fa-eye"></i></span> <br />
	        		<span id="pw2Result"></span>
				
				</td>
			</tr>
			<tr>
				<td><input id="btn" type="submit" value="확인" /></td>
			</tr>
		</table>
    </form>	    
    </c:if>

</body>
</html>