<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원정보</title>
<link rel="stylesheet" href="${path}/resources/css/my/mypage.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<main class="Site-content textcenter">
<c:choose>
	<c:when test="${msg eq null }">
		<h3 class="mt30">${mdto.nickname}님 회원정보</h3>	
	</c:when>
	<c:otherwise>
		<h3 class="mt30"><c:out value="${msg }" default="" /></h3>
	</c:otherwise>
</c:choose>
    <div id="mypageedit" align="center">
		    <div class="profile-image-area">
		        <%-- 프로필 이미지가 없으면 기본 이미지 --%>
		        <c:if test="${empty mdto.profileimg}" >
		            <img src="${path}/resources/img/my/user.png" id="profileimg">
		        </c:if>
		        <%-- 프로필 이미지가 있으면 있는 이미지 --%>
		        <c:if test="${!empty mdto.profileimg}" >
		            <img src="${path}/resources/upload/my/${mdto.profileimg}" id="profileimg">
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
		    <div class="mt30">
		    	<c:choose>
		    		<c:when test="${!empty palist}">
				    	<c:forEach items="${palist}" var="pa" end="3">
		   				<a href="#" onclick="javascript_:opener.document.location.href='${path}/oh/OHPhotoDetailView?pb_no=${pa.pb_no}';window.close();">
		   				<div style='display:inline-flex;justify-content: center;border-radius: 10px;overflow: hidden;'>
		   				<img class="imgsmall" src="${path}/resources/upload/oh/photo/${pa.pa_attach}" alt="" /></div></a>
				    	</c:forEach>
		    		</c:when>
		    		<c:otherwise>
		    		<c:if test="${msg eq null}">
		    		<h3>올린 사진이 없습니다.</h3>
		    		</c:if>
		    		</c:otherwise>	
		    	</c:choose>
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
</body>
</html>