<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file ="header.jsp" %>
<script>
document.title = "Admin Demand Withdrawal";
</script>

<main class="Site-content" style="margin-top:10px;">
	
	<div class="mypage_category">
		<div class="mypage_category_list list_1"><a href="mypage">메인</a></div>
		<div class="mypage_category_list list_2"><a href="admin_memberlist">회원관리</a></div>
		<!-- <div class="mypage_category_list list_3">업체신청관리</div> -->
		<div class="mypage_category_list list_3"><a href="admin_report">신고게시판</a></div>
		<!-- <div class="mypage_category_list list_4">컨텐츠관리</div> -->
	</div>
	<div class="mypage_category">
        <div class="mypage_category_list list_2_1"><a href="admin_memberlist">회원리스트</a></div>
	    <div class="mypage_category_list list_2_2"><a href="#">탈퇴신청회원리스트</a></div>
    </div>
	
		<table align="center" class="scraptable">
			<tr>
				<th class="scrapth">회원번호</th>
				<th class="scrapth">탈퇴사유</th>
				<th class="scrapth">탈퇴신청일</th>
				<th class="scrapth">승인여부</th>				
			</tr>			
			<c:forEach items="${wdto }" var="list">
			<tr>
				<td class="scraptd">${list.memno }</td>
				<td class="scraptd">${list.reason }</td>
				<td class="scraptd"><fmt:formatDate value="${list.wddate }" type="both" dateStyle="short" pattern="YYYY-MM-dd"/></td>
				<c:choose>
					<c:when test="${list.yesno eq 'N'}">
						<td class="scraptd">
							<a class="aaa" id="allowCheck" href="allowCheckWithdrawal?memno=${list.memno }">승인하기</a>
						</td>
					</c:when>
					<c:otherwise>
						<td class="scraptd">
							<a class="aaa" href="allowCheckWithdrawal?memno=${list.memno }">취소하기</a>
						</td>
					</c:otherwise>
				</c:choose>
			</tr>
			</c:forEach>
		</table>
	</main>
	<%@include file ="footer.jsp" %>