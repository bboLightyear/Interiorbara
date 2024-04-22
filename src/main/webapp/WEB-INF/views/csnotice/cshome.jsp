<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- <%@include file ="header.jsp" %> --%>
<link rel="stylesheet" type="text/css" href="resources/css/cs/csboard.css" />
<link rel="stylesheet" type="text/css" href="resources/css/main/main.css" />
<!-- <link rel="stylesheet" type="text/css" href="resources/css/header_footer.css" /> -->
</head>
	<!-- 헤더 -->
	<header>
		<!-- header_top : 헤더 윗부분 -->
		<div class="header_top">
			<!-- 왼쪽 여백 -->
			<div></div>
			<!-- header_logo : 로고 -->
			<div class="header_logo">
				<img src="${path}/resources/img/mainimg/logo_1_small_1459x344.jpg" alt="#" onclick="location.href='${path}/main'" />
			</div>
			<!-- header_search_box : 검색창 -->
			<div class="header_search_box">
				<form action="${path}/mainSearchView" method="get">
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
							<a href="${path}/my/loginform">로그인</a>
						</div>
						<div class="header_join">
							<a href="${path}/my/joinform">회원가입</a>
						</div>
				   </c:when>
				   <c:otherwise>
				   		<div class="header_nickname">
						   	${loginUserDto.nickname }님 <br />
				   		</div>
	   					<div class="header_login">
							<a href="${path}/my/logout">로그아웃</a>
						</div>
						<div class="header_join">
							<a href="${path}/my/mypage">mypage</a>
						</div>
				   </c:otherwise>
				</c:choose>
			</div>

			<!-- 오른쪽 여백 -->
			<div></div>
		</div>
		<!-- header_bottom : 헤더 아랫부분 -->
		<div id="header_bottom" class="header_bottom">
			<div class="header_category_list list_1">
				<a href="#" class="openModal">퀵견적</a>
			</div>
			<div class="header_category_list list_2">
				<a href="${path}/shop/list">소품샵</a>
			</div>
			<div class="header_category_list list_3">
				<a href="${path}/biz/search/bizAddrSearch">업체 둘러보기</a>
			</div>
			<div class="header_category_list list_4">
				<a href="${path}/oh/OHMainView">우리 집 자랑하기</a>
			</div>
			<div class="header_category_list list_5">
				<a href="${path}/cshome">고객센터</a>
			</div>
		</div>
	</header>
