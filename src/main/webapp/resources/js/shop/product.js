$(document).ready(function() {
	updateTotalPrice();
	$("#writeReviewBtn").on("click", openReviewModal);
	$("#writeQnaBtn").on("click", openQnaModal);
	$("#reviewModalClose").on("click", closeReviewModal);
	$("#qnaModalClose").on("click", closeQnaModal);
	
	$(".goToBtn").on("click", changeScroll);
	$(".reviewStar").on("mouseenter", changeMousePointer);
	$(".reviewStar").on("mouseleave", changeMouseNormal);
	
	$("#reviewScoreWrap").on("mouseleave", hoveringScoreLeave);
	
	$("#star1").on("mouseenter", starScore1);
	$("#star2").on("mouseenter", starScore2);
	$("#star3").on("mouseenter", starScore3);
	$("#star4").on("mouseenter", starScore4);
	$("#star5").on("mouseenter", starScore5);
	
	$("#star1").on("mouseleave", noStarScore);
	$("#star2").on("mouseleave", noStarScore);
	$("#star3").on("mouseleave", noStarScore);
	$("#star4").on("mouseleave", noStarScore);
	$("#star5").on("mouseleave", noStarScore);
	
	$("#star1").on("click", setStarScore1);
	$("#star2").on("click", setStarScore2);
	$("#star3").on("click", setStarScore3);
	$("#star4").on("click", setStarScore4);
	$("#star5").on("click", setStarScore5);
	
	setReviewBar();
});

function changeQnaPage(pageNum) {
	const productId = $("main").data("productId");
	
	$.ajax({
		type: "get",
		async: true,
		url: "product/changeQnaPage",
		data: {
			"productId" : productId,
			"pageNum" : pageNum
		},
		success: function(data) {
			$("#qnaGroup").empty();
			
			const qnaPageVO = data["qnaPageVO"];
			const qnas = data["qnas"];
			
			var htmlText = "";
			
			for (var i = 0; i < qnas.length; ++i) {
				htmlText +=
					`<li class="qnaItem">
						qna_id: ${qnas[i].qna_id} <br />
						user_id: ${qnas[i].user_id} <br />
						q_content: ${qnas[i].q_content} <br />
					</li>`;				
			}
			
			$("#qnaGroup").append(htmlText);
			
			
			$("#qnaPageButtonWrap").empty();
			
			htmlText = "";
			
			if (qnaPageVO.groupPageCount < qnaPageVO.pageEndNum) {
				htmlText +=
					`<table class="qnaPageArrowsTable">
						<tr>
							<td onclick="changeQnaPage(1)"><i class="fa-solid fa-angles-left"></i></td>
							<td onclick="changeQnaPage(${qnaPageVO.pageStartNum - 1})"><i class="fa-solid fa-angle-left"></i></td>
						</tr>
					</table>`;
			}
	
			htmlText +=
				`<table class="qnaPageButtonTable">
					<tr>`;
			for (var i = qnaPageVO.pageStartNum; i < qnaPageVO.pageEndNum + 1; ++i) {
				htmlText += `<td onclick="changeQnaPage(${i})">${i}</td>`;
			}
			
			htmlText +=
					`</tr>
				</table>`;
			
			if (qnaPageVO.pageTotalNum > qnaPageVO.pageEndNum) {
				htmlText +=
					`<table class="qnaPageArrowsTable" >
						<tr>
							<td onclick="changeQnaPage(${qnaPageVO.pageEndNum + 1})"><i class="fa-solid fa-angle-right"></i></td>
							<td onclick="changeQnaPage(${qnaPageVO.pageTotalNum})"><i class="fa-solid fa-angles-right"></i></td>
						</tr>
					</table>`;
			}
			
			$("#qnaPageButtonWrap").append(htmlText);
		}
	});
}

