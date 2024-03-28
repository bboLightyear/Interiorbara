<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- <script src="${path}/resources/js/my/mypage.js"></script> --%>

<style>
	.mypage_category {
    	margin: 0;
        padding: 0;
        width: 100%;
        height: 65px;
        /* border-bottom: 1px solid gray; */
        display: flex; 
        justify-content: center;
        align-items: center;
        /* background-color: lightblue; */
	}
    /* 카테고리 list */
   	.mypage_category_list {
        margin-top: -5px;
        margin-left: 10px;
        padding-left: 10px;
        border-left: 1px solid gray;
        display: inline-block;
        width: fit-content;
        height: fit-content;
        font-size: 15px;
        font-weight: bold;
        font-family: sans-serif;
        cursor: pointer;
    }
    .myPage-row{
	    width: 500px;
	    height: 50px;
	    margin-top: 20px;
	
	    display: flex;
	    align-items: center;
	    border-bottom : 2px solid #ddd;
	}
	
	.myPage-row > * {
	    font-size: 18px;
	    font-weight: bold;
	}
	
	/* 행 제목 */
	.myPage-row > label{
	    width: 30%;
	    color: #455ba8;
	}
	
	.myPage-row > span{
	    width: 70%;
	    color: #455ba8;
	}
	
	/* 행 내부 input 태그 */
	.myPage-row > input{
	    width: 100%;
	    height: 100%;
	    border: none;
	    outline: none;
	    font-weight: normal;
	}
	
	/* 제출 버튼 */
	.myPage-submit{
	    width: 100%;
	    padding: 10px;
	    margin: 50px 0;
	    
	    border: none;
	    font-size: 20px;
	    font-weight: bold;
	
	    background-color: #455ba8;
	    color: white;
	    cursor: pointer;
	}
    
    .profile-image-area{
	    width: 150px;
	    height: 150px;
	    /* border: 3px solid #ccc; */
	    border-radius: 50%;
	
	    position: relative;
	
	    overflow: hidden;
	    display: flex;
	    justify-content: center;
	    align-content: center;
	}

	#profileimg{
	    height: 100%;
	}
	
	/* 삭제버튼 */
/* 	form[name='myPageFrm']{position: relative;} */
	
	/* 이미지 버튼 영역 */
	.profile-btn-area{
	    width: 230px;
	    margin: 20px 0;
	    display: flex;
	    justify-content: center;
	    align-items: center;
	}
	
	.profile-btn-area > *{
	    max-width: 110px;
	    max-height: 33px;
	    padding: 5px 10px;

	    border: 1px solid black;
	    background-color: white;
	    font-size: 14px;
	    cursor: pointer;
	    text-align: center;
	    
	}
	
	#imgInput{ 
		display: none;
		}
	
	.profile-btn-area > button{
	    background-color: #455ba8;
	    color : white;
	    margin-left: 2px;
	}
	
</style>
</head>
<body>
<h3>mypageinfoedit.jsp</h3>
	<div class="mypage_category">
        <div class="mypage_category_list list_1">프로필</div>
	    <div class="mypage_category_list list_2">나의쇼핑</div> <br>
    </div>
    <div class="mypage_category">
        <div class="mypage_category_list list_1_1">모두보기</div>
	    <div class="mypage_category_list list_1_2">내사진</div>
        <div class="mypage_category_list list_1_3">내동영상</div>
        <div class="mypage_category_list list_1_4">회원정보수정</div>
        <div class="mypage_category_list list_1_5">비밀번호변경</div>
    </div>
    
    <form action="profile" method="POST" name="myPageFrm" id="profileFrm" enctype="multipart/form-data">
	    <div class="profile-image-area">
	        <%-- 프로필 이미지가 없으면 기본 이미지 --%>
	        <c:if test="${empty dto.profileimg}" >
	            <img src="../resources/img/my/user.png" id="profileimg">
	        </c:if>
	        <%-- 프로필 이미지가 있으면 있는 이미지 --%>
	        <c:if test="${!empty dto.profileimg}" >
	            <img src="../resources/upload/my/${dto.profileimg}" id="profileimg">
	        </c:if>
	
	    </div>
	    	
	    <div class="profile-btn-area">
	        <label for="imgInput">이미지 선택</label>
	        <input type="file" name="profileimg" id="imgInput" accept="image/*">
	        <button>변경하기</button>
	    </div>
	</form>
	<form action="modify" method="post">    
	    <div class="myPage-row">
	        <label for="email">이메일</label>
	        <span><input type="text" name="email" id="email" value="${dto.email}" /></span>
	    </div>
	    
	    <div class="myPage-row">
	        <label for="nickname">닉네임</label>
	        <span><input type="text" name="nickname" id="nickname" value="${dto.nickname}" /></span>
	    </div>
	    <div class="myPage-row">
	        <label for="birth">생년월일</label>
	        <span><input type="text" name="birth" id="birth" value="${dto.birth}" /></span>
	    </div>
	    <div class="myPage-row">
	        <label>성별</label>
	        <span>
	        	<c:choose>
	        		<c:when test="${dto.gender eq 'm' }">
	        			<input type="radio" name="gender" value="m" checked/>남
	        			<input type="radio" name="gender" value="fm" />여
		        		<input type="radio" name="gender" value="notCheck" />선택하지않음
	        		</c:when>
	        		<c:when test="${dto.gender eq 'fm' }">
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
	        </span>
	    </div>
	    <div class="myPage-row">
	        <a href="#">탈퇴하기 ></a>
	    </div>
	    <div>
	    	<input type="submit" value="확인" />
	    </div>
	    
    </form>	    
	

    
    
    
    <div>
    </div>
    
</body>
</html>