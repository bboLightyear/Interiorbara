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
        <div class="mypage_category_list list_1_3 pointcolor">스크랩</div>
        <div class="mypage_category_list list_1_4"><a href="mylike">좋아요</a></div>
        <div class="mypage_category_list list_1_5"><a href="mypagecompanysignup">업체신청</a></div>
        <div class="mypage_category_list list_1_6"><a href="mypageinfoedit">회원정보수정</a></div>
        <div class="mypage_category_list list_1_7"><a href="mypagepasswordedit">비밀번호변경</a></div>
    </div>
    
    <div>
	<h3 class="textcenter mb30">My Scrap</h3>    
    <table align="center" class="admintablestyle">
     	<colgroup> 
     		<col style="width: 30%;"> 
            <col style="width: 30%;"> 
            <col style="width: 40%;">
        </colgroup>
    <tr>
    	<th colspan="3" class="scrapth">북마크한 업체(${bmarkBiz}개)</th>
    </tr>
    <tr>
    	<th class="scraptd">업 체 이 름</th>
    	<th class="scraptd" colspan="2">소&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;개</th>
    </tr>
    <c:choose>
    	<c:when test="${!empty bhlist}">
    	
		    <c:forEach items="${bhlist}" var="bh">
		    <tr>
		    	<td class="scraptd"><a class="abc" href="${path}/biz/home/bizHome?inteno=${bh.inteno}">
		    	${bh.bh_name} <i class="fa-solid fa-house fa-2xs"></i></a></td>
		    	<td colspan="2" class="left scraptd s">${bh.bh_intro}</td>
		    </tr>
		    </c:forEach>
    	</c:when>
    	<c:otherwise>
    		<tr>
    			<td colspan="3"><h3>북마크한 업체가 없습니다.</h3></td>
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
    	<th colspan="3" class="scrapth">스크랩한 게시물(${scrapPb}개)</th>
    </tr>
    <tr>
    	<th class="scraptd">글 쓴 이</th>
    	<th class="scraptd">제&nbsp;&nbsp;목</th>
    	<th class="scraptd">내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;용</th>
    </tr>
    <c:choose>
    	<c:when test="${!empty scraplist}">
    		<c:forEach items="${scraplist}" var="scrap">
    			<tr>
    				<td class="scraptd">
    				<span class="abc" onclick="javascript_:window.open('${path}/my/memberinfopage?nickname=${scrap.myMemberInfoDto.nickname}','pop','menubar=no,status=no,scrollbars=no,resizable=no,width=560,height=700,top=50,left=50');">
					${scrap.myMemberInfoDto.nickname} <i class="fa-solid fa-user fa-2xs"></i></span>    				
    				</td>
    				<td class="scraptd"><a class="abc" href="${path}/oh/OHPhotoDetailView?pb_no=${scrap.photoBoardDto.pb_no}"><i class="fa-solid fa-list-ul fa-2xs"></i> ${scrap.photoBoardDto.pb_title}</a></td>
    				<td class="scraptd s">${scrap.photoBoardDto.pb_content}</td>
    			</tr>
    		</c:forEach>
    	</c:when>
    	<c:otherwise>
    	<tr>
    		<td colspan="3"><h3>스크랩한 게시물이 없습니다.</h3></td>
    	</tr>
    	</c:otherwise>
    </c:choose>    
    </table>        
    </div>
</main>
<%@include file ="footer.jsp" %>