function changeReviewPage(pageNum) {
	const productId = $("main").data("productId");
	
	$.ajax({
		type: "get",
		async: true,
		url: "product/changeReviewPage",
		data: {
			"productId" : productId,
			"pageNum" : pageNum
		},
		success: function(data) {
			$("#reviewGroup").empty();
			
			const reviewPageVO = data["reviewPageVO"];
			const reviews = data["reviews"];
			
			var htmlText = "";
			
			for (var i = 0; i < reviews.length; ++i) {
			
				htmlText +=
					`<li class="reviewItem">
						review_id: ${reviews[i].review_id} <br />
						user_id: ${reviews[i].user_id} <br />
						score: ${reviews[i].score} <br />`;
				
				if (reviews[i].file_src != null) {
					htmlText +=
						`<div>
							<img src="../resources/upload/shop/${reviews[i].file_src}" alt="d"
								class="reviewImages" />
						</div>`;
				}
				
				htmlText +=
						`content: ${reviews[i].content }
					</li>`;
				
			}
			
			$("#reviewGroup").append(htmlText);
			
			
			$("#pageButtonWrap").empty();
			
			htmlText = "";
			
			if (reviewPageVO.groupPageCount < reviewPageVO.pageEndNum) {
				htmlText +=
					`<table class="pageArrowsTable">
						<tr>
							<td onclick="changeReviewPage(1)"><i class="fa-solid fa-angles-left"></i></td>
							<td onclick="changeReviewPage(${reviewPageVO.pageStartNum - 1})"><i class="fa-solid fa-angle-left"></i></td>
						</tr>
					</table>`;
			}
	
			htmlText +=
				`<table class="pageButtonTable">
					<tr>`;
			for (var i = reviewPageVO.pageStartNum; i < reviewPageVO.pageEndNum + 1; ++i) {
				htmlText += `<td onclick="changeReviewPage(${i})">${i}</td>`;
			}
			
			htmlText +=
					`</tr>
				</table>`;
			
			if (reviewPageVO.pageTotalNum > reviewPageVO.pageEndNum) {
				htmlText +=
					`<table class="pageArrowsTable" >
						<tr>
							<td onclick="changeReviewPage(${reviewPageVO.pageEndNum + 1})"><i class="fa-solid fa-angle-right"></i></td>
							<td onclick="changeReviewPage(${reviewPageVO.pageTotalNum})"><i class="fa-solid fa-angles-right"></i></td>
						</tr>
					</table>`;
			}
			
			$("#pageButtonWrap").append(htmlText);
		}
	});
}

function setReviewBar() {
	$("#reviewScore5Bar").css("width", $("#reviewScore5Bar").data("ratio") + "%");
	$("#reviewScore4Bar").css("width", $("#reviewScore4Bar").data("ratio") + "%");
	$("#reviewScore3Bar").css("width", $("#reviewScore3Bar").data("ratio") + "%");
	$("#reviewScore2Bar").css("width", $("#reviewScore2Bar").data("ratio") + "%");
	$("#reviewScore1Bar").css("width", $("#reviewScore1Bar").data("ratio") + "%");
}

var lastColor1 = "#b1b8c0";
var lastColor2 = "#b1b8c0";
var lastColor3 = "#b1b8c0";
var lastColor4 = "#b1b8c0";
var lastColor5 = "#b1b8c0";

function setStarScore1() {
	$("#star1").css("color", "#1e90ff");
	$("#star2").css("color", "#b1b8c0");
	$("#star3").css("color", "#b1b8c0");
	$("#star4").css("color", "#b1b8c0");
	$("#star5").css("color", "#b1b8c0");
	
	lastColor1 = "#1e90ff";
	lastColor2 = "#b1b8c0";
	lastColor3 = "#b1b8c0";
	lastColor4 = "#b1b8c0";
	lastColor5 = "#b1b8c0";
}

function setStarScore2() {
	$("#star1").css("color", "#1e90ff");
	$("#star2").css("color", "#1e90ff");
	$("#star3").css("color", "#b1b8c0");
	$("#star4").css("color", "#b1b8c0");
	$("#star5").css("color", "#b1b8c0");
	
	lastColor1 = "#1e90ff";
	lastColor2 = "#1e90ff";
	lastColor3 = "#b1b8c0";
	lastColor4 = "#b1b8c0";
	lastColor5 = "#b1b8c0";
}

function setStarScore3() {
	$("#star1").css("color", "#1e90ff");
	$("#star2").css("color", "#1e90ff");
	$("#star3").css("color", "#1e90ff");
	$("#star4").css("color", "#b1b8c0");
	$("#star5").css("color", "#b1b8c0");
	
	lastColor1 = "#1e90ff";
	lastColor2 = "#1e90ff";
	lastColor3 = "#1e90ff";
	lastColor4 = "#b1b8c0";
	lastColor5 = "#b1b8c0";
}

