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
			<c:set var="basketTotalPrice" value="0"/>
			<c:forEach items="${products }" var="product">
				<li class="productItem" data-product-id="${product.product_id }">
					<input type="checkbox" class="productCheckBox" data-product-id="${product.product_id }" checked />
					${product.name } <button class="removeBtn" data-btn-of="product" data-product-id="${product.product_id }">X</button>
					<ul class="selectedOptionGroup">
					<c:set var="productTotalPrice" value="0"/>
					<c:forEach items="${baskets }" var="basket" varStatus="status">
					<c:if test="${product.product_id eq basket.product_id }">
					<c:set var="optionTotalPrice" value="${basket.product_data_dto.price * basket.quantity }"/>
					<c:set var="productTotalPrice" value="${productTotalPrice + optionTotalPrice }"/>
						<li class="selectedOption" data-basket-id="${basket.basket_id }"
							data-option-id="${basket.option_id }"
							data-product-id="${basket.product_id }"
							data-quantity="${basket.quantity }"
							data-option-price="${basket.product_data_dto.price }"
							data-option-total-price="${basket.product_data_dto.price * basket.quantity }">
							<div>
							<c:if test="${basket.option_set_dto ne null }">
								${basket.option_set_dto.name }: ${basket.option_dto.name } /
							</c:if>
							<c:if test="${basket.final_option_set_dto.name ne null }">
								${basket.final_option_set_dto.name }:
							</c:if>
								${basket.final_option_dto.name } <button class="removeBtn" data-btn-of="option" data-option-id="${basket.option_id }">X</button>
							</div>
							<button type="button" class="quantityBtn" data-action="sub" data-option-id="${basket.option_id }">&lt;</button>
							(<span class="optionQuantityText" data-option-id="${basket.option_id }">${basket.quantity }</span>)
							<button type="button" class="quantityBtn" data-action="add" data-option-id="${basket.option_id }">&gt;</button>
							<span class="optionPriceText" data-option-id="${basket.option_id }">
							<fmt:formatNumber type="number" pattern="#,###" value="${basket.product_data_dto.price * basket.quantity }"/></span>원
						</li>
					</c:if>
					</c:forEach>
					</ul>
					<c:set var="basketTotalPrice" value="${basketTotalPrice + productTotalPrice }"/>
					총 금액: <span class="productTotalPrice" data-product-id="${product.product_id }"
					data-product-total-price="${productTotalPrice }">
					<fmt:formatNumber type="number" pattern="#,###" value="${productTotalPrice }"/></span>원
				</li>
			</c:forEach>
			</ul>
		</div>
		<div id="sideWrap">
			<div>
				총 금액: <span id="totalSelectedBasketsPrice" data-basket-total-price="${basketTotalPrice }">
				<fmt:formatNumber type="number" pattern="#,###" value="${basketTotalPrice }"/></span>원
			</div>
			<div>
				<button type="button" id="purchaseBtn">구매하기</button>
			</div>
		</div>
	</main>
</body>
</html>