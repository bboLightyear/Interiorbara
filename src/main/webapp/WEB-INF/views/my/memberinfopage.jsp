<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script>
	document.title = "Member Infomation";
</script>
<main class="Site-content textcenter">
<h3>${mdto.nickname}님 페이지</h3>
    <div id="mypageedit" align="center">
		    <div class="profile-image-area">
		        <%-- 프로필 이미지가 없으면 기본 이미지 --%>
		        <c:if test="${empty mdto.profileimg}" >
		            <img src="../resources/img/my/user.png" id="profileimg">
		        </c:if>
		        <%-- 프로필 이미지가 있으면 있는 이미지 --%>
		        <c:if test="${!empty mdto.profileimg}" >
		            <img src="../resources/upload/my/${mdto.profileimg}" id="profileimg">
		        </c:if>	
		    </div>
		    <div class="myPage-row">
		        <label>이메일</label>
		        <p>${mdto.email}</p>	        
		    </div>
		    <div class="myPage-row">
		        <label for="nickname">닉네임<br /></label>
		        <p>${mdto.nickname}</p>
		    </div>
		    <c:if test="${loginUserDto.memtype eq 'ADMIN'}">
		    <div class="myPage-row">
		        <label for="phone">휴대폰번호<br /></label>
		        <p id="phone"></p>
		    </div>
		    <div class="myPage-row">
		        <label for="birth">생년월일<br /></label>
		        <p id="birth"></p>
		    </div>
		    <div class="myPage-row">
		        <label>성별<br /></label>
		        <p>${mdto.gender}</p>
		    </div>		    
		    </c:if>
    </div>
    <div>
    	<table align="center">
    		<tr>
    			<c:forEach items="${palist}" var="pa" end="2">
    				<td class="pd8"><img class="imgsize" src="${path}/resources/upload/oh/photo/${pa.pa_attach}" alt="" /></td>
    			</c:forEach>
    		</tr>
	  	</table>
	</div>	    
    <script>

$(document).ready(function() {
  var phonenum = "${mdto.phone}";
  var replacephone = phonenum.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
  $("#phone").text(replacephone);
});

$(document).ready(function() {
	var birthnum = "${mdto.birth}";
	var replacebirth=birthnum.replace(/(\d{4})(\d{2})(\d{2})/g, '$1-$2-$3');
	$("#birth").text(replacebirth);
});

</script>
</main>
<%@include file ="footer.jsp" %>