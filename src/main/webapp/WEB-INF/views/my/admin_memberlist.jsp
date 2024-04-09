<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/my/mypageinfoedit.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
	<h3>admin_memberlist.jsp</h3>
	<div class="mypage_category">
		<div class="mypage_category_list list_1"><a href="mypage">메인</a></div>
		<div class="mypage_category_list list_2">회원관리</div>
		<!-- <div class="mypage_category_list list_3">업체신청관리</div> -->
		<div class="mypage_category_list list_3">신고게시판</div>
		<div class="mypage_category_list list_4">컨텐츠관리</div>
	</div>
	<div class="mypage_category">
        <div class="mypage_category_list list_2_1">회원리스트</div>
	    <div class="mypage_category_list list_2_2"><a href="admin_demandwithdrawal">탈퇴신청회원리스트</a></div>
    </div>
	
		<table align="center">
			<tr>
				<th>회원번호</th>
				<th>회원닉네임</th>
				<th>이메일</th>
				<th>가입일</th>
				<th>회원구분</th>
			</tr>			
			<c:forEach items="${list }" var="mdto">
			<tr>
				<td>${mdto.memno }</td>
				<td>${mdto.nickname }</td>
				<td>${mdto.email }</td>
				<td><fmt:formatDate value="${mdto.joindate }" type="both" dateStyle="short" pattern="YY-MM-dd"/></td>
				<td>${mdto.memtype }</td>
			</tr>
			</c:forEach>
		</table>
	

</body>
</html>