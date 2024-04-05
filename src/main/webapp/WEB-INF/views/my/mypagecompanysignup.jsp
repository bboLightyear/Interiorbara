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
	<script defer src="${path }/resources/js/my/mypagecompanysignup.js"></script>
</head>
<body>
<h3>mypagecompanysignup.jsp</h3>
	<div class="mypage_category">
        <div class="mypage_category_list list_1"><a href="mypagemain">프로필</a></div>
	    <div class="mypage_category_list list_2">나의쇼핑</div>
	    <div class="mypage_category_list list_3">업체신청</div> <br>
	    
    </div>
    <div class="mypage_category">
        <div class="mypage_category_list list_1_1"><a href="mypagemain">모두보기</a></div>
	    <div class="mypage_category_list list_1_2">내사진</div>
        <div class="mypage_category_list list_1_3">내동영상</div>
        <div class="mypage_category_list list_1_4"><a href="mypageinfoedit">회원정보수정</a></div>
        <div class="mypage_category_list list_1_5"><a href="mypagepasswordedit">비밀번호변경</a></div>
    </div>
    <form action="signUp" method="post">
    <input type="hidden" name="memno" id="memno" value="${loginUserDto.memno}" />
    <input type="hidden" name="memtype" id="memtype" value="${loginUserDto.memtype}"/>
    	<c:out value="${errorMsg}" default="" />
    	<h4>인테리어업체 신청하기</h4>
    	<label for="interior">사업자등록번호 </label>
    	<input type="text" name="interior" id="interior" placeholder="10자리 숫자만 입력해주세요" oninput="oninputNum(this)"/>
    	<button>신청</button> <br />
    	<span id="interiorResult"></span> <br />
    	<c:out value="${inteResultMsg}" default="" />
    	<br /><br />   	
    	<h4>판매업체 신청하기</h4>
    	<label for="seller">사업자등록번호</label>
    	<input type="text" name="seller" id="seller" placeholder="10자리 숫자만 입력해주세요" oninput="oninputNum(this)" />
    	<button>신청</button> <br />
    	<span id="sellerResult"></span> <br />
    	<c:out value="${sellerResultMsg}" default="" />    	 
    </form>
</body>
</html>