<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%
String path=request.getContextPath();
%>
    <title>mStandard.jsp</title>
    <link rel="stylesheet" href="resources/css/modal.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script></head>
<body>


<!-- 평수 선택 모달 창 영역 -->
<div class="sizeModal" id="modal" data-prev-modal="">
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
                <h4>어떤 서비스가 필요하신가요?</h4>
                <div>필요한 서비스를 선택해 주세요.</div>
            </div>
            <div class="modal_leftside_question">
                <h5>바로문의</h5>
                123-456-7890
            </div>
        </div>
			<div class="modal_center">
				<div class="modal_center_header">
					<h3>평수 선택</h3>
					<span id="closeSizeModal" class="close">&times;</span>
				</div>
				<div class="sizeModal_center_body">
					<div>
						<div>
							<h3>평형을 알려주세요.</h3>
							<p class="max_size">최대 평형 99</p>
						</div>

						<div>
							<input type="hidden" id="sizeOption" value="">
						</div>
						<div class="size-control">
							<button id="decreaseSize">-</button>
							<input type="text" id="sizeInput" value="15" min="1" max="99"
								readonly>
							<button id="increaseSize">+</button>
						</div>
					</div>
				</div>
				
				<div class="modal_center_footer">
					<button id="sizePrivBtn">이전</button>
					<button id="sizeNextBtn">다음</button>	
						
				</div>			
			</div>
			
			<div class="modal_rightside">
				<div class="modal_rightside_header">
				<p>요약</p>
				</div>
				<div class="service_box">
				<div class="selectedSize" ></div>
				<div class="selectedService" >
					<span id="selectedService"></span>
				</div>
				</div>
				
			</div>
		</div>
</div>
<%-- <jsp:include page="mServiceCheck.jsp" /> --%>

<script>
$(document).ready(function() {
    var sizeModal = $('.sizeModal');
    var closeSizeModalBtn = $('.close');
    var sizeInput = $('#sizeInput');
    var decreaseBtn = $('#decreaseSize');
    var increaseBtn = $('#increaseSize');
    var privBtn = $('#sizePrivBtn');
   
    function openModal(modalId) {
        $(modalId).css('display', 'block');
    }

    function closeModal(modalId) {
        $(modalId).css('display', 'none');
    }

    closeSizeModalBtn.click(function() {
        closeModal('.sizeModal');
    });

    decreaseBtn.click(function() {
        var currentSize = parseInt(sizeInput.val());
        if (currentSize > 1) {
            sizeInput.val(currentSize - 1);
        }
    });

    increaseBtn.click(function() {
        var currentSize = parseInt(sizeInput.val());
        if (currentSize < 99) {
            sizeInput.val(currentSize + 1);
        }
    });
    privBtn.click(function() {
        closeModal('.sizeModal');
        openModal('.myModal');
    });

    $('#sizeNextBtn').click(function() {
        var selectedSize = $('#sizeInput').val();
        $('.selectedSize').text(selectedSize + '평');
        $('.serviceCheckModal').attr('data-prev-modal', 'sizeModal');

        closeModal('.sizeModal');
        openModal('.serviceCheckModal');
   		
    });
    
});
</script>


</body>
</html>