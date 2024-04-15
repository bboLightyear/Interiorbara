<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<style>
html,body {
	margin: 0;
	padding: 0;
	height: 100%;
}
	body{
		display: flex;
  		min-height: 100vh;
  		flex-direction: column;
	}	
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
    .mypage_category_list:hover{
		padding-right: 10px;
		transform: scale(1.1);
	    letter-spacing: 2px;
		background-color: #e2f0fe;
		transition: 0.1s;
		font-size: 18px;	
	}
	a{
		text-decoration: none;
		color: black;
		font-weight: bold;
	}
	a:hover{
		padding-right: 10px;
		transform: scale(1.1);
	    letter-spacing: 2px;
		background-color: #e2f0fe;
		transition: 0.1s;
		font-size: 18px;	
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
	
/* 푸터 */
#wrapper {
	width:100%;
    min-height: 35%;
    position: relative;
    display: grid;
    bottom: 0;
    margin-top: 26px;
}

footer {
	margin: 0;
	padding: 0;
	width: 100%;
	height: 130px;
	position: absolute;
	/* transform: translateY(-10%); */
	border-top: 1px solid #b1b8c0;
	display: flex;
	background-color: #b1b8c0;
	bottom: 0;
}

/* 푸터 로고 */
.footer_logo {
	margin-top: 5px;
	margin-left: 30px;
	width: 120px;
	height: 120px;
	border: 1px solid #b1b8c0;
	cursor: pointer;
}

.footer_logo img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	object-position: center;
}

/* 푸터 내용 */
.footer_content {
	margin-top: 10px;
	margin-left: 50px;
	width: 60%;
	white-space: pre-line;
}

/* sns 아이콘 */
.footer_sns {
	position: absolute;
	right: 50px;
	bottom: 10px;
	text-align: right;
	margin-top: 100px;
	width: 150px;
	height: 25px;
}
.footer_sns a{
	float: left;
	margin-left: 5px;
	margin-right: 5px;
	width: 20px;
	height: 20px;
	text-decoration: none;
}
.Site-content {
  flex: 1;
}
.clear{
    clear: both;
}
</style>
</head>
<body>
<h3>myshopping.jsp</h3>
	<main class="Site-content">
	<div class="mypage_category">
        <div class="mypage_category_list list_1"><a href="mypage">프로필</a></div>
	    <div class="mypage_category_list list_2"><a href="#">나의쇼핑</a></div>
	    <div class="mypage_category_list list_3"><a href="mypagecompanysignup">업체신청</a></div> <br>
    </div>
    <div class="mypage_category">
        <div class="mypage_category_list list_1_1"><a href="#">주문배송목록</a></div>
	    <div class="mypage_category_list list_1_2">나의견적</div>
    </div>

    
    
    </main>
    <div class="clear"></div>
<!-- 푸터 -->
	<div id="wrapper">
	<footer>
		<!-- 푸터 로고 -->
		<div class="footer_logo">
			<img src="${path}/resources/img/mainimg/footer_logo.PNG" alt="#" onclick="location.href='${path}/main'"  />
		</div>
		<!-- 푸터 내용 -->
		<div class="footer_content">(주) 카피바라 주소 : 대한민국 서울시 양천구 목동 655-19
			대표 : 조보근 전화번호 : 010-3017-5283</div>
		<!-- sns 아이콘 -->
		<div class="footer_sns">
			<a href="https://www.facebook.com/"><i class="fab fa-facebook fa-lg"></i></a>
			<a href="https://www.youtube.com/"><i class="fab fa-youtube fa-lg"></i></a>
			<a href="https://www.twitter.com/"><i class="fab fa-twitter fa-lg"></i></a>
			<a href="https://www.twitch.tv/"><i class="fab fa-twitch fa-lg"></i></a>
			<a href="https://www.instagram.com/"><i class="fab fa-instagram fa-lg"></i></a>
		</div>
	</footer>
	</div>
    
</body>
</html>