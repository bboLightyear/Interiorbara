<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<<<<<<< HEAD

	<script>
		function loadSubOptionSet() {
			var select = event.target;
			var option_id = select.value;
			
			$.ajax({
				type: "get",
				async: true,
				url: "loadSubOptionSet",
				data: {
					"option_id" : option_id
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
		
		function addSelectedProductCard() {
			var select = $("#finalOptionSet")[0];
			var option_id = select.value;
			
			$.ajax({
				type: "get",
				async: true,
				url: "loadProductData",
				data: {
					"option_id" : option_id
				},
				success: function(data) {
					var firstOption = "";
					var finalOption = "";
					
					if ($("#optionSet").length) {
						firstOption = $("#optionSet").find("option:first-child").text() + ": " +
							$("#optionSet option:selected").text() +' / ';
					}
					
					finalOption = $("#finalOptionSet").find("option:first-child").text() + ": "
						+ data.name;
					
					var htmlText = '<div class="selectedProductCard" data-option-id="' + data.option_id + '">' + 
									firstOption + finalOption +
									'<br /><span>' + data.product_data_dto.price + '</span>원' +
									'</div>';
					$("#optionWrap").append(htmlText);
					
					$("option", "#finalOptionSet").not(":eq(0)").remove();
					$("#finalOptionSet").prop("selectedIndex", 0);
					$("#optionSet").prop("selectedIndex", 0);
				
					
					var price = parseInt($("#totalPrice").data("totalPrice"), 10);
					price += parseInt(data.product_data_dto.price, 10);
					
					$("#totalPrice").data("totalPrice", price);
					$("#totalPrice").text($("#totalPrice").data("totalPrice"));
				}
			});
			
			

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
			height: 50px;
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
=======
>>>>>>> bogeun00
</head>
<body>
	<h3>product.jsp</h3>
<<<<<<< HEAD
	<h4>user_id: <%= session.getAttribute("user_id") %></h4>
	<a href="basket">장바구니</a>
	<br />
	<main data-product-id="${product.product_id }">
		<div>
			<c:forEach items="${categories }" var="cat" varStatus="s">
				<a href="list?category_id=${cat.category_id }">${cat.name }</a>
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
					<img class="imageList" src="../resources/img/shop/${i.file_src }" alt="${s.index }" onmouseenter="changeMainImg()"/>
				</c:forEach>
			</div>
			<div id="imageMain">
				<img id="imageRepresent" src="../resources/img/shop/${images[0].file_src }" alt="대표이미지" />
			</div>
		</section>
		<section id="summary">
			product_id: ${product.product_id } <br />
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
							<select name="finalOptionSet" id="finalOptionSet" text="asdf" onchange="addSelectedProductCard()">
								<option selected disabled>${subOptionSet.name }</option>
								<!-- ajax -->
							</select>
						</c:when>
						
						<c:otherwise>
							<select name="finalOptionSet" id="finalOptionSet" onchange="addSelectedProductCard()">
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
				<input type="button" value="장바구니"/>
				<input type="button" value="바로구매"/>
			</form>
			<br />
			총 금액 : <span id="totalPrice" data-total-price="0">0</span>원
		</section>
	</main>
=======
	
	id: ${product.product_id } <br />
	이름: ${product.name } <br />
	
	옵션셋id: ${optionSet1.option_set_id } <br />
	옵션이름: ${optionSet1.name }
>>>>>>> bogeun00
</body>
</html>