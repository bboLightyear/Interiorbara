/**
 * 
 */

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
	
	var categoryId = select.value;
	
	$.ajax({
		type: "get",
		async: true,
		url: "loadSubCategories",
		data: {
			"categoryId" : categoryId
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
			가격: <input type="number" name="optionPrice" class="optionPrice" required="required" onchange="updateDPrice()" />\
			할인가격: <input type="number" name="optionDPrice" class="optionDPrice" />\
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
				가격: <input type="number" name="set1Option1Price" class="optionPrice" required="required" onchange="updateDPrice()" />\
				할인가격: <input type="number" name="set1Option1DPrice" class="optionDPrice" />\
				재고: <input type="number" name="set1Option1Stock" required="required" />\
			</div>\
			<div id="set1Option2">\
				옵션2<br />\
				이름: <input type="text" name="set1Option2Name" required="required" />\
				가격: <input type="number" name="set1Option2Price" class="optionPrice" required="required" onchange="updateDPrice()" />\
				할인가격: <input type="number" name="set1Option2DPrice" class="optionDPrice" />\
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
			가격: <input type="number" name="set' + setNum + 'Option' + optionCnt + 'Price" class="optionPrice" required="required" onchange="updateDPrice()" />\
			할인가격: <input type="number" name="set' + setNum + 'Option' + optionCnt + 'DPrice" class="optionDPrice" />\
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
							가격: <input type="number" name="set1Option1Price" class="optionPrice" required="required" onchange="updateDPrice()" />\
							할인가격: <input type="number" name="set1Option1DPrice" class="optionDPrice" />\
							재고: <input type="number" name="set1Option1Stock" required="required" />\
						</div>\
						<div id="set1Option2">\
							옵션2<br />\
							이름: <input type="text" name="set1Option2Name" required="required" />\
							가격: <input type="number" name="set1Option2Price" class="optionPrice" required="required" onchange="updateDPrice()" />\
							할인가격: <input type="number" name="set1Option2DPrice" class="optionDPrice" />\
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
							가격: <input type="number" name="set2Option1Price" class="optionPrice" required="required" onchange="updateDPrice()" />\
							할인가격: <input type="number" name="set2Option1DPrice" class="optionDPrice" />\
							재고: <input type="number" name="set2Option1Stock" required="required" />\
						</div>\
						<div id="set2Option2">\
							옵션2<br />\
							이름: <input type="text" name="set2Option2Name" required="required" />\
							가격: <input type="number" name="set2Option2Price" class="optionPrice" required="required" onchange="updateDPrice()" />\
							할인가격: <input type="number" name="set2Option2DPrice" class="optionDPrice" />\
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
					가격: <input type="number" name="set' + setCnt + 'Option1Price" class="optionPrice" required="required" onchange="updateDPrice()" />\
					할인가격: <input type="number" name="set' + setCnt + 'Option1DPrice" class="optionDPrice" />\
					재고: <input type="number" name="set' + setCnt + 'Option1Stock" required="required" />\
				</div>\
				<div id="set' + setCnt + 'Option2">\
					옵션2<br />\
					이름: <input type="text" name="set' + setCnt + 'Option2Name" required="required" />\
					가격: <input type="number" name="set' + setCnt + 'Option2Price" class="optionPrice" required="required" onchange="updateDPrice()" />\
					할인가격: <input type="number" name="set' + setCnt + 'Option2DPrice" class="optionDPrice" />\
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

function updateDPrice() {
	if ($("#discountRate").val().length === 0 || $("#discountRate").val() === 0) {
		$(".optionDPrice").each(function() {
			$(this).val("");
		});
	} else {
		const discountRate = (100 - $("#discountRate").val()) * 0.01;
		$(".optionDPrice").each(function() {
			const optionPrice = $(this).siblings(".optionPrice").first();
			if ($(optionPrice).val().length === 0 || $(optionPrice).val() === 0) {
				$(this).val("");
			} else {
				const optionPriceVal = $(optionPrice).val();
				var result;
				if (optionPriceVal < 1000) {
					result = Math.floor(optionPriceVal * discountRate * 0.1) * 10;
				} else {
					result = Math.floor(optionPriceVal * discountRate * 0.01) * 100;
				}
				
				$(this).val(result);
			}
		})
	}
	
	var isChanged = false;
	var lowest = Number.MAX_SAFE_INTEGER;
	var lowestD = 0;
	$(".optionPrice").each(function() {
		if (!($(this).val().length === 0) && !($(this).val() === 0)) {
			if ($(this).val() < lowest) {
				lowest = $(this).val();
				isChanged = true;
				
				const optionDPrice = $(this).siblings(".optionDPrice").first();
				if (!($(optionDPrice).val().length === 0) && !($(optionDPrice).val() === 0)) {
					lowestD = $(optionDPrice).val();
				} else {
					$("#repDPrice").val("");
				}
			}
		} else {
			$("#repPrice").val("");
			$("#repDPrice").val("");
		}
		
/* 		const optionDPrice = $(this).siblings(".optionDPrice").first();
		if (!($(optionDPrice).val().length === 0) && !($(optionDPrice).val() === 0)) {
			lowestD = $(optionDPrice).val();
		} else {
			$("#repDPrice").val("");
		} */
	});
	
	if (isChanged) {
		$("#repPrice").val(lowest);
		if (lowestD === 0) {
			$("#repDPrice").val("");
		} else {
			$("#repDPrice").val(lowestD);
		}
	}
}


