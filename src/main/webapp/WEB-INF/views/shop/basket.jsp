<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="../resources/js/shop/basket.js"></script>
<link rel="stylesheet" href="../resources/css/shop/basket.css" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>basket.jsp</h3>
	<main>
		<div id="contentWrap">
		
			<input type="checkbox" id="checkAll" checked />
			<label for="checkAll">전체선택</label>
			
			<ul id="productGroup">
			
				<c:set var="basketTotalPrice" value="0" />
				<c:set var="basketTotalDPrice" value="0" />
				<c:set var="basketTotalDelivery" value="0" />
				
				<c:forEach items="${products }" var="product">
				
					<c:set var="productTotalPrice" value="0" />
					<c:set var="productTotalDPrice" value="0" />
					<c:set var="productTotalDelivery" value="0" />
					<c:set var="isDiscounted" value="${product.is_discounted eq 'Y' }" />
					
					<li class="productItem" data-product-id="${product.product_id }">
					
						<input type="checkbox" class="productCheckBox" data-product-id="${product.product_id }" checked />
						
						${product.name }
						 
						<button class="removeBtn" data-btn-of="product" data-product-id="${product.product_id }">X</button>
						
						<ul class="selectedOptionGroup">
						
							<c:forEach items="${baskets }" var="basket" varStatus="status">
							
								<c:if test="${product.product_id eq basket.product_id }">
								
									<c:set var="optionTotalPrice" value="${basket.option.price * basket.quantity }"/>
									<c:set var="optionTotalDPrice" value="${isDiscounted ? basket.option.discounted_price * basket.quantity : 0 }"/>
									<c:set var="productTotalPrice" value="${productTotalPrice + optionTotalPrice }"/>
									<c:set var="productTotalDPrice" value="${productTotalDPrice + optionTotalDPrice }"/>
									
									<li class="selectedOption" data-basket-id="${basket.basket_id }"
										data-option-id="${basket.option_id }"
										data-product-id="${basket.product_id }"
										data-quantity="${basket.quantity }"
										data-option-price="${basket.option.price }"
										data-option-d-price="${basket.option.discounted_price != null ? basket.option.discounted_price : 0 }"
										data-option-total-price="${optionTotalPrice }"
										data-option-total-d-price="${optionTotalDPrice }">
										
										<div>
											${basket.option_text }
											<button class="removeBtn" data-btn-of="option" data-option-id="${basket.option_id }">X</button>
										</div>
										
										<button type="button" class="quantityBtn" data-action="sub" data-option-id="${basket.option_id }">&lt;</button>
										(<span class="optionQuantityText" data-option-id="${basket.option_id }">${basket.quantity }</span>)
										<button type="button" class="quantityBtn" data-action="add" data-option-id="${basket.option_id }">&gt;</button>
										
										<span class="optionPriceText" data-option-id="${basket.option_id }">
											<fmt:formatNumber type="number" pattern="#,###" value="${optionTotalDPrice != 0 ? optionTotalDPrice : optionTotalPrice }"/></span>원
									</li>
									
								</c:if>
								
							</c:forEach>
							
						</ul>
						
						<c:set var="basketTotalPrice" value="${basketTotalPrice + productTotalPrice }"/>
						<c:set var="basketTotalDPrice" value="${basketTotalDPrice + productTotalDPrice }"/>
						<c:set var="basketTotalDelivery" value="${basketTotalDelivery + product.delivery_fee }" />
						
						총 금액: <span class="productTotalPrice" data-product-id="${product.product_id }"
									data-product-total-price="${productTotalPrice }"
									data-product-total-d-price="${productTotalDPrice }">
									<fmt:formatNumber type="number" pattern="#,###" value="${productTotalDPrice != 0 ? productTotalDPrice : productTotalPrice }"/></span>원 <br />
						배송비: <span class="deliveryFee" data-delivery-fee="${product.delivery_fee }"
									data-product-id="${product.product_id }">
									<fmt:formatNumber type="number" pattern="#,###" value="${product.delivery_fee }"/></span>원
					</li>
					
				</c:forEach>
				
			</ul>
		</div>
		<div id="sideWrap">
			<div>
				총 상품 금액: <span id="totalSelectedBasketsPrice">
				<fmt:formatNumber type="number" pattern="#,###" value="${basketTotalPrice }"/></span>원 <br />
				총 배송비: <span id="totalDeliveryFee" data-delivery-fee="${basketTotalDelivery }" >
				<fmt:formatNumber type="number" pattern="#,###" value="${basketTotalDelivery }"/></span>원 <br />
				총 할인금액: <span id="totalSelectedBasketsSubDPrice">
				<fmt:formatNumber type="number" pattern="#,###" value="${basketTotalDPrice != 0 ? basketTotalPrice - basketTotalDPrice : 0 }"/></span>원 <br />
				결제금액: <span id="totalPurchasePrice">
				<fmt:formatNumber type="number" pattern="#,###" value="${basketTotalDPrice != 0 ? basketTotalDPrice + basketTotalDelivery : basketTotalPrice + basketTotalDelivery }"/></span>원 <br />
			</div>
			<div>
				<button type="button" id="purchaseBtn">구매하기</button>
			</div>
		</div>
	</main>
</body>
</html>