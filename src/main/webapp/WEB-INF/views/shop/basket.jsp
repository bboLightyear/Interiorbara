<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="../resources/js/shop/basket.js"></script>
<link rel="stylesheet" href="../resources/css/shop/basket.css" />
<meta charset="UTF-8">
<title>Basket</title>
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
				<!-- <img src="resources/img/mainimg/main_logo.jpg" alt="#" onclick="location.href='main'" /> -->
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
        <main>
            <div class="basket_title">장바구니</div>
            <div id="contentWrap">
                <div class="product_group">
                    <div class="check_all">
                        <input type="checkbox" id="checkAll" checked />
                        <div class="check_all_label">
                            <label for="checkAll">전체선택</label>
                        </div>
                    </div>
                    <ul id="productGroup">
                    
                        <c:set var="basketTotalPrice" value="0" />
                        <c:set var="basketTotalDPrice" value="0" />
                        <c:set var="basketTotalDeliveryFee" value="0" />
                        
                        <c:forEach items="${products }" var="product">
                        
                            <c:set var="productTotalPrice" value="0" />
                            <c:set var="productTotalDPrice" value="0" />
                            <c:set var="productTotalDeliveryFee" value="0" />
                            <c:set var="isDiscounted" value="${product.is_discounted eq 'Y' }" />
                            <c:set var="deliveryType" value="${product.delivery_type }" />
                            <div class="product_list">
                                <li class="productItem" data-product-id="${product.product_id }">
                                
                                    <input type="checkbox" name="productCheckBox" class="productCheckBox" data-product-id="${product.product_id }" checked />
                                    <div class="product_name">
                                        ${product.name }
                                    </div>
                                    <div class="product_cancel_btn">
                                        <button class="removeBtn" data-btn-of="product" data-product-id="${product.product_id }">X</button>
                                    </div>
                                    
                                    <ul class="optionGroup">
                                    
                                        <c:forEach items="${baskets }" var="basket">
                                        
                                            <c:if test="${product.product_id eq basket.product_id }">
                                            
                                                <c:set var="optionTotalPrice" value="${basket.option.price * basket.quantity }"/>
                                                <c:set var="optionTotalDPrice" value="${isDiscounted ? basket.option.discounted_price * basket.quantity : 0 }"/>
                                                <div class="option_list">
                                                    <li class="optionItem" data-basket-id="${basket.basket_id }" data-option-id="${basket.option_id }" data-product-id="${basket.product_id }">
                                                        <div class="option_text_wrap">
                                                            <div class="option_item">
                                                                ${basket.option_text }
                                                            </div>
                                                            <div class="option_cancel_btn">
                                                                <button class="removeBtn" data-btn-of="option" data-option-id="${basket.option_id }">X</button>
                                                            </div>
                                                        </div>
                                                        <div class="quantity_button_wrap">
                                                            <div class="quantity_btn">
                                                                <button type="button" class="quantityBtn" data-action="sub" data-option-id="${basket.option_id }">&lt;</button>
                                                            </div>
                                                            <div class="basket_quantity">
                                                                (<span class="optionQuantityNumber" data-option-id="${basket.option_id }" data-quantity="${basket.quantity }">${basket.quantity }</span>)
                                                            </div>
                                                            <div class="quantity_btn">
                                                                <button type="button" class="quantityBtn" data-action="add" data-option-id="${basket.option_id }">&gt;</button>
                                                            </div>
                                                            <div class="option_price_nuber">
                                                                <span class="optionPriceNumber" data-option-id="${basket.option_id }" data-product-id="${basket.product_id }"
                                                                    data-value="${optionTotalPrice }"
                                                                    data-value-d="${optionTotalDPrice }">
                                                                    <fmt:formatNumber type="number" pattern="#,###" value="${isDiscounted ? optionTotalDPrice : optionTotalPrice }"/>원
                                                                </span>
                                                            </div>
                                                        </div>
                                                    </li>
                                                </div>
                                                
                                                <c:set var="productTotalPrice" value="${productTotalPrice + optionTotalPrice }" />
                                                <c:set var="productTotalDPrice" value="${productTotalDPrice + optionTotalDPrice }" />
                                                <c:set var="productTotalDeliveryFee" value="${productTotalDeliveryFee + (product.delivery_fee * basket.quantity) }" />
                                                
                                            </c:if>
                                            
                                        </c:forEach>
                                        
                                    </ul>
                                    <div class="product_total_price">
                                        총 금액:
                                        <span class="productTotalPriceNumber" data-product-id="${product.product_id }" data-value="${productTotalPrice }" data-value-d="${productTotalDPrice }">
                                            <fmt:formatNumber type="number" pattern="#,###" value="${isDiscounted ? productTotalDPrice : productTotalPrice }"/>원
                                        </span>
                                    </div>
                                    
                                    <br />
                                    <div class="product_delivery_fee">
                                        배송비:
                                            <c:choose>
                                            
                                                <c:when test="${deliveryType eq 'free' }">
                                                    <span class="productTotalDeliveryFeeNumber" data-product-id="${product.product_id }" data-value="0">
                                                        무료
                                                    </span>
                                                </c:when>
                                                
                                                <c:when test="${deliveryType eq 'each' }">
                                                    <span class="productTotalDeliveryFeeNumber" data-product-id="${product.product_id }" data-value="${productTotalDeliveryFee }">
                                                        <fmt:formatNumber type="number" pattern="#,###" value="${productTotalDeliveryFee }"/>원
                                                    </span>
                                                    <c:set var="basketTotalDeliveryFee" value="${basketTotalDeliveryFee + productTotalDeliveryFee }" />
                                                </c:when>
                                                
                                                <c:when test="${deliveryType eq 'over' }">
                                                    <c:if test="${isDiscounted ? productTotalDPrice >= product.ref_price : productTotalPrice >= product.ref_price }">
                                                        <span class="productTotalDeliveryFeeNumber" data-product-id="${product.product_id }" data-value="0">
                                                            무료,
                                                        </span>
                                                    </c:if>
                                                    <c:if test="${isDiscounted ? productTotalDPrice < product.ref_price : productTotalPrice < product.ref_price }">
                                                        <span class="productTotalDeliveryFeeNumber" data-product-id="${product.product_id }" data-value="${productTotalDeliveryFee }">
                                                            <fmt:formatNumber type="number" pattern="#,###" value="${productTotalDeliveryFee }"/>원,
                                                        </span>
                                                        <c:set var="basketTotalDeliveryFee" value="${basketTotalDeliveryFee + productTotalDeliveryFee }" />
                                                    </c:if>
                                                        <fmt:formatNumber type="number" pattern="#,###" value="${product.ref_price }"/>원 이상 구매시 무료
                                                    
                                                </c:when>
                                                
                                                <c:when test="${deliveryType eq 'arrival' }">
                                                    <span class="productTotalDeliveryFeeNumber" data-product-id="${product.product_id }" data-value="0">
                                                        착불, <fmt:formatNumber type="number" pattern="#,###" value="${productTotalDeliveryFee }"/>원
                                                    </span>
                                                </c:when>
                                                
                                            </c:choose>
                                    </div>
                                    <br />
                                    
                                </li>
                            </div>
                            
                            <c:set var="basketTotalPrice" value="${basketTotalPrice + productTotalPrice }" />
                            <c:set var="basketTotalDPrice" value="${basketTotalDPrice + productTotalDPrice }" />
                            
                        </c:forEach>
                        
                    </ul>
                </div>
            </div>
            <div id="sideWrap" class="side_wrap">
                <c:set var="basketTotalDiscount" value="${basketTotalPrice - basketTotalDPrice }" />
                <c:set var="basketTotalAmount" value="${basketTotalPrice + basketTotalDeliveryFee }" />
                <c:set var="basketTotalDAmount" value="${basketTotalDPrice + basketTotalDeliveryFee }" />
                <div class="total_price_number_wrap">
                    <div class="total_price_number">
                        총 상품 금액:
                    </div>
                    <div class="total_price_won">
                        <span id="selectedBasketsTotalPriceNumber">
                            <fmt:formatNumber type="number" pattern="#,###" value="${basketTotalPrice }"/>원
                        </span>
                    </div>
                </div>
                <br />
                <div class="total_delivery_wrap">
                    <div class="total_delivery_fee_number">
                        총 배송비:
                    </div>
                    <div class="total_deliver_fee_won">
                        <span id="selectedBasketsTotalDeliveryFeeNumber">
                            <fmt:formatNumber type="number" pattern="#,###" value="${basketTotalDeliveryFee }"/>원
                        </span>
                    </div>
                </div>
                <br />
                <div class="total_discount_wrap">
                    <div class="total_discount_number">
                        총 할인금액:
                    </div>
                    <div class="total_discount_won">
                        <span id="selectedBasketsTotalDiscountNumber">
                            <fmt:formatNumber type="number" pattern="#,###" value="${basketTotalDPrice != 0 ? basketTotalDiscount : 0 }"/>원
                        </span>
                    </div>
                </div>
                <br />
                <div class="total_amount_wrap">
                    <div class="total_amount_number">
                        결제금액:
                    </div>
                    <div class="total_amount_won">
                        <span id="selectedBasketsAmountNumber">
                            <fmt:formatNumber type="number" pattern="#,###" value="${basketTotalDPrice != 0 ? basketTotalDAmount : basketTotalAmount }"/>원
                        </span>
                    </div>
                </div>
                <br />
                <div class="purchase_btn">
                    <button type="button" id="purchaseBtn">구매하기</button>
                </div>
            </div>
        </main>
    </div>
    <br />
    <!-- 푸터 -->
	<footer>
		<!-- 푸터 로고 -->
		<div class="footer_logo">
			<!-- <img src="resources/img/mainimg/footer_logo.PNG" alt="#" onclick="location.href='main'"  /> -->
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