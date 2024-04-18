<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="../resources/js/shop/list.js"></script>
<link rel="stylesheet" href="../resources/css/shop/list.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<title>Product List</title>
</head>
<body>
	<%
	if (session.getAttribute("userId") == null) {
		session.setAttribute("userId", "1");
	}
	%>
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
				<a href="../shop/list">소품샵</a>
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
	</header>
	<br />
	<br />
	<div class="body_section">
		<div class="management_link">
			<a href="management">상품등록</a>
		</div>
		<div class="level_categories_wrap_1 category_0">
			<c:forEach items="${levelCategories }" var="level_1">
				<div class="category_level_1">
					<c:if test="${level_1.level == 1 }">
						<a href="list?categoryId=${level_1.category_id }">${level_1.name }</a>
					</c:if>
				</div>
			</c:forEach>
		</div>
		<!-- category_1 -->
		<!-- category_1 -->
			<div class="level_categories_wrap_2 category_1">
				<c:forEach items="${levelCategories }" var="level_2">
					<div class="category_level_2">
						<c:if test="${level_2.level == 2 && level_2.category_id < 20000 }">
							<a href="list?categoryId=${level_2.category_id }">${level_2.name }</a>
						</c:if>
					</div>
				</c:forEach>
			</div>
			<!-- category_1_category_1 -->
			<!-- category_1_category_1 -->
				<div class="level_categories_wrap_3 category_1_category_1">
					<c:forEach items="${levelCategories }" var="level_3">
						<div class="category_level_3">
							<c:if test="${level_3.level == 3 && level_3.category_id < 10200 }">
								<a href="list?categoryId=${level_3.category_id }">${level_3.name }</a>
							</c:if>
						</div>
					</c:forEach>
				</div>
				<div class="level_categories_wrap_3 category_1_category_2">
					<c:forEach items="${levelCategories }" var="level_3">
						<div class="category_level_3">
							<c:if test="${level_3.level == 3 && level_3.category_id > 10200 && level_3.category_id < 10300 }">
								<a href="list?categoryId=${level_3.category_id }">${level_3.name }</a>
							</c:if>
						</div>
					</c:forEach>
				</div>
				<div class="level_categories_wrap_3 category_1_category_3">
					<c:forEach items="${levelCategories }" var="level_3">
						<div class="category_level_3">
							<c:if test="${level_3.level == 3 && level_3.category_id > 10300 && level_3.category_id < 10400 }">
								<a href="list?categoryId=${level_3.category_id }">${level_3.name }</a>
							</c:if>
						</div>
					</c:forEach>
				</div>
				<div class="level_categories_wrap_3 category_1_category_4">
					<c:forEach items="${levelCategories }" var="level_3">
						<div class="category_level_3">
							<c:if test="${level_3.level == 3 && level_3.category_id > 10400 && level_3.category_id < 10500 }">
								<a href="list?categoryId=${level_3.category_id }">${level_3.name }</a>
							</c:if>
						</div>
					</c:forEach>
				</div>
					<!-- category_1_category_1_category_1 -->
					<!-- category_1_category_1_category_1 -->
					<div class="level_categories_wrap_4 category_1_category_1_category_1">
						<c:forEach items="${levelCategories }" var="level_4">
							<div class="category_level_4">
								<c:if test="${level_4.level == 4 && level_4.category_id > 10103 && level_4.category_id < 10113 }">
									<a href="list?categoryId=${level_4.category_id }">${level_4.name }</a>
								</c:if>
							</div>
						</c:forEach>
					</div>
					<div class="level_categories_wrap_4 category_1_category_1_category_2">
						<c:forEach items="${levelCategories }" var="level_4">
							<div class="category_level_4">
								<c:if test="${level_4.level == 4 && level_4.category_id > 10112 && level_4.category_id < 10120 }">
									<a href="list?categoryId=${level_4.category_id }">${level_4.name }</a>
								</c:if>
							</div>
						</c:forEach>
					</div>
			<div class="level_categories_wrap_2 category_2">
				<c:forEach items="${levelCategories }" var="level_2">
					<div class="category_level_2">
						<c:if test="${level_2.level == 2 && level_2.category_id > 20000 && level_2.category_id < 30000 }">
							<a href="list?categoryId=${level_2.category_id }">${level_2.name }</a>
						</c:if>
					</div>
				</c:forEach>
			</div>
			<div class="level_categories_wrap_2 category_3">
				<c:forEach items="${levelCategories }" var="level_2">
					<div class="category_level_2">
						<c:if test="${level_2.level == 2 && level_2.category_id > 30000 && level_2.category_id < 40000 }">
							<a href="list?categoryId=${level_2.category_id }">${level_2.name }</a>
						</c:if>
					</div>
				</c:forEach>
			</div>
			<div class="level_categories_wrap_2 category_4">
				<c:forEach items="${levelCategories }" var="level_2">
					<div class="category_level_2">
						<c:if test="${level_2.level == 2 && level_2.category_id > 40000 && level_2.category_id < 50000 }">
							<a href="list?categoryId=${level_2.category_id }">${level_2.name }</a>
						</c:if>
					</div>
				</c:forEach>
			</div>
			<div class="level_categories_wrap_2 category_5">
				<c:forEach items="${levelCategories }" var="level_2">
					<div class="category_level_2">
						<c:if test="${level_2.level == 2 && level_2.category_id > 50000 && level_2.category_id < 60000 }">
							<a href="list?categoryId=${level_2.category_id }">${level_2.name }</a>
						</c:if>
					</div>
				</c:forEach>
			</div>
			<div class="level_categories_wrap_2 category_6">
				<c:forEach items="${levelCategories }" var="level_2">
					<div class="category_level_2">
						<c:if test="${level_2.level == 2 && level_2.category_id > 60000 }">
							<a href="list?categoryId=${level_2.category_id }">${level_2.name }</a>
						</c:if>
					</div>
				</c:forEach>
			</div>
		
		<script>
			document.addEventListener('DOMContentLoaded', category1fn = function() {
				const category1 = document.querySelectorAll('.level_categories_wrap_1 a');
				
				function adjustDisplay(categoryId) {
				  switch (categoryId) {
				    case 10000:
				      document.querySelector('.category_1').style.display = 'block';
				      document.querySelector('.category_2').style.display = 'none';
				      document.querySelector('.category_3').style.display = 'none';
				      document.querySelector('.category_4').style.display = 'none';
				      document.querySelector('.category_5').style.display = 'none';
				      document.querySelector('.category_6').style.display = 'none';
				      break;
				    case 20000:
				      document.querySelector('.category_1').style.display = 'none';
				      document.querySelector('.category_2').style.display = 'block';
				      document.querySelector('.category_3').style.display = 'none';
				      document.querySelector('.category_4').style.display = 'none';
				      document.querySelector('.category_5').style.display = 'none';
				      document.querySelector('.category_6').style.display = 'none';
				      break;
				    case 30000:
				      document.querySelector('.category_1').style.display = 'none';
				      document.querySelector('.category_2').style.display = 'none';
				      document.querySelector('.category_3').style.display = 'block';
				      document.querySelector('.category_4').style.display = 'none';
				      document.querySelector('.category_5').style.display = 'none';
				      document.querySelector('.category_6').style.display = 'none';
				      break;
				    case 40000:
				      document.querySelector('.category_1').style.display = 'none';
				      document.querySelector('.category_2').style.display = 'none';
				      document.querySelector('.category_3').style.display = 'none';
				      document.querySelector('.category_4').style.display = 'block';
				      document.querySelector('.category_5').style.display = 'none';
				      document.querySelector('.category_6').style.display = 'none';
				      break;
				    case 50000:
				      document.querySelector('.category_1').style.display = 'none';
				      document.querySelector('.category_2').style.display = 'none';
				      document.querySelector('.category_3').style.display = 'none';
				      document.querySelector('.category_4').style.display = 'none';
				      document.querySelector('.category_5').style.display = 'block';
				      document.querySelector('.category_6').style.display = 'none';
				      break;
				    case 60000:
				      document.querySelector('.category_1').style.display = 'none';
				      document.querySelector('.category_2').style.display = 'none';
				      document.querySelector('.category_3').style.display = 'none';
				      document.querySelector('.category_4').style.display = 'none';
				      document.querySelector('.category_5').style.display = 'none';
				      document.querySelector('.category_6').style.display = 'block';
				      break;
				    default:
				      break;
				  }
				}
				category1.forEach(function(link) {
					link.addEventListener('click', function(event) {
						event.preventDefault();
						const categoryId = parseInt(link.getAttribute('href').split('=')[1]);
						adjustDisplay(categoryId);
					});
				});
			});
			
			document.addEventListener('DOMContentLoaded', category2fn = function() {
				const category2 = document.querySelectorAll('.level_categories_wrap_2 a');
				
				function adjustDisplay(categoryId) {
					switch (categoryId) {
						case 10100:
							document.querySelector('.category_1_category_1').style.display = 'block';
							document.querySelector('.category_1_category_2').style.display = 'none';
							document.querySelector('.category_1_category_3').style.display = 'none';
							document.querySelector('.category_1_category_4').style.display = 'none';
						  break;
						case 10200:
							document.querySelector('.category_1_category_1').style.display = 'none';
							document.querySelector('.category_1_category_2').style.display = 'block';
							document.querySelector('.category_1_category_3').style.display = 'none';
							document.querySelector('.category_1_category_4').style.display = 'none';
						  break;
						case 10300:
							document.querySelector('.category_1_category_1').style.display = 'none';
							document.querySelector('.category_1_category_2').style.display = 'none';
							document.querySelector('.category_1_category_3').style.display = 'block';
							document.querySelector('.category_1_category_4').style.display = 'none';
						  break;
						case 10400:
							document.querySelector('.category_1_category_1').style.display = 'none';
							document.querySelector('.category_1_category_2').style.display = 'none';
							document.querySelector('.category_1_category_3').style.display = 'none';
							document.querySelector('.category_1_category_4').style.display = 'block';
						  break;
						default:
						  break;
					}
				}
				category2.forEach(function(link) {
					link.addEventListener('click', function(event) {
						event.preventDefault();
						const categoryId = parseInt(link.getAttribute('href').split('=')[1]);
						adjustDisplay(categoryId);
					});
				});
			 });
			
			document.addEventListener('DOMContentLoaded', category3fn = function() {
				const category3 = document.querySelectorAll('.level_categories_wrap_3 a');
				
				function adjustDisplay(categoryId) {
					switch (categoryId) {
						case 10101:
							document.querySelector('.category_1_category_1_category_1').style.display = 'block';
							document.querySelector('.category_1_category_1_category_2').style.display = 'none';
						  break;
						case 10102:
							document.querySelector('.category_1_category_1_category_1').style.display = 'none';
							document.querySelector('.category_1_category_1_category_2').style.display = 'block';
						  break;
						case 10103:
							document.querySelector('.category_1_category_1_category_1').style.display = 'none';
							document.querySelector('.category_1_category_1_category_2').style.display = 'none';
						  break;
						default:
						  break;
				}
			}
			category3.forEach(function(link) {
				link.addEventListener('click', function(event) {
					event.preventDefault();
					const categoryId = parseInt(link.getAttribute('href').split('=')[1]);
					adjustDisplay(categoryId);
					});
				});
			});
		</script>

		<div class="products_wrap">
			<div class="products_top_wrap">
				<div class="products_category_name">
					${category.name }
				</div>
				<br />
				<div class="products_count_wrap">
					<div class="products_count">
						상품 개수:
					</div>
					<div class="products_count_count">
						${productCnt }
					</div>
				</div>
			</div>
			<div class="product_list_table">
				<table>
					<c:forEach items="${productList }" var="product" varStatus="status">
						<a href="product?productId=${product.product_id }" class="productItem">
							<img src="../resources/upload/shop/${product.rep_img }" class="productRepImg" alt="${product.product_id } 이미지" />
							${product.name }
						</a>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
	<br />
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