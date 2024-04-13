<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script defer src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script defer src="${path}/resources/js/my/mysellerchart.js"></script>
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
    /* #mypage_profile{
    	padding-left: 25%;
    } */
	/* .box {
	    width: 150px;
	    height: 150px; 
	    border-radius: 70%;
	    overflow: hidden;
	} */
	/* .profile {
	    width: 100%;
	    height: 100%;
	    background-color:#f9fafb;
	    object-fit: cover;
	} */
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
	/* .flex-container{
		/* display: inline-flex;
		margin: auto; */
		display: flex;
		justify-content : center;
		margin-top: 10px;		
	}
	.container{
		padding-left:10%;
		width: fit-content;
        height: fit-content;
	} */
/* 	.row{
		width: fit-content;
        height: fit-content; 
	} */ 
	/* #myChart{
		width: 450px;		
	} */
</style>
</head>
<body>
<h3>sellersalelist.jsp</h3>
	<div class="mypage_category">
        <div class="mypage_category_list list_1"><a href="mypage">프로필</a></div>
	    <div class="mypage_category_list list_2"><a href="#">판매</a></div> <br />
    </div>
    <div class="mypage_category">
        <div class="mypage_category_list list_1_1"><a href="sellersale">판매상품관리</a></div>
	    <div class="mypage_category_list list_1_2"><a href="#">판매목록</a></div>
        
    </div>
    
	    
    
    
    
</body>
</html>