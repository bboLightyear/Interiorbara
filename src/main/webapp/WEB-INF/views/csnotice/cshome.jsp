<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/cs/csboard.css" />
<link rel="stylesheet" type="text/css" href="resources/css/main/main.css" />
<script>
	/* function sendEmail(event) { // 이벤트 객체를 매개변수로 명시적으로 받음
		var target = event.target; // 이벤트 대상을 가져옴
		var nickname = $(target).data("nickname"); // jQuery를 사용하여 데이터 속성 값 가져옴
		console.log(nickname); // 콘솔에 로그 출력
		
		if (!nickname) { // nickname 값이 null, undefined, 빈 문자열인 경우 체크
			alert("로그인 후 작성해주세요");
			document.getElementById("retarea").blur(); // 입력 필드 포커스 해제
		}
	} */
	function sendEmail(event) {
		event.preventDefault(); // 링크의 기본 동작을 중지
		var target = event.target;
		var nickname = $(target).data("nickname");
		console.log(nickname);

		if (!nickname) {
			alert("로그인 후 작성해주세요");
			// 로그인 페이지로 리다이렉트하거나 다른 적절한 액션 수행
			window.location.href = 'my/login'; // 예시로 로그인 페이지로 이동
		} else {
			// 사용자가 로그인했다면 이메일 페이지로 리다이렉트하거나 이메일을 발송하는 함수 호출
			window.location.href = 'mailservice'; // 예시로 이메일 보내기 페이지로 이동
		}
	}
</script>
</head>
<%@include file ="header.jsp" %>
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
					<a href="mailservice" class="emailbtn" onclick="sendEmail(event)" data-nickname="${loginUserDto.nickname }">이메일보내기</a>
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