<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Main</title>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/modal.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	
   
</head>

<body class="body">
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
	
	<div class="mBoard_body">
	    	<h3>견적 상세</h3>
		<div class="mBoard_body_1">
	    	<div>작성일  ${modalBoard.m_date} (견적번호 ${modalBoard.estino})</div>	    	
	    </div>
	    
	    	<h4>고객 정보</h4>
	    <div class="mBoard_body_2">
	    	<div class="mBoard-info">받는사람</div><div class="mBoard-info2">${modalBoard.name}</div>
	    	<div class="mBoard-info">연락처</div><div class="mBoard-info2">${modalBoard.phone}</div>
	    	<div class="mBoard-info">이메일</div><div class="mBoard-info2">${modalBoard.email}</div>
	    	<div class="mBoard-info">주소</div><div class="mBoard-info2">${modalBoard.m_addr}</div>
	    </div>
	    	<h4>견적 내용</h4>
		<div class="mBoard_body_3">
			<div class="mBoard_body_3-service">${modalBoard.m_type}  ${modalBoard.m_size}</div>
			<div class="mBoard_body_3-circs">환경</div>
			<div class="mBoard_body_3-circs-1">${modalBoard.m_circs}</div>
			<div class="mBoard_body_3-circs-2">${modalBoard.m_place}</div>		
			<div class="mBoard_body_3-plus">추가내용</div>
			<div style="white-space: pre-wrap;" id="mBoard-body-contentprice">${modalBoard.m_contentprice}</div>
			<div class="mBoard_body_3-money">
			<div>예상금액</div><div>${modalBoard.m_price}</div>
			</div>
		</div>
			<h4>요청사항</h4>
		<div class="mBoard_body_4">
			<div class="mBoard_body_4-time">희망상담시간</div><div>${modalBoard.m_wanttime}</div>
			<div class="mBoard_body_4-date">희망시공일자</div><div>${modalBoard.m_wantdate}</div>
			<div class="mBoard_body_4-content">추가요청내용</div><div>${modalBoard.m_request}</div>
		</div>	

	</div>
	
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