<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    #mypage_profile{
    	padding-left: 25%;
    }
    
	.box {
	    width: 150px;
	    height: 150px; 
	    border-radius: 70%;
	    overflow: hidden;
	}
	.profile {
	    width: 100%;
	    height: 100%;
	    background-color:#f9fafb;
	    object-fit: cover;
	}
	ul li {
		list-style:none;
		margin-bottom: 15%;
	 }
	.fl {float:left; }
	.tc {text-align:center; }
	.board {width: 160px; }
	.w50 {width:50px; }
	.w70 {width:70px; }
	.w80 {width:80px; }
	.w150 {width:150px; }
	table{
		margin-left: 40%;
	}
	td{
		padding: 8px;
	}
	.imgsize{
		width: 200px;
		height: 150px;
	}
</style>
</head>
<body>
<h3>mypagemain.jsp</h3>
	<div class="mypage_category">
        <div class="mypage_category_list list_1"><a href="#">프로필</a></div>
	    <div class="mypage_category_list list_2"><a href="myshopping">나의쇼핑</a></div>
	    <div class="mypage_category_list list_3"><a href="mypagecompanysignup">업체신청</a></div> <br>
    </div>
    <div class="mypage_category">
        <div class="mypage_category_list list_1_1"><a href="#">모두보기</a></div>
	    <div class="mypage_category_list list_1_2"><a href="myphoto">내사진</a></div>
        <div class="mypage_category_list list_1_3"><a href="myscrap">스크랩북</a></div>
        <div class="mypage_category_list list_1_4"><a href="mylike">좋아요</a></div>
        <div class="mypage_category_list list_1_5"><a href="mypageinfoedit">회원정보수정</a></div>
        <div class="mypage_category_list list_1_6"><a href="mypagepasswordedit">비밀번호변경</a></div>
    </div>
    
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
       		<li class="fl tc w80"><a href="myscrap"><img class="w50" src="../resources/img/my/bookmark.png" alt="" /></a></li>
       		<li class="fl tc w80"><a href="mylike"><img class="w50" src="../resources/img/my/heart.png" alt="" /></a></li>        		
       	</ul>
       	<ul class="board">
       		<li class="fl tc w80"><a href="myscrap">스크랩북</a></li>
       		<li class="fl tc w80"><a href="mylike">좋아요</a></li>
       	</ul>
       	<ul class="board">
       		<li class="fl tc w80"><a href="myscrap">${myscrap}</a></li>
       		<li class="fl tc w80"><a href="mylike">${mylike}</a></li>
       	</ul>
    </div>
    
    
    <div id="mypage_photo">
    	<table>
    		<tr>
    			<td colspan="4"><b>내 사진</b></td>
    		</tr>
    		<tr>
    			<c:forEach items="${palist}" var="pa" end="3">
    				<td><img class="imgsize" src="../resources/upload/oh/photo/${pa.pa_attach}" alt="" /></td>
    			</c:forEach>
    		</tr>
	  	</table>
    
    
    </div>
</body>
</html>