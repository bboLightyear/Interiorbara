<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/header_footer.css" />
<link rel="stylesheet" href="mainCSS/sidebar.css" />
<link rel="stylesheet" type="text/css" href="mainCSS/mainSearchView.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<title>Search View</title>
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
				<img src="${path}/resources/img/mainimg/logo_1_small_1459x344.jpg" alt="#" onclick="location.href='${path}/main'" />
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
				   		<div class="header_nickname">
						   	${loginUserDto.nickname }님 <br />
				   		</div>
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
			<div class="header_category_list list_1">
				<a href="#" class="openModal">퀵견적</a>
			</div>
			<jsp:include page="../modal/mMain.jsp" />
			<div class="header_category_list list_2">
				<a href="${path}/shop/list">소품샵</a>
			</div>
			<div class="header_category_list list_3">
				<a href="${path}/biz/search/bizAddrSearch">업체 둘러보기</a>
			</div>
			<div class="header_category_list list_4">
				<a href="${path}/oh/OHMainView">우리 집 자랑하기</a>
			</div>
			<div class="header_category_list list_5">
				<a href="${path}/cshome">고객센터</a>
			</div>
		</div>
	</header>
	<br />
	<br />
	<div class="body_section">
		<div class="search_result">
			<h2>업체 검색</h2>
			<hr />
            <div class="result_content_wrap biz_wrap">
				<c:forEach items="${bizSearchList }" var="bizSearch" varStatus="loop">
		            <div class="result_title">
		              	 검색 결과 ${loop.index + 1}
		            </div>
					<div class="result_content">
						업체 이름 : ${bizSearch.bh_name }
					</div>
					<div class="result_content">
						업체 주소 : ${bizSearch.bh_addr1 } ${bizSearch.bh_addr2 }
					</div>
				</c:forEach>
            </div>
            <div class="result_more biz_more">
                <a href="${path}/biz/search/bizAddrSearch"> &#183;&#183;&gt; 검색 결과 더보기 &lt;&#183;&#183; </a>
            </div>
            <div class="result_none biz_none"> 검색 결과 없음 </div>
		</div>
		<div class="search_result">
			<h2>소품 샵 검색</h2>
			<hr />
            <div class="result_content_wrap shop_wrap">
				<c:forEach items="${shopSearchList }" var="shopSearch" varStatus="loop">
		            <div class="result_title">
		              	 검색결과 ${loop.index + 1}
		            </div>
					<div class="result_content">
						상품 이름 : ${shopSearch.shop_name }
					</div>
					<div class="result_content">
						상품 가격 : ${shopSearch.shop_price }
					</div>
				</c:forEach>
            </div>
            <div class="result_more shop_more">
                <a href="${path}/shop/list"> &#183;&#183;&gt; 검색 결과 더보기 &lt;&#183;&#183; </a>
            </div>
            <div class="result_none shop_none"> 검색 결과 없음 </div>
		</div>
		<div class="search_result">
			<h2>우리 집 자랑 게시판 검색</h2>
			<hr />
            <div class="result_content_wrap oh_wrap">
				<c:forEach items="${ohSearchList }" var="ohSearch" varStatus="loop">
		            <div class="result_title">
		              	 검색결과 ${loop.index + 1}
		            </div>
					<div class="result_content">
						제목 : ${ohSearch.oh_name }
					</div>
					<div class="result_content">
						내용 : ${ohSearch.oh_content }
					</div>
				</c:forEach>
            </div>
            <div class="result_more oh_more">
                <a href="${path}/oh/OHMainView"> &#183;&#183;&gt; 검색 결과 더보기 &lt;&#183;&#183; </a>
            </div>
            <div class="result_none oh_none"> 검색 결과 없음 </div>
		</div>
		<div class="search_result">
			<h2>공지사항 검색</h2>
			<hr />
            <div class="result_content_wrap notice_wrap">
				<c:forEach items="${noticeSearchList }" var="noticeSearch" varStatus="loop">
		            <div class="result_title">
		              	 검색결과 ${loop.index + 1}
		            </div>
					<div class="result_content">
						공지 제목 : ${noticeSearch.notice_title }
					</div>
					<div class="result_content">
						작성 날짜 : ${noticeSearch.notice_date }
					</div>
				</c:forEach>
            </div>
            <div class="result_more notice_more">
                <a href="${path}/noticelist"> &#183;&#183;&gt; 검색 결과 더보기 &lt;&#183;&#183; </a>
            </div>
            <div class="result_none notice_none"> 검색 결과 없음 </div>
		</div>
		<div class="search_result">
			<h2>QnA 검색</h2>
			<hr />
            <div class="result_content_wrap qna_wrap">
				<c:forEach items="${qnaSearchList }" var="qnaSearch" varStatus="loop">
		            <div class="result_title">
		              	 검색결과 ${loop.index + 1}
		            </div>
					<div class="result_content">
						QnA 제목 : ${qnaSearch.qna_title }
					</div>
					<div class="result_content">
						QnA 작성자 : ${qnaSearch.qna_writer }
					</div>
					<div class="result_content">
						작성 날짜 : ${qnaSearch.qna_date }
					</div>
				</c:forEach>
            </div>
            <div class="result_more qna_more">
                <a href="${path}/qnalist"> &#183;&#183;&gt; 검색 결과 더보기 &lt;&#183;&#183; </a>
            </div>
            <div class="result_none qna_none"> 검색 결과 없음 </div>
		</div>
		<script>
 	    window.onload = function() {
		        var bizSearchList = ${bizSearchList};
		        if (bizSearchList == null || bizSearchList.length === 0) {
		            var bizNoResult = document.getElementsByClassName('biz_none');
		            var bizWrapResult = document.getElementsByClassName('biz_wrap');
		            var bizMoreResult = document.getElementsByClassName('biz_more');
		            for (var i = 0; i < bizNoResult.length; i++) {
		            	bizNoResult[i].style.display = 'block';
		            	bizWrapResult[i].style.display = 'none';
		            	bizMoreResult[i].style.display = 'none';
		            }
		        }
		        
		        var shopSearchList = ${shopSearchList};
		        if (shopSearchList == null || shopSearchList.length === 0) {
		            var shopNoResult = document.getElementsByClassName('shop_none');
		            var shopWrapResult = document.getElementsByClassName('shop_wrap');
		            var shopMoreResult = document.getElementsByClassName('shop_more');
		            for (var i = 0; i < shopNoResult.length; i++) {
		            	shopNoResult[i].style.display = 'block';
		            	shopWrapResult[i].style.display = 'none';
		            	shopMoreResult[i].style.display = 'none';
		            }
		        }
		        
		        var ohSearchList = ${ohSearchList};
		        if (ohSearchList == null || ohSearchList.length === 0) {
		            var ohNoResult = document.getElementsByClassName('oh_none');
		            var ohWrapResult = document.getElementsByClassName('oh_wrap');
		            var ohMoreResult = document.getElementsByClassName('oh_more');
		            for (var i = 0; i < ohNoResult.length; i++) {
		            	ohNoResult[i].style.display = 'block';
		            	ohWrapResult[i].style.display = 'none';
		            	ohMoreResult[i].style.display = 'none';
		            }
		        }
		        
		        var noticeSearchList = ${noticeSearchList};
		        if (noticeSearchList == null || noticeSearchList.length === 0) {
		            var noticeNoResult = document.getElementsByClassName('notice_none');
		            var noticeWrapResult = document.getElementsByClassName('notice_wrap');
		            var noticeMoreResult = document.getElementsByClassName('notice_more');
		            for (var i = 0; i < noticeNoResult.length; i++) {
		            	noticeNoResult[i].style.display = 'block';
		            	noticeWrapResult[i].style.display = 'none';
		            	noticeMoreResult[i].style.display = 'none';
		            }
		        }
		        
		    	var qnaSearchList = ${qnaSearchList};
		        if (qnaSearchList == null || qnaSearchList.length === 0) {
		            var qnaNoResult = document.getElementsByClassName('qna_none');
		            var qnaWrapResult = document.getElementsByClassName('qna_wrap');
		            var qnaMoreResult = document.getElementsByClassName('qna_more');
		            for (var i = 0; i < qnaNoResult.length; i++) {
		            	qnaNoResult[i].style.display = 'block';
		            	qnaWrapResult[i].style.display = 'none';
		            	qnaMoreResult[i].style.display = 'none';
		            }
		        }
		    }
		</script>
	</div>
	<br />
        <div id="main_left_side_bar" class="main_left_side_bar">
            <button class="openModal side_bar_button button_1">
				<span>퀵견적</span>
			</button>
			<button onclick="location.href='${path}/shop/list'"	class="side_bar_button button_2">
				<span>소품 샵</span>
			</button>
			<button class="side_bar_button button_3" onclick="location.href='${path}/biz/search/bizAddrSearch'" >
				<span>업체 <br> 둘러보기
				</span>
			</button>
			<button onclick="location.href='${path}/oh/OHMainView'"	class="side_bar_button button_4">
				<span>우리 집 <br> 자랑하기
				</span>
			</button>
			<button onclick="location.href='${path}/cshome'" class="side_bar_button button_5">
				<span>고객센터</span>
			</button>
        </div>

        <script>
        window.addEventListener('scroll', function() {
            var scrollHeight = window.scrollY;
            var headerBottom = document.getElementById('header_bottom');
            var mainLeftSideBar = document.getElementById('main_left_side_bar');

            if(scrollHeight > 10) {
                headerBottom.style.visibility = 'hidden';
                headerBottom.style.opacity ='0';
            } else {
                headerBottom.style.visibility = 'visible';
                headerBottom.style.opacity ='1';
            }
            
            if(scrollHeight > 700) {
                mainLeftSideBar.style.visibility = 'visible';
                mainLeftSideBar.style.opacity = '1';
            } else {
                mainLeftSideBar.style.visibility = 'hidden';
                mainLeftSideBar.style.opacity = '0';
            }
        });
        </script>
		<hr />
	</div>
	<br />
	<br />
	<!-- 푸터 -->
	<footer>
		<!-- 푸터 로고 -->
		<div class="footer_logo">
			<img src="resources/img/mainimg/logo_3_1500x1500.jpg" alt="#" onclick="location.href='${path}/main'"  />
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
</body>
</html>