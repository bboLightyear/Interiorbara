<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="resources/css/cs/csboard.css" />
</head>
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
		<div class="header_category_list list_1">퀵견적</div>
		<div class="header_category_list list_2">업체 둘러보기</div>
		<div class="header_category_list list_3">소품샵</div>
		<div class="header_category_list list_4">우리 집 자랑하기</div>
		<div class="header_category_list list_5">고객센터</div>
	</div>
</header>

<body>

	<div class="cs_wrap_all">

		<section class="cs_home_section1">

			<div class="cs_wrap_content">
				<div class="cs_wrap_home_notice">

					<div class="cs_home_notice_head">
						<h2 class="cs_home_notice_h2">
							<a href="noticelist" class="cs_home_notice_h2_a">공지사항</a>
						</h2>
						<a href="noticelist" class="cs_home_notice_viewmoew">더보기</a>
					</div>

					<ul class="cs_home_notice_ul">
						<c:forEach items="${noticelist}" var="dto">
							<li class="cs_home_notice_li"><span
								class="cs_home_notice_li_icon">📣</span> <a href=""
								class="cs_home_notice_li_contnet">${dto.nbtitle }</a></li>
						</c:forEach>
					</ul>
				</div>
				<!--cs_wrap_home_notice-->

				<div class="cs_wrap_home_csinfor">
					<h2 class="cs_home_csinfor_h2">
						고객센터<span class="cs_home_csinfor_h2_span">09:00~18:00</span>
					</h2>
					<div class="cs_home_csinfor_pwrap">
						<p class="cs_home_csinfor_p">평일: 전체 문의 상담</p>
						<p class="cs_home_csinfor_p">토요일: 전체(09:00~13:00)</p>
						<p class="cs_home_csinfor_p">일요일: 휴무</p>
					</div>

					<p>
						<span>📞<span> <strong>010-3017-5283</strong>
					</p>

					<a href="chat" class="chatbtn">채팅상담</a> <a href="" class="emailbtn">이메일
						보내기<!--가능하면 할 생각-->
					</a>
					<button class="emailcopy">이메일 주소 복사</button>
				</div>
				<!--cs_wrap_home_csinfor-->
			</div>
			<!--cs_wrap_content-->
		</section>

		<div class="cs_home_white_space">
			<!--qna 위 공백-->
		</div>

		<div class="cs_home_wrap_qnaboard">

			<div class="cs_home_qnaboard_head">
				<h2 class="cs_home_qnaboard_head_h2">
					<a href="qnalist" class="cs_home_qnaboard_head_h2_a1">QnA</a>
					<a href="" class="cs_home_qnaboard_head_h2_a2">더보기</a>
				</h2>
			</div><!--cs_home_wrap_qnaboard-->

			<div class="cs_home_qnaboard_nav_wrap">
				
			<nav class="cs_home_qnaboard_nav">

				<label for="nav_all" class="cs_home_qnaboard_nav_label"> 
					<span><a href="cshome?qnadiv=all" id="nav_all" class="cs_home_qnaboard_nav_label_a">전체</a></span>
				</label> 
							
				<label for="nav_qq" class="cs_home_qnaboard_nav_label"> 
					<span><a href="cshome?qnadiv=qq" id="nav_qq" class="cs_home_qnaboard_nav_label_a">퀵견적</a></span>
				</label> 
							
				<label for="nav_oh" class="cs_home_qnaboard_nav_label"> 
					<span><a href="cshome?qnadiv=oh" id="nav_oh" class="cs_home_qnaboard_nav_label_a">우리집 자랑</a></span>
				</label> 
							
				<label for="nav_biz" class="cs_home_qnaboard_nav_label">
					<span><a href="cshome?qnadiv=biz" id="nav_biz" class="cs_home_qnaboard_nav_label_a">업체 관련</a></span>
				</label> 
							
				<label for="nav_sh" class="cs_home_qnaboard_nav_label"> 
					<span><a href="cshome?qnadiv=sh" id="nav_sh" class="cs_home_qnaboard_nav_label_a">소품샵</a></span>
				</label> 
							
				<label for="nav_pf" class="cs_home_qnaboard_nav_label"> 
					<span><a href="cshome?qnadiv=pf" id="nav_pf" class="cs_home_qnaboard_nav_label_a">로그인/회원정보</a></span>
				</label>
							
			</nav>
			</div>
			<!--cs_home_qnaboard_nav_wrap-->

			<section class="cs_home_section2">
				<div class="cs_home_qna_ul_wrap">
				<ul class="cs_home_qna_ul">
					<c:forEach items="${qnalist}" var="dto">					
						<li class="cs_home_qna_li">
						<span class="cs_home_qna_li_icon">❔</span>
						<a href="qnacontent?qbno=${dto.qbno }" class="cs_home_qna_li_contnet">${dto.qbtitle }</a>
						</li>
					</c:forEach>
				</ul>
				</div>
			</section>

		</div>
		<!--"cs_home_wrap_qnaboard"-->





	</div>
	<!--cs_wrap_all-->



</body>

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
</html>