<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
						<a href="${path}/my/loginform">로그인</a>
					</div>
					<div class="header_join">
						<a href="${path}/my/joinform">회원가입</a>
					</div>
			   </c:when>
			   <c:otherwise>
   					<div class="header_login">
						<a href="${path}/my/logout">로그아웃</a>
					</div>
					<div class="header_join">
						<a href="${path}/my/mypage">mypage</a>
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
