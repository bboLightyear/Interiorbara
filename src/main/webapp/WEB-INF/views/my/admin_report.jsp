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
<style>
table{
	width: 70%;
	text-align: center;
	margin-top: 30px;
	font-size: 15px;
}
th, td{
	height: 30px;
	border-bottom: 1px solid gray;
}
th{
	background-color: #e2f0fe;
}
/* .shortcontent {
    width: 50px;                /* 가로 길이 고정*/
    text-overflow: ellipsis;     /* 생략 처리 ( ... )*/
    white-space: nowrap;         /* 줄바꿈 하지 않고 잘림*/
    overflow: hidden;            /* 스크롤 처리 하지 않음*/
} */
</style>

</head>
<body>
	<h3>admin_report.jsp</h3>
	<div class="mypage_category">
		<div class="mypage_category_list list_1"><a href="mypage">메인</a></div>
		<div class="mypage_category_list list_2"><a href="admin_memberlist">회원관리</a></div>
		<!-- <div class="mypage_category_list list_3">업체신청관리</div> -->
		<div class="mypage_category_list list_3"><a href="#">신고게시판</a></div>
		<div class="mypage_category_list list_4">컨텐츠관리</div>
	</div>
	<table align="center">
		<tr>
			<th>신고글번호</th>
			<th>신고대상자</th>
			<th>신고게시판</th>
			<th>신고글내용</th>
			<th>신고사유</th>
			<th>신고날짜</th>
			<th>승인여부</th>
		</tr>
		<c:forEach items="${list }" var="reportdto">
		<tr>
			<td>${reportdto.reno }</td>
			<td>${reportdto.targetmemno }</td>
			<td>${reportdto.targettype }</td>
			<td>${reportdto.bizRvReportedDto.brr_content }</td>
			<td>${reportdto.cause }</td>
			<td><fmt:formatDate value="${reportdto.redate }" type="both" dateStyle="short" pattern="YY-MM-dd"/></td>
			<c:choose>
				<c:when test="${reportdto.yesno eq 'N'}">
					<td>
						<a href="blindCheck?reno=${reportdto.reno}">승인하기</a>
					</td>
				</c:when>
				<c:otherwise>
					<td>
						<a href="blindCheck?reno=${reportdto.reno}">취소하기</a>
					</td>
				</c:otherwise>
			</c:choose>			
		</tr>
		</c:forEach>	
	</table>

</body>
</html>