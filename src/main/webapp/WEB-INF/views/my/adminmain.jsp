<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<link rel="stylesheet" href="${path}/resources/css/my/mypageinfoedit.css" />
<script defer src="${path}/resources/js/my/mychart.js"></script>
</head>
<body>
	<h3>adminmain.jsp</h3>
	<div class="mypage_category">
		<div class="mypage_category_list list_1"><a href="#">메인</a>	</div>
		<div class="mypage_category_list list_2"><a href="admin_memberlist">회원관리</a></div>
		<div class="mypage_category_list list_3">업체신청관리</div>
		<div class="mypage_category_list list_4">신고게시판</div>
		<div class="mypage_category_list list_5">컨텐츠관리</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<canvas id="myChart"></canvas>
			</div>
			<div class="col-md-6">
				<canvas id="myChart2"></canvas>
			</div>
		</div>
	</div>
	


</body>
</html>