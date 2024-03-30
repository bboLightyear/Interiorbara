$(document).ready(function() {
	$(".quantityButton").on("click", modifyQuantity);
});

function modifyQuantity() {
	const optionId = $(this).data("optionId");
	const action = $(this).data("action");
	
	const option = $(`.selectedOption[data-option-id="${optionId}"]`).first();
	const productId = option.data("productId");
	
	var quantity = option.data("quantity");
	
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
		success: function(result) {
			quantity = result;
		}
	})
	
	// 수량, 가격 변경
	option.data("quantity", quantity);
	
	const quantityText = $(`.optionQuantityText[data-option-id="${optionId}"]`).first();
	quantityText.text(quantity);
	
	const optionPrice = option.data("optionPrice");
	option.data("optionTotalPrice", optionPrice * quantity);
	
	const priceText = $(`.optionPriceText[data-option-id="${optionId}"]`).first();
	priceText.text(optionPrice * quantity + "원");
	
	updateProductTotalPrice(productId);
}

function updateProductTotalPrice(productId) {
	var productTotalPrice = 0;
	$(`.selectedOption[data-product-id="${productId}"]`).each(function() {
		productTotalPrice += $(this).data("optionTotalPrice");
	});
	
	const priceText = $(`.productTotalPrice[data-product-id="${productId}"]`).first();
	priceText.text(productTotalPrice + "원");
}
