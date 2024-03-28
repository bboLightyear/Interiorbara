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
						var htmlText = '<select name="lv' + level + 'Category"\
				 		id="lv' + level + 'Category" onchange="loadSubCategories()"\
				 		data-level="' + level + '" required="required">\
						<option value="" selected disabled>카테고리' + level + '</option>';
						
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
		
		function changeOptionField() {
			var target = event.target;
			var flag = target.value;
			
			switch (flag) {
			case '0':
				toNonOption();
				break;
			case '1':
				toOneOption();
				break;
			case '2':
				toTwoOptions();
				break;
			}
		}
		
		function toNonOption() {
			$("#optionField").empty();
			var htmlText =
				'<div id="optionField">\
					이름: <input type="text" name="optionName" required="required" />\
					가격: <input type="number" name="optionPrice" required="required" />\
					할인가격: <input type="number" name="optionDPrice" />\
					재고: <input type="number" name="optionStock" required="required" />\
				</div>';
			$("#optionField").append(htmlText);
		}
		
		function toOneOption() {
			$("#optionField").empty();
			var htmlText =
				'<div id="set1" data-set-num="1" data-option-cnt="2">\
					옵션세트이름: <input type="text" name="set1Name" required="required"/>\
					<button class="addOption" type="button" onclick="addOption()">옵션 추가</button>\
					<button class="deleteOption" type="button" onclick="deleteOption()">옵션 삭제</button>\
					<div id="set1Option1">\
						옵션1<br />\
						이름: <input type="text" name="set1Option1Name" required="required" />\
						가격: <input type="number" name="set1Option1Price" required="required" />\
						할인가격: <input type="number" name="set1Option1DPrice" />\
						재고: <input type="number" name="set1Option1Stock" required="required" />\
					</div>\
					<div id="set1Option2">\
						옵션2<br />\
						이름: <input type="text" name="set1Option2Name" required="required" />\
						가격: <input type="number" name="set1Option2Price" required="required" />\
						할인가격: <input type="number" name="set1Option2DPrice" />\
						재고: <input type="number" name="set1Option2Stock" required="required" />\
					</div>\
				</div>';
				
			$("#optionField").append(htmlText);
		}
		
		function addOption() {
			var parent = event.target.parentElement;
			
			var setNum = $(parent).data("setNum");
			var optionCnt = $(parent).data("optionCnt");
			
			$(parent).data("optionCnt", ++optionCnt);
			
			var htmlText =
				'<div id="set' + setNum + 'Option' + optionCnt + '">\
					옵션' + optionCnt + '<br />\
					이름: <input type="text" name="set' + setNum + 'Option' + optionCnt + 'Name" required="required" />\
					가격: <input type="number" name="set' + setNum + 'Option' + optionCnt + 'Price" required="required" />\
					할인가격: <input type="number" name="set' + setNum + 'Option' + optionCnt + 'DPrice" />\
					재고: <input type="number" name="set' + setNum + 'Option' + optionCnt + 'Stock" required="required" />\
				</div>';
				
			
			$(parent).append(htmlText);
		}
		
		function deleteOption() {
			var parent = event.target.parentElement;
			
			var optionCnt = $(parent).data("optionCnt");
			
			if (optionCnt == 0) {
				return;
			}
			
			$(parent).children().last().remove();
			
			$(parent).data("optionCnt", --optionCnt);
		}
		
		function toTwoOptions() {
			$("#optionField").empty();
			var htmlText =
				'<div id="optionField" >\
					<div id="upSet" data-set-cnt="2">\
						옵션세트이름: <input type="text" name="upSetName" required="required" />\
						<button class="addSet" type="button" onclick="addSet()">옵션 추가</button>\
						<button class="deleteSet" type="button" onclick="deleteSet()">옵션 삭제</button>\
						<hr />\
						<div id="upOption1">\
							옵션1 <br />\
							이름: <input type="text" name="upOption1Name" required="required" /> <br />\
							<hr />\
							<div id="set1" data-set-num="1" data-option-cnt="2">\
								하위옵션세트이름: <input type="text" class="setName" name="set1Name" required="required" onchange="syncSetName()" />\
								<button class="addOption" type="button" onclick="addOption()">옵션 추가</button>\
								<button class="deleteOption" type="button" onclick="deleteOption()">옵션 삭제</button>\
								<div id="set1Option1">\
									옵션1<br />\
									이름: <input type="text" name="set1Option1Name" required="required" />\
									가격: <input type="number" name="set1Option1Price" required="required" />\
									할인가격: <input type="number" name="set1Option1DPrice" />\
									재고: <input type="number" name="set1Option1Stock" required="required" />\
								</div>\
								<div id="set1Option2">\
									옵션2<br />\
									이름: <input type="text" name="set1Option2Name" required="required" />\
									가격: <input type="number" name="set1Option2Price" required="required" />\
									할인가격: <input type="number" name="set1Option2DPrice" />\
									재고: <input type="number" name="set1Option2Stock" required="required" />\
								</div>\
							</div>\
							<hr />\
						</div>\
						<div id="upOption2">\
							옵션2 <br />\
							이름: <input type="text" name="upOption2Name" required="required" /> <br />\
							<hr />\
							<div id="set2" data-set-num="2" data-option-cnt="2">\
								하위옵션세트이름: <input type="text" class="setName" name="set2Name" required="required" onchange="syncSetName()" />\
								<button class="addOption" type="button" onclick="addOption()">옵션 추가</button>\
								<button class="deleteOption" type="button" onclick="deleteOption()">옵션 삭제</button>\
								<div id="set2Option1">\
									옵션1<br />\
									이름: <input type="text" name="set2Option1Name" required="required" />\
									가격: <input type="number" name="set2Option1Price" required="required" />\
									할인가격: <input type="number" name="set2Option1DPrice" />\
									재고: <input type="number" name="set2Option1Stock" required="required" />\
								</div>\
								<div id="set2Option2">\
									옵션2<br />\
									이름: <input type="text" name="set2Option2Name" required="required" />\
									가격: <input type="number" name="set2Option2Price" required="required" />\
									할인가격: <input type="number" name="set2Option2DPrice" />\
									재고: <input type="number" name="set2Option2Stock" required="required" />\
								</div>\
							</div>\
							<hr />\
						</div>\
					</div>\
				</div>';
				
			$("#optionField").append(htmlText);
		}
		
		function syncSetName() {
			var target = event.target;
			var value = target.value;
			
			$(".setName").val(value);
		}
		
		function addSet() {
			var setCnt = $("#upSet").data("setCnt");
			
			$("#upSet").data("setCnt", ++setCnt);
			
			var htmlText =
				'<div id="upOption' + setCnt + '">\
					옵션' + setCnt + ' <br />\
					이름: <input type="text" name="upOption' + setCnt + 'Name" required="required" /> <br />\
					<hr />\
					<div id="set' + setCnt + '" data-set-num="' + setCnt + '" data-option-cnt="2">\
						하위옵션세트이름: <input type="text" class="setName" name="set' + setCnt + 'Name" required="required" onchange="syncSetName()" />\
						<button class="addOption" type="button" onclick="addOption()">옵션 추가</button>\
						<button class="deleteOption" type="button" onclick="deleteOption()">옵션 삭제</button>\
						<div id="set' + setCnt + 'Option1">\
							옵션1<br />\
							이름: <input type="text" name="set' + setCnt + 'Option1Name" required="required" />\
							가격: <input type="number" name="set' + setCnt + 'Option1Price" required="required" />\
							할인가격: <input type="number" name="set' + setCnt + 'Option1DPrice" />\
							재고: <input type="number" name="set' + setCnt + 'Option1Stock" required="required" />\
						</div>\
						<div id="set' + setCnt + 'Option2">\
							옵션2<br />\
							이름: <input type="text" name="set' + setCnt + 'Option2Name" required="required" />\
							가격: <input type="number" name="set' + setCnt + 'Option2Price" required="required" />\
							할인가격: <input type="number" name="set' + setCnt + 'Option2DPrice" />\
							재고: <input type="number" name="set' + setCnt + 'Option2Stock" required="required" />\
						</div>\
					</div>\
					<hr />\
				</div>';
				
			$("#upSet").append(htmlText);
		}
		
		function deleteSet() {
			var setCnt = $("#upSet").data("setCnt");
			
			if (setCnt == 0) {
				return;
			}
			
			$("#upSet").children().last().remove();
			
			$("#upSet").data("setCnt", --setCnt);
		}
	</script>
</head>
<body>
	<h3>management.jsp</h3>
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
		<br />
		옵션: 
		<input type="radio" name="optionType" value="0" onchange="changeOptionField()" checked/> 없음
		<input type="radio" name="optionType" value="1" onchange="changeOptionField()"/> 1개
		<input type="radio" name="optionType" value="2" onchange="changeOptionField()"/> 2개
		
		<div id="optionField" >
			이름: <input type="text" name="optionName" required="required" />
			가격: <input type="number" name="optionPrice" required="required" />
			할인가격: <input type="number" name="optionDPrice" />
			재고: <input type="number" name="optionStock" required="required" />
		</div>
		
		<br />
		<input type="submit" value="등록하기" />
	</form>
</body>
</html>