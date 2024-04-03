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
		
		IMP.request_pay({
			pg : "nice.iamport02m",
			pay_method : payMethod,
			merchant_uid : "10",
			name : "침대1",
			amount : 100,
			buyer_email : "user1@naver.com",
			buyer_name : "유저일",
			buyer_tel : "010-6416-4164",
			buyer_addr : "서울특별시 구로구",
			buyer_postcode : "123456",
		}, function(rsp) {
			// callback
			//rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
		});
	}

	
	
	function sample6_execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== ''
							&& /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== ''
							&& data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					// 조합된 참고항목을 해당 필드에 넣는다.
					document.getElementById("sample6_extraAddress").value = extraAddr;

				} else {
					document.getElementById("sample6_extraAddress").value = '';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('sample6_postcode').value = data.zonecode;
				document.getElementById("sample6_address").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("sample6_detailAddress")
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
		<div id="content">
			<h3>주문/결제</h3>
			주문자
			<hr />
			이름: <input type="text" name="ordererName" /> <br />
			이메일: <input type="text" name="email" /> <br />
			전화번호: <input type="text" name="phoneNumber" /> <br />
			배송지
			<hr />
			배송지명: <input type="text" name="addrName" /> <br />
			받는 사람: <input type="text" name="receiverName" /> <br />
			전화번호: <input type="text" name="receiverPhone" /> <br />
			주소: <input type="text" id="sample6_postcode" placeholder="우편번호">
			<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
			<input type="text" id="sample6_address" placeholder="주소"><br>
			<input type="text" id="sample6_detailAddress" placeholder="상세주소">
			<input type="text" id="sample6_extraAddress" placeholder="참고항목">

	
	
			<br />
			주문상품  ${fn:length(orderProductList) }건
			<hr />
			<ul>
				<c:forEach items="${orderProductList }" var="orderProduct">				
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
		<div id="side">
			총 상품금액: <span><fmt:formatNumber type="number" pattern="#,###" value="${order.total_price }"/></span>원 <br />
			총 배송비: <span><fmt:formatNumber type="number" pattern="#,###" value="${order.total_delivery_fee }"/></span>원 <br />
			결제금액: <span><fmt:formatNumber type="number" pattern="#,###" value="${order.amount }"/></span>원 <br />
			<button id="purchase">결제하기</button>
		</div>
		</c:if>
	</div>
	
</body>
</html>