<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file ="header.jsp" %>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script>
document.title = "회원관리";
</script>
<style>
tr:nth-child(odd) {background-color: #f9fafb;}
tr:nth-child(even) {background-color: #fefefe;}
</style>
	<main class="Site-content" id="top">
	<div class="mypage_category">
		<div class="mypage_category_list list_1"><a href="mypage">관리자메인</a></div>
		<div class="mypage_category_list list_2 pointcolor">회원관리</div>
		<div class="mypage_category_list list_3"><a href="admin_report">신고게시판</a></div>
	</div>
	<div class="mypage_category">
        <div class="mypage_category_list list_2_1 pointcolor">회원리스트</div>
	    <div class="mypage_category_list list_2_2"><a href="admin_demandwithdrawal">탈퇴신청회원리스트</a></div>
    </div>
<div>
	<form action="admin_memberlist" method="post">
			<div  class="formdiv pd8">
			<select name="searchType" class="mg3pd6">
				<option selected disabled>--검색선택--</option>
				<option value="num" <c:if test="${mlSel=='num'}">selected</c:if>>회원번호</option>
				<option value="nn" <c:if test="${mlSel=='nn'}">selected</c:if>>닉네임</option>
				<option value="mt" <c:if test="${mlSel=='mt'}">selected</c:if>>회원타입</option>
			</select>
			<input class="mg3pd6" type="text" name="sk" value="${resk }" />
			<input id="minibtn" type="submit" value="검색" />			
			</div>
		</form><br/>
		<span class="formdiv mg3pd6">총 <b>${total}</b>명</span>

		<table align="center" class="admintablestyle tc mt30">
			<tr>
				<th class="scrapth w180">회원번호</th>
				<th class="scrapth">회원닉네임</th>
				<th class="scrapth">이메일</th>
				<th class="scrapth w180">가입일</th>
				<th class="scrapth w180">회원타입</th>
			</tr>
			<c:forEach items="${mlist}" var="mdto">
			<tr>
				<td class="scraptd">${mdto.memno}</td>
				<td class="scraptd">
				<span class="abc" onclick="javascript_:window.open('${path}/my/memberinfopage?memno=${mdto.memno}','pop','menubar=no,status=no,scrollbars=no,resizable=no,width=560,height=780,top=50,left=50');">
				${mdto.nickname} <i class="fa-solid fa-user fa-2xs"></i></span></td>
				<td class="scraptd">${mdto.email}</td>
				<td class="scraptd"><fmt:formatDate value="${mdto.joindate}" type="both" dateStyle="short" pattern="YYYY-MM-dd"/></td>
				<td class="scraptd">${mdto.memtype}</td>
			</tr>
			</c:forEach>
		</table>
		</div>
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