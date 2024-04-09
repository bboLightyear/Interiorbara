<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="mainCSS/main.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<title>Main</title>
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
	<br />
	<br />
	<div class="body_section">
		<!--carousel_main : 최상위 클래스로 캐러셀의 전체 구조를 잡아줍니다.
        carousel_wrapper : 캐러셀 슬라이드의 전체 구조를 잡아줍니다.
        carousel_slide : 캐러셀 이미지를 설정합니다.
        carousel_button_container : 슬라이드를 넘기기 위한 사이드 버튼의 전체 구조를 잡아줍니다.
        carousel_prev / carousel_next : 캐러셀 사이드 버튼을 설정하고 svg 태그를 사용했습니다.
        carousel_pagination : 캐러셀 중앙 버튼의 전체 구조를 잡아줍니다.
        carousel_circle : 캐러셀 중앙 버튼을 설정합니다.-->
		<div class="carousel_whole_wrap">
			<!-- 캐러셀 왼쪽 버튼 -->
			<div class="carousel_prev_button_container">
				<button type="button" class="carousel_prev">
					<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
						fill="currentColor" class="bi bi-chevron-double-left"
						viewBox="0 0 16 16">
				        <path fill-rule="evenodd"
							d="M8.354 1.646a.5.5 0 0 1 0 .708L2.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z" />
				        <path fill-rule="evenodd"
							d="M12.354 1.646a.5.5 0 0 1 0 .708L6.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z" />
				    </svg>
				</button>
			</div>
			<div class="carousel_main">
				<div class="carousel_wrapper">
					<div class="carousel_slide">
						<img src="mainImagesOH/1711080291545_집사진2.jpg" alt="#" />
						<!-- 차후 table에서 저장되는 파일양식을 불러오는 방향으로 변경할 예정 -->
					</div>
					<div class="carousel_slide">
						<img src="resources/img/mainimg/0.gif" alt="#" />
					</div>
					<div class="carousel_slide">
						<img src="resources/img/mainimg/1.gif" alt="#" />
					</div>
					<div class="carousel_slide">
						<img src="resources/img/mainimg/2.gif" alt="#" />
					</div>
					<div class="carousel_slide">
						<img src="resources/img/mainimg/3.gif" alt="#" />
					</div>
					<div class="carousel_slide">
						<img src="resources/img/mainimg/4.gif" alt="#" />
					</div>
				</div>
			</div>
			<!-- 캐러셀 오른쪽 버튼 -->
			<div class="carousel_next_button_container">
				<button type="button" class="carousel_next">
					<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
						fill="currentColor" class="bi bi-chevron-double-right"
						viewBox="0 0 16 16">
                        <path fill-rule="evenodd"
							d="M3.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L9.293 8 3.646 2.354a.5.5 0 0 1 0-.708z" />
                        <path fill-rule="evenodd"
							d="M7.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L13.293 8 7.646 2.354a.5.5 0 0 1 0-.708z" />
                    </svg>
				</button>
			</div>
			<!-- 캐러셀 중앙 버튼 -->
			<div class="carousel_pagination">
				<div class="carousel_circle"></div>
				<div class="carousel_circle"></div>
				<div class="carousel_circle"></div>
				<div class="carousel_circle"></div>
			</div>
		</div>
		<!-- 캐러셀 작동 js -->
		<script>
			
		<%-- JSP scriptlet to generate JavaScript code dynamically --%>
			var swiper = document.querySelector('.carousel_wrapper');
			var prevButtons = document.querySelectorAll('.carousel_prev');
			var nextButtons = document.querySelectorAll('.carousel_next');
			var bullets = document.querySelectorAll('.carousel_circle');
			var currentSlide = 0;
			function showSlide(slideIndex) {
				swiper.style.transform = "translateX(-" + slideIndex * 300
						+ "px)";
				currentSlide = slideIndex;
				bullets.forEach(function(bullet, index) {
					if (index === currentSlide) {
						bullet.classList.add('active');
					} else {
						bullet.classList.remove('active');
					}
				});
			}
			prevButtons.forEach(function(prevButton) {
				prevButton.addEventListener('click', function() {
					if (currentSlide > 0) {
						showSlide(currentSlide - 1);
					}
				});
			});
			nextButtons.forEach(function(nextButton) {
				nextButton.addEventListener('click', function() {
					if (currentSlide < 3) {
						showSlide(currentSlide + 1);
					}
				});
			});
			bullets.forEach(function(bullet, index) {
				bullet.addEventListener('click', function() {
					showSlide(index);
				});
			});
			showSlide(0);
		</script>
		<br />
		<div class="category_button_wrap">
			<button  class="openModal category_button category_1">
				<span>퀵견적</span>
			</button>
			<jsp:include page="../modal/mMain.jsp" />
			<button onclick="location.href='shop/list'" id="category_button" class="category_button category_2">
				<span>소품 샵</span>
			</button>
			<button onclick="location.href='biz/magazine/bizMgzList'" id="category_button" class="category_button category_3">
				<span>업체 <br> 둘러보기
				</span>
			</button>
			<button onclick="location.href='oh/OHMainView'" id="category_button" class="category_button category_4">
				<span>우리 집 <br> 자랑하기
				</span>
			</button>
			<button onclick="location.href='cshome'" id="category_button" class="category_button category_5">
				<span>고객센터</span>
			</button>
			<br />
		</div>
		<div class="main_preview_wrap">
			<div class="main_preview">
				<h1 class="main_preview_title"><a href="biz/magazine/bizMgzList">입점 업체 보기</a></h1>
				<hr />
				<div class="main_preview_biz">
					<c:forEach items="${bizPreviewList }" var="biz">
						<div class="main_preview_biz_list">
							<ul>
								<li class="main_preview_biz_img">
									<img src="resources/upload/main/${biz.biz_img }" alt="#" />
								</li>
							</ul>
							<ul>
								<li class="main_preview_biz_name">${biz.biz_name }</li>
							</ul>
							<ul>
								<li class="main_preview_biz_addr">${biz.biz_addr }</li>
							</ul>
							<ul>
								<li class="main_preview_biz_chat"><a
									href="https://www.naver.com" class="main_preview_biz_chat_link">채팅
										바로가기 <i class="far fa-comment-alt"></i>
								</a></li>
							</ul>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="main_preview">
				<h1 class="main_preview_title"><a href="shop/list">소품 샵</a></h1>
				<hr />
				<div class="main_preview_shop">
					<c:forEach items="${shopPreviewList }" var="shop">
					<div class="main_preview_shop_list">
						<ul>
							<li class="main_preview_shop_img">
								<img src="resources/upload/main/${shop.shop_img }" alt="#" />
							</li>
						</ul>
						<ul>
							<li class="main_preview_shop_name">${shop.shop_name }</li>
						</ul>
						<ul>
							<li class="main_preview_shop_price">\ ${shop.shop_price }</li>
						</ul>
						<ul>
							<li class="main_preview_shop_chat"><a
								href="https://www.naver.com" class="main_preview_shop_chat_link">채팅
									바로가기 <i class="far fa-comment-alt"></i>
							</a></li>
						</ul>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="main_preview">
				<h1 class="main_preview_title"><a href="oh/OHMainView">우리집 자랑하기</a></h1>
				<hr />
				<div class="main_preview_OH">
					<c:forEach items="${ohPreviewList }" var="oh">
						<div class="main_preview_OH_list">
							<ul>
								<li class="main_preview_OH_img">
									<img src="resources/upload/main/${oh.oh_img }" alt="#" />
								</li>
							</ul>
							<ul>
								<li class="main_preview_OH_name">${oh.oh_name }</li>
							</ul>
							<ul>
								<li class="main_preview_OH_content">${oh.oh_content }</li>
							</ul>
							<ul>
								<li class="main_preview_OH_chat"><a
									href="https://www.naver.com" class="main_preview_OH_chat_link">채팅
										바로가기 <i class="far fa-comment-alt"></i>
								</a></li>
							</ul>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="main_preview_cs">
				<div class="main_preview_cs_notice">
					<h1 class="main_preview_title"><a href="noticelist">공지사항</a></h1>
					<hr>
					<div class="main_preview_cs_notice_board">
						<ul>
							<li class="main_preview_cs_notice_category w10 bb">번호</li>
							<li class="main_preview_cs_notice_category w30 bb">제목</li>
							<li class="main_preview_cs_notice_category w20 bb">작성자</li>
							<li class="main_preview_cs_notice_category w15 bb">조회수</li>
							<li class="main_preview_cs_notice_category w24 bb">작성일</li>
						</ul>
						<c:forEach items="${noticePreviewList }" var="notice">
							<ul>
								<li class="main_preview_cs_notice_category w10">${notice.notice_no }</li>
								<li class="main_preview_cs_notice_category w30">${notice.notice_title }</li>
								<li class="main_preview_cs_notice_category w20">${notice.notice_writer }</li>
								<li class="main_preview_cs_notice_category w15">${notice.notice_hit }</li>
								<li class="main_preview_cs_notice_category w24">${notice.notice_date }</li>
							</ul>
						</c:forEach>
					</div>
				</div>
				<div class="main_preview_cs_qna">
					<h1 class="main_preview_title"><a href="qnalist">QnA</a></h1>
					<hr>
					<div class="main_preview_cs_qna_board">
						<ul>
							<li class="main_preview_cs_qna_category w10 bb">번호</li>
							<li class="main_preview_cs_qna_category w30 bb">제목</li>
							<li class="main_preview_cs_qna_category w20 bb">작성자</li>
							<li class="main_preview_cs_qna_category w15 bb">조회수</li>
							<li class="main_preview_cs_qna_category w24 bb">작성일</li>
						</ul>
						<c:forEach items="${qnaPreviewList }" var="qna">
							<ul>
								<li class="main_preview_cs_qna_category w10">${qna.qna_no }</li>
								<li class="main_preview_cs_qna_category w30">${qna.qna_title }</li>
								<li class="main_preview_cs_qna_category w20">${qna.qna_writer }</li>
								<li class="main_preview_cs_qna_category w15">${qna.qna_hit }</li>
								<li class="main_preview_cs_qna_category w24">${qna.qna_date }</li>
							</ul>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
        <div id="main_left_side_bar" class="main_left_side_bar">
            <button  class="openModal side_bar_button button_1">
				<span>퀵견적</span>
			</button>
			
			<button onclick="location.href='shop/list'"	class="side_bar_button button_2">
				<span>소품 샵</span>
			</button>
			<button class="side_bar_button button_3" onclick="location.href='biz/magazine/bizMgzList'" >
				<span>업체 <br> 둘러보기
				</span>
			</button>
			<button onclick="location.href='oh/OHMainView'"	class="side_bar_button button_4">
				<span>우리 집 <br> 자랑하기
				</span>
			</button>
			<button onclick="location.href='cshome'" class="side_bar_button button_5">
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
            
            if(scrollHeight > 650) {
                mainLeftSideBar.style.visibility = 'visible';
                mainLeftSideBar.style.opacity = '1';
            } else {
                mainLeftSideBar.style.visibility = 'hidden';
                mainLeftSideBar.style.opacity = '0';
            }
        });
        </script>
        <script>
            var side_bar
        </script>
		<hr />
	</div>
	<br />
	<br />
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