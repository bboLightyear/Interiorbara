/**
 * 
 */

$(document).ready(function() {
	updateTotalPrice();
});

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
				if ($("main").data("isDiscounted") === "N") {
					$("#finalOptionSet").append($("<option>", { 
				        value: option.option_id,
				        text : option.name + ' ' + option.price.toLocaleString() + "원"
				    }));
				} else {
					$("#finalOptionSet").append($("<option>", { 
				        value: option.option_id,
				        text : option.name + ' ' + option.discounted_price.toLocaleString() + "원"
				    }));
				}
			});
		}
	});
}

function addOneOptionCard() {
	var select = event.target;
	var optionId = select.value;
	
	var notContain = true;
	$(".selectedOptionListItem").each(function() {
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
			success: function(option) {
				var optionText = "";
				optionText = $("#finalOptionSet").find("option:first-child").text() + ": "
					+ option.name;
				
				var price;
				if ($("main").data("isDiscounted") === "N") {
					price = option.price;
				} else {
					price = option.discounted_price;
				}
				
				var htmlText =
					'<div class="selectedOptionListItem" data-option-id="' + option.option_id + '"\
						data-quantity="1" data-option-price="'+ price + '"\
						data-total-price="'+ price +'">' + 
						optionText + '<br />\
						<button type="button" onclick="quantity(`sub`)">&lt;</button>(<span id="quantityText">1</span>)\
						<button type="button" onclick="quantity(`add`)">&gt;</button>\
						<span id="priceText">' + price.toLocaleString() + '원</span>\
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
	$(".selectedOptionListItem").each(function() {
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
			success: function(option) {
				var optionText = "";

				optionText = $("#optionSet").find("option:first-child").text() + ": " +
					$("#optionSet option:selected").text() +' / ' +
					$("#finalOptionSet").find("option:first-child").text() + ": "
					+ option.name;
					
				var price;
				if ($("main").data("isDiscounted") === "N") {
					price = option.price;
				} else {
					price = option.discounted_price;
				}
				
				var htmlText =
					'<div class="selectedOptionListItem" data-option-id="' + option.option_id + '"\
						data-quantity="1" data-option-price="'+ price + '"\
						data-total-price="'+ price +'">' + 
						optionText + '<br />\
						<button type="button" onclick="quantity(`sub`)">&lt;</button>(<span id="quantityText">1</span>)\
						<button type="button" onclick="quantity(`add`)">&gt;</button>\
						<span id="priceText">' + price.toLocaleString() + '원</span>\
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
	$(".selectedOptionListItem").each(function() {
		totalPrice += $(this).data("totalPrice");
	});
	
	$("#totalPrice").data("totalPrice", totalPrice);
	$("#totalPrice").text(totalPrice.toLocaleString() + "원");
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
	$(parent).find("#priceText").text(totalPrice.toLocaleString() + "원");
	$(parent).find("#quantityText").text(quantity.toLocaleString());
	
	updateTotalPrice();
}

function addBasket() {
	var data = [];

	var productId = $("main").data("productId");

	var index = 0;
	$(".selectedOptionListItem").each(function() {
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
	
	$(".selectedOptionListItem").each(function() {
		if ($(this).data("nonOption") != 1) {
			$(this).remove();
		} else {
			$(this).data("quantity", 1);
			$(this).data("totalPrice", $(this).data("optionPrice"));
			$(this).find("#quantityText").text(1);
			$(this).find("#priceText").text($(this).data("optionPrice").toLocaleString()  + "원");
		}
	});
	updateTotalPrice();
}