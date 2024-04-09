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
</head>
<body>
	<h3>admin_demandwithdrawal.jsp</h3>
	<div class="mypage_category">
		<div class="mypage_category_list list_1"><a href="adminmain">메인</a></div>
		<div class="mypage_category_list list_2"><a href="admin_memberlist"></a>회원관리</div>
		<div class="mypage_category_list list_3">업체신청관리</div>
		<div class="mypage_category_list list_4">신고게시판</div>
		<div class="mypage_category_list list_5">컨텐츠관리</div>
	</div>
	<div class="mypage_category">
        <div class="mypage_category_list list_2_1"><a href="admin_memberlist">회원리스트</a></div>
	    <div class="mypage_category_list list_2_2">탈퇴신청회원리스트</div>
    </div>
	<!-- <form action="allowCheckWithdrawal" method="post"> -->
		<table>
			<tr>
				<th>회원번호</th>
				<th>탈퇴사유</th>
				<th>탈퇴신청일</th>
				<th>승인여부</th>				
			</tr>			
			<c:forEach items="${wdto }" var="list">
			<tr>
				<td>${list.memno }</td>
				<td>${list.reason }</td>
				<td><fmt:formatDate value="${list.wddate }" type="both" dateStyle="short" pattern="YY-MM-dd"/></td>
				<c:choose>
					<c:when test="${list.yesno eq 'N'}">
						<td>
							<a id="allowCheck" href="allowCheckWithdrawal?memno=${list.memno }">승인하기</a>
						</td>
					</c:when>
					<c:otherwise>
						<td>
							<a href="allowCheckWithdrawal?memno=${list.memno }">취소하기</a>
						</td>
					</c:otherwise>
				</c:choose>
			</tr>
			</c:forEach>
		</table>
	<!-- </form> -->

</body>
</html>