<body>

	<div class="cs_wrap_all">

		<section class="cs_home_section1">

			<div class="cs_wrap_content">
				<div class="cs_wrap_home_notice">

					<div class="cs_home_notice_head">
						<h2 class="cs_home_notice_h2">
							<a href="noticelist" class="cs_home_notice_h2_a">공지사항</a>
						<a href="noticelist" class="cs_home_notice_viewmoew">더보기</a>
						</h2>
					</div>

					<ul class="cs_home_notice_ul">
						<c:forEach items="${noticelist}" var="dto">
							<li class="cs_home_notice_li"><span
								class="cs_home_notice_li_icon">📣</span> <a href=""
								class="cs_home_notice_li_contnet">${dto.nbtitle }</a></li>
						</c:forEach>
					</ul>
				</div>
				<!--cs_wrap_home_notice-->

				<div class="cs_wrap_home_csinfor">
					<h2 class="cs_home_csinfor_h2">
						고객센터<span class="cs_home_csinfor_h2_span">09:00~18:00</span>
					</h2>
					<div class="cs_home_csinfor_pwrap">
						<p class="cs_home_csinfor_p">평일: 전체 문의 상담</p>
						<p class="cs_home_csinfor_p">토요일: 전체(09:00~13:00)</p>
						<p class="cs_home_csinfor_p">일요일: 휴무</p>
					</div>
					<div class="cs_home_white_space"></div>
					<p><span>📞<span> <strong>010-3017-5283</strong></p>

					<!-- <a href="chat" class="chatbtn">채팅상담</a>  -->
					<div class="cs_wrap_mailbtn">
					<a href="mailservice" class="emailbtn">이메일보내기</a>
					<button onclick="copyEmail()" class="emailcopy">이메일 주소 복사</button>
					</div>
				</div>
				<!--cs_wrap_home_csinfor-->
			</div>
			<!--cs_wrap_content-->
		</section>
		
		<script> //이메일 복사 기능 스크립트 
		 function copyEmail() {
		      var email = "bokun0502@gmail.com";
		      
		      // 텍스트를 클립보드에 복사
		      navigator.clipboard.writeText(email)
		        .then(function() {
		          // 복사 성공 시 알림 표시
		          alert("이메일이 복사되었습니다: " + email);
		        })
		        
		        .catch(function(error) {
		          // 복사 실패 시 오류 메시지 표시
		          console.error("클립보드 복사 실패:", error);
		          alert("이메일 복사에 실패했습니다.");
		        });
		    }
		</script>
		

		<div class="cs_home_white_space">
			<!--qna 위 공백-->
		</div>
		

		<div class="cs_home_wrap_qnaboard">

			<div class="cs_home_qnaboard_head">
				<h2 class="cs_home_qnaboard_head_h2">
					<a href="qnalist" class="cs_home_qnaboard_head_h2_a1">QnA</a>
					<a href="qnalist" class="cs_home_qnaboard_head_h2_a2">더보기</a>
				</h2>
			</div><!--cs_home_wrap_qnaboard-->
			<div class="cs_home_qnaboard_nav_wrap">
				
			<nav class="cs_home_qnaboard_nav">

				<label for="nav_all" class="cs_home_qnaboard_nav_label"> 
					<span><a href="cshome?qnadiv=all" id="nav_all" class="cs_home_qnaboard_nav_label_a">전체</a></span>
				</label> 
							
				<label for="nav_qq" class="cs_home_qnaboard_nav_label"> 
					<span><a href="cshome?qnadiv=qq" id="nav_qq" class="cs_home_qnaboard_nav_label_a">퀵견적</a></span>
				</label> 
							
				<label for="nav_oh" class="cs_home_qnaboard_nav_label"> 
					<span><a href="cshome?qnadiv=oh" id="nav_oh" class="cs_home_qnaboard_nav_label_a">우리집 자랑</a></span>
				</label> 
							
				<label for="nav_biz" class="cs_home_qnaboard_nav_label">
					<span><a href="cshome?qnadiv=biz" id="nav_biz" class="cs_home_qnaboard_nav_label_a">업체 관련</a></span>
				</label> 
							
				<label for="nav_sh" class="cs_home_qnaboard_nav_label"> 
					<span><a href="cshome?qnadiv=sh" id="nav_sh" class="cs_home_qnaboard_nav_label_a">소품샵</a></span>
				</label> 
							
				<label for="nav_pf" class="cs_home_qnaboard_nav_label"> 
					<span><a href="cshome?qnadiv=pf" id="nav_pf" class="cs_home_qnaboard_nav_label_a">로그인/회원정보</a></span>
				</label>
							
			</nav>
			</div>
			<!--cs_home_qnaboard_nav_wrap-->

			<section class="cs_home_section2">
				<div class="cs_home_qna_ul_wrap">
				<ul class="cs_home_qna_ul">
					<c:forEach items="${qnalist}" var="dto">					
						<li class="cs_home_qna_li">
						<span class="cs_home_qna_li_icon">❔</span>
						<a href="qnacontent?qbno=${dto.qbno }" class="cs_home_qna_li_contnet">${dto.qbtitle }</a>
						</li>
					</c:forEach>
				</ul>
				</div>
			</section>

		</div>
	</div>
	<!--cs_wrap_all-->


<%@include file ="sidebar.jsp" %>
</body>
<%@include file ="footer.jsp" %>
</html>