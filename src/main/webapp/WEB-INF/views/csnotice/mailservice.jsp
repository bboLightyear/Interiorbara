<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 문의하기</title>
<link rel="stylesheet" type="text/css" href="resources/css/cs/csboard.css" />
<!-- <link rel="stylesheet" type="text/css" href="mainCSS/main.css" /> -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
</head>
<!-- 헤더 -->
<header>
	<!-- header_top : 헤더 윗부분 -->
	<div class="header_top">
		<!-- 왼쪽 여백 -->
		<div></div>
		<!-- header_logo : 로고 -->
		<div class="header_logo">
			<img src="resources/img/mainimg/main_logo.jpg" alt="#" onclick="location.href='main'" />
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
</header>
<body>

	<div class="cs_mail_wrap_all">
		<div class="cs_home_white_space"></div>
		<div class="cs_home_white_space"></div>
		<div class="cs_home_white_space"></div>
		
		<div class="cs_mail_wrap_title">
			<h2 style="margin: 0;">이메일 문의하기</h2>
			<h4 style="margin: 0;">상품배송 등 쇼핑 관련은 <a href="cshome">고객센터</a>에서 요청해주세요.</h4>
		</div>
		
		<div class="cs_home_white_space"></div>
		
		<form action="mailsend">
			<div class="cs_mail_wrap_selectBox">
				<h4 style="margin: 0;">어떤 유형의 문의인가요?</h4>
				<div class="selectBox">
			  		<select name="maildiv" class="select">
				    	<option disabled selected>문의 종류 🍊</option>
				    	<option value="mi">회원정보 관련</option>
				    	<option value="ev">할인이벤트 관련</option>
				    	<option value="op">주문/결제 관련</option>
				    	<option value="cpb">취소/환불 관련</option>
				    	<option value="del">배송 관련</option>
				    	<option value="sug">서비스 개선 제안</option>
				    	<option value="rep">시스템 오류 제보</option>
				    	<option value="inc">불편신고</option>
				    	<option value="oth">기타</option>
			  		</select>
			  		<span class="icoArrow"><img src="${path }/resources/img/csimg/아래화살표.png" alt="아래화살표"></span>
				</div><!--selectBox  -->
			</div><!--  cs_mail_wrap_selectBox-->
			
			<div class="cs_mail_wrap_form_title">
				<div class="cs_mail_wrap_title_it">
					<h4 style="margin: 0;">제목입력</h4>
				</div>
				<input type="text" class="cs_mail_wrap_form_title_it" name="mailtitle" value="제목을 입력해주세요." onfocus="clearInput(this)"/>
				
				<script>// 글제목 커서 올릴 때 제목입력 문구 사라지게 하는 스크립트
		
		        function clearInput(inputField) {
		            if (inputField.value.trim() === "제목을 입력해주세요.") {
		                inputField.value = "";
		            }
		        }
				</script>
			</div><!--cs_write_wrap_form_title-->
			
			<div class="cs_home_white_space"></div>
			
			<div class="cs_write_mail_form_wrap_content">
				<input type="hidden" name="nickname" value="${ loginUserDto.nickname}" />
				<input type="hidden" name="id" value="${ loginUserDto.email}" />
				
				<div class="cs_write_mail_form_content">
					<h4 style="margin: 0;">내용 입력</h4>
					<textarea type="text" class="cs_mail_wrap_form_content_ta" name="mailcontent"></textarea>
				</div><!--cs_write_wrap_form_content-->
			</div><!--cs_write_wrap_form_wrap_content-->
		
			<div class="cs_write_wrap_form_wrap_filebtn">
				<label for="file-upload" class="custom-file-upload">
	   				<i class="fa fa-cloud-upload"></i> 파일 첨부하기
				</label>
						
				<input id="file-upload" type="file" class="cs_write_wrap_form_filebtn" name="mailfile" multiple="multiple" style="display: none;" onchange="displayFileName(this)"/>
							<!-- <input type="file" class="cs_write_wrap_form_filebtn" name="qbfile" multiple="multiple" /> -->
			</div><!--cs_write_wrap_form_wrap_filebtn-->
					
			<div class="cs_write_wrap_form_file_wrap_display">
				<div id="file-name-display-a" class="cs_write_wrap_form_file_display">
					<p style="margin: 0; border-bottom: 1px;">첨부된 파일</p>
					<div class="" id="file-name-display"> </div>					
				</div>
			</div>
					
			<script>// 사진 첨부 후에 첨부한 사진 리스트 나오도록 하는 스크립트
				function displayFileName(input) {
					const maxFiles = 3; // 최대 파일 수 설정
	
			        const files = input.files;
			        const fileNameDisplay = document.getElementById('file-name-display');
			        const fileNameDisplayA = document.getElementById('file-name-display-a');
	
			        if (files.length >= maxFiles) {
			            alert("파일은 2개까지 업로드 가능합니다."); // 파일 수가 최대 값보다 많으면 알림 표시
			            input.value = null; // 파일 선택 초기화
			            fileNameDisplayA.style.display = "none"; // 파일 이름 표시 부분 숨김
			        } else {
			            fileNameDisplayA.style.display = "flex"; // 파일 이름 표시 부분 표시
	
			            // 파일 이름 표시 부분 업데이트
			            fileNameDisplay.innerHTML = "";
			            for (var i = 0; i < files.length; i++) {
			                const fileNameDiv = document.createElement("div");
			                fileNameDiv.innerText = files[i].name;
			                fileNameDisplay.appendChild(fileNameDiv);
			            }
			        }
			    }
			</script>
						
			<div class="cs_write_wrap_form_wrap_writebtn">
				
				<input type="submit" class="cs_write_wrap_form_writebtn" value="완료" />
			</div><!--cs_write_wrap_form_wrap_writebtn-->		
		</form>
	
	</div><!--cs_mail_wrap_all  -->
</body>
<!-- 푸터 -->
<footer>
	<!-- 푸터 로고 -->
	<div class="footer_logo">
		<img src="resources/img/mainimg/footer_logo.PNG" alt="#"
			onclick="location.href='main'" />
	</div>
	<!-- 푸터 내용 -->
	<div class="footer_content">(주) 카피바라 주소 : 대한민국 서울시 양천구 목동 655-19
		대표 : 조보근 전화번호 : 010-3017-5283</div>
	<!-- sns 아이콘 -->
	<div class="footer_sns">
		<a href="https://www.facebook.com/"><i
			class="fab fa-facebook fa-lg"></i></a> <a
			href="https://www.youtube.com/"><i class="fab fa-youtube fa-lg"></i></a>
		<a href="https://www.twitter.com/"><i
			class="fab fa-twitter fa-lg"></i></a> <a href="https://www.twitch.tv/"><i
			class="fab fa-twitch fa-lg"></i></a> <a
			href="https://www.instagram.com/"><i
			class="fab fa-instagram fa-lg"></i></a>
	</div>
</footer>
</html>