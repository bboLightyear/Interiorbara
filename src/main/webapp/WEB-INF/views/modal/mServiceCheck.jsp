<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 평수 선택 모달 창 영역 -->
<div id="serviceCheckModal" class="modal" data-prev-modal="">
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
                    <li data-step-name="biz" class="">
                        <div>
                            <span>업체추천</span>
                        </div>
                    </li>
                    <li data-step-name="info" class="">
                        <div>
                            <span>정보입력</span>
                        </div>
                    </li>
                    <li data-step-name="date" class="">
                        <div>
                            <span>날짜선택</span>
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
				<div class="modal_center_header">
					<h3>서비스를 선택해주세요.</h3>
					<span id="closeServiceCheckModal" class="close">&times;</span>
				</div>
				<div class="serviceCheckModal_center_body">
					<div>
						<div class="serviceCheckBox">
							<%-- ${db데이터 } --%>
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
				<div class="service_box">
				<div class="selectedSize" ></div>
				<div class="selectedService" >
					<span id="selectedService"></span>
				</div>
				</div>
				
			</div>
		</div>
</div>

<!-- 이전버튼했을때 사이즈나 서비스입력이 업데이트 되게 만들어야함 -->
<script>
$(document).ready(function() {
    var serviceCheckModal = $('#serviceCheckModal');
    
    function openModal(modalId) {
        $(modalId).css('display', 'block');
    }

    function closeModal(modalId) {
        $(modalId).css('display', 'none');
    }

    $(document).on('click', '.close', function() {
        closeModal('#serviceCheckModal');
    });

    $(document).on('click', '#SCPrivBtn', function() {
    	
        var prevModal = serviceCheckModal.attr('data-prev-modal');
        closeModal('#serviceCheckModal');
        openModal('#' + prevModal);
    });
});
</script>

</body>
</html>