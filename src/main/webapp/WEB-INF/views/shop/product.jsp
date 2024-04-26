<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="../resources/js/shop/product.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>
<link rel="stylesheet" href="../resources/css/shop/product.css" />
<title>Product Detail</title>
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
				<img src="../resources/img/mainimg/main_logo.jpg" alt="#" onclick="location.href='../'" />
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
				<a href="../shop/list">소품샵</a>
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
		<div class="basket_wrap">
			<a href="basket">장바구니</a>
		</div>
		<br />
		<main data-product-id="${product.product_id }" data-is-discounted="${product.is_discounted }">
			<div class="show_category_list">
				<c:forEach items="${categories }" var="cat" varStatus="s">
					<a href="list?categoryId=${cat.category_id }">${cat.name }</a>
					<c:if test="${not s.last }"> > </c:if>
				</c:forEach>
			</div>
			<div class="top_wrap">
				<div class="image_wrap">
					<section id="imageView">
						<script>
							function changeMainImg() {
								var target = event.target;
								
								$("#imageRepresent").attr("src", $(target).attr("src"));
							}
						</script>
							<div id="imageSideBar">
								<c:forEach items="${images }" var="i" varStatus="s">
									<img class="imageList" src="../resources/upload/shop/${i.file_src }" alt="${s.index }" onmouseenter="changeMainImg()"/>
								</c:forEach>
							</div>
							<div id="imageMain">
								<img id="imageRepresent" src="../resources/upload/shop/${images[0].file_src }" alt="대표이미지" />
							</div>
					</section>
				</div>
				<div class="product_summary">
					<section id="summary">
						<div class="product_seller">
							판매자: ${product.seller.nickname } <br />
						</div>
						<div class="product_name">
							${product.name } <br />
						</div>
						<div class="product_price">
							가격: <fmt:formatNumber type="number" pattern="#,###" value="${product.rep_price }"/>원 <br />
						</div>
						<div class="discounted_price">
							<c:if test="${product.rep_discounted_price ne null }">
							할인율: ${product.discount_rate } <br />
							할인가격: <fmt:formatNumber type="number" pattern="#,###" value="${product.rep_discounted_price }"/>원 <br />
							</c:if>
						</div>
						<div class="delevery_fee">
							배송비: 
							<c:choose>
								<c:when test="${product.delivery_type eq 'free' }">
									무료배송
								</c:when>
								<c:when test="${product.delivery_type eq 'arrival' }">
									착불 <fmt:formatNumber type="number" pattern="#,###" value="${product.delivery_fee }"/>원
								</c:when>
								<c:when test="${product.delivery_type eq 'each' }">
									<fmt:formatNumber type="number" pattern="#,###" value="${product.delivery_fee }"/>원
								</c:when>
								<c:when test="${product.delivery_type eq 'over' }">
									<fmt:formatNumber type="number" pattern="#,###" value="${product.delivery_fee }"/>원,
									<fmt:formatNumber type="number" pattern="#,###" value="${product.ref_price }"/>원 이상 무료배송
								</c:when>
							</c:choose>
						</div>
						<br />
						<br />
						옵션 <br />
						<form action="">
							<div id="optionWrap">
								<c:choose>
									<c:when test="${product.option_type eq '0' }">
										<div class="selectedOptionListItem" data-option-id="${option.option_id }" data-quantity="1" data-non-option="1"
											data-option-price="${option.price }" data-total-price="${option.price }">
											${option.name } <br />
											<button type="button" onclick="quantity(`sub`)">&lt;</button>(<span id="quantityText">1</span>)
											<button type="button" onclick="quantity(`add`)">&gt;</button>
											<span id="priceText">
												<fmt:formatNumber type="number" pattern="#,###" value="${option.price }"/>원
											</span>
										</div>
									</c:when>
			
									<c:when test="${product.option_type eq '1' }">
										<select name="finalOptionSet" id="finalOptionSet" onchange="addOneOptionCard()">
											<option selected disabled>${optionSet.name }</option>
											<c:forEach items="${optionList }" var="option">
												<option value="${option.option_id }">${option.name }
												(<fmt:formatNumber type="number" pattern="#,###" value="${option.price }"/>원)</option>
											</c:forEach>
										</select>
									</c:when>
									
									<c:when test="${product.option_type eq '2' }">
										<select name="optionSet" id="optionSet" onchange="loadSubOptionSet()">
											<option selected disabled>${parentOptionSet.name }</option>
											<c:forEach items="${parentOptionList }" var="parentOption">
												<option value="${parentOption.option_id }">${parentOption.name }</option>
											</c:forEach>
										</select>
										<select name="finalOptionSet" id="finalOptionSet" onchange="addTwoOptionCard()">
											<option selected disabled>${optionSet.name }</option>
											<!-- ajax -->
										</select>
									</c:when>
								</c:choose>
								
								<!-- ajax -->
								
								<br />
							</div>
							<br />
							<div class="basket_button">
								<button type="button" onclick="addBasket()">장바구니에 담기</button>
							</div>
						</form>
						<br />
						총 금액 : <span id="totalPrice" data-total-price="0">0원</span>
					</section>
				</div>
			</div>
			
			<div class="clear"></div>
			
			<div class="button_group">
				<button class="goToBtn" data-to="detailInfo">상세정보</button>
				<button class="goToBtn" data-to="review">리뷰</button>
				<button class="goToBtn" data-to="qna">문의</button>
				<button class="goToBtn" id="topBtn" data-to="top">↑</button>
			</div>
				
			<section id="detailInfo">
				<h1>상세정보</h1>
				<div id="detailImgWrap">
					<c:forEach items="${detailImgs }" var="detailImg">
						<img src="../resources/upload/shop/${detailImg.file_src }" alt="gg"
							class="detailImg" />
					</c:forEach>
				</div>
			</section>
			
			<section id="review">
				<h1>리뷰</h1>
				<button id="writeReviewBtn">리뷰쓰기</button>
				리뷰 개수: ${reviewTotalCnt } <br />
				리뷰 평균: ${reviewAvgScore } <br />
				5점: 
				<div class="reviewScoreBack">
					<div class="reviewScoreBar" id="reviewScore5Bar" data-ratio="${reviewRatio[4] }">
					</div>
				</div> 
				${reviewScoreCnt[4] }<br />
				4점: 
				<div class="reviewScoreBack">
					<div class="reviewScoreBar" id="reviewScore4Bar" data-ratio="${reviewRatio[3] }">
					</div>
				</div>
				${reviewScoreCnt[3] }<br />
				3점: 
				<div class="reviewScoreBack">
					<div class="reviewScoreBar" id="reviewScore3Bar" data-ratio="${reviewRatio[2] }">
					</div>
				</div>
				${reviewScoreCnt[2] }<br />
				2점: 
				<div class="reviewScoreBack">
					<div class="reviewScoreBar" id="reviewScore2Bar" data-ratio="${reviewRatio[1] }">
					</div>
				</div>
				${reviewScoreCnt[1] }<br />
				1점: 
				<div class="reviewScoreBack">
					<div class="reviewScoreBar" id="reviewScore1Bar" data-ratio="${reviewRatio[0] }">
					</div>
				</div>
				${reviewScoreCnt[0] }<br />
				
				<div>
					<ul id="reviewGroup">
						<c:forEach items="${reviews }" var="review">
							<li class="reviewItem">
								작성자 : ${review.user_id } <br />
								평점 : ${review.score } <br /><br />
								<c:if test="${review.file_src ne null }">
									<div>
										<img src="../resources/upload/shop/${review.file_src }" alt="d"
											class="reviewImages" />
									</div>
								</c:if>
								content: ${review.content }
							</li>
						</c:forEach>
					</ul>
				</div>
				
				<div class="modal" id="reviewModal">
					<div class="modalContent">
						<span class="closeModal" id="reviewModalClose">
							<i class="fa-solid fa-x"></i>
						</span>
						<div class="clear"></div>
						<h3 class="modalTitle">리뷰쓰기</h3>
						<form id="reviewForm" action="product/regReview" method="post" enctype="multipart/form-data">
							별점평가 <br />
							<input type="hidden" name="productId" value="${product.product_id }" />
							<div id="reviewScoreWrap">
								<input type="radio" value="1" id="point1" name="reviewScore" class="reviewScore" required="required" />
								<label for="point1">
									<i id="star1" class="fa-solid fa-star reviewStar"></i>
								</label>
								<input type="radio" value="2" id="point2" name="reviewScore" class="reviewScore" required="required" />
								<label for="point2">
									<i id="star2" class="fa-solid fa-star reviewStar"></i>
								</label>
								<input type="radio" value="3" id="point3" name="reviewScore" class="reviewScore" required="required" />
								<label for="point3">
									<i id="star3" class="fa-solid fa-star reviewStar"></i>
								</label>
								<input type="radio" value="4" id="point4" name="reviewScore" class="reviewScore" required="required" />
								<label for="point4">
									<i id="star4" class="fa-solid fa-star reviewStar"></i>
								</label>
								<input type="radio" value="5" id="point5" name="reviewScore" class="reviewScore" required="required" />
								<label for="point5">
									<i id="star5" class="fa-solid fa-star reviewStar"></i>
								</label>
							</div>
							<br />
							사진 첨부 (선택)<br />
							<input type="file" name="reviewImage" accept="image/*" />
							<br />
							리뷰 작성 <br />
							<textarea name="reviewContent" id="" cols="30" rows="10" required="required"></textarea>
							<br />
							<input type="submit" value="등록하기" />
						</form>
					</div>
				</div>
			</section>
			
			<section id="qna">
				<h1>문의</h1>
				<button id="writeQnaBtn">문의하기</button>
				문의 개수: ${qnaTotalCnt } <br />
				<div>
					<ul id="qnaGroup">
						<c:forEach items="${qnas }" var="qna">
							<li class="qnaItem">
								작성자 : ${qna.user_id } <br />
								문의 내용: ${qna.q_content } <br />
							</li>
						</c:forEach>
					</ul>
				</div>
				
				<div class="modal" id="qnaModal">
					<div class="modalContent">
						<span class="closeModal" id="qnaModalClose">
							<i class="fa-solid fa-x"></i>
						</span>
						<div class="clear"></div>
						<h3 class="modalTitle">문의하기</h3>
						<form action="product/regQna" method="post">
							<input type="hidden" name="productId" value="${product.product_id }" />
							문의 작성 <br />
							<textarea name="qnaContent" id="" cols="30" rows="10" required="required"></textarea>
							<br />
							<input type="submit" value="등록하기" />
						</form>
					</div>
				</div>
			</section>
	
		</main>
	</div>
	<br />
	<br />
	<!-- 푸터 -->
	<footer>
		<!-- 푸터 로고 -->
		<div class="footer_logo">
			<img src="../resources/img/mainimg/footer_logo.PNG" alt="#" onclick="location.href='main'"  />
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