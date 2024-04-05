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
	<script defer src="${path}/resources/js/my/jquery-3.7.1.min.js"></script>
	<script defer src="${path}/resources/js/my/mypagepasswordedit.js"></script>
	<script defer src="${path}/resources/js/my/my_script_pwd.js"></script>    
</head>
<body>
<h3>mypagepasswordedit.jsp</h3>
	<div class="mypage_category">
        <div class="mypage_category_list list_1"><a href="mypagemain">프로필</a></div>
	    <div class="mypage_category_list list_2">나의쇼핑</div>
	    <div class="mypage_category_list list_3"><a href="mypagecompanysignup">업체신청</a></div> <br>
    </div>
    <div class="mypage_category">
        <div class="mypage_category_list list_1_1"><a href="mypagemain">모두보기</a></div>
	    <div class="mypage_category_list list_1_2">내사진</div>
        <div class="mypage_category_list list_1_3">내동영상</div>
        <div class="mypage_category_list list_1_4"><a href="mypageinfoedit">회원정보수정</a></div>
        <div class="mypage_category_list list_1_5">비밀번호변경</div>
    </div>
    <form action="passedit" id="passedit" method="post">
		<input type="hidden" name="nickname" id="nickname" value="${loginUserDto.nickname}" />
		<input type="hidden" name="mypwd" id="mypwd" value="${mypwd }" />
	    <div class="myPage-row">
	        <label for="inputpwd">현재비밀번호</label>
	        <p><input type="text" name="inputpwd" id="inputpwd" style="padding:10px;" size="35" required /> <br />
	        <%-- <c:out value="${returnmsg }" default=""/> --%>
	        <span id="pwdMatchResule"></span></p>
	    </div>
   	    
	    <div class="myPage-row">
	        <label for="pw1">새 비밀번호<br /></label>
	        <p><input type="password" name="pw1" id="pw1" style="padding:10px;" size="35" required />
	        <span id="togglePwd1"><i class="fa-solid fa-eye"></i></span> <br />
	        <span id="pw1Result"></p>
	    </div>
	    <div class="myPage-row">
	        <label for="pw2">새 비밀번호 확인<br /></label>
	        <p><input type="password" name="pw2" id="pw2" style="padding:10px;" size="35" required />
	        <span id="togglePwd2"><i class="fa-solid fa-eye"></i></span> <br />
	        <span id="pw2Result"></p>
	    </div>
   	    <div>
	    	<input type="submit" value="확인" />
	    	<c:out value="${msg }" default="" /> 
	    </div>
    </form>	    

</body>
</html>