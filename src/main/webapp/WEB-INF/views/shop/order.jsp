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
<title>Insert title here</title>
<style>
	#wrap {
		width: 800px;
		margin: auto;
	}
	
	#content {
		float: left;
		width: 70%;
		background-color: #fffdfd;
	}
	
	#side {
		float: right;
		width: 30%;
		background-color: #fdfdff;
	}
	
	.orderProduct {
		background-color: #f0f0f0;
		margin-top: 5px;
		margin-bottom: 5px;
	}
	
	ul {
		list-style: none;
	}
</style>
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
		const orderName = $("#side").data("orderName") + " 외 " + $("#side").data("productCnt") + "건";
		const orderAmount = $("#side").data("orderAmount");
		
		IMP.request_pay({
			pg : "nice.iamport02m",
			pay_method : payMethod,
			merchant_uid : merchantUid,
			name : orderName,
			amount : 100,
			buyer_name : $("#ordererName").val()
/* 			buyer_email : "user1@naver.com",
			buyer_name : "유저일",
			buyer_tel : "010-6416-4164",
			buyer_addr : "서울특별시 구로구",
			buyer_postcode : "123456", */
		}, function(rsp) {
			// callback
			//rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
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
	<h3>order.jsp</h3>
	
	<div id="wrap">
		<c:if test="${result ne -1 }">
		<div id="content" data-order-id="${order.order_id }">
			<h3>주문/결제</h3>
			주문자
			<hr />
			이름: <input type="text" name="ordererName" id="ordererName" /> <br />
			이메일: <input type="text" name="email" id="email" /> <br />
			전화번호: <input type="text" name="phoneNumber" id="phoneNumber" /> <br />
			배송지
			<hr />
			배송지명: <input type="text" name="addrName" id="addrName" /> <br />
			받는 사람: <input type="text" name="receiverName" id="receiverName" /> <br />
			전화번호: <input type="text" name="receiverPhone" id="receiverPhone" /> <br />
			주소: <input type="text" id="postcode" placeholder="우편번호" readonly="readonly">
			<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
			<input type="text" id="address" placeholder="주소"><br>
			<input type="text" id="detailAddress" placeholder="상세주소">

	
	
			<br />
			주문상품  ${fn:length(orderProductList) }건
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
							상품명: ${orderProduct.name } <br />
							${orderProduct.option_text } <br />
							총 가격: <span><fmt:formatNumber type="number" pattern="#,###" value="${orderProduct.total_price }"/></span>원 <br />
							수량: ${orderProduct.quantity } <br />
						</div>
					</li>
				</c:forEach>
			</ul>
			결제수단
			<hr />
			<input type="radio" name="payMethod" value="card" />카드
			<input type="radio" name="payMethod" value="trans" />실시간 계좌이체
			<input type="radio" name="payMethod" value="vbank" />가상계좌
			<input type="radio" name="payMethod" value="phone" />휴대폰
			<input type="radio" name="payMethod" value="kakaopay" />카카오페이
			
		</div>
		<div id="side" data-order-name="${orderName }" data-order-amount="${order.amount }" data-product-cnt="${productCnt }">
			총 상품금액: <span><fmt:formatNumber type="number" pattern="#,###" value="${order.total_price }"/></span>원 <br />
			총 배송비: <span><fmt:formatNumber type="number" pattern="#,###" value="${order.total_delivery_fee }"/></span>원 <br />
			결제금액: <span><fmt:formatNumber type="number" pattern="#,###" value="${order.amount }"/></span>원 <br />
			<button id="purchase">결제하기</button>
		</div>
		</c:if>
	</div>
	
</body>
</html>