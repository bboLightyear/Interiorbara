<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>

	<script>
		function loadSubOptionSet() {
			var select = event.target;
			var optionId = select.value;
			
			$.ajax({
				type: "get",
				async: true,
				url: "loadSubOptionSet",
				data: {
					"optionId" : optionId
				},
				success: function(data) {
					$("option", "#finalOptionSet").not(":eq(0)").remove();
					$("#finalOptionSet").prop("selectedIndex", 0);
					
					$.each(data, function (i, option) {
					    $("#finalOptionSet").append($("<option>", { 
					        value: option.option_id,
					        text : option.name + ' ' + option.product_data_dto.price + "원"
					    }));
					});
				}
			});
		}
		
		function addOneOptionCard() {
			var select = event.target;
			var optionId = select.value;
			
			var notContain = true;
			$(".selectedProductCard").each(function() {
				if (optionId == $(this).data("optionId")) {
					alert("이미 추가한 옵션입니다");
					notContain = false;
					return false;
				}
			});
			
			if (notContain) {
				$.ajax({
					type: "get",
					async: true,
					url: "loadProductData",
					data: {
						"optionId" : optionId
					},
					success: function(data) {
						var optionText = "";
						optionText = $("#finalOptionSet").find("option:first-child").text() + ": "
							+ data.name;
						
						var htmlText =
							'<div class="selectedProductCard" data-option-id="' + data.option_id + '"\
								data-quantity="1" data-option-price="'+ data.product_data_dto.price + '"\
								data-total-price="'+ data.product_data_dto.price +'">' + 
								optionText + '<br />\
								<button type="button" onclick="quantity(`sub`)"><</button>(<span id="quantityText">1</span>)\
								<button type="button" onclick="quantity(`add`)">></button>\
								<span id="priceText">' + data.product_data_dto.price + '</span>원\
							</div>';
							
						$("#optionWrap").append(htmlText);
						
					
						updateTotalPrice();
					}
				});
			}
			
			$("#finalOptionSet").prop("selectedIndex", 0);
		}
		
		function addTwoOptionCard() {
			var select = event.target;
			var optionId = select.value;
			
			var notContain = true;
			$(".selectedProductCard").each(function() {
				if (optionId == $(this).data("optionId")) {
					alert("이미 추가한 옵션입니다");
					notContain = false;
					return false;
				}
			});
			
			if (notContain) {
				$.ajax({
					type: "get",
					async: true,
					url: "loadProductData",
					data: {
						"optionId" : optionId
					},
					success: function(data) {
						var optionText = "";

						optionText = $("#optionSet").find("option:first-child").text() + ": " +
							$("#optionSet option:selected").text() +' / ' +
							$("#finalOptionSet").find("option:first-child").text() + ": "
							+ data.name;
						
						var htmlText =
							'<div class="selectedProductCard" data-option-id="' + data.option_id + '"\
								data-quantity="1" data-option-price="'+ data.product_data_dto.price + '"\
								data-total-price="'+ data.product_data_dto.price +'">' + 
								optionText + '<br />\
								<button type="button" onclick="quantity(`sub`)"><</button>(<span id="quantityText">1</span>)\
								<button type="button" onclick="quantity(`add`)">></button>\
								<span id="priceText">' + data.product_data_dto.price + '</span>원\
							</div>';
							
						$("#optionWrap").append(htmlText);

						$("#optionSet").prop("selectedIndex", 0);
						
						updateTotalPrice();
					}
				});
			}
			
			$("option", "#finalOptionSet").not(":eq(0)").remove();
			$("#finalOptionSet").prop("selectedIndex", 0);
		}
		
		function updateTotalPrice() {
			var totalPrice = 0;
			$(".selectedProductCard").each(function() {
				totalPrice += $(this).data("totalPrice");
			});
			
			$("#totalPrice").data("totalPrice", totalPrice);
			$("#totalPrice").text(totalPrice);
		}
		
		function quantity(operation) {
			var target = event.target;
			var parent = target.parentElement;
			
			var quantity = $(parent).data("quantity");
			var price = $(parent).data("optionPrice");
			
			switch (operation) {
			case "add":
				++quantity;
				break;
			case "sub":
				if (quantity == 1) {
					alert("1개 이상 가능");
					return;
				} else {
					--quantity;
				}
				break;
			}
			
			$(parent).data("quantity", quantity);
			
			var totalPrice = price * quantity;
			
			$(parent).data("totalPrice", totalPrice);
			$(parent).find("#priceText").text(totalPrice);
			$(parent).find("#quantityText").text(quantity);
			
			updateTotalPrice();
		}
		
		function addBasket() {
			var data = [];

			var productId = $("main").data("productId");

			var index = 0;
			$(".selectedProductCard").each(function() {
				var optionId = $(this).data("optionId");
				var quantity = $(this).data("quantity");
				
				data.push({
						"productId" : productId,
						"optionId" : optionId,
						"quantity" : quantity
				});
				
				++index;
			});
			
			if (index == 0) {
				return;
			}
			
			$.ajax({
				type: "post",
				async: true,
				url: "addBasket",
				data: JSON.stringify(data),
				success: function() {
					alert("장바구니에 담기 완료");
				}
			});
			
			$(".selectedProductCard").remove();
			updateTotalPrice();
		}
	</script>
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
		
		.selectedProductCard {
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
	<main data-product-id="${product.product_id }">
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
			productId: ${product.product_id } <br />
			name: ${product.name } <br />
			옵션 <br />
			<form action="">
				<div id="optionWrap">
					<c:choose>
						<c:when test="${nonOption ne null }">
							<div class="selectedProductCard">
								${nonOption.name } <br />
								${nonOption.product_data_dto.price }
							</div>
						</c:when>
						
						<c:when test="${subOptionSet ne null }">
							<select name="optionSet" id="optionSet" onchange="loadSubOptionSet()">
								<option selected disabled>${optionSet.name }</option>
								<c:forEach items="${options }" var="o">
									<option value="${o.option_id }">${o.name }</option>
								</c:forEach>
							</select>
							<select name="finalOptionSet" id="finalOptionSet" onchange="addTwoOptionCard()">
								<option selected disabled>${subOptionSet.name }</option>
								<!-- ajax -->
							</select>
						</c:when>
						
						<c:otherwise>
							<select name="finalOptionSet" id="finalOptionSet" onchange="addOneOptionCard()">
								<option selected disabled>${optionSet.name }</option>
								<c:forEach items="${options }" var="o">
									<option value="${o.option_id }">${o.name } (${o.product_data_dto.price }원)</option>
								</c:forEach>
							</select>
						</c:otherwise>
					</c:choose>
					
					<!-- ajax -->
					
					<br />
				</div>
				<br />
				<input type="button" value="장바구니" onclick="addBasket()"/>
				<input type="button" value="바로구매"/>
			</form>
			<br />
			총 금액 : <span id="totalPrice" data-total-price="0">0</span>원
		</section>
	</main>
</body>
</html>