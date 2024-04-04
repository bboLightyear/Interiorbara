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
				<c:set var="basketTotalDeliveryFee" value="0" />
				
				<c:forEach items="${products }" var="product">
				
					<c:set var="productTotalPrice" value="0" />
					<c:set var="productTotalDPrice" value="0" />
					<c:set var="productTotalDeliveryFee" value="0" />
					<c:set var="isDiscounted" value="${product.is_discounted eq 'Y' }" />
					<c:set var="deliveryType" value="${product.delivery_type }" />
					
					<li class="productItem" data-product-id="${product.product_id }">
					
						<input type="checkbox" name="productCheckBox" class="productCheckBox" data-product-id="${product.product_id }" checked />
						
						${product.name }
						 
						<button class="removeBtn" data-btn-of="product" data-product-id="${product.product_id }">X</button>
						
						<ul class="optionGroup">
						
							<c:forEach items="${baskets }" var="basket">
							
								<c:if test="${product.product_id eq basket.product_id }">
								
									<c:set var="optionTotalPrice" value="${basket.option.price * basket.quantity }"/>
									<c:set var="optionTotalDPrice" value="${isDiscounted ? basket.option.discounted_price * basket.quantity : 0 }"/>
									
									<li class="optionItem" data-basket-id="${basket.basket_id }" data-option-id="${basket.option_id }" data-product-id="${basket.product_id }">
										
										<div>
											${basket.option_text }
											<button class="removeBtn" data-btn-of="option" data-option-id="${basket.option_id }">X</button>
										</div>
										
										<button type="button" class="quantityBtn" data-action="sub" data-option-id="${basket.option_id }">&lt;</button>
										
										(<span class="optionQuantityNumber" data-option-id="${basket.option_id }" data-quantity="${basket.quantity }">${basket.quantity }</span>)
										
										<button type="button" class="quantityBtn" data-action="add" data-option-id="${basket.option_id }">&gt;</button>
										
										<span class="optionPriceNumber" data-option-id="${basket.option_id }" data-product-id="${basket.product_id }"
											data-value="${optionTotalPrice }"
											data-value-d="${optionTotalDPrice }">
											<fmt:formatNumber type="number" pattern="#,###" value="${isDiscounted ? optionTotalDPrice : optionTotalPrice }"/>원
										</span>
									</li>
									
									<c:set var="productTotalPrice" value="${productTotalPrice + optionTotalPrice }" />
									<c:set var="productTotalDPrice" value="${productTotalDPrice + optionTotalDPrice }" />
									<c:set var="productTotalDeliveryFee" value="${productTotalDeliveryFee + (product.delivery_fee * basket.quantity) }" />
									
								</c:if>
								
							</c:forEach>
							
						</ul>
						
						총 금액:
						<span class="productTotalPriceNumber" data-product-id="${product.product_id }" data-value="${productTotalPrice }" data-value-d="${productTotalDPrice }">
							<fmt:formatNumber type="number" pattern="#,###" value="${isDiscounted ? productTotalDPrice : productTotalPrice }"/>원
						</span>
						
						<br />
						
						배송비:
							<c:choose>
							
								<c:when test="${deliveryType eq 'free' }">
									<span class="productTotalDeliveryFeeNumber" data-product-id="${product.product_id }" data-value="0">
										무료
									</span>
								</c:when>
								
								<c:when test="${deliveryType eq 'each' }">
									<span class="productTotalDeliveryFeeNumber" data-product-id="${product.product_id }" data-value="${productTotalDeliveryFee }">
										<fmt:formatNumber type="number" pattern="#,###" value="${productTotalDeliveryFee }"/>원
									</span>
									<c:set var="basketTotalDeliveryFee" value="${basketTotalDeliveryFee + productTotalDeliveryFee }" />
								</c:when>
								
								<c:when test="${deliveryType eq 'over' }">
									<c:if test="${isDiscounted ? productTotalDPrice >= product.ref_price : productTotalPrice >= product.ref_price }">
										<span class="productTotalDeliveryFeeNumber" data-product-id="${product.product_id }" data-value="0">
											무료,
										</span>
									</c:if>
									<c:if test="${isDiscounted ? productTotalDPrice < product.ref_price : productTotalPrice < product.ref_price }">
										<span class="productTotalDeliveryFeeNumber" data-product-id="${product.product_id }" data-value="${productTotalDeliveryFee }">
											<fmt:formatNumber type="number" pattern="#,###" value="${productTotalDeliveryFee }"/>원,
										</span>
										<c:set var="basketTotalDeliveryFee" value="${basketTotalDeliveryFee + productTotalDeliveryFee }" />
									</c:if>
										<fmt:formatNumber type="number" pattern="#,###" value="${product.ref_price }"/>원 이상 구매시 무료
									
								</c:when>
								
								<c:when test="${deliveryType eq 'arrival' }">
									<span class="productTotalDeliveryFeeNumber" data-product-id="${product.product_id }" data-value="0">
										착불, <fmt:formatNumber type="number" pattern="#,###" value="${productTotalDeliveryFee }"/>원
									</span>
								</c:when>
								
							</c:choose>
						<br />
						
					</li>
					
					<c:set var="basketTotalPrice" value="${basketTotalPrice + productTotalPrice }" />
					<c:set var="basketTotalDPrice" value="${basketTotalDPrice + productTotalDPrice }" />
					
				</c:forEach>
				
			</ul>
		</div>
		<div id="sideWrap">
			<div>
				<c:set var="basketTotalDiscount" value="${basketTotalPrice - basketTotalDPrice }" />
				<c:set var="basketTotalAmount" value="${basketTotalPrice + basketTotalDeliveryFee }" />
				<c:set var="basketTotalDAmount" value="${basketTotalDPrice + basketTotalDeliveryFee }" />
				
				총 상품 금액:
				<span id="selectedBasketsTotalPriceNumber">
					<fmt:formatNumber type="number" pattern="#,###" value="${basketTotalPrice }"/>원
				</span>
				<br />
				총 배송비:
				<span id="selectedBasketsTotalDeliveryFeeNumber">
					<fmt:formatNumber type="number" pattern="#,###" value="${basketTotalDeliveryFee }"/>원
				</span>
				<br />
				총 할인금액:
				<span id="selectedBasketsTotalDiscountNumber">
					<fmt:formatNumber type="number" pattern="#,###" value="${basketTotalDPrice != 0 ? basketTotalDiscount : 0 }"/>원
				</span>
				<br />
				결제금액:
				<span id="selectedBasketsAmountNumber">
					<fmt:formatNumber type="number" pattern="#,###" value="${basketTotalDPrice != 0 ? basketTotalDAmount : basketTotalAmount }"/>원
				</span>
				<br />
			</div>
			<div>
				<button type="button" id="purchaseBtn">구매하기</button>
			</div>
		</div>
	</main>
</body>
</html>