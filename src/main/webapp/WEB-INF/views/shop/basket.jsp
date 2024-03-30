<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="../resources/js/shop/basket.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		main {
			width: 800px;
			margin: auto;
		}
		
		.selectedOption {
			background-color: #f0f0f0;
			margin-top: 5px;
			margin-bottom: 5px;
		}
		
		.productItem {
			background-color: #fefee0;
			padding: 10px;
		}
		
		ul {
			list-style: none;
		}
	</style>
</head>
<body>
	<h3>basket.jsp</h3>
	<main>
		<ul id="productGroup">
			<c:forEach items="${products }" var="product">
				<li class="productItem" data-product-id="${product.product_id }">
					${product.name }
					<ul class="selectedOptionGroup">
						<c:set var="productTotalPrice" value="0"/>
						<c:forEach items="${baskets }" var="basket" varStatus="status">
							<c:if test="${product.product_id eq basket.product_id }">
								<c:set var="optionTotalPrice" value="${basket.product_data_dto.price * basket.quantity }"/>
								<c:set var="productTotalPrice" value="${productTotalPrice + optionTotalPrice }"/>
								<li class="selectedOption" data-option-id="${basket.option_id }"
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
										${basket.final_option_dto.name }
									</div>
									<button type="button" class="quantityButton" data-action="sub" data-option-id="${basket.option_id }">&lt;</button>
									(<span class="optionQuantityText" data-option-id="${basket.option_id }">${basket.quantity }</span>)
									<button type="button" class="quantityButton" data-action="add" data-option-id="${basket.option_id }">&gt;</button>
									<span class="optionPriceText" data-option-id="${basket.option_id }">${basket.product_data_dto.price * basket.quantity } 원</span>
								</li>							
							</c:if>
						</c:forEach>
					</ul>
					총 가격: <span class="productTotalPrice" data-product-id="${product.product_id }">${productTotalPrice } 원</span>
				</li>
			</c:forEach>
		</ul>
	</main>
</body>
</html>