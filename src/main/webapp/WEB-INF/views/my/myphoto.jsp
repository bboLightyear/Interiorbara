<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file ="header.jsp" %>
<script>
document.title = "My Photo";
</script>
<style>
tr:nth-child(odd) {background-color: #f9fafb;}
tr:nth-child(even) {background-color: #fefefe;}
</style>
<main class="Site-content" style="margin-top:10px;">
    <div class="mypage_category">
        <div class="mypage_category_list list_1_1"><a href="mypage">프로필</a></div>
	    <div class="mypage_category_list list_1_2 pointcolor">내사진</div>
        <div class="mypage_category_list list_1_3"><a href="myscrap">스크랩</a></div>
        <div class="mypage_category_list list_1_4"><a href="mylike">좋아요</a></div>
        <div class="mypage_category_list list_1_5"><a href="mypagecompanysignup">업체신청</a></div>
        <div class="mypage_category_list list_1_6"><a href="mypageinfoedit">회원정보수정</a></div>
        <div class="mypage_category_list list_1_7"><a href="mypagepasswordedit">비밀번호변경</a></div>
    </div>    
    <div id="mypage_pictrue">
    <h3 class="tc ma" >My Photo</h3>
    	<div>
    	<table class="admintablestyle" align="center">
    		<colgroup> 
     			<col style="width: 10%;"> 
        	    <col style="width: 20%;"> 
    	        <col style="width: 70%;">
	        </colgroup>
    		<tr>
    			<th class="scrapth pd8">글번호</th>
    			<th class="scrapth pd8">글제목</th>
    			<th class="scrapth pd8">사진들</th>
    		</tr>
    		<c:choose>
    			<c:when test="${!empty palist}">
	    			<c:forEach items="${palist}" var="pa">
		    			<tr>
		    				<td class="scraptd pd8">${pa.photoBoardDto.pb_no}</td>	
		    				<td class="scraptd pd8">${pa.photoBoardDto.pb_title}</td>
		    				<td class="scraptd classtable pd8">
		    				<c:forTokens items="${pa.attachs}" delims="," var="photo" end="5">	
		    				<a href="${path}/oh/OHPhotoDetailView?pb_no=${pa.photoBoardDto.pb_no}">
		    				<div style='display:inline-flex;justify-content: center;border-radius: 10px;overflow: hidden;'>
		    				<img class="imgsmall" src="../resources/upload/oh/photo/${photo}" alt="" /></div></a>&nbsp;&nbsp;
		    				</c:forTokens>
		    				</td>
		    			</tr>
		    		</c:forEach>
    			</c:when>
    			<c:otherwise>
		    		<tr>
		    			<td colspan="3" class="pd8"><h3 class="container">등록된 사진이 없습니다.</h3></td>
		    		</tr>		    		
		    	</c:otherwise>    		
    		</c:choose>
	  	</table>
    	</div>
    </div>
</main>
<%@include file ="footer.jsp" %>