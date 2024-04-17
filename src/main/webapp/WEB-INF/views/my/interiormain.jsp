<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file ="header.jsp" %>
<script>
document.title = "인테리어업체 마이페이지";
</script>
<%-- <script defer src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script defer src="${path}/resources/js/my/myinteriorchart.js"></script> --%>
<main class="Site-content" style="margin-top:10px;">
	
    <div class="mypage_category">
        <div class="mypage_category_list list_1_1 pointcolor">프로필</div>
	    <div class="mypage_category_list list_1_2"><a href="interiorinfoedit">회원정보수정</a></div>
        <div class="mypage_category_list list_1_3"><a href="interiorpasswordedit">비밀번호변경</a></div>
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
        	<li class="fl tc w150"><a href="${path}/biz/home/bizHome?inteno=${loginUserDto.myinteriordto.inteno}"><b>MY HOME</b></a></li>
        </ul>
        
    </div>
   
	<div>
    <table class="maintable">
    	<tr>
    		<td class="pd8 signuplabel pb20" colspan="4"><b>내 시공사례</b></td>
    	</tr>
    	<tr>
    		<th class="scrapth pd8">메인이미지</th>
    		<th class="scrapth pd8">작성자</th>
    		<th class="scrapth pd8">제목</th>
    		<th class="scrapth pd8">내용</th>
    	</tr>
    	<c:forEach items="${cdto}" var="caseslist">
    	<tr>
    		<%-- <td class="pd8">${caseslist.inteCasesDto.bc_no}</td> --%>
    		<td class="scraptd pd8">
    			<c:forTokens items="${caseslist.imgs}" delims="," var="casesimg" end="0">	
    				<a href="${path}/biz/cases/bizCasesContentView?bc_no=${caseslist.inteCasesDto.bc_no}"><img class="imgsmall" src="${path}/resources/upload/biz/cases/${casesimg}" alt="" /></a>
    			</c:forTokens>
    		</td>
    		<td class="scraptd pd8">${caseslist.inteCasesDto.bc_writer}</td>
    		<td class="scraptd pd8">${caseslist.inteCasesDto.bc_title}</td>
    		<td class="scraptd pd8"><p class="w20 s">${caseslist.inteCasesDto.bc_content}</p></td>
    		
    	</tr>
    	</c:forEach>
    </table>  
    
    
    </div>
	</div>
</main>
<%@include file ="footer.jsp" %>