<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<style>
table{
	width: 60%;
	text-align: center;
	margin-top: 50px;
	font-size: 15px;
}
th, td{
	height: 50px;
	border-bottom: 1px solid gray;
}
.title{
	background-color: #e2f0fe;
}
</style>

</head>
<body>
<h3>nonmemberEstimateSearch.jsp</h3>
<table align="center">
	<tr>
		<td class="title">견적번호</td>
		<td>${ndto.estino}</td>
	</tr>
	<tr>
		<td class="title">이름</td>
		<td>${ndto.name}</td>
	</tr>
	<tr>
		<td class="title">폰번호</td>
		<td id="phone"></td>
	</tr>
	<tr>
		<td class="title">email</td>
		<td>${ndto.email}</td>
	</tr>
</table>
<c:out value="${msg }" default="" />
<script>

$(document).ready(function() {
                
  var test = "${ndto.phone}";
  var testDate = test.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
  
  $("#phone").text(testDate);
 
});
</script>
</body>
</html>