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
<title>Insert title here</title>
</head>
<body id="top">
	<h3>product.jsp</h3>
	<h4>userId: <%= session.getAttribute("userId") %></h4>
	<a href="basket">장바구니</a>
	<br />
	<main data-product-id="${product.product_id }" data-is-discounted="${product.is_discounted }">
		<div>
			<c:forEach items="${categories }" var="cat" varStatus="s">
				<a href="list?categoryId=${cat.category_id }">${cat.name }</a>
				<c:if test="${not s.last }"> > </c:if>
			</c:forEach>
		</div>
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
		<section id="summary">
			판매자: ${product.seller.nickname } <br />
			productId: ${product.product_id } <br />
			name: ${product.name } <br />
			가격: <fmt:formatNumber type="number" pattern="#,###" value="${product.rep_price }"/>원 <br />
			<c:if test="${product.rep_discounted_price ne null }">
			할인율: ${product.discount_rate } <br />
			할인가격: <fmt:formatNumber type="number" pattern="#,###" value="${product.rep_discounted_price }"/>원 <br />
			</c:if>
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
				<input type="button" value="장바구니" onclick="addBasket()"/>
				<input type="button" value="바로구매"/>
			</form>
			<br />
			총 금액 : <span id="totalPrice" data-total-price="0">0원</span>
		</section>
		
		<div class="clear"></div>
		
		<button class="goToBtn" data-to="detailInfo">상세정보</button>
		<button class="goToBtn" data-to="review">리뷰</button>
		<button class="goToBtn" data-to="qna">문의</button>
		<button class="goToBtn" id="topBtn" data-to="top">↑</button>
			
		<section id="detailInfo">
			<h1>상세정보</h1>
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
							review_id: ${review.review_id } <br />
							user_id: ${review.user_id } <br />
							score: ${review.score } <br />
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
				
				<div id="pageButtonWrap">				
					<c:if test="${pageVO.groupPageCount < pageVO.pageEndNum }">
						<table class="pageArrowsTable">
							<tr>
								<td onclick="changeReviewPage(1)"><i class="fa-solid fa-angles-left"></i></td>
								<td onclick="changeReviewPage(${pageVO.pageStartNum - 1})"><i class="fa-solid fa-angle-left"></i></td>
							</tr>
						</table>
					</c:if>
		
					
					<table class="pageButtonTable">
						<tr>
							<c:forEach begin="${pageVO.pageStartNum }" end="${pageVO.pageEndNum }" var="pageNum">
								<td onclick="changeReviewPage(${pageNum })">${pageNum }</td>
							</c:forEach>
						</tr>
					</table>
					
					<c:if test="${pageVO.pageTotalNum > pageVO.pageEndNum }">
						<table class="pageArrowsTable" >
							<tr>
								<td onclick="changeReviewPage(${pageVO.pageEndNum + 1 })"><i class="fa-solid fa-angle-right"></i></td>
								<td onclick="changeReviewPage(${pageVO.pageTotalNum })"><i class="fa-solid fa-angles-right"></i></td>
							</tr>
						</table>
					</c:if>
				</div>
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
			<div class="modal" id="qnaModal">
				<div class="modalContent">
					<span class="closeModal" id="qnaModalClose">
						<i class="fa-solid fa-x"></i>
					</span>
					<div class="clear"></div>
					<h3 class="modalTitle">문의하기</h3>
					<form action="product/regQna" method="post">
						문의 작성 <br />
						<textarea name="reviewContent" id="" cols="30" rows="10" required="required"></textarea>
						<br />
						<input type="submit" value="등록하기" />
					</form>
				</div>
			</div>
		</section>

	</main>
</body>
</html>