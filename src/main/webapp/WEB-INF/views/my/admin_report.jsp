<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
<script>
	document.title = "Admin Report";
</script>

<style>
/* .shortcontent {
    width: 50px;                /* 가로 길이 고정*/
    text-overflow: ellipsis;     /* 생략 처리 ( ... )*/
    white-space: nowrap;         /* 줄바꿈 하지 않고 잘림*/
    overflow: hidden;            /* 스크롤 처리 하지 않음*/
} */
</style>
<main class="Site-content" style="margin-top:10px;">
	<div class="mypage_category">
		<div class="mypage_category_list list_1"><a href="mypage">메인</a></div>
		<div class="mypage_category_list list_2"><a href="admin_memberlist">회원관리</a></div>
		<!-- <div class="mypage_category_list list_3">업체신청관리</div> -->
		<div class="mypage_category_list list_3"><a href="#">신고게시판</a></div>
		<!-- <div class="mypage_category_list list_4">컨텐츠관리</div> -->
	</div>
	<table align="center" class="scraptable">
		<tr>
			<th class="scrapth">신고글번호</th>
			<th class="scrapth">신고대상자</th>
			<th class="scrapth">신고게시판</th>
			<th class="scrapth">신고글내용</th>
			<th class="scrapth">신고사유</th>
			<th class="scrapth">신고날짜</th>
			<th class="scrapth">승인여부</th>
		</tr>
		<c:forEach items="${list }" var="reportdto">
		<tr>
			<td class="scraptd">${reportdto.reno }</td>
			<td class="scraptd">${reportdto.targetmemno }</td>
			<td class="scraptd">${reportdto.targettype }</td>
			<td class="scraptd">${reportdto.bizRvReportedDto.brr_content }</td>
			<td class="scraptd">${reportdto.cause }</td>
			<td class="scraptd"><fmt:formatDate value="${reportdto.redate }" type="both" dateStyle="short" pattern="YYYY-MM-dd"/></td>
			<c:choose>
				<c:when test="${reportdto.yesno eq 'N'}">
					<td class="scraptd">
						<a class="aaa" href="blindCheck?reno=${reportdto.reno}">승인하기</a>
					</td>
				</c:when>
				<c:otherwise>
					<td class="scraptd">
						<a class="aaa" href="blindCheck?reno=${reportdto.reno}">취소하기</a>
					</td>
				</c:otherwise>
			</c:choose>			
		</tr>
		</c:forEach>	
	</table>
</main>
<%@include file ="footer.jsp" %>