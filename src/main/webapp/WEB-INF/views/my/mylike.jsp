<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file ="header.jsp" %>
<script>
document.title = "My Like";
</script>
<main class="Site-content" style="margin-top:10px;">
	<div class="mypage_category">
        <div class="mypage_category_list list_1"><a href="mypage">프로필</a></div>
	    <!-- <div class="mypage_category_list list_2"><a href="myshopping">나의쇼핑</a></div> -->
	    <div class="mypage_category_list list_3"><a href="mypagecompanysignup">업체신청</a></div> <br>
    </div>
    <div class="mypage_category">
        <div class="mypage_category_list list_1_1"><a href="mypage">모두보기</a></div>
	    <div class="mypage_category_list list_1_2"><a href="myphoto">내사진</a></div>
        <div class="mypage_category_list list_1_3"><a href="myscrap">스크랩북</a></div>
        <div class="mypage_category_list list_1_4"><a href="#">좋아요</a></div>
        <div class="mypage_category_list list_1_5"><a href="mypageinfoedit">회원정보수정</a></div>
        <div class="mypage_category_list list_1_6"><a href="mypagepasswordedit">비밀번호변경</a></div>
    </div>
    <h3 class="textcenter">My Like</h3>
    <table align="center" class="scraptable">
    	<tr>
    		<th class="scrapth">좋아요한 게시물(${likePb})</th>
    	</tr>
    	<tr>
    		<td class="scraptd">제목</td>
    	</tr>
    	<c:forEach items="${likelist}" var="like">
    	<tr>
    		<td class="scraptd"><a class="aaa" href="${path}/oh/OHMainView?pb_no=${like.pb_no}">${like.pb_title}</a></td>
    	</tr>
    	</c:forEach>    
    </table>
</main>
<%@include file ="footer.jsp" %>