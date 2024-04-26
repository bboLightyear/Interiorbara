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
        <div class="mypage_category_list list_1_3"><a href="myscrap">스크랩</a></div>
        <div class="mypage_category_list list_1_4 pointcolor">좋아요</div>
        <div class="mypage_category_list list_1_5"><a href="mypagecompanysignup">업체신청</a></div>
        <div class="mypage_category_list list_1_6"><a href="mypageinfoedit">회원정보수정</a></div>
        <div class="mypage_category_list list_1_7"><a href="mypagepasswordedit">비밀번호변경</a></div>
    </div>
    <h3 class="textcenter mb30">My Like</h3>
    <table align="center" class="admintablestyle">
    	<colgroup> 
     		<col style="width: 30%;"> 
            <col style="width: 30%;"> 
            <col style="width: 40%;">
        </colgroup>
    	<tr>
    		<th class="scrapth" colspan="3">좋아요한 업체리뷰(${likeBr}개)</th>
    	</tr>
    	<tr>
    		<th class="scraptd">글 쓴 이</th>
    		<th class="scraptd" colspan="2">내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;용</th>
    	</tr>
    	<c:choose>
    		<c:when test="${!empty rvlikelist}">
    			<c:forEach items="${rvlikelist}" var="likerv">
			    	<tr>
			    		<td class="scraptd">
			    		<span class="abc" onclick="javascript_:window.open('${path}/my/memberinfopage?nickname=${likerv.br_writer}','pop','menubar=no,status=no,scrollbars=no,resizable=no,width=560,height=700,top=50,left=50');">
						${likerv.br_writer} <i class="fa-solid fa-user fa-2xs"></i></span>
			    		</td>
			    		<td colspan="2" class="scraptd s">
			    		<a class="abc" href="${path}/biz/review/bizRvContentView?br_no=${likerv.br_no}"><i class="fa-solid fa-list-ul fa-2xs"></i> ${likerv.br_content}</a></td>
			    	</tr>
		    	</c:forEach>    		
    		</c:when>
    		<c:otherwise>
    			<tr>
    				<td colspan="3"><h3>좋아요한 업체리뷰가 없습니다.</h3></td>
    			</tr>
    		</c:otherwise>
    	</c:choose>
    	</table>
    	<h3 class="ma50"> </h3>
    	<table align="center" class="admintablestyle">
    	<colgroup> 
     		<col style="width: 22%;"> 
            <col style="width: 22%;"> 
            <col style="width: 56%;">
        </colgroup>
    	<tr>
    		<th class="scrapth" colspan="3">좋아요한 게시물(${likePb}개)</th>
    	</tr>
    	<tr>
    		<th class="scraptd">글 쓴 이</th>
    		<th class="scraptd">제&nbsp;&nbsp;목</th>
    		<th class="scraptd">내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;용</th>
    	</tr>
    	<c:choose>
    		<c:when test="${!empty pblikelist}">
    			<c:forEach items="${pblikelist}" var="likepb">
			    	<tr>
			    		<td class="scraptd">
			    		<span class="abc" onclick="javascript_:window.open('${path}/my/memberinfopage?nickname=${likepb.myMemberInfoDto.nickname}','pop','menubar=no,status=no,scrollbars=no,resizable=no,width=560,height=700,top=50,left=50');">
						${likepb.myMemberInfoDto.nickname} <i class="fa-solid fa-user fa-2xs"></i></span>
			    		</td>
			    		<td class="scraptd"><a class="abc" href="${path}/oh/OHPhotoDetailView?pb_no=${likepb.photoBoardDto.pb_no}"><i class="fa-solid fa-list-ul fa-2xs"></i> ${likepb.photoBoardDto.pb_title}</a></td>
			    		<td class="scraptd s">${likepb.photoBoardDto.pb_content}</td>
			    	</tr>
		    	</c:forEach>    		
    		</c:when>
    		<c:otherwise>
    			<tr>
    				<td colspan="3"><h3>좋아요한 게시물이 없습니다.</h3></td>
    			</tr>
    		</c:otherwise>
    	</c:choose>    	
    </table>
</main>
<%@include file ="footer.jsp" %>