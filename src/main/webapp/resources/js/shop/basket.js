$(document).ready(function() {
	$(".quantityBtn").on("click", modifyQuantity);
	$(".removeBtn").on("click", removeBasket);
	$("#checkAll").on("click", checkAll);
	$(".productCheckBox").on("click", checkProduct);
	$("#purchaseBtn").on("click", purchaseChecked);
});

var baskets;

function purchaseChecked() {
	var purchaseBaskets = [];
	var hasChecked = false;
	$(".productCheckBox").each(function() {
		if ($(this).is(":checked")) {
			hasChecked = true;
			const productId = $(this).data("productId");
			$(`.optionItem[data-product-id="${productId}"]`).each(function() {
				const basketId = $(this).data("basketId");
				purchaseBaskets.push(basketId);
			});
		}
	});
	
	if (!hasChecked) {
		alert("선택한 상품이 없습니다");
	} else {
		$.ajax({
			type: "POST",
			url: "basket/makeOrder",
			data: JSON.stringify(purchaseBaskets),
			success: function(data) {
				var url = "order?orderId=" + data;
				location.href = url;
			}
		});
	}
}

function checkAll() {
	if ($(this).is(":checked")) {
		$(".productCheckBox").prop("checked", true);
	} else {
		$(".productCheckBox").prop("checked", false);
	}
	
	updateBasketTotalPrice();
}

function checkProduct() {
	if (!$(this).is(":checked")) {
		$("#checkAll").prop("checked", false);
	} else {
		updateCheck();
	}
	
	updateBasketTotalPrice();
}

function updateCheck() {
	var hasNotChecked = false;
	$(".productCheckBox").each(function() {
		if (!$(this).is(":checked")) {
			hasNotChecked = true;
		}
	});
	
	if (!hasNotChecked) {
		$("#checkAll").prop("checked", true);
	}
}

function modifyQuantity() {
	const optionId = $(this).data("optionId");
	const action = $(this).data("action");
	
	const optionQuantityNumber = $(`.optionQuantityNumber[data-option-id="${optionId}"]`).first();
	const quantity = optionQuantityNumber.data("quantity");

	if (action === "sub" && quantity === 1) {
		alert("1개 이상 가능");
		return;
	}
	
	$.ajax({
		type: "post",
		async: false,
		url: "basket/modifyQuantity",
		data: {
			"optionId" : optionId,
			"action" : action
		},
		success: function(data) {
			updateBasket(data);
		}
	})
}

function updateBasket(data) {
	var basketTotalPrice = 0;
	var basketTotalDPrice = 0;
	var basketTotalDeliveryFee = 0;
	
	$(".productItem").each(function(item) {
		var productTotalPrice = 0;
		var productTotalDPrice = 0;
		var productTotalDeliveryFee = 0;
		const productId = $(this).data("productId");
		const isChecked = $(`.productCheckBox[data-product-id="${productId}"]`).is(":checked");
		
		var product;
		
		data.forEach((basket) => {
			if (productId === basket.productId) {
				product = basket.product;
				const optionId = basket.optionId;
				const optionQuantityNumber = $(this).
					find(`.optionQuantityNumber[data-option-id="${optionId}"]`).first();
				const optionPriceNumber = $(this).
					find(`.optionPriceNumber[data-option-id="${optionId}"]`).first();
				
				optionQuantityNumber.data("quantity", basket.quantity);
				optionQuantityNumber.text(basket.quantity);
				
				const optionTotalDPrice = basket.product.is_discounted === "Y" ? 
						basket.option.discounted_price * basket.quantity : 0;
				productTotalDPrice += optionTotalDPrice;
				optionPriceNumber.data("valueD", optionTotalDPrice);
				
				const optionTotalPrice = basket.option.price * basket.quantity;
				productTotalPrice += optionTotalPrice;
				optionPriceNumber.data("value", optionTotalPrice);
				
				if (basket.product.is_discounted === "Y") {
					optionPriceNumber.text(optionTotalDPrice.toLocaleString() + "원");
				} else {
					optionPriceNumber.text(optionTotalPrice.toLocaleString() + "원");
				}
				
				productTotalDeliveryFee += basket.product.delivery_fee * basket.quantity;
			}
		});
		
		const productTotalPriceNumber = $(this).
			find(`.productTotalPriceNumber[data-product-id="${productId}"]`).first();
		const productTotalDeliveryFeeNumber = $(this).
			find(`.productTotalDeliveryFeeNumber[data-product-id="${productId}"]`).first();
		
		productTotalPriceNumber.data("valueD", productTotalDPrice);
		productTotalPriceNumber.data("value", productTotalPrice);
		
		if (product.is_discounted === "Y") {
			productTotalPriceNumber.text(productTotalDPrice.toLocaleString() + "원");
		} else {
			productTotalPriceNumber.text(productTotalPrice.toLocaleString() + "원");
		}
		
		switch (product.delivery_type) {
		case "free": {
			break;
		}
		case "each": {
			if (isChecked){
				basketTotalDeliveryFee += productTotalDeliveryFee;				
			}
			productTotalDeliveryFeeNumber.text(productTotalDeliveryFee.toLocaleString() + "원");
			productTotalDeliveryFeeNumber.data("value", productTotalDeliveryFee);
			break;
		}
		case "over": {
			if (product.is_discounted === "Y" ?
				productTotalDPrice >= product.ref_price :
				productTotalPrice >= product.ref_price) {
				productTotalDeliveryFeeNumber.text("무료, ");
				productTotalDeliveryFeeNumber.data("value", 0);
			} else {
				if (isChecked){
					basketTotalDeliveryFee += productTotalDeliveryFee;				
				}
				productTotalDeliveryFeeNumber.text(productTotalDeliveryFee.toLocaleString() + "원, ");
				productTotalDeliveryFeeNumber.data("value", productTotalDeliveryFee);
			}
			break;
		}
		case "arrival": {
			productTotalDeliveryFeeNumber.text("착불, " + productTotalDeliveryFee.toLocaleString() + "원");
			break;
		}
		}
		
		if (isChecked){
			basketTotalPrice += productTotalPrice;
			basketTotalDPrice += productTotalDPrice;				
		}
	});
	
	const basketTotalDiscount = basketTotalDPrice != 0 ? basketTotalPrice - basketTotalDPrice : 0;
	const basketTotalAmount = basketTotalDPrice != 0 ? basketTotalDPrice + basketTotalDeliveryFee :
		basketTotalPrice + basketTotalDeliveryFee;
	
	$(`#selectedBasketsTotalPriceNumber`).text((basketTotalPrice).toLocaleString() + "원");
	$(`#selectedBasketsTotalDeliveryFeeNumber`).text((basketTotalDeliveryFee).toLocaleString() + "원");
	$(`#selectedBasketsTotalDiscountNumber`).text((basketTotalDiscount).toLocaleString() + "원");
	$(`#selectedBasketsAmountNumber`).text((basketTotalAmount).toLocaleString() + "원");
}

