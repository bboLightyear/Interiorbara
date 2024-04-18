<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file ="header.jsp" %>
<script>
document.title = "My Like";
</script>
<style>
tr:nth-child(odd) {background-color: #f9fafb;}
tr:nth-child(even) {background-color: #fefefe;}
</style>
<main class="Site-content" style="margin-top:10px;">
    <div class="mypage_category">
        <div class="mypage_category_list list_1_1"><a href="mypage">프로필</a></div>
	    <div class="mypage_category_list list_1_2"><a href="myphoto">내사진</a></div>
        <div class="mypage_category_list list_1_3"><a href="myscrap">스크랩북</a></div>
        <div class="mypage_category_list list_1_4 pointcolor">좋아요</div>
        <div class="mypage_category_list list_1_5"><a href="mypagecompanysignup">업체신청</a></div>
        <div class="mypage_category_list list_1_6"><a href="mypageinfoedit">회원정보수정</a></div>
        <div class="mypage_category_list list_1_7"><a href="mypagepasswordedit">비밀번호변경</a></div>
    </div>
    <h3 class="textcenter">My Like</h3>
    <table align="center" class="scraptable">
    	<tr>
    		<th class="scrapth">좋아요한 게시물(${likePb})</th>
    	</tr>
    	<tr>
    		<td class="scraptd">제목</td>
    	</tr>
    	<c:choose>
    		<c:when test="${!empty likelist}">
    			<c:forEach items="${likelist}" var="like">
			    	<tr>
			    		<td class="scraptd"><a class="aaa" href="${path}/oh/OHMainView?pb_no=${like.photoBoardDto.pb_no}">${like.photoBoardDto.pb_title}</a></td>
			    	</tr>
		    	</c:forEach>    		
    		</c:when>
    		<c:otherwise>
    			<tr>
    				<td><h3>좋아요한 게시물이 없습니다.</h3></td>
    			</tr>
    		</c:otherwise>
    	</c:choose>    
    </table>
</main>
<%@include file ="footer.jsp" %>