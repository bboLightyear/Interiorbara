<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" /> -->
<script defer src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script defer src="${path}/resources/js/my/myinteriorchart.js"></script>
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
    	padding-left: 80%;
    } */
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
	.flex-container{
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
	}
/* 	.row{
		width: fit-content;
        height: fit-content; 
	} */ 
	#myChart{
		width: 450px;		
	}
</style>
</head>
<body>
<h3>interiormain.jsp</h3>
	<div class="mypage_category">
        <div class="mypage_category_list list_1"><a href="#">프로필</a></div>
	    <div class="mypage_category_list list_2">견적</div> <br />
    </div>
    <div class="mypage_category">
        <div class="mypage_category_list list_1_1"><a href="#">모두보기</a></div>
	    <div class="mypage_category_list list_1_2">내시공사례</div>
        <div class="mypage_category_list list_1_3">질문과답변</div>
        <div class="mypage_category_list list_1_4"><a href="interiorinfoedit">회원정보수정</a></div>
        <div class="mypage_category_list list_1_5"><a href="interiorpasswordedit">비밀번호변경</a></div>
    </div>
    <div class="flex-container">
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
        인테리어 업체번호 ${loginInteDto.inteno }번님
    </div>
    
    <div class="container">
		<div class="row">
			<div class="col-md-6">
				<canvas id="myChart"></canvas>
			</div>
			<%-- <div class="col-md-6">
				<canvas id="myChart2"></canvas>
			</div> --%>
		</div>
	</div>
	</div>
</body>
</html>