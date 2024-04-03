<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="resources/css/noticelist.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<title>Notice List</title>
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
				<i class="fas fa-paw"></i>
			</div>
			<!-- header_search_box : 검색창 -->
			<div class="header_search_box">
				<i class="fas fa-search header_search_box_icon"></i> <input
					type="text" class="header_search_box_input" placeholder="검색">
			</div>
			<!-- header_login_box : 회원관리부분 -->
			<div class="header_login_box">
				<div class="header_login">로그인</div>
				<div class="header_join">회원가입</div>
				<div class="header_cs">마이페이지</div>
			</div>
			<!-- 오른쪽 여백 -->
			<div></div>
		</div>
		<!-- header_bottom : 헤더 아랫부분 -->
		<div class="header_bottom">
			<!-- header_category_icon : 카테고리 아이콘 -->
			<div class="header_category_icon">
				<i class="fas fa-bars"></i>
			</div>
			<!-- header_category_list : 카테고리 / list_1~5 : list에 각각 들어갈 내용 -->
			<div class="header_category_list list_1">퀵견적</div>
			<div class="header_category_list list_2">업체 둘러보기</div>
			<div class="header_category_list list_3">소품샵</div>
			<div class="header_category_list list_4">우리 집 자랑하기</div>
			<div class="header_category_list list_5">고객센터</div>
		</div>
	</header>

	<br>

	<!-- QnA 내용 -->
	<div class="notice_list_body">
		<!-- QnA 타이틀 -->
		<div class="notice_list_title">
			<h1>Notice List</h1>
		</div>
		<!-- 게시판 검색 -->
		<div class="notice_list_body_search_wrap">
			<form action="#">
				<select name="search_options" id="search_option"
					class="notice_list_body_search_option">
					<option value="quick">퀵 견적</option>
					<option value="biz">업체 둘러보기</option>
					<option value="shop">소품샵</option>
					<option value="house">우리 집 자랑하기</option>
				</select>
			</form>
			<!-- 검색 창 -->
			<div class="notice_list_body_search_box">
				<input type="text" class="notice_list_body_search_box_input"
					placeholder="검색"> <i
					class="fas fa-search notice_list_body_search_box_icon"></i>
			</div>
		</div>

		<!---QnA 게시판--->
		<div class="notice_list_board">
			<!-- QnA 게시판 카테고리 -->
			<ul class="notice_list_board_list">
				<li class="board_list board_category w10 border_right">순번</li>
				<li class="board_list board_category w50 border_right">제목</li>
				<li class="board_list board_category w12 border_right">등록자명</li>
				<li class="board_list board_category w15 border_right">등록일</li>
				<li class="board_list board_category w10 ">조회수</li>
			</ul>
			<!--- QnA 게시판 리스트 --->
			<ul class="notice_list_board_list">
				<li class="board_list w10 list_height border_bottom border_right">2</li>
				<li class="board_list w50 list_height border_bottom border_right">제목</li>
				<li class="board_list w12 list_height border_bottom border_right">관리자</li>
				<li class="board_list w15 list_height border_bottom border_right">2019-02-11</li>
				<li class="board_list w10 list_height border_bottom">1</li>
			</ul>
			<ul class="notice_list_board_list">
				<li class="board_list w10 list_height border_bottom border_right">2</li>
				<li class="board_list w50 list_height border_bottom border_right">제목</li>
				<li class="board_list w12 list_height border_bottom border_right">관리자</li>
				<li class="board_list w15 list_height border_bottom border_right">2019-02-11</li>
				<li class="board_list w10 list_height border_bottom">1</li>
			</ul>
			<ul class="notice_list_board_list">
				<li class="board_list w10 list_height border_bottom border_right">2</li>
				<li class="board_list w50 list_height border_bottom border_right">제목</li>
				<li class="board_list w12 list_height border_bottom border_right">관리자</li>
				<li class="board_list w15 list_height border_bottom border_right">2019-02-11</li>
				<li class="board_list w10 list_height border_bottom">1</li>
			</ul>
			<ul class="notice_list_board_list">
				<li class="board_list w10 list_height border_bottom border_right">2</li>
				<li class="board_list w50 list_height border_bottom border_right">제목</li>
				<li class="board_list w12 list_height border_bottom border_right">관리자</li>
				<li class="board_list w15 list_height border_bottom border_right">2019-02-11</li>
				<li class="board_list w10 list_height border_bottom">1</li>
			</ul>
			<ul class="notice_list_board_list">
				<li class="board_list w10 list_height border_bottom border_right">2</li>
				<li class="board_list w50 list_height border_bottom border_right">제목</li>
				<li class="board_list w12 list_height border_bottom border_right">관리자</li>
				<li class="board_list w15 list_height border_bottom border_right">2019-02-11</li>
				<li class="board_list w10 list_height border_bottom">1</li>
			</ul>
		</div>
		<!-- page numbering -->
		<div class="page_number">
			<i class="fas fa-angle-double-left"></i>
			<ul>
				<li class="page_number_list page_number_list_1">1</li>
				<li class="page_number_list page_number_list_2">2</li>
				<li class="page_number_list page_number_list_3">3</li>
				<li class="page_number_list page_number_list_4">4</li>
				<li class="page_number_list page_number_list_5">5</li>
			</ul>
			<i class="fas fa-angle-double-right"></i>
			<!-- 글쓰기 버튼 -->
			<button type="button" onclick="" class="write_button">글쓰기</button>
		</div>
	</div>
	<br>
	<br>
	<!-- 푸터 -->
	<footer>
		<!-- 푸터 로고 -->
		<div class="footer_logo">logo</div>
		<!-- 푸터 내용 -->
		<div class="footer_content">(주) 카피바라 주소 : 대한민국 서울시 양천구 목동 655-19
			대표 : 조보근 전화번호 : 010-3017-5283</div>
		<!-- sns 아이콘 -->
		<div class="footer_sns">
			<i class="fab fa-facebook fa-lg"></i> <i class="fab fa-youtube fa-lg"></i>
			<i class="fab fa-twitter fa-lg"></i> <i class="fab fa-twitch fa-lg"></i>
			<i class="fab fa-instagram fa-lg"></i>
		</div>
	</footer>
</body>
</html>