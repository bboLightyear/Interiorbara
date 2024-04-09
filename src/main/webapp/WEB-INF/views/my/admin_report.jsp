<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/my/mypageinfoedit.css" />
<style>
table{
	width: 60%;
	text-align: center;
	margin-top: 30px;
}
th, td{
	height: 30px;
	border-bottom: 1px solid gray;
}
th{
	background-color: #e2f0fe;
}
</style>
</head>
<body>
	<h3>admin_report.jsp</h3>
	<div class="mypage_category">
		<div class="mypage_category_list list_1"><a href="mypage">메인</a>	</div>
		<div class="mypage_category_list list_2"><a href="admin_memberlist">회원관리</a></div>
		<!-- <div class="mypage_category_list list_3">업체신청관리</div> -->
		<div class="mypage_category_list list_3">신고게시판</div>
		<div class="mypage_category_list list_4">컨텐츠관리</div>
	</div>
	<form action="blind" method="post">
	<table align="center">
		
	
	
	
	
	
	</table>
	
	
	
	
	</form>


</body>
</html>