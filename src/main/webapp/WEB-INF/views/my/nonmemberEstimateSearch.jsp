<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>nonmemberEstimateSearch.jsp</h3>
<table align="center">
	<tr>
		<td>견적번호</td>
		<td>${ndto.estino}</td>
	</tr>
	<tr>
		<td>이름</td>
		<td>${ndto.name}</td>
	</tr>
	<tr>
		<td>폰번호</td>
		<td>${ndto.phone}</td>
	</tr>
	<tr>
		<td>email</td>
		<td>${ndto.email}</td>
	</tr>


</table>


<c:out value="${msg }" default="" />
</body>
</html>