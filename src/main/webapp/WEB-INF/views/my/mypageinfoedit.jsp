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
	<link rel="stylesheet" href="${path}/resources/css/my/mypageinfoedit.css" />
	<script defer src="${path}/resources/js/my/mypage.js"></script>
	<script defer src="${path}/resources/js/my/mypagemodify.js"></script>
    <script defer src="${path}/resources/js/my/my_script_nickname.js"></script>	
</head>
<body>
<h3>mypageinfoedit.jsp</h3>
	<div class="mypage_category">
        <div class="mypage_category_list list_1"><a href="mypagemain">프로필</a></div>
	    <div class="mypage_category_list list_2">나의쇼핑</div>
	    <div class="mypage_category_list list_3"><a href="mypagecompanysignup">업체신청</a></div> <br>
    </div>
    <div class="mypage_category">
        <div class="mypage_category_list list_1_1"><a href="mypagemain">모두보기</a></div>
	    <div class="mypage_category_list list_1_2">내사진</div>
        <div class="mypage_category_list list_1_3">내동영상</div>
        <div class="mypage_category_list list_1_4">회원정보수정</div>
        <div class="mypage_category_list list_1_5"><a href="mypagepasswordedit">비밀번호변경</a></div>
    </div>
    
    <form action="profile" method="POST" name="myPageFrm" id="profileFrm" enctype="multipart/form-data">
    	<input type="hidden" name="memno" value="${loginUserDto.memno} " />
	    <div class="profile-image-area">
	        <%-- 프로필 이미지가 없으면 기본 이미지 --%>
	        <c:if test="${empty loginUserDto.profileimg}" >
	            <img src="../resources/img/my/user.png" id="profileimg">
	        </c:if>
	        <%-- 프로필 이미지가 있으면 있는 이미지 --%>
	        <c:if test="${!empty loginUserDto.profileimg}" >
	            <img src="../resources/upload/my/${loginUserDto.profileimg}" id="profileimg">
	        </c:if>	
	    </div>
	    <span id="deleteimg">x</span>
	    <div class="profile-btn-area">
	        <label for="imgInput">이미지 선택</label>
	        <input type="file" name="profileimg" id="imgInput" accept="image/*">
	        <button>변경하기</button> 
	    </div>
	</form>
	<form action="modify" id="modify" method="post">    
	    <div class="myPage-row">
	        <label>이메일</label>
	        <p><input type="text" name="email" id="email" value="${loginUserDto.email}" readonly /></p>	        
	    </div>
	    
	    <div class="myPage-row">
	        <label for="nickname">닉네임<br /></label>
	        <p><input type="text" name="nickname" id="nickname" value="${loginUserDto.nickname}" /> <br />
	        <span id="nicknameResult"></span></p>
	    </div>
	    <div class="myPage-row">
	        <label for="phone">휴대폰번호<br /></label>
	        <p><input type="number" name="phone" id="phone" value="${loginUserDto.phone}" /><br />
	        <span id="phoneResult"></span></p>
	    </div>
	    <div class="myPage-row">
	        <label for="birth">생년월일<br /></label>
	        <p><input type="number" name="birth" id="birth" value="${loginUserDto.birth}" /><br />
	        <span id="birthResult"></span>
	        </p>
	    </div>
	    <div class="myPage-row">
	        <label>성별<br /></label>
	        <p>
	        	<c:choose>
	        		<c:when test="${loginUserDto.gender eq 'm' }">
	        			<input type="radio" name="gender" value="m" checked/>남
	        			<input type="radio" name="gender" value="fm" />여
		        		<input type="radio" name="gender" value="notCheck" />선택하지않음
	        		</c:when>
	        		<c:when test="${loginUserDto.gender eq 'fm' }">
	        			<input type="radio" name="gender" value="m" />남
	        			<input type="radio" name="gender" value="fm" checked/>여
		        		<input type="radio" name="gender" value="notCheck" />선택하지않음
	        		</c:when>
	        		<c:otherwise>
	        			<input type="radio" name="gender" value="m" />남
	        			<input type="radio" name="gender" value="fm" />여
		        		<input type="radio" name="gender" value="notCheck" checked/>선택하지않음	        		
	        		</c:otherwise>        	
	        	</c:choose>		        		        
	        </p>
	    </div>
	    <div class="myPage-row">
	        <a href="withdrawal">탈퇴하기 ></a>
	    </div>
	    <div>
	    	<input type="submit" value="확인" /> <br />
	    	<c:out value="${msg }" default="" />
	    </div>
    </form>	    
    
</body>
</html>