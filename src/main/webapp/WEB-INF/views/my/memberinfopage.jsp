<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script>
	document.title = "회원 정보";
</script>
<main class="Site-content textcenter">
<h3>${mdto.nickname}님 회원정보</h3>
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
		    <div  class="myPage-row">
		    	<label>멤버타입<br /></label>
		    	<p id="memtype"></p>		    
		    </div>
		    <div  class="myPage-row">
		    	<label>최근올린사진<br /></label>
		    </div>
		    <div>
		    	<c:forEach items="${palist}" var="pa" end="3">
   				<a href="${path}/oh/OHPhotoDetailView?pb_no=${pa.pb_no}"><img class="imgsmall mt10" src="${path}/resources/upload/oh/photo/${pa.pa_attach}" alt="" /></a>
		    	</c:forEach>
			 </div>
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


window.onload = function (){
	var membertype="${mdto.memtype}";
	var memtype = document.getElementById("memtype");
	if(membertype == "PERSON"){
		memtype.innerHTML = "개인회원"
	}else if (membertype=="INTERIOR"){
		memtype.innerHTML = "인테리어업체"
	}else if (membertype=="SELLER"){
		memtype.innerHTML = "판매자"
	}else if(membertype=="ADMIN"){
		memtype.innerHTML = "관리자"
	}else if(membertype=="WITHDRAWAL"){
		memtype.innerHTML = "탈퇴회원"
	}else if(membertype=="NOTMAILCHECK"){
		memtype.innerHTML = "메일인증안된회원"
	}
}
</script>
</main>
<%@include file ="footer.jsp" %>