function setStarScore4() {
	$("#star1").css("color", "#1e90ff");
	$("#star2").css("color", "#1e90ff");
	$("#star3").css("color", "#1e90ff");
	$("#star4").css("color", "#1e90ff");
	$("#star5").css("color", "#b1b8c0");
	
	lastColor1 = "#1e90ff";
	lastColor2 = "#1e90ff";
	lastColor3 = "#1e90ff";
	lastColor4 = "#1e90ff";
	lastColor5 = "#b1b8c0";
}

function setStarScore5() {
	$("#star1").css("color", "#1e90ff");
	$("#star2").css("color", "#1e90ff");
	$("#star3").css("color", "#1e90ff");
	$("#star4").css("color", "#1e90ff");
	$("#star5").css("color", "#1e90ff");
	
	lastColor1 = "#1e90ff";
	lastColor2 = "#1e90ff";
	lastColor3 = "#1e90ff";
	lastColor4 = "#1e90ff";
	lastColor5 = "#1e90ff";
}

function starScore1() {
	$("#star1").css("color", "#e2f0fe");
	$("#star2").css("color", "#b1b8c0");
	$("#star3").css("color", "#b1b8c0");
	$("#star4").css("color", "#b1b8c0");
	$("#star5").css("color", "#b1b8c0");
}

function starScore2() {
	$("#star1").css("color", "#e2f0fe");
	$("#star2").css("color", "#e2f0fe");
	$("#star3").css("color", "#b1b8c0");
	$("#star4").css("color", "#b1b8c0");
	$("#star5").css("color", "#b1b8c0");
}

function starScore3() {
	$("#star1").css("color", "#e2f0fe");
	$("#star2").css("color", "#e2f0fe");
	$("#star3").css("color", "#e2f0fe");
	$("#star4").css("color", "#b1b8c0");
	$("#star5").css("color", "#b1b8c0");
}

function starScore4() {
	$("#star1").css("color", "#e2f0fe");
	$("#star2").css("color", "#e2f0fe");
	$("#star3").css("color", "#e2f0fe");
	$("#star4").css("color", "#e2f0fe");
	$("#star5").css("color", "#b1b8c0");
}

function starScore5() {
	$("#star1").css("color", "#e2f0fe");
	$("#star2").css("color", "#e2f0fe");
	$("#star3").css("color", "#e2f0fe");
	$("#star4").css("color", "#e2f0fe");
	$("#star5").css("color", "#e2f0fe");
}

function hoveringScoreLeave() {
	$("#star1").css("color", lastColor1);
	$("#star2").css("color", lastColor2);
	$("#star3").css("color", lastColor3);
	$("#star4").css("color", lastColor4);
	$("#star5").css("color", lastColor5);
}

function noStarScore() {
	$("#star1").css("color", "#b1b8c0");
	$("#star2").css("color", "#b1b8c0");
	$("#star3").css("color", "#b1b8c0");
	$("#star4").css("color", "#b1b8c0");
	$("#star5").css("color", "#b1b8c0");
}

function changeMousePointer() {
	$(".reviewStar").css("cursor", "pointer");
}

function changeMouseNormal() {
	$(".reviewStar").css("cursor", "default");
}

function changeScroll() {
	const target = event.target;
	const to = $(target).data("to");
	
	var position = $("#" + to).offset();
	console.log(position);
	
	$(window).scrollTop(position.top);
}

function openReviewModal() {
	$("#reviewModal").css("display", "block");
	$("body").css("overflow", "hidden");
	$("body").css("height", "100%");
}

function openQnaModal() {
	$("#qnaModal").css("display", "block");
	$("body").css("overflow", "hidden");
	$("body").css("height", "100%");
}

function closeReviewModal() {
	if (confirm("작성된 내용은 저장되지 않습니다.\n닫으시겠습니까?")) {
		resetReviewInputs();
		$("#reviewModal").css("display", "none");
		$("body").css("overflow", "auto");
		$("body").css("height", "auto");
	}
}

function resetReviewInputs() {
	noStarScore();
	lastColor1 = "#b1b8c0";
	lastColor2 = "#b1b8c0";
	lastColor3 = "#b1b8c0";
	lastColor4 = "#b1b8c0";
	lastColor5 = "#b1b8c0";
	$("#reviewForm").get(0).reset();
}

function closeQnaModal() {
	if (confirm("작성된 내용은 저장되지 않습니다.\n닫으시겠습니까?")) {
		$("#qnaModal").css("display", "none");
		$("body").css("overflow", "auto");
		$("body").css("height", "auto");
	}
}

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