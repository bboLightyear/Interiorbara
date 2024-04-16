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
     <!-- 주소api -->
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=4efcfe1bb89f6b2d141d4e7298e8efee&libraries=services"></script>
    
</head>
<body>

<!-- 평수 선택 모달 창 영역 -->
<div class="askModal" id="modal" data-prev-modal="">
    <div class="modal_content">
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
            		<img src="${pageContext.request.contextPath}/resources/img/modalimg/mAsk.png" alt="mAsk" />
           		</div>
            <div class="modal_leftside_content">
                <h4>추가 질문</h4>
                <div>현장환경에 따라 시공비/운임비/운송비/양중비(기타비용)이 추가 될 수 있습니다.</div>
            </div>
            <div class="modal_leftside_question">
                <h4>바로문의</h4>
                010-1234-5678
            </div>
        </div>
			<div class="modal_center">
				<div class="modal_center_header">
					<h3>추가 질문</h3>
					<span id="closeaskModal" class="close">&times;</span>
				</div>
				<div class="Modal_center">
				<div class="modal_center_body">
                <div class="row">      
                        
                    <div class="item6">  
	                    <div class="place">
	                    	<label for="place_l">시공공간종류</label>                  	
	                        <select placeholder="선택해주세요" class="place_s">
	                        	<option value>선택해주세요</option>
	                        	<option value="아파트">아파트</option>
	                        	<option value="빌라">빌라</option>
	                        	<option value="오피스텔">오피스텔</option>
	                        	<option value="단독주택">단독주택</option>
	                        </select>
	                    </div>
                    </div>
                    <div class="item7">
                       	<div class="circs">
	                    	<label for="circs_l">시공환경</label>                  	
	                        <select placeholder="선택해주세요" class="circs_s">
	                        	<option value>선택해주세요</option>
	                        	<option value="신축(5년 미만)">신축(5년 미만)</option>
	                        	<option value="구축(10년 이상)">구축(10년 이상)</option>
	                        </select>
	                    </div>
                    </div>
                    <div class="item8">
                    	<div class="addr">
                    		<label for="sample5_address">주소</label>
                        	<input type="text" id="sample5_address1" placeholder="시공하실 주소를 입력해주세요" >
							<input type="button" class="sample5_address2" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
						</div>
                    </div>
                    <div class="item9">  
	                    <div class="wantdate">
	                    	<label for="wantdate_l">희망시공일자</label>                  	
	                        <select placeholder="선택해주세요" class="wantdate_s">
	                        	<option value>선택해주세요</option>
	                        	<option value="1달 이내">1달 이내</option>
	                        	<option value="1달~2달 이내">1달~2달 이내</option>
	                        	<option value="2달~3달 이내">2달~3달 이내</option>
	                        	<option value="3달 이후">3달 이후</option>
	                        </select>
	                    </div>
                    </div>   
                    <div class="item10">  
	                    <div class="wanttime">
	                    	<label for="wanttime_l">희망상담시간</label>                  	
	                        <select placeholder="선택해주세요" class="wanttime_s">
	                        	<option value>선택해주세요</option>
	                        	<option value="09:00~10:00">09:00~10:00</option>
	                        	<option value="10:00~11:00">10:00~11:00</option>
	                        	<option value="11:00~12:00">11:00~12:00</option>
	                        	<option value="12:00~13:00">12:00~13:00</option>
	                        	<option value="13:00~14:00">13:00~14:00</option>
	                        	<option value="14:00~15:00">14:00~15:00</option>
	                        	<option value="15:00~16:00">15:00~16:00</option>
	                        	<option value="16:00~17:00">16:00~17:00</option>
	                        	<option value="17:00~18:00">17:00~18:00</option>
	                        </select>
	                    </div>
                    </div> 
                    <div class="item11">
                    	<div class="request">
                    		<label for="request_id"></label>
                        	<textarea placeholder="추가로 요청하실 사항이 있으시면 적어주세요!" class="request_ta" id="request_id" cols="68" rows="4" style="border-radius: 8px;padding-block-start: 5px;
    padding-inline-start: 5px;"></textarea>
						</div>
                    </div>                               
                </div>
                	
            </div>
				</div>
				
				<div class="modal_center_footer">
					<button id="askPrivBtn">이전</button>
					<button id="askNextBtn">다음</button>	
						
				</div>			
			</div>
			<div class="rightside">
				<div class="modal_rightside_header">
					<span>요약</span>
				</div>
			<div class="modal_rightside">
				<div class="modal_rightside_body">
					<div class="service_box">
						<div class="selectedSize"></div>
						<div class="selectedService">
							<span id="selectedService"></span>
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
					<div class="selectedItems" id="selectedItems" style="white-space: pre-wrap;">
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
</div>


