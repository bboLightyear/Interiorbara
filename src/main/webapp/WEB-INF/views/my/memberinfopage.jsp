<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link rel="stylesheet" href="${path}/resources/css/my/mypageinfoedit.css" />
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	<style>
	.imgsize{
		width: 200px;
		height: 150px;
	}
	td{
		padding: 8px;
	}
	</style>
</head>
<body>
<h3>memberinfopage.jsp</h3>
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
    				<td><img class="imgsize" src="${path}/resources/upload/oh/photo/${pa.pa_attach}" alt="" /></td>
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
</body>
</html>