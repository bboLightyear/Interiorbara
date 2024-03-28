<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		main {
			width: 800px;
			margin: auto;
		}
		
		.selectedProductCard {
			disply: inline-block;
			width: 300px;
			height: 50px;
			background-color: #f0f0f0;
			margin-top: 5px;
			margin-bottom: 5px;
		}
		
		.productGroup {
			background-color: #fefee0;
			padding: 10px;
		}
	</style>
</head>
<body>
	<h3>basket.jsp</h3>
	<main>
		<c:forEach items="${products }" var="p">
			<div class="productGroup">
				${p.name }
				<c:forEach items="${baskets }" var="b" varStatus="s">
					<c:if test="${p.product_id eq b.product_id }">
						<div class="selectedProductCard">
							<c:if test="${b.option_set_dto ne null }">
								${b.option_set_dto.name }: ${b.option_dto.name } /   
							</c:if>
							<c:if test="${b.final_option_set_dto.name ne null }">
								${b.final_option_set_dto.name }:
							</c:if>
							${b.final_option_dto.name } <br />
							${b.product_data_dto.price }원
						</div>
					</c:if>
				</c:forEach>
			</div>
		</c:forEach>
	</main>
</body>
</html>