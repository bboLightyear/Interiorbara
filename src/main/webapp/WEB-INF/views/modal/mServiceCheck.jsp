<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%
String path=request.getContextPath();
%>
<meta charset="UTF-8">
<title>상품체크창</title>
 <link rel="stylesheet" href="resources/css/modal.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>

<!-- 평수 선택 모달 창 영역 -->
<div class="serviceCheckModal" id="modal" data-prev-modal="">
    <div class="modal_content">
        <div class="modal_leftside">
            <div class=modal_leftside_progress>
                <ul>
                    <li data-step-name="services" class="">
                        <div>
                            <span>어떤 서비스가 필요하신가요?</span>
                        </div>
                    </li>
                    <li data-step-name="service_select" class="">
                        <div>
                            <span>원하는 서비스 선택하기</span>
                        </div>
                    </li>
                    <li data-step-name="ask" class="">
                        <div>
                            <span>추가질문</span>
                        </div>
                    </li>
                    
                    <li data-step-name="info" class="">
                        <div>
                            <span>정보입력</span>
                        </div>
                    </li>
                    
                    <li data-step-name="complete" class="">
                        <div>
                            <span>견적완료</span>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="modal_leftside_content">
                <h4>원하는 서비스 선택하기</h4>
                <div>원하는 서비스를 선택해 주세요.</div>
            </div>
            <div class="modal_leftside_question">
                <h5>바로문의</h5>
                123-456-7890
            </div>
        </div>
			<div class="modal_center">
				<div class="serviceCheckModal_center_header">
					<h3>서비스를 선택해주세요.</h3>
					<span id="closeServiceCheckModal" class="close">&times;</span>
				</div>
				<div class="serviceCheckModal_center">
				<div class="serviceCheckModal_center_body">
					<div>
						<div class="productCheckBox">
					
						</div>	
					</div>
				</div>
				</div>
				
				<div class="modal_center_footer">
					<button id="SCPrivBtn">이전</button>
					<button id="SCNextBtn">다음</button>	
						
				</div>			
			</div>
			
			 <div class="modal_rightside">
				<div class="modal_rightside_header">
				<p>요약</p>
				</div>
				<div class="modal_rightside_body">
					<div class="service_box">
						<div class="selectedSize"></div>
						<div class="selectedService">
							<span id="selectedService"></span>
								<div>추가 :</div>
								<div class="checkedItems" id="checkedItems">
									<!-- 선택한 상품들을 동적으로 생성 -->
								</div>
							
						</div>
					</div>
				</div>
				<div class="modal_rightside_footer">
					<div class="expPrice">예상 견적</div>
					<div>
						<div class="selectedService">
						<span id="selectedService"></span>	
						</div>												
					</div>
					
						<div class="selectedItems" id="selectedItems">
							<!-- 선택한 상품들을 동적으로 생성 -->
						</div>
					
					<div class="totalPrice">
						<div>합계</div>
						<div class="totalPriceValue">0 만원</div>
					</div>
				</div>
			</div>
		</div>
</div>

<!-- 이전버튼했을때 사이즈나 서비스입력이 업데이트 되게 만들어야함 -->
<script>

$(document).ready(function() {
    var serviceCheckModal = $('.serviceCheckModal');
    
   

    // 상품 체크박스 클릭 이벤트 처리 (이벤트 위임 사용)
    $(document).on('change', '.productCheckBox', function() {
        var itemName = $(this).data('name');
        var itemPrice = $(this).data('price');
        var itemQuantity = $(this).closest('.serviceItem').find('.quantity').val();

        if ($(this).is(':checked')) {
            selectedItems[itemName] = {
                price: itemPrice,
                quantity: itemQuantity
            };
            checkedItems[itemName] = {};
        } else {
            delete selectedItems[itemName];
            delete checkedItems[itemName];
        }
        
		
        updateSelectedItems();
        updateTotalPrice();
    });

    // 수량 증가 버튼 클릭 이벤트 처리 (이벤트 위임 사용)
    $(document).on('click', '.increaseQuantity', function() {
        var quantityInput = $(this).siblings('.quantity');
        var currentQuantity = parseInt(quantityInput.val());
        quantityInput.val(currentQuantity + 1);

        var itemName = $(this).closest('.serviceItem').find('.productCheckBox').data('name');
        if (selectedItems[itemName]) {
            selectedItems[itemName].quantity++;
        }

        updateSelectedItems();
        updateTotalPrice();
    });

    // 수량 감소 버튼 클릭 이벤트 처리 (이벤트 위임 사용)
    $(document).on('click', '.decreaseQuantity', function() {
        var quantityInput = $(this).siblings('.quantity');
        var currentQuantity = parseInt(quantityInput.val());
        if (currentQuantity > 1) {
            quantityInput.val(currentQuantity - 1);

            var itemName = $(this).closest('.serviceItem').find('.productCheckBox').data('name');
            if (selectedItems[itemName]) {
                selectedItems[itemName].quantity--;
            }

            updateSelectedItems();
            updateTotalPrice();
        }
    });

 // 선택한 상품들을 업데이트하는 함수
    function updateSelectedItems() {
        var selectedItemsDiv = $('.selectedItems');
        selectedItemsDiv.empty();

        for (var itemName in selectedItems) {
            if (selectedItems.hasOwnProperty(itemName)) {
                var item = selectedItems[itemName];
                var itemPrice = item.price;
                var itemQuantity = item.quantity;
                var totalPrice = itemPrice * itemQuantity;
                var itemDiv = $('<div>').text(itemName);
                var priceDiv = $('<div>').text(totalPrice + '만원');
                selectedItemsDiv.append(itemDiv).append(priceDiv);
            }
        }

        var checkedItemsDiv = $('.checkedItems');
        checkedItemsDiv.empty();

        var isFirst = true;

        for (var itemName in checkedItems) {
            if (checkedItems.hasOwnProperty(itemName)) {
                var itemText = itemName;
                if (isFirst) {
                    itemText =itemText;
                    isFirst = false;
                }
                
                var itemDiv = $('<div id="itemText">').text(itemText);
                checkedItemsDiv.append(itemDiv);
            }
        }
    }

    // 총 가격을 업데이트하는 함수
    function updateTotalPrice() {
        var totalPrice = 0;
        for (var itemName in selectedItems) {
            if (selectedItems.hasOwnProperty(itemName)) {
                var item = selectedItems[itemName];
                var itemPrice = item.price;
                var itemQuantity = item.quantity;
                totalPrice += itemPrice * itemQuantity;
            }
        }
        $('.totalPriceValue').text(totalPrice + ' 만원');
    }

    $(document).on('click', '#SCNextBtn', function() {
    	
     // 선택한 item 정보를 sessionStorage에 저장
        sessionStorage.setItem('selectedItems', JSON.stringify(selectedItems));
        sessionStorage.setItem('checkedItems', JSON.stringify(checkedItems));
        updateSelectedItems();
        updateTotalPrice(); 
       // console.log(selectedItems);
        closeModal('.serviceCheckModal');
        openModal('.askModal');
    });
    function openModal(modalId) {
        $(modalId).css('display', 'block');
    }

    function closeModal(modalId) {
        $(modalId).css('display', 'none');
        
    }

    $(document).on('click', '.close', function() {
        closeModal('.serviceCheckModal');
    });

    $(document).on('click', '#SCPrivBtn', function() {
    	
        var prevModal = serviceCheckModal.attr('data-prev-modal');
        closeModal('.serviceCheckModal');
        openModal('.' + prevModal);
    });
	
});
</script>

</body>
</html>