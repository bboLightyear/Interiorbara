<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file ="header.jsp" %>
<script>
document.title = "My Page";
</script>
<style>
    
	table{
		margin-left: 40%;
	}
	td{
		padding: 8px;
	}
	
</style>
	<main class="Site-content" style="margin-top:10px;">
	<div class="mypage_category">
        <div class="mypage_category_list list_1"><a href="#">프로필</a></div>
	    <!-- <div class="mypage_category_list list_2"><a href="myshopping">나의쇼핑</a></div> -->
	    <div class="mypage_category_list list_3"><a href="mypagecompanysignup">업체신청</a></div> <br>
    </div>
    <div class="mypage_category">
        <div class="mypage_category_list list_1_1"><a href="#">모두보기</a></div>
	    <div class="mypage_category_list list_1_2"><a href="myphoto">내사진</a></div>
        <div class="mypage_category_list list_1_3"><a href="myscrap">스크랩북</a></div>
        <div class="mypage_category_list list_1_4"><a href="mylike">좋아요</a></div>
        <div class="mypage_category_list list_1_5"><a href="mypageinfoedit">회원정보수정</a></div>
        <div class="mypage_category_list list_1_6"><a href="mypagepasswordedit">비밀번호변경</a></div>
    </div>
    <div class="mypage_area">
    <div id="mypage_profile">
    	<ul class="board">
    		<li class="fl tc box w150">
    			<c:if test="${empty loginUserDto.profileimg}" >
	            <img class="profile" src="../resources/img/my/user.png" id="profileimg">
	        </c:if>
	        <%-- 프로필 이미지가 있으면 있는 이미지 --%>
	        <c:if test="${!empty loginUserDto.profileimg}" >
	            <img class="profile" src="../resources/upload/my/${loginUserDto.profileimg}" id="profileimg">
	        </c:if>	
    			<%-- <img class="profile" src="../resources/upload/my/${loginUserDto.profileimg}" alt=""> --%>
    		</li>
    	</ul>
        <ul class="board">
        	<li class="fl tc w150">${loginUserDto.nickname}님</li>
        </ul>
       	<ul class="board">
       		<li class="fl tc w80"><a href="myscrap"><img class="w50 simg" src="../resources/img/my/bookmark.png" alt="" /></a></li>
       		<li class="fl tc w80"><a href="mylike"><img class="w50 simg" src="../resources/img/my/heart.png" alt="" /></a></li>        		
       	</ul>
       	<ul class="board">
       		<li class="fl tc w80"><a class="aaa" href="myscrap">스크랩북</a></li>
       		<li class="fl tc w80"><a class="aaa" href="mylike">좋아요</a></li>
       	</ul>
       	<ul class="board">
       		<li class="fl tc w80"><a class="aaa" href="myscrap">${myscrap}</a></li>
       		<li class="fl tc w80"><a class="aaa" href="mylike">${mylike}</a></li>
       	</ul>
    </div>
        
    <div id="mypage_photo">
    	<table>
    		<tr>
    			<td colspan="4"><b>내 사진</b></td>
    		</tr>
    		<tr>
    			<c:choose>
    				<c:when test="${!empty palist}">
		    			<c:forEach items="${palist}" var="pa" end="3">
		    				<td><a href="${path}/oh/OHPhotoDetailView?pb_no=${pa.pb_no}"><img class="imgsize" src="../resources/upload/oh/photo/${pa.pa_attach}" alt="" /></a></td>
	    				</c:forEach>
	    			</c:when>
	    			<c:otherwise>
	    			<td><h3>등록된 사진이 없습니다.</h3></td>
	    			</c:otherwise>
    			</c:choose>
    		</tr>
    		
	  	</table>
    </div>
    </div>
    </main>
<%@include file ="footer.jsp" %>