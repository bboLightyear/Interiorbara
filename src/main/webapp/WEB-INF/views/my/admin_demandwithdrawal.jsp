<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file ="header.jsp" %>
<script>
document.title = "탈퇴신청회원관리";
</script>
<style>
tr:nth-child(odd) {background-color: #f9fafb;}
tr:nth-child(even) {background-color: #fefefe;}
</style>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<main class="Site-content" style="margin-top:10px;">
	
	<div class="mypage_category">
		<div class="mypage_category_list list_1"><a href="mypage">관리자메인</a></div>
		<div class="mypage_category_list list_2 pointcolor">회원관리</div>
		<div class="mypage_category_list list_3"><a href="admin_report">신고게시판</a></div>
	</div>
	<div class="mypage_category mb30">
        <div class="mypage_category_list list_2_1"><a href="admin_memberlist">회원리스트</a></div>
	    <div class="mypage_category_list list_2_2 pointcolor">탈퇴신청회원리스트</div>
    </div>
	
		<table align="center" class="admintablestyle">
			<tr>
				<th class="scrapth">회원번호</th>
				<th class="scrapth">탈퇴사유</th>
				<th class="scrapth">탈퇴신청일</th>
				<th class="scrapth">승인여부</th>				
			</tr>			
			<c:forEach items="${wdto}" var="list">
			<tr>
				<td class="scraptd">
				<span class="abc" onclick="javascript_:window.open('${path}/my/memberinfopage?memno=${list.memno}','pop','menubar=no,status=no,scrollbars=no,resizable=no,width=560,height=780,top=50,left=50');">
				${list.memno} <i class="fa-solid fa-user fa-2xs"></i></span>
				</td>
				<td class="scraptd">${list.reason }</td>
				<td class="scraptd"><fmt:formatDate value="${list.wddate }" type="both" dateStyle="short" pattern="YYYY-MM-dd"/></td>
				<c:choose>
					<c:when test="${list.yesno eq 'N'}">
						<td class="scraptd">
							<a class="pointblue" id="allowCheck" href="${path}/my/allowCheckWithdrawal?memno=${list.memno}">승인하기</a>
						</td>
					</c:when>
					<c:otherwise>
						<td class="scraptd">
							<a class="pointorange" href="${path}/my/allowCheckWithdrawal?memno=${list.memno}">취소하기</a>
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