function removeBasket() {
	const btnOf = $(this).data("btnOf");
	
	var targetId;
	switch (btnOf) {
	case "product":
		targetId = $(this).data("productId");
		break;
	case "option":
		targetId = $(this).data("optionId");
		break;
	}
	
	$.ajax({
		type: "post",
		async: true,
		url: "basket/removeBasket",
		data: {
			"target" : btnOf,
			"targetId" : targetId
		},
		success: function(data) {
			switch (btnOf) {
			case "product":
				$(`.productItem[data-product-id="${targetId}"]`).first().remove();
				break;
			case "option":
				const productId = $(`.optionItem[data-option-id="${targetId}"]`).first().data("productId");
				$(`.optionItem[data-option-id="${targetId}"]`).first().remove();
				
				const productItem = $(`.productItem[data-product-id="${productId}"]`).first();
				if (productItem.find(`.optionItem`).length === 0) {
					productItem.remove();
				}
				break;
			}
			
			updateBasket(data);
		}
	});
	

	
	updateCheck();
}

function updateProductTotalPrice(productId) {
	var productTotalPrice = 0;
	var productTotalDPrice = 0;
	$(`.optionPriceNumber[data-product-id="${productId}"]`).each(function() {
		productTotalPrice += $(this).data("value");
		productTotalDPrice += $(this).data("valueD");
	});
	
	const productTotalPriceNumber = $(`.productTotalPriceNumber[data-product-id="${productId}"]`).first();
	if (productTotalDPrice != 0) {
		productTotalPriceNumber.text(productTotalDPrice.toLocaleString());
	} else {
		productTotalPriceNumber.text(productTotalPrice.toLocaleString());
	}
	
	productTotalPriceNumber.data("value", productTotalPrice);
	productTotalPriceNumber.data("valueD", productTotalDPrice);
}

function updateBasketTotalPrice() {
	var basketTotalPrice = 0;
	var basketTotalDPrice = 0;
	
	$(`.productTotalPriceNumber`).each(function() {
		const productId = $(this).data("productId");
		const checkbox = $(`.productCheckBox[data-product-id="${productId}"]`).first();
		if ($(checkbox).is(":checked")) {
			basketTotalPrice += $(this).data("value");
			basketTotalDPrice += $(this).data("valueD");
		}
	});
	$("#selectedBasketsTotalPriceNumber").text(basketTotalPrice.toLocaleString() + "원");
	if (basketTotalDPrice != 0) {
		$("#selectedBasketsTotalDiscountNumber").text((basketTotalPrice - basketTotalDPrice).toLocaleString() + "원");		
	} else {
		$("#selectedBasketsTotalDiscountNumber").text("0원");
	}
	
	var totalDeliveryFee = 0;
	
	$(`.productTotalDeliveryFeeNumber`).each(function() {
		const productId = $(this).data("productId");
		const checkbox = $(`.productCheckBox[data-product-id="${productId}"]`).first();
		if ($(checkbox).is(":checked")) {
			totalDeliveryFee += $(this).data("value");
		}
	});
	$("#selectedBasketsTotalDeliveryFeeNumber").text(totalDeliveryFee.toLocaleString() + "원");
	
	if (basketTotalDPrice != 0) {
		$("#selectedBasketsAmountNumber").text((basketTotalDPrice + totalDeliveryFee).toLocaleString() + "원");		
	} else {
		$("#selectedBasketsAmountNumber").text((basketTotalPrice  + totalDeliveryFee).toLocaleString() + "원");
	}
}