<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%
	String path = request.getContextPath();
%>
<meta charset="UTF-8">
<title>고객정보창</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/modal.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</head>
<body>
	<!-- mInfo.jsp -->
	<!-- 평수 선택 모달 창 영역 -->
	<div class="infoModal" id="modal" data-prev-modal="">
		<div class="modal_content">
			<div class="modal_leftside">
				<div class=modal_leftside_progress>
				<!-- 	<ul>
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
            		<img src="${pageContext.request.contextPath}/resources/img/modalimg/mInfo.png" alt="mInfo" />
           		</div>
				<div class="modal_leftside_content">
					<h4>정보 입력</h4>
					<div>연락을 드릴 수 있는 고객님의 정보를 입력해 주세요!</div>
				</div>
				<div class="modal_leftside_question">
					<h4>바로문의</h4>
                010-1234-5678
				</div>
			</div>
			<div class="modal_center">
				<div class="modal_center_header">
					<h3>고객 정보 입력</h3>
					<span class="summary-button">요약보기</span>
					<span id="closeaskModal" class="close">&times;</span>
				</div>
				<div class="Modal_center">
					<div class="modal_center_body">
						<div class="infoRow">
							<div class="users"></div>
							<form id="nonMemberForm"
								action="<%=request.getContextPath()%>/modal/insertNonMember"
								method="post">
								<div class="item12">
									<label for="name">성함</label> <input type="text" id="name"
										name="name" placeholder="성함" required>
								</div>
								<div class="item13">
									<label for="email">이메일</label> <input type="email" id="email"
										name="email" placeholder="이메일 주소" required>
								</div>
								<div class="item14">
									<label for="phone">휴대번호</label> <input type="tel" id="phone"
										name="phone" class="phone" placeholder="01012345678 (- 제외 )" required>
								</div>
								<div class="item-pw">
									<div class="item15">
										<label for="password">비밀번호</label> <input type="password"
											id="password" name="pw" placeholder="비밀번호" required>
									</div>
									<div class="item16">
										<label for="confirmPassword">비밀번호확인</label> <input
											type="password" id="confirmPassword" name="confirmPassword"
											 placeholder="비밀번호확인" required>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>

				<div class="modal_center_footer">
					<button id="infoPrivBtn">이전</button>
					<button id="infoNextBtn">다음</button>

				</div>
			</div>
			<div class="rightside rightside-ani">
				<div class="modal_rightside_header">
					<span>요약</span>
				</div>
			<div class="modal_rightside">
				<div class="modal_rightside_body">
					<div class="service_box">
						<div class="selectedSize complete-selectedSize" id="complete-selectedSize"></div>
						<div class="selectedService">
							<span id="selectedService"></span>
							<div class="checkedItems complete-checkedItems" id="complete-checkedItems">
								<!-- 선택한 상품들을 동적으로 생성 -->
							</div>
						</div>
						<div class="questionAsk" id="questionAsk">
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
				</div>
				<div class="modal_rightside_footer">
					<div class="expPrice">예상 견적</div>
					<div>
						<div class="selectedService">
							<span id="selectedService"></span>
						</div>
					</div>
					<div class="selectedItems complete-selectedItems" id="complete-selectedItems" style="white-space: pre-wrap;">
						<!-- 선택한 상품들을 동적으로 생성 -->
					</div>
					<div class="totalPrice">
						<div>합계</div>
						<div class="totalPriceValue complete-totalPriceValue">0 만원</div>
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
				var infoModal = $('.infoModal');
				
				function openModal(modalId) {
					$(modalId).css('display', 'block');	

				}

				function closeModal(modalId) {
					$(modalId).css('display', 'none');
				}

				$(document).on('click', '.close', function() {
					closeModal('.infoModal');
				});

				$(document).on('click', '#infoPrivBtn', function() {
					closeModal('.infoModal');
					openModal('.askModal');
				});
				
			
				$(document).on('click', '#infoNextBtn', function() {
					
					var email = $('#email').val();
				    var password = $('#password').val();
				    var confirmPassword = $('#confirmPassword').val();
				    var phone = $('#phone').val();

				    // 이메일 형식 검증
				    var emailPattern = /^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$/;
				    if (!emailPattern.test(email)) {
				        alert('올바른 이메일 형식으로 입력해주세요.');
				        return;
				    }

				    // 비밀번호 길이 검증
				    if (password.length < 4) {
				        alert('비밀번호는 4자리 이상으로 입력해주세요.');
				        return;
				    }

				    // 비밀번호 일치 여부 검증
				    if (password !== confirmPassword) {
				        alert('비밀번호가 일치하지 않습니다.');
				        return;
				    }

				    // 전화번호 형식 검증
				    var phonePattern = /^010\d{8}$/;
				    if (!phonePattern.test(phone)) {
				        alert('올바른 핸드폰번호 형식으로 입력해주세요.');
				        return;
				    }

				    
				    
				    $.ajax({
				        type: 'POST',
				        url: '<%=path%>/modal/insertNonMember',
				        data: $('#nonMemberForm').serialize(),
				        success: function() {
				        	var modalCompleteDto = {
					                m_addr: $('#addr_result').text(),
					                phone: $('.phone').val(),
					                m_content: $('#complete-checkedItems').text(),
					                m_size: $('#complete-selectedSize').text(),
					                m_request: $('#request_result').text(),
					                m_price: $('.complete-totalPriceValue').text(),
					                m_wanttime: $('#wanttime_result').text(),
					                m_wantdate: $('#wantdate_result').text(),
					                m_circs: $('#circs_result').text(),
					                m_place: $('#place_result').text(),
					                m_type: $('#selectedService').text(),
					                m_contentprice: $('#complete-selectedItems').text()
					                
					            };

				            $.ajax({
				                type: 'POST',
				                url: '<%=path%>/modal/updateModalComplete',
				                contentType: 'application/json',
				                data: JSON.stringify(modalCompleteDto),
				                success: function() {
				                    console.log('updateModalComplete 성공');

				                    // 서버로부터 완료 정보를 가져오는 AJAX 요청
				                    $.ajax({
				                        type: 'GET',
				                        url: '<%=path%>/modal/complete',
				                        data: { phone: $('.phone').val() },
				                        success: function(data) {
				                        	 $('.estino').text(data.estino);
				                        	 $('.customer-info').html('성함  ' + data.name + '<br>' + '이메일  ' + data.email + '<br>' + '전화번호  ' + data.phone);
				                             openModal('.completeModal');
				                             closeModal('.infoModal');
				                        },
				                        error: function() {
				                            alert('이미 등록된 정보이거나 잘못된 정보입니다.');
				                        }
				                    });
				                },
				                error: function() {
				                    alert('AJAX updateModalComplete = 오류가 발생했습니다.');
				                }
				            });
				            
				        },
				        error: function() {
				            alert('AJAX insertNonMember = 오류가 발생했습니다.');
				        }
				        
				    });
				    
				    
				    
				});
				
				
});
</script>

</body>
</html>