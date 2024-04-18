<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file ="header.jsp" %>
<script>
document.title = "My Scrap";
</script>
<style>
tr:nth-child(odd) {background-color: #f9fafb;}
tr:nth-child(even) {background-color: #fefefe;}
</style>
<main class="Site-content" style="margin-top:10px;">
    <div class="mypage_category">
        <div class="mypage_category_list list_1_1"><a href="mypage">프로필</a></div>
	    <div class="mypage_category_list list_1_2"><a href="myphoto">내사진</a></div>
        <div class="mypage_category_list list_1_3 pointcolor">스크랩북</div>
        <div class="mypage_category_list list_1_4"><a href="mylike">좋아요</a></div>
        <div class="mypage_category_list list_1_5"><a href="mypagecompanysignup">업체신청</a></div>
        <div class="mypage_category_list list_1_6"><a href="mypageinfoedit">회원정보수정</a></div>
        <div class="mypage_category_list list_1_7"><a href="mypagepasswordedit">비밀번호변경</a></div>
    </div>
    
    <div>
	<h3 class="textcenter">My Scrap</h3>    
    <table align="center" class="scraptable">
    <tr>
    	<th colspan="2" class="scrapth">북마크한 업체(${bmarkBiz}개)</th>
    </tr>
    <tr>
    	<td class="scraptd">업체이름</td>
    	<td class="scraptd">소개</td>
    </tr>
    <c:choose>
    	<c:when test="${!empty bhlist}">
    	
		    <c:forEach items="${bhlist}" var="bh">
		    <tr>
		    	<td class="scraptd"><a class="aaa" href="${path}/biz/home/bizHome?inteno=${bh.inteno}">${bh.bh_name}</a></td>
		    	<td class="left scraptd"><a class="aaa" href="${path}/biz/home/bizHome?inteno=${bh.inteno}">${bh.bh_intro}</a></td>
		    </tr>
		    </c:forEach>
    	</c:when>
    	<c:otherwise>
    		<tr>
    			<td colspan="2"><h3>북마크한 업체가 없습니다.</h3></td>
    		</tr>
    	</c:otherwise>
    
    </c:choose>
    <tr>
    	<td colspan="2" class="tdheight scraptd"> </td>
    </tr>
    <tr>
    	<th colspan="2" class="scrapth">스크랩한 게시물(${scrapPb})</th>
    </tr>
    <tr>
    	<td colspan="2" class="scraptd">제목</td>
    </tr>
    <c:choose>
    	<c:when test="${!empty scraplist}">
    		<c:forEach items="${scraplist}" var="scrap">
    			<tr>
    				<td colspan="2" class="scraptd"><a class="aaa" href="${path}/oh/OHMainView?pb_no=${scrap.photoBoardDto.pb_no}">${scrap.photoBoardDto.pb_title}</a></td>
    			</tr>
    		</c:forEach>
    	</c:when>
    	<c:otherwise>
    	<tr>
    		<td colspan="2"><h3>스크랩한 게시물이 없습니다.</h3></td>
    	</tr>
    	</c:otherwise>
    </c:choose>
    
    
    </table>
        
    </div>
</main>
<%@include file ="footer.jsp" %>