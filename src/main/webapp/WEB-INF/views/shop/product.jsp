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
<title>Insert title here</title>
	<style>
		
		main {
			width: 800px;
			margin: auto;
		}
		
		section#imageView {
			float: left;
			width: 50%;
			background-color: #fffdfd;
		}
		
		section#summary {
			float: right;
			width: 50%;
			background-color: #fdfdff;
		}
		
		.selectedOptionListItem {
			disply: inline-block;
			width: 300px;
			background-color: #f0f0f0;
			margin-top: 5px;
			margin-bottom: 5px;
		}
		
		#imageSideBar {
			float: left;
			width: 10%;
		}
		
		.imageList {
			width: 100%;
		}
		
		#imageMain {
			float: right;
			width:90%;
		}
		
		#imageRepresent {
			width: 100%;
		}
	</style>
</head>
<body>
	
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
	</main>
</body>
</html>