<script>
var selectedItems = {};
var checkedItems = {};

	 function sample5_execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				var addr = data.address; // 최종 주소 변수
				// 주소 정보를 해당 필드에 넣는다.
				document.getElementById("sample5_address").value = addr;
				// 주소로 상세 정보를 검색

			}
		});
		new daum.Postcode({
			onclose : function(state) {
				//state는 우편번호 찾기 화면이 어떻게 닫혔는지에 대한 상태 변수 이며, 상세 설명은 아래 목록에서 확인하실 수 있습니다.
				if (state === 'FORCE_CLOSE') {
					//사용자가 브라우저 닫기 버튼을 통해 팝업창을 닫았을 경우, 실행될 코드를 작성하는 부분입니다.

				}
			}
		});
	} 
	$(document).ready(function() {
		var askModal = $('.askModal');

		function openModal(modalId) {
			$(modalId).css('display', 'block');

		}

		function closeModal(modalId) {
			$(modalId).css('display', 'none');
		}

		$(document).on('click', '.close', function() {
			closeModal('.askModal');
		});

		$(document).on('click', '#askPrivBtn', function() {
			closeModal('.askModal');
			openModal('.serviceCheckModal');
		});

		$(document).on('click', '#askNextBtn', function() {

			closeModal('.askModal');
			openModal('.infoModal');
		});

		// 시공공간종류 선택 시
		$(".place_s").change(function() {
			var selectedPlace = $(this).val();
			$(".place_result").text(selectedPlace);
		});

		// 시공환경 선택 시
		$(".circs_s").change(function() {
			var selectedCircs = $(this).val();
			$(".circs_result").text(selectedCircs);
		});

		// 시공주소 입력 시
		$("#sample5_address1").on("input", function() {
			var enteredAddr = $(this).val();
			$(".addr_result").text(enteredAddr);
		});
		// 주소 검색 버튼 클릭 시
		$(".sample5_address2").click(function() {

			new daum.Postcode({
				oncomplete : function(data) {
					var addr = data.address;
					$("#sample5_address1").val(addr);
					$(".addr_result").text(addr);
				},
				onclose : function(state) {
					if (state === 'FORCE_CLOSE') {
						// 주소 검색창이 닫힐 때 실행되는 콜백 함수
						// 선택된 주소가 입력 필드에 유지되도록 함
						var selectedAddr = $("#sample5_address1").val();
						$(".addr_result").text(selectedAddr);
					}
				}
			}).open();
		});

		// 희망시공일자 선택 시
		$(".wantdate_s").change(function() {
			var selectedWantdate = $(this).val();
			$(".wantdate_result").text(selectedWantdate);
		});

		// 희망상담시간 선택 시
		$(".wanttime_s").change(function() {
			var selectedWanttime = $(this).val();
			$(".wanttime_result").text(selectedWanttime);
		});

		// 추가요청사항 입력 시
		$(".request_ta").on("input", function() {
			var enteredRequest = $(this).val();
			$(".request_result").text(enteredRequest);
		});

	});
</script>

</body>
</html>