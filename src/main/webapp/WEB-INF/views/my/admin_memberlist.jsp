<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file ="header.jsp" %>
<script>
document.title = "Admin Member List";
</script>
	<main class="Site-content">
	<div class="mypage_category">
		<div class="mypage_category_list list_1"><a href="mypage">메인</a></div>
		<div class="mypage_category_list list_2"><a href="#">회원관리</a></div>
		<!-- <div class="mypage_category_list list_3">업체신청관리</div> -->
		<div class="mypage_category_list list_3"><a href="admin_report">신고게시판</a></div>
		<!-- <div class="mypage_category_list list_4">컨텐츠관리</div> -->
	</div>
	<div class="mypage_category">
        <div class="mypage_category_list list_2_1"><a href="#">회원리스트</a></div>
	    <div class="mypage_category_list list_2_2"><a href="admin_demandwithdrawal">탈퇴신청회원리스트</a></div>
    </div>
	
		<table align="center" class="scraptable">
			<tr>
				<th class="scrapth">회원번호</th>
				<th class="scrapth">회원닉네임</th>
				<th class="scrapth">이메일</th>
				<th class="scrapth">가입일</th>
				<th class="scrapth">회원구분</th>
			</tr>			
			<c:forEach items="${list}" var="mdto">
			<tr>
				<td class="scraptd"><a class="aaa" href="memberinfopage?memno=${mdto.memno}">${mdto.memno}</a></td>
				<td class="scraptd">${mdto.nickname}</td>
				<td class="scraptd">${mdto.email}</td>
				<td class="scraptd"><fmt:formatDate value="${mdto.joindate}" type="both" dateStyle="short" pattern="YYYY-MM-dd"/></td>
				<td class="scraptd">${mdto.memtype}</td>
			</tr>
			</c:forEach>
		</table>
	</main>
<%@include file ="footer.jsp" %>