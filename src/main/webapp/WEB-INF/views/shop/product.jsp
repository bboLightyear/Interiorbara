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
<link  rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>
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
			<div class="modal" id="reviewModal">
				<div class="modalContent">
					<span class="closeModal" id="reviewModalClose">
						<i class="fa-solid fa-x"></i>
					</span>
					<div class="clear"></div>
					<h3 class="modalTitle">리뷰쓰기</h3>
					별점평가
					<br />
					
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
				</div>
			</div>
		</section>

	</main>
</body>
</html>