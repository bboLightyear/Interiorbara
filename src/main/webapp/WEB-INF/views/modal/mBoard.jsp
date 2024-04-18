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
			<div class="header_category_list list_1">
				<a href="#" class="openModal">퀵견적</a>
			</div>
			<div class="header_category_list list_2">
				<a href="shop/list">소품샵</a>
			</div>
			<div class="header_category_list list_3">
				<a href="biz/magazine/bizMgzList">업체 둘러보기</a>
			</div>
			<div class="header_category_list list_4">
				<a href="oh/OHMainView">우리 집 자랑하기</a>
			</div>
			<div class="header_category_list list_5">
				<a href="cshome">고객센터</a>
			</div>
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
			<div class="mBoard_body_3-service1">서비스</div>
			<div class="mBoard_body_3-service">${modalBoard.m_type}  ${modalBoard.m_size}</div>
			<div class="mBoard_body_3-circs">환경</div>
			<div class="mBoard_body_3-circs-1">${modalBoard.m_circs}</div>
			<div class="mBoard_body_3-circs-2">${modalBoard.m_place}</div>		
			<div class="mBoard_body_3-plus">추가내용</div>
			<div style="white-space: pre-wrap;" id="mBoard-body-contentprice">${modalBoard.m_contentprice}</div>
			<div class="mBoard_body_3-money">
			<div>예상금액</div><div>${modalBoard.m_price}</div>
			</div>
			<div class="mBoard_body_3-caution">
				<ul>
					<li>자가거주 용도의 종합리모델링 평균 금액으로, 임대 혹은 기능적 목적의 수리와는 견적이 다릅니다.</li>
					<li>본 금액은 참고용입니다. 상세 조건, 시공지 상황, 업체별 자재비, 인건비, 상세 시공방법 등에 따라 금액이 달라질 수 있으니, 참고로만 이용해 주세요.</li>
				</ul>
			</div>
		</div>
			<h4>요청사항</h4>
		<div class="mBoard_body_4">
			<div class="mBoard_body_4-time">희망상담시간</div><div>${modalBoard.m_wanttime}</div>
			<div class="mBoard_body_4-date">희망시공일자</div><div>${modalBoard.m_wantdate}</div>
			<div class="mBoard_body_4-content">추가요청내용</div><div>${modalBoard.m_request}</div>
		</div>	

	</div>
	<jsp:include page="../modal/mMain.jsp" />
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