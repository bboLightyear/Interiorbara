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
 	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/modal.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
   
</head>
<body>

<!-- 평수 선택 모달 창 영역 -->
	<div class="completeModal" id="modal" data-prev-modal="">
		<div class="completeModal_content modal_content">
			<div class="modal_leftside">
				<div class=modal_leftside_progress>
					<!-- <ul>
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
					</ul> -->
				</div>
				<div class="img2 modal_leftside_img">
            		<img src="${pageContext.request.contextPath}/resources/img/modalimg/mComplete.png" alt="mComplete" />
           		</div>
				<div class="modal_leftside_content">
					<h3>견적 완료</h3>
					<div>견적이 완료되었습니다. 확인 후 1,2 영업일 내 연락 드리겠습니다.</div>
				</div>
				<div class="modal_leftside_question">
					<h4>바로문의</h4>
                010-1234-5678
				</div>
			</div>
			<div class="complete_modal_center">
				<div class="modal_center_header">
					<h3>견적 완료</h3>
					<span id="closeCompleteModal" class="close">&times;</span>
				</div>
				<div class="Modal_center2">
					<div class="modal_center_body complete_modal_center_body">
						<div class="complete-row">		
							<div class="completeEstino">
							<span class="section-title">견적번호</span>
								<div class="estino">
								     
								</div>
							</div>
							<div class="complete_service_box">
							<span class="section-title">선택사항</span>
							<div class="selectedService">
								<span id="selectedService"></span>
							</div>
							<div class="checkedItems complete-checkedItems" id="complete-checkedItems2">
								<!-- 선택한 상품들을 동적으로 생성 -->
							</div>
						
						<div class="questionAsk" id="complete-questionAsk">
							<div>
								시공공간종류: <span class="place_result" id="place_result"></span>
							</div>
							<div>
								시공환경: <span class="circs_result" id="circs_result"></span>
							</div>
							<div>
								시공주소: <span class="addr_result" id="addr_result"></span>
							</div>
							<div>
								희망시공일자: <span class="wantdate_result" id="wantdate_result"></span>
							</div>
							<div>
								희망상담시간: <span class="wanttime_result" id="wanttime_result"></span>
							</div>
							<div>
								추가요청사항: <span class="request_result" id="request_result"></span>
							</div>
						</div>
					</div>
								<div class="completeInfo">
						        	<span class="section-title">고객</span>
						        	<div class="customer-info"></div>
						 	   </div>
							<div class="completeService">
							    <span class="section-title">서비스</span>
							    <div class="selectedService complete-selectedService">
									<span id="selectedService"></span>
							    <div class="selectedSize complete-selectedSize"></div>
								</div>
							</div>
							<div class="completeSelectedItems">
							    <span class="section-title">추가</span>
							    <div class="selectedItems complete-selectedItems" id="complete-selectedItems" style="white-space: pre-wrap;"></div>
							</div>
							<div class="complete_totalPriceValues">
								<span>예상금액</span><span class="totalPriceValue"></span>
							</div>
							<div class="mBoard_body_3-caution">
								<ul>
									<li>자가거주 용도의 종합리모델링 평균 금액으로, 임대 혹은 기능적 목적의 수리와는 견적이 다릅니다.</li>
									<li>본 금액은 참고용입니다. 상세 조건, 시공지 상황, 업체별 자재비, 인건비, 상세 시공방법 등에 따라 금액이 달라질 수 있으니, 참고로만 이용해 주세요.</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<script>
		var selectedItems = {};
		var checkedItems = {};
		
		$(document).ready(function() {
			
			var completeModal = $('.completeModal');
			 
			  function openModal(modalId) {
		    	  $(modalId).css('display', 'block');
		    	  setTimeout(function() {
		    	    $(modalId).find('.modal_leftside_img, .modal_leftside_content, .rightside-ani, .modal_center_body, .complete_modal_center_body, .mainModal_center_body').addClass('show');
		    	  }, 130);
		    	}

		    function closeModal(modalId) {
		        $(modalId).css('display', 'none');
		        
		    	}

			$(document).on('click', '.close', function() {
				closeModal('.completeModal');
			});

			
		});
	</script>

</body>
</html>