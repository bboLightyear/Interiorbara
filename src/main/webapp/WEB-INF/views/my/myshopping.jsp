<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<style>
/* 헤더 */
html, body {
	margin: 0;
	padding: 0;
	height: 100%;
}

body {
	display: flex;
	min-height: 100vh;
	flex-direction: column;
}

header {
	margin: 0;
	padding: 0;
	width: 100%;
	height: 130px;
	text-align: center;
	position: sticky;
	top: 0;
	z-index: 999;
}

/* 헤더 윗부분 */
.header_top {
	margin: 0;
	padding: 0;
	width: 100%;
	height: 65px;
	border-bottom: 1px solid #b1b8c0;
	display: flex;
	justify-content: space-between;
	align-items: center;
	background-color: white;
}

/* 로고 이미지 */
.header_logo {
	display: inline-block;
	margin-top: 5px;
	margin-left: 150px;
	width: 400px;
	height: 50px;
	object-fit: fill;
	cursor: pointer;
}

.header_logo img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	object-position: center;
}

/* 검색 창 */
.header_search_box {
	margin-top: 5px;
	display: inline-block;
	width: 40%;
	height: 30px;
	border: 1px solid #b1b8c0;
	border-radius: 10px;
	background-color: #f9fafb;
}

.header_search_box:hover {
	background-color: #e2f0fe;
}

.header_search_box:click {
	background-color: #e2f0fe;
}
/* 검색 부분 */
.header_search_box_input {
	margin-top: 5px;
	border: none;
	overflow: auto;
	z-index: -1;
	font-size: 15px;
	width: 80%;
	height: 60%;
	background-color: #f9fafb;
	text-align: center;
	cursor: pointer;
}

.header_search_box_input:hover {
	background-color: #e2f0fe;
}

.header_search_box_input:click {
	background-color: #e2f0fe;
}

.header_search_box_icon {
	margin-right: 10px;
}
/* 회원관리부분 */
.header_login_box {
	margin-top: 25px;
	display: inline-block;
	width: fit-content;
	height: 30px;
	font-size: 12px;
}
/* 로그인 */
.header_login {
	float: left;
	margin-right: 10px;
	padding-left: 10px;
	padding-right: 10px;
	width: fit-content;
	height: fit-content;
	border-left: 1px solid #b1b8c0;
	border-right: 1px solid #b1b8c0;
	cursor: pointer;
}
/* 회원가입 */
.header_join {
	float: left;
	margin-right: 10px;
	padding-right: 10px;
	width: fit-content;
	height: fit-content;
	border-right: 1px solid #b1b8c0;
	cursor: pointer;
}
/* 마이페이지 */
.header_cs {
	float: left;
	cursor: pointer;
}

/* 헤더 아랫부분 */
.header_bottom {
	margin: 0;
	padding: 0;
	width: 100%;
	height: 65px;
	border-bottom: 1px solid #b1b8c0;
	display: flex;
	justify-content: center;
	align-items: center;
	background-color: white;
	transition: 0.1s;
}

/* 카테고리 아이콘 */
.header_category_icon {
	margin-top: 12px;
	display: inline-block;
	width: fit-content;
	height: 40px;
	cursor: pointer;
}

/* 카테고리 list */
.header_category_list {
	margin-top: -5px;
	margin-left: 10px;
	padding-left: 10px;
	border-left: 1px solid #b1b8c0;
	display: inline-block;
	width: fit-content;
	height: fit-content;
	font-size: 15px;
	font-weight: bold;
	font-family: sans-serif;
	text-decoration: none;
	cursor: pointer;
}

.header_category_list:hover {
	padding-right: 10px;
	transform: scale(1.1);
	letter-spacing: 2px;
	background-color: #e2f0fe;
	transition: 0.1s;
	font-size: 18px;
}

.body_section {
	width: 80%;
	margin-left: 13%;
	text-align: center;
	height: auto;
	min-height: 100%;
	padding-bottom: 130px;
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

.mypage_category_list:hover {
	padding-right: 10px;
	transform: scale(1.1);
	letter-spacing: 2px;
	background-color: #e2f0fe;
	transition: 0.1s;
	font-size: 18px;
}

a {
	text-decoration: none;
	color: black;
	font-weight: bold;
}

a:hover {
	padding-right: 10px;
	transform: scale(1.1);
	letter-spacing: 2px;
	background-color: #e2f0fe;
	transition: 0.1s;
	font-size: 18px;
}

ul li {
	list-style: none;
	margin-bottom: 15%;
}

.fl {
	float: left;
}

.tc {
	text-align: center;
}

.board {
	width: 160px;
}

.w50 {
	width: 50px;
}

.w70 {
	width: 70px;
}

.w80 {
	width: 80px;
}

.w150 {
	width: 150px;
}

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
	/* transform: translateY(10%); */
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

.footer_sns a {
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

.clear {
	clear: both;
}
</style>
</head>
<body>
	<!-- 헤더 -->
	<header>
		<!-- header_top : 헤더 윗부분 -->
		<div class="header_top">
			<!-- 왼쪽 여백 -->
			<div></div>
			<!-- header_logo : 로고 -->
			<div class="header_logo">
				<img src="${path}/resources/img/mainimg/main_logo.jpg" alt="#" onclick="location.href='${path}/main'" />
				
			</div>
			<!-- header_search_box : 검색창 -->
			<div class="header_search_box">
				<form action="${path}/mainSearchView" method="get">
					<i class="fas fa-search header_search_box_icon"></i> <input
						type="text" name="mainSearchContent" value="${mainSearchContent }"
						class="header_search_box_input" placeholder="검색">
				</form>
			</div>
			<!-- header_login_box : 회원관리부분 -->
			<div class="header_login_box">
			<!-- 로그인 세션 부분 -->
				<c:choose>
				   <c:when test="${loginUserDto eq null }">
		   				<div class="header_login">
							<a href="loginform">로그인</a>
						</div>
						<div class="header_join">
							<a href="joinform">회원가입</a>
						</div>
				   </c:when>
				   <c:otherwise>
	   					<div class="header_login">
							<a href="logout">로그아웃</a>
						</div>
						<div class="header_join">
							<a href="mypage">mypage</a>
						</div>
				   </c:otherwise>
				</c:choose>
			</div>

			<!-- 오른쪽 여백 -->
			<div></div>
		</div>
		<!-- header_bottom : 헤더 아랫부분 -->
		<div id="header_bottom" class="header_bottom">
			<!-- header_category_icon : 카테고리 아이콘 -->
			<div class="header_category_icon">
				<i class="fas fa-bars"></i>
			</div>
			<!-- header_category_list : 카테고리 / list_1~5 : list에 각각 들어갈 내용 -->
			<div class="header_category_list list_1">
				<a href="#" class="openModal">퀵견적</a>
				
			</div>
			<div class="header_category_list list_2">
				<a href="${path}/shop/list">소품샵</a>
			</div>
			<div class="header_category_list list_3">
				<a href="${path}/biz/magazine/bizMgzList">업체 둘러보기</a>
			</div>
			<div class="header_category_list list_4">
				<a href="${path}/oh/OHMainView">우리 집 자랑하기</a>
			</div>
			<div class="header_category_list list_5">
				<a href="${path}/cshome">고객센터</a>
			</div>
		</div>
	</header>
	
	
	
	<main class="Site-content">
		<div class="mypage_category">
			<div class="mypage_category_list list_1">
				<a href="mypage">프로필</a>
			</div>
			<div class="mypage_category_list list_2">
				<a href="#">나의쇼핑</a>
			</div>
			<div class="mypage_category_list list_3">
				<a href="mypagecompanysignup">업체신청</a>
			</div>
			<br>
		</div>
		<div class="mypage_category">
			<div class="mypage_category_list list_1_1">
				<a href="#">주문배송목록</a>
			</div>
			<div class="mypage_category_list list_1_2">나의견적</div>
		</div>
	


	</main>
	<div class="clear"></div>
	<!-- 푸터 -->
	<div id="wrapper">
		<footer>
			<!-- 푸터 로고 -->
			<div class="footer_logo">
				<img src="${path}/resources/img/mainimg/footer_logo.PNG" alt="#"
					onclick="location.href='${path}/main'" />
			</div>
			<!-- 푸터 내용 -->
			<div class="footer_content">(주) 카피바라 주소 : 대한민국 서울시 양천구 목동
				655-19 대표 : 조보근 전화번호 : 010-3017-5283</div>
			<!-- sns 아이콘 -->
			<div class="footer_sns">
				<a href="https://www.facebook.com/"><i
					class="fab fa-facebook fa-lg"></i></a> <a
					href="https://www.youtube.com/"><i class="fab fa-youtube fa-lg"></i></a>
				<a href="https://www.twitter.com/"><i
					class="fab fa-twitter fa-lg"></i></a> <a href="https://www.twitch.tv/"><i
					class="fab fa-twitch fa-lg"></i></a> <a
					href="https://www.instagram.com/"><i
					class="fab fa-instagram fa-lg"></i></a>
			</div>
		</footer>
	</div>

</body>
</html>