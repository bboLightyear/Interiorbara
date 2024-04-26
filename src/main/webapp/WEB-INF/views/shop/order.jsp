<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet" href="../resources/css/shop/order.css" />
<title>Order</title>
<script>
	$(document).ready(function() {
		var result = ${result};
		if (result === -1) {
			alert("접근불가");
		}
	});
</script>
<script>
	$(document).ready(function() {
		$("#purchase").on("click", requestPay);
	});

	var IMP = window.IMP;
	IMP.init("imp18525217");

	function requestPay() {
		if(!$("input[name='payMethod']").is(":checked")) {
			alert("결제 방법을 선택해주세요");
			return;
		}
		
		const payMethod = $("input[name='payMethod']:checked").val();
		const merchantUid = $("#content").data("orderId");
		let orderName = $("#side").data("orderName");;
		if ($("#side").data("productCnt") > 0){
			orderName += " 외 " + $("#side").data("productCnt") + "건";
		}
		const orderAmount = $("#side").data("orderAmount");
		
		IMP.request_pay({
			pg : "nice.iamport02m",
			pay_method : payMethod,
			merchant_uid : merchantUid,
			name : orderName,
			amount : 100,
			buyer_name : $("#ordererName").val()
			/* notice_url: "https://1260-211-197-18-247.ngrok-free.app/ibara/shop/order/verify" */
		}, function(rsp) {
			// callback
			
			if (rsp.success) {
				$.ajax({
					type: "post",
					async: true,
					url: "order/complete",
					data: {
						"orderId" : rsp.merchant_uid,
						"ordererName" : $("#ordererName").val(),
						"email" : $("#email").val(),
						"phoneNumber" : $("#phoneNumber").val(),
						"addrName" : $("#addrName").val(),
						"receiverName" : $("#receiverName").val(),
						"receiverPhone" : $("#receiverPhone").val(),
						"zipcode" : $("#postcode").val(),
						"bigAddress" : $("#address").val(),
						"detailAddress" : $("#detailAddress").val(),
						"paymentType" : payMethod
					},
					success: function() {
						alert("결제성공");
						location.href = "list";
					}
				});
			} else {
				alert("결제에 실패했습니다. 에러 내용:\n" + rsp.error_msg);
			}
		});
	}

	function execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('postcode').value = data.zonecode;
				document.getElementById("address").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("detailAddress")
						.focus();
			}
		}).open();
	}
</script>
</head>
<body>
    <!-- 헤더 -->
	<header>
		<!-- header_top : 헤더 윗부분 -->
		<div class="header_top">
			<!-- 왼쪽 여백 -->
			<div></div>
			<!-- header_logo : 로고 -->
			<div class="header_logo">
				<img src="../resources/img/mainimg/main_logo.jpg" alt="#" onclick="location.href='../'" />
			</div>
			<!-- header_search_box : 검색창 -->
			<div class="header_search_box">
				<form action="mainSearchView" method="get">
					<i class="fas fa-search header_search_box_icon"></i> <input
						type="text" name="mainSearchContent" value="${mainSearchContent }"
						class="header_search_box_input" placeholder="검색">
				</form>
			</div>
			<!-- header_login_box : 회원관리부분 -->
			<div class="header_login_box">
			<!-- 로그인 세션 부분 -->
				<c:choose>
				   <c:when test="${loginUserDto eq null }">
		   				<div class="header_login">
							<a href="my/loginform">로그인</a>
						</div>
						<div class="header_join">
							<a href="my/joinform">회원가입</a>
						</div>
				   </c:when>
				   <c:otherwise>
					${loginUserDto.nickname }님 로그인 되었습니다. <br />
					${loginUserDto.memno}번 회원님 로그인 되었습니다. <br />   
					${loginUserDto.email}님 로그인 되었습니다.<br />
	   					<div class="header_login">
							<a href="my/logout">로그아웃</a>
						</div>
						<div class="header_join">
							<a href="my/mypage">mypage</a>
						</div>
				   </c:otherwise>
				</c:choose>
			</div>

			<!-- 오른쪽 여백 -->
			<div></div>
		</div>
		<!-- header_bottom : 헤더 아랫부분 -->
		<div id="header_bottom" class="header_bottom">
			<!-- header_category_icon : 카테고리 아이콘 -->
			<div class="header_category_icon">
				<i class="fas fa-bars"></i>
			</div>
			<!-- header_category_list : 카테고리 / list_1~5 : list에 각각 들어갈 내용 -->
			<div class="header_category_list list_1">
				<a href="#" class="openModal">퀵견적</a>
			</div>
			<div class="header_category_list list_2">
				<a href="shop/list">소품샵</a>
			</div>
			<div class="header_category_list list_3">
				<a href="biz/magazine/bizMgzList">업체 둘러보기</a>
			</div>
			<div class="header_category_list list_4">
				<a href="oh/OHMainView">우리 집 자랑하기</a>
			</div>
			<div class="header_category_list list_5">
				<a href="cshome">고객센터</a>
			</div>
		</div>
        <script>
            window.addEventListener('scroll', function() {
                var scrollHeight = window.scrollY;
                var headerBottom = document.getElementById('header_bottom');
    
                if(scrollHeight > 10) {
                    headerBottom.style.visibility = 'hidden';
                    headerBottom.style.opacity ='0';
                } else {
                    headerBottom.style.visibility = 'visible';
                    headerBottom.style.opacity ='1';
                }
            });
            </script>
	</header>
    <div class="body_section">
        <div id="wrap">
            <div class="order_title">주문/결제</div>
            <div class="order_group">
                <c:if test="${result ne -1 }">
                    <div id="content" data-order-id="${order.order_id }">
                        <div class="order_info">
                            주문자 정보
                        </div>
                        <hr />
						<div class="info_name">
							이름: <input type="text" name="ordererName" id="ordererName" /> <br />
						</div>
						<div class="info_email">
							이메일: <input type="text" name="email" id="email" /> <br />
						</div>
						<div class="info_phone_number">
							전화번호: <input type="text" name="phoneNumber" id="phoneNumber" /> <br />
						</div>
						<div class="addr_info">
							배송지 정보
						</div>
                        <hr />
						<div class="info_addr_name">
							배송지명: <input type="text" name="addrName" id="addrName" /> <br />
						</div>
						<div class="info_receiver_name">
							받는 사람: <input type="text" name="receiverName" id="receiverName" /> <br />
						</div>
						<div class="info_receiver_phone">
							전화번호: <input type="text" name="receiverPhone" id="receiverPhone" /> <br />
						</div>
						<div class="info_postcode">
							<div class="info_postcode_addr">
								주소: <input type="text" id="postcode" placeholder="우편번호" readonly="readonly">
								<input type="button" id="search_postcode" onclick="execDaumPostcode()" value="우편번호 찾기"><br />
							</div>
						</div>
						<div class="info_address">
							<input type="text" id="address" placeholder="주소"><br>
						</div>
						<div class="info_detail_address">
							<input type="text" id="detailAddress" placeholder="상세주소">
						</div>
                        <br />
						<div class="order_product_count">
							<div class="order_product">
								주문상품
							</div>
							<div class="order_product_list_cnt">
								${fn:length(orderProductList) }
							</div>
							<div class="order_product_cnt">
								건
							</div>
						</div>
                        <hr />
                        <ul>
                            <c:set var="orderName" value="" />
                            <c:set var="productCnt" value="0" />
                            <c:forEach items="${orderProductList }" var="orderProduct" varStatus="status">
                                <c:if test="${status.first }">
                                    <c:set var="orderName" value="${orderProduct.name }" />
                                </c:if>
                                <c:if test="${!status.first }">
                                    <c:set var="productCnt" value="${productCnt + 1 }" />
                                </c:if>
                                <li>
                                    <div class="orderProduct">
										<div class="orderProduct_name_wrap">
											<div class="orderProduct_name">
												상품명:
											</div>
											<div class="orderProduct_name_name">
												${orderProduct.name } <br />
											</div>
										</div>
										<div class="orderProduct_option">
											${orderProduct.option_text } <br />
										</div>
										<div class="order_Product_total_price_wrap">
											<div class="order_Product_total_price">
												총 가격:
											</div>
											<div class="order_Product_total_price_price">
												<span><fmt:formatNumber type="number" pattern="#,###" value="${orderProduct.total_price }"/></span>
											</div>
											<div class="order_Product_total_price_won">
												원 <br />
											</div>
										</div>
										<div class="order_Product_quantity_wrap">
											<div class="order_Product_quantity">
												수량:
											</div>
											<div class="orderProduct_quantity_quantity">
												${orderProduct.quantity } <br />
											</div>
										</div>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
						<div class="order_payment">
							결제수단
						</div>
                        <hr />
                        <input type="radio" name="payMethod" value="card" />카드
                        <input type="radio" name="payMethod" value="trans" />실시간 계좌이체
                        <input type="radio" name="payMethod" value="vbank" />가상계좌
                        <input type="radio" name="payMethod" value="phone" />휴대폰
                        <input type="radio" name="payMethod" value="kakaopay" />카카오페이
                    </div>
            </div>
            <div class="side_wrap">
                <div id="side" data-order-name="${orderName }" data-order-amount="${order.amount }" data-product-cnt="${productCnt }">
                    <div class="total_price_number_wrap">
						<div class="total_price_number">
							총 상품금액: <span><fmt:formatNumber type="number" pattern="#,###" value="${order.total_price }"/></span>
						</div>
						<div class="total_price_won">
							원
						</div>
					</div>
                    <div class="total_delivery_wrap">
						<div class="total_delivery_fee_number">
							총 배송비: <span><fmt:formatNumber type="number" pattern="#,###" value="${order.total_delivery_fee }"/></span>
						</div>
						<div class="total_deliver_fee_won">
							원
						</div>
                    </div>
                    <div class="total_amount_wrap">
						<div class="total_amount_number">
							결제금액: <span><fmt:formatNumber type="number" pattern="#,###" value="${order.amount }"/></span>
						</div>
						<div class="total_amount_won">
							원
						</div>
                    </div>
                    <div class="purchase_btn">
                        <button id="purchase">결제하기</button>
                    </div>
                </div>
            </div>
            </c:if>
        </div>
    </div>
    <br />
	<!-- 푸터 -->
	<footer>
		<!-- 푸터 로고 -->
		<div class="footer_logo">
			<img src="../resources/img/mainimg/footer_logo.PNG" alt="#" onclick="location.href='main'"  />
		</div>
		<!-- 푸터 내용 -->
		<div class="footer_content">(주) 카피바라 주소 : 대한민국 서울시 양천구 목동 655-19
			대표 : 조보근 전화번호 : 010-3017-5283</div>
		<!-- sns 아이콘 -->
		<div class="footer_sns">
			<a href="https://www.facebook.com/"><i class="fab fa-facebook fa-lg"></i></a>
			<a href="https://www.youtube.com/"><i class="fab fa-youtube fa-lg"></i></a>
			<a href="https://www.twitter.com/"><i class="fab fa-twitter fa-lg"></i></a>
			<a href="https://www.twitch.tv/"><i class="fab fa-twitch fa-lg"></i></a>
			<a href="https://www.instagram.com/"><i class="fab fa-instagram fa-lg"></i></a>
		</div>
	</footer>
</body>
</html>