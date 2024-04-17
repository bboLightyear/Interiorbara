<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="../resources/js/shop/management.js"></script>
<meta charset="UTF-8">
<title>Product Management</title>
</head>
<body>
	상품 등록 <br />
	<form action="management/regProduct" method="post" enctype="multipart/form-data">
		상품 이름: <input type="text" name="productName" value="상품이름" required="required" /> <br />
		판매자ID: <input type="number" name="sellerId" value="1" required="required" /> <br />
		카테고리:
		<span id="categorySelect">
			<select name="lv1Category" id="lv1Category" onchange="loadSubCategories()" data-level="1" required="required">
				<option value="" selected disabled>카테고리1</option>
				<c:forEach items="${lv1Categories }" var="c">
					<option value="${c.category_id }">${c.name }</option>
				</c:forEach>
			</select>
		</span>
		<br />
		상품 이미지: <input type="file" name="productImgs" multiple="multiple" required="required" />
		상세정보 이미지: <input type="file" name="detailImgs" multiple="multiple" required="required" />
		<br />
		배송유형:
		<select name="deliveryType">
			<option value="free">무료</option>
			<option value="arrival">착불</option>
			<option value="each">개별</option>
			<option value="over">기준이상시무료</option>
		</select>
		<br />
		배송비: <input type="number" name="deliveryFee" required="required"/> <br />
		배송무료기준금액: <input type="number" name="refPrice" /> <br />
		할인율: <input type="number" name="discountRate" required="required" id="discountRate" onchange="updateDPrice()"/> <br />
		대표가격: <input type="number" name="repPrice" id="repPrice" required="required"/> <br />
		대표할인가격: <input type="number" name="repDPrice" id="repDPrice" required="required"/> <br />
		옵션: 
		<input type="radio" name="optionType" value="0" onchange="changeOptionField()" checked/> 없음
		<input type="radio" name="optionType" value="1" onchange="changeOptionField()"/> 1개
		<input type="radio" name="optionType" value="2" onchange="changeOptionField()"/> 2개
		
		<div id="optionField" >
			이름: <input type="text" name="optionName" required="required" />
			가격: <input type="number" name="optionPrice" required="required" class="optionPrice" onchange="updateDPrice()" />
			할인가격: <input type="number" name="optionDPrice" class="optionDPrice" />
			재고: <input type="number" name="optionStock" required="required" />
		</div>
		
		<br />
		<input type="submit" value="등록하기" />
	</form>
</body>
</html>