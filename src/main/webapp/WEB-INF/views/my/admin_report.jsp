<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
<script>
	document.title = "Admin Report";
</script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<style>
tr:nth-child(odd) {background-color: #f9fafb;}
tr:nth-child(even) {background-color: #fefefe;}
/* .shortcontent {
    width: 50px;                /* 가로 길이 고정*/
    text-overflow: ellipsis;     /* 생략 처리 ( ... )*/
    white-space: nowrap;         /* 줄바꿈 하지 않고 잘림*/
    overflow: hidden;            /* 스크롤 처리 하지 않음*/
} */
</style>
<main class="Site-content" style="margin-top:10px;">
	<div class="mypage_category">
		<div class="mypage_category_list list_1"><a href="mypage">관리자메인</a></div>
		<div class="mypage_category_list list_2"><a href="admin_memberlist">회원관리</a></div>
		<div class="mypage_category_list list_3 pointcolor">신고게시판</div>
	</div>
	<table align="center" class="scraptable">
		<tr>
			<th class="scrapth">신고글번호</th>
			<th class="scrapth">신고대상자</th>
			<th class="scrapth">신고한회원</th>
			<th class="scrapth">신고게시판</th>
			<th class="scrapth">신고글내용</th>
			<th class="scrapth">신고사유</th>
			<th class="scrapth">신고날짜</th>
			<th class="scrapth">승인여부</th>
		</tr>
		<c:forEach items="${list }" var="reportdto">
		<tr>
			<td class="scraptd">${reportdto.reno }</td>
			<td class="scraptd">
			<span class="abc" onclick="javascript_:window.open('${path}/my/memberinfopage?memno=${reportdto.targetmemno}','pop','menubar=no,status=no,scrollbars=no,resizable=no,width=560,height=780,top=50,left=50');">
			${reportdto.targetmemno} <i class="fa-solid fa-user fa-2xs"></i></span>
			</td>
			<td class="scraptd">
			<span class="abc" onclick="javascript_:window.open('${path}/my/memberinfopage?memno=${reportdto.memno}','pop','menubar=no,status=no,scrollbars=no,resizable=no,width=560,height=780,top=50,left=50');">
			${reportdto.memno} <i class="fa-solid fa-user fa-2xs"></i></span>
			</td>
			<td class="scraptd">${reportdto.targettype}</td>
			<td class="scraptd s"><a class="abc" href="${path}/biz/review/bizRvContentView?br_no=${reportdto.targetno}">${reportdto.bizRvReportedDto.brr_content}</a></td>
			<td class="scraptd">${reportdto.cause}</td>
			<td class="scraptd"><fmt:formatDate value="${reportdto.redate}" type="both" dateStyle="short" pattern="YYYY-MM-dd"/></td>
			<c:choose>
				<c:when test="${reportdto.yesno eq 'N'}">
					<td class="scraptd">
						<a class="pointblue" href="blindCheck?reno=${reportdto.reno}">승인하기</a>
					</td>
				</c:when>
				<c:otherwise>
					<td class="scraptd">
						<a class="pointorange" href="blindCheck?reno=${reportdto.reno}">취소하기</a>
					</td>
				</c:otherwise>
			</c:choose>			
		</tr>
		</c:forEach>	
	</table>
	<div>
		<a id="topBtn" href="#"><img alt="" src="${path}/resources/img/my/fromtop.png"></a>		
	</div>
<script>
$(function() {
   // 보이기 | 숨기기
   $(window).scroll(function() {
      if ($(this).scrollTop() > 250) { //250 넘으면 버튼이 보여짐니다.
            $('#topBtn').fadeIn();
            } else {
            $('#topBtn').fadeOut();
      }
   });
   // 버튼 클릭시
   $("#topBtn").click(function() {   
   $('html, body').animate({
     scrollTop : 0    // 0 까지 animation 이동합니다.
    }, 400);          // 속도 400
    return false;
    });
  });
</script>
</main>
<%@include file ="footer.jsp" %>