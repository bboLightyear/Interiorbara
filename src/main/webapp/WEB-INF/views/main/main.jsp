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
				<img src="resources/img/mainimg/main_logo.jpg" alt="#" onclick="location.href='main'" />
			</div>
			<!-- header_search_box : 검색창 -->
			<div class="header_search_box">
				<form action="mainSearchView" method="get">
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
							<a href="my/loginform">로그인</a>
						</div>
						<div class="header_join">
							<a href="my/joinform">회원가입</a>
						</div>
				   </c:when>
				   <c:otherwise>
					${loginUserDto.nickname }님 로그인 되었습니다. <br />
					${loginUserDto.memno}번 회원님 로그인 되었습니다. <br />   
					${loginUserDto.email}님 로그인 되었습니다.<br />
	   					<div class="header_login">
							<a href="my/logout">로그아웃</a>
						</div>
						<div class="header_join">
							<a href="my/mypage">mypage</a>
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
	<br />
	<br />
	<div class="body_section">
		<!--carousel_main : 최상위 클래스로 캐러셀의 전체 구조를 잡아줍니다.
        carousel_wrapper : 캐러셀 슬라이드의 전체 구조를 잡아줍니다.
        carousel_slide : 캐러셀 이미지를 설정합니다.
        carousel_button_container : 슬라이드를 넘기기 위한 사이드 버튼의 전체 구조를 잡아줍니다.
        carousel_pagination : 캐러셀 중앙 버튼의 전체 구조를 잡아줍니다.
        carousel_circle : 캐러셀 중앙 버튼을 설정합니다.-->
		<div class="carousel_whole_wrap">
			<div class="carousel_main">
				<div class="carousel_wrapper">
					<div class="carousel_slide">
						<img src="resources/img/mainimg/footer_logo.PNG" alt="#" />
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
			<!-- 캐러셀 중앙 버튼 -->
			<div class="carousel_pagination">
				<div class="carousel_circle"></div>
				<div class="carousel_circle"></div>
				<div class="carousel_circle"></div>
				<div class="carousel_circle"></div>
				<div class="carousel_circle"></div>
				<div class="carousel_circle"></div>
			</div>
			<!-- 캐러셀 작동 js -->
			<script>
				var swiper = document.querySelector('.carousel_wrapper');
				var bullets = document.querySelectorAll('.carousel_circle');
				var currentSlide = 0;
				function showSlide(slideIndex) {
					swiper.style.transform = "translateX(-" + slideIndex * 700
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
				bullets.forEach(function(bullet, index) {
					bullet.addEventListener('click', function() {
						showSlide(index);
					});
				});
				showSlide(0);
				setInterval(function(intervalSlide){
					if (currentSlide < 6) {
						showSlide(currentSlide + 1);
					}
					if (currentSlide == 6) {
						showSlide(0);
					}
				}, 2000);
			</script>
			
			<div class="carousel_main2">
				<div class="carousel_wrapper2">
					<div class="carousel_slide2">
						<img src="resources/img/mainimg/footer_logo.PNG" alt="#" />
					</div>
					<div class="carousel_slide2">
						<img src="resources/img/mainimg/0.gif" alt="#" />
					</div>
					<div class="carousel_slide2">
						<img src="resources/img/mainimg/1.gif" alt="#" />
					</div>
					<div class="carousel_slide2">
						<img src="resources/img/mainimg/2.gif" alt="#" />
					</div>
					<div class="carousel_slide2">
						<img src="resources/img/mainimg/3.gif" alt="#" />
					</div>
					<div class="carousel_slide2">
						<img src="resources/img/mainimg/4.gif" alt="#" />
					</div>
				</div>
			</div>
			<!-- 캐러셀 중앙 버튼 -->
			<div class="carousel_pagination2">
				<div class="carousel_circle2"></div>
				<div class="carousel_circle2"></div>
				<div class="carousel_circle2"></div>
				<div class="carousel_circle2"></div>
				<div class="carousel_circle2"></div>
				<div class="carousel_circle2"></div>
			</div>
		</div>
		<!-- 캐러셀 작동 js -->
		<script>
			var swiper2 = document.querySelector('.carousel_wrapper2');
			var bullets2 = document.querySelectorAll('.carousel_circle2');
			var currentSlide2 = 0;
			function showSlide2(slideIndex2) {
				swiper2.style.transform = "translateX(-" + slideIndex2 * 400
						+ "px)";
				currentSlide2 = slideIndex2;
				bullets2.forEach(function(bullet2, index2) {
					if (index2 === currentSlide2) {
						bullet2.classList.add('active');
					} else {
						bullet2.classList.remove('active');
					}
				});
			}
			bullets2.forEach(function(bullet2, index2) {
				bullet2.addEventListener('click', function() {
					showSlide2(index2);
				});
			});
			showSlide2(0);
			setInterval(function(intervalSlide2){
				if (currentSlide2 < 6) {
					showSlide2(currentSlide2 + 1);
				}
				if (currentSlide2 == 6) {
					showSlide2(0);
				}
			}, 3000);
		</script>
		<br />
		<div id="category_button" class="category_button_wrap">
			<button id="category_button" class="openModal category_button category_1">
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
            <button class="openModal side_bar_button button_1">
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
			<img src="resources/img/mainimg/footer_logo.PNG" alt="#" onclick="location.href='main'"  />
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