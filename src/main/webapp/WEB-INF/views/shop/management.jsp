<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
	</style>
	<script>
		function loadSubCategories() {
			var select = event.target;
			var level = $(select).data("level");
			if (level == 4) {
				return;
			}
			
			$("#categorySelect > select").each(function() {
				if ($(this).data("level") > level) {
					$(this).remove();
				}
			});
			
			++level;
			
			var category_id = select.value;
			
			$.ajax({
				type: "get",
				async: true,
				url: "loadSubCategories",
				data: {
					"category_id" : category_id
				},
				success: function(data) {
					if (data.length > 0) {
						var htmlText = '<select name="lv' + level + 'Category"' + 
				 		' id="lv' + level + 'Category" onchange="loadSubCategories()"' +
				 		' data-level="' + level + '" required="required">' +
						'<option value="" selected disabled>카테고리' + level + '</option>';
						
						for (var i  = 0; i < data.length; ++i) {
							htmlText = htmlText + '<option value="' + data[i].category_id + '">' +
							data[i].name + '</option>'; 
						}
						
						htmlText = htmlText + '</select>\n';
						
						$("#categorySelect").append(htmlText);
					}
				}
			});
		}
	</script>
</head>
<body>
	<h3>management.jsp</h3>
	상품 추가 <br />
	<form action="">
		상품 이름: <input type="text" name="productName" value="상품이름" /> / 판매자ID: <input type="text" name="sellerId" value="판매자ID" /> <br />
		카테고리:
		<span id="categorySelect">
			<select name="lv1Category" id="lv1Category" onchange="loadSubCategories()" data-level="1">
				<option value="" selected disabled>카테고리1</option>
				<c:forEach items="${lv1Categories }" var="c">
					<option value="${c.category_id }">${c.name }</option>
				</c:forEach>
			</select>
		</span>
		<br />
		<br />
		<input type="submit" value="추가하기" />
	</form>
</body>
</html>