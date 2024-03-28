<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		#wrap {
			width: 800px;
			margin: auto;
		}
		
		nav {
			float: left;
			width: 50%;
			background-color: #fff0f0;
		}
		
		main {
			float: right;
			width: 50%;
			background-color: #f0f0ff;
		}
		
		.clear {
			clear: both;
		}
		
		a {
			text-decoration: none;
		}
		
		.cell {
			display: inline-block;
			width: 33%;
			height: 100px;
			text-align: center;
		}
	</style>

</head>
<body>
	<h3>list.jsp</h3>
	<%
	if (session.getAttribute("user_id") == null) {
		session.setAttribute("user_id", "1");
	}
	%>
	<h4>user_id: <%= session.getAttribute("user_id") %></h4>
	<a href="management">상품등록</a>
	<div id="wrap">
		<nav>			
			<c:forEach items="${levelCategories }" var="cat">
				<a href="list?category_id=${cat.category_id }">
					<c:forEach begin="1" end="${cat.level - 1}">&nbsp;&nbsp;&nbsp;</c:forEach>
					${cat.name }
				</a>
				<button>O</button>
				<br />
			</c:forEach>
		</nav>
		<main>
			<h3>${category.name }</h3>
			
			<select name="colorFilter" id="">
				<option value="black">검은색</option>
				<option value="white">하얀색</option>
				<option value="brown">갈색</option>
			</select>
			<br />
	
			<h4>상품 개수: ${productCnt }</h4>
			<table>
				<c:forEach items="${productList }" var="product" varStatus="status">
					<div class="cell">
						<a href="product?product_id=${product.product_id }">${product.name }</a>
					</div>
				</c:forEach>
			</table>
		</main>
	</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>