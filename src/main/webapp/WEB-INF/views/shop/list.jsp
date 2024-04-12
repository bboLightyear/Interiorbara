<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="../resources/js/shop/list.js"></script>
<link rel="stylesheet" href="../resources/css/shop/list.css" />
<link rel="stylesheet" href="../resources/css/main/main.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<body>
	<h3>list.jsp</h3>
	<%
	if (session.getAttribute("userId") == null) {
		session.setAttribute("userId", "1");
	}
	%>
	<h4>userId: <%= session.getAttribute("userId") %></h4>
	<!-- 헤더 -->
	<header>
		<!-- header_top : 헤더 윗부분 -->
		<div class="header_top">
			<!-- 왼쪽 여백 -->
			<div></div>
			<!-- header_logo : 로고 -->
			<div class="header_logo">
				<i class="fas fa-paw"></i>
			</div>
			<!-- header_search_box : 검색창 -->
			<div class="header_search_box">
				<form action="mainSearchView">
					<i class="fas fa-search header_search_box_icon"></i> <input
						type="text" class="header_search_box_input" placeholder="검색">
				</form>
			</div>
			<!-- header_login_box : 회원관리부분 -->
			<div class="header_login_box">
				<div class="header_login">로그인</div>
				<div class="header_join">회원가입</div>
				<div class="header_cs">마이페이지</div>
			</div>
			<!-- 로그인 세션 부분 -->
		<!--<c:choose>
				<c:when test="${sessionNickname eq null }">
					<a href="my/joinform">join</a> | <a href="my/loginform">login</a>
				</c:when>
				<c:otherwise>
    				${sessionNickname }님 로그인 되었습니다.
    				<br />
					<a href="my/mypagemain">mypage</a> | <a href="my/logout">logout</a>
				</c:otherwise>
			</c:choose> -->
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
			<div class="openModal header_category_list list_1">퀵견적</div>
			<div class="header_category_list list_2">업체 둘러보기</div>
			<div class="header_category_list list_3">소품샵</div>
			<div class="header_category_list list_4">우리 집 자랑하기</div>
			<div class="header_category_list list_5">고객센터</div>
		</div>
	</header>
	<a href="management">상품등록</a>
	<div id="wrap">
		<nav>			
			<c:forEach items="${levelCategories }" var="cat">
				<a href="list?categoryId=${cat.category_id }">
					<c:forEach begin="1" end="${cat.level - 1}">&nbsp;&nbsp;&nbsp;</c:forEach>
					${cat.name }
				</a>
				<br />
			</c:forEach>
		</nav>
		<main>
			<h3>${category.name }</h3>
			<br />
	
			<h4>상품 개수: ${productCnt }</h4>
			<table>
				<c:forEach items="${productList }" var="product" varStatus="status">
					<a href="product?productId=${product.product_id }" class="productItem">
						<img src="../resources/upload/shop/${product.rep_img }" class="productRepImg" alt="${product.product_id } 이미지" />
						${product.name }
					</a>
				</c:forEach>
			</table>
		</main>
	</div>
</body>
</html>