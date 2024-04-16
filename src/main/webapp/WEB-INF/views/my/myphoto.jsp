<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file ="header.jsp" %>
<script>
document.title = "My Photo";
</script>
<main class="Site-content" style="margin-top:10px;">
	<div class="mypage_category">
        <div class="mypage_category_list list_1"><a href="mypage">프로필</a></div>
	    <!-- <div class="mypage_category_list list_2"><a href="myshopping">나의쇼핑</a></div> -->
	    <div class="mypage_category_list list_3"><a href="mypagecompanysignup">업체신청</a></div> <br>
    </div>
    <div class="mypage_category">
        <div class="mypage_category_list list_1_1"><a href="mypage">모두보기</a></div>
	    <div class="mypage_category_list list_1_2"><a href="#">내사진</a></div>
        <div class="mypage_category_list list_1_3"><a href="myscrap">스크랩북</a></div>
        <div class="mypage_category_list list_1_4"><a href="mylike">좋아요</a></div>
        <div class="mypage_category_list list_1_5"><a href="mypageinfoedit">회원정보수정</a></div>
        <div class="mypage_category_list list_1_6"><a href="mypagepasswordedit">비밀번호변경</a></div>
    </div>
    
    <div id="mypage_pictrue">
    	<table class="classtable" align="center">
    		<c:forEach items="${palist}" var="pa">
    			<tr>
    				<td>${pa.photoBoardDto.pb_no}</td>	
    				<td>${pa.photoBoardDto.pb_title}</td>
    				<td>
    				<c:forTokens items="${pa.attachs}" delims="," var="photo" end="5">	
    				<a href="${path}/oh/OHPhotoDetailView?pb_no=${pa.photoBoardDto.pb_no}"><img class="imgsmall" src="../resources/upload/oh/photo/${photo}" alt="" /></a>&nbsp;&nbsp;
    				</c:forTokens>
    				</td>
    			</tr>
    		</c:forEach>
	  	</table>
    </div>
</main>
<%@include file ="footer.jsp" %>