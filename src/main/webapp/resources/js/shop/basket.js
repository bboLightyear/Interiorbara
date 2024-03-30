function updateOptionTotalPrice() {
			
}

function updateProductTotalPrice() {
	
}

function updateTotalPrice() {
	
}

function quantity(operation) {
	var target = event.target;
	var optionParent = target.parentElement;
	var productParent = optionParenet.parentElement;
	
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
	
	$(optionParent).data("optionTotalPrice", totalPrice);
	$(optionParent).find("#priceText").text(totalPrice);
	$(optionParent).find("#quantityText").text(quantity);
	
	updateTotalPrice();
}