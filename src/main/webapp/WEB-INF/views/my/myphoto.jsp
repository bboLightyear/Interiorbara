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
		margin-left: 30%;
	}
	td{
		padding: 8px;
	}
	.imgsize{
		width: 100px;
		height: 70px;
	}
</style>
</head>
<body>
<h3>myphoto.jsp</h3>
	<div class="mypage_category">
        <div class="mypage_category_list list_1"><a href="mypage">프로필</a></div>
	    <div class="mypage_category_list list_2"><a href="myshopping">나의쇼핑</a></div>
	    <div class="mypage_category_list list_3"><a href="mypagecompanysignup">업체신청</a></div> <br>
    </div>
    <div class="mypage_category">
        <div class="mypage_category_list list_1_1"><a href="mypage">모두보기</a></div>
	    <div class="mypage_category_list list_1_2"><a href="#">내사진</a></div>
        <div class="mypage_category_list list_1_3"><a href="myscrap">스크랩북</a></div>
        <div class="mypage_category_list list_1_4"><a href="mylike">좋아요</a></div>
        <div class="mypage_category_list list_1_5"><a href="mypageinfoedit">회원정보수정</a></div>
        <div class="mypage_category_list list_1_6"><a href="mypagepasswordedit">비밀번호변경</a></div>
    </div>
    
    <div id="mypage_pictrue">
    	<table>
    		<c:forEach items="${palist}" var="pa">
    			<tr>
    				<td>${pa.photoBoardDto.pb_no}</td>	
    				<td>${pa.photoBoardDto.pb_title}</td>
    				<td>
    				<c:forTokens items="${pa.attachs}" delims="," var="photo" end="5">	
    				<img class="imgsize" src="../resources/upload/oh/photo/${photo}" alt="" />&nbsp;&nbsp;
    				</c:forTokens>
    				</td>
    			</tr>
    		</c:forEach>
	  	</table>
	  	<span align="center"><h2>사진이나 제목 누르면 링크로 글로 넘어가게하기</h2></span>
    
    
    </div>
</body>
</html>