<%@page import="com.tech.ibara.csnotice.dto.NoticeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/cs/csboard.css" />
</head>
<header>
	<!-- header_top : 헤더 윗부분 -->
	<div class="header_top">
		<!-- 왼쪽 여백 -->
		<div></div>
		<!-- header_logo : 로고 -->
		<div class="header_logo">
			<i class="fas fa-paw"></i>
		</div>
		<!-- header_search_box : 검색창 -->
		<div class="header_search_box">
			<form action="mainSearchView">
				<i class="fas fa-search header_search_box_icon"></i> <input
					type="text" class="header_search_box_input" placeholder="검색">
			</form>
		</div>
		<!-- header_login_box : 회원관리부분 -->
		<div class="header_login_box">
			<div class="header_login">로그인</div>
			<div class="header_join">회원가입</div>
			<div class="header_cs">마이페이지</div>
		</div>
		<!-- 로그인 세션 부분 -->
		<!--<c:choose>
				<c:when test="${sessionNickname eq null }">
					<a href="my/joinform">join</a> | <a href="my/loginform">login</a>
				</c:when>
				<c:otherwise>
    				${sessionNickname }님 로그인 되었습니다.
    				<br />
					<a href="my/mypagemain">mypage</a> | <a href="my/logout">logout</a>
				</c:otherwise>
			</c:choose> -->
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
		<div class="header_category_list list_1">퀵견적</div>
		<div class="header_category_list list_2">업체 둘러보기</div>
		<div class="header_category_list list_3">소품샵</div>
		<div class="header_category_list list_4">우리 집 자랑하기</div>
		<div class="header_category_list list_5">고객센터</div>
	</div>
</header>

<body>
	<%-- <%session.setAttribute("userId",null);%> --%>
	<%
		session.setAttribute("userId", "cus");
	%>

	<p style="margin: 0">
		userId 값 :<%=session.getAttribute("userId")%></p>
	<%
		System.out.println("userId 값 : " + session.getAttribute("userId"));
	%>

	<div class="cs_qnaboard_whitespace">
		<!--여백-->
	</div>

	<section class="cs_content_section1">
		<div class="cs_content_head">
			                            <!-- 게시글 작성자 프로필 이미지 -->         
			<div class="cs_list_head_wrap_h">
            <%-- 프로필 이미지가 없으면 기본 이미지 --%>
            <c:if test="${empty loginUserDto.profileimg}" >
              <img src="${path }/resources/img/my/user.png" id="OHMainView-photoProfileImage" style="width: 25px; height: 25px;">
              </c:if>
              <%-- 프로필 이미지가 있으면 있는 이미지 --%>
              <c:if test="${!empty loginUserDto.profileimg}" >
              <img src="${path }/resources/upload/my/${loginUserDto.profileimg}" id="OHMainView-photoProfileImage">
              </c:if>   
			 <h3 class="cs_list_head_h">${notice_content.nbtitle }</h3></div>


			<div class="cs_list_head_wrap_span">
				<span>작성자 : ${notice_content.nbwriter }&nbsp;</span> 
				<span>조회수 : ${notice_content.nbhit }&nbsp;</span> 
				<span>${notice_content.nbqnadiv } &nbsp;</span> 
				<span>
					<fmt:formatDate value="${notice_content.nbdate}" pattern="yy/MM/dd" />&nbsp;
				</span>
			</div>

		</div>
	</section>
	<div class="cs_qnaboard_whitespace">
		<!--여백-->
	</div>

	<section class="cs_content_section2">

		<div class="cs_content_section2_content">
			<p style="margin: 0">${notice_content.nbcontent }</p>
		</div>

		<div class="cs_qnaboard_whitespace">
			<!--여백-->
		</div>

		<div class="cs_content_section2_wrap_img">
			<c:forEach items="${imglist}" var="dto">
				<span><img src="${path }/resources/upload/cs/${dto.filesrc}" alt="${dto.filesrc}" class="cs_content_section2_img"/></span>
			</c:forEach>
		</div>
	</section>

	<div class="cs_qnaboard_whitespace">
		<!--여백-->
	</div>

	<%
		if (session.getAttribute("userId") == null) {

	} else {
	%>
	<section class="cs_content_section3">

		<div class="cs_content_section3_rcnt">
			<h3 style="margin: 0">답글 <span class="cs_content_section3_rcnt_span">${replycnt}</span>개</h3>
		</div>

		<form action="noticereply?nbno=${notice_content.nbno }" method="post">
			<div class="cs_content_section3_replyform">
				<span>
					
	           		<c:if test="${empty loginUserDto.profileimg}" >
	              	<img src="${path }/resources/img/my/user.png" id="OHMainView-photoProfileImage" style="width: 35px; height: 35px;">
	              	</c:if>
	              	
	              	<c:if test="${!empty loginUserDto.profileimg}" >
	              	<img src="${path }/resources/upload/my/${loginUserDto.profileimg}" id="OHMainView-photoProfileImage">
	              	</c:if>   
				</span>

				<div class="cs_content_section3_replyform_ti">
					<textarea class="cs_content_section3_replyform_textarea" name="noticereply"></textarea>
					<input type="hidden" name="noticerewriter" value="<%=session.getAttribute("userId")%>" /> 
					<input class="reply_input_btn" type="submit" value="답변" />
				</div>
			</div>
		</form>
	</section>
	<%
		}
	%>

	<section class="cs_content_section4">
		<!--전체 글에 대한 답글 조회  -->
		<c:forEach items="${replylist }" var="dto">
			<div class="cs_content_section4_wrap_rreply">
				<div class="cs_content_section4_wrap_rreply_c">
					<div class="cs_content_section4_wrap_rreply_ni">
						<c:if test="${empty loginUserDto.profileimg}" >
				        	<img src="${path }/resources/img/my/user.png" id="OHMainView-photoProfileImage" style="width: 30px; height: 30px;">
				            </c:if>
				            <%-- 프로필 이미지가 있으면 있는 이미지 --%>
				            <c:if test="${!empty loginUserDto.profileimg}" >
				           	<img src="${path }/resources/upload/my/${loginUserDto.profileimg}" id="OHMainView-photoProfileImage">
				        </c:if> <h4 class="cs_content_section4_wrap_rreply_ni_h4">${dto.rnbwriter }</h4></div>
					<div class="cs_content_section4_wrap_rreply_content">${dto.rnbcontent }</div>
	
					<!--답글 달기 버튼을 클릭 시에 아래에 입력 창이 나타나도록 하는 스크립트-->
					<%
						if (session.getAttribute("userId") == null) {
					%>
					<div class="cs_content_section4_wrap_rreply_btn">
					<%
					} else {
					%>
					<div class="cs_content_section4_wrap_rreply_wrap_btn">
					
					<button  class="cs_content_section4_wrap_rreply_btn" onclick="replyform()" data-rnbno="${dto.rnbno }">답글달기</button>
					<%
						}
					%>
	
					<input class="cs_content_section4_wrap_rreply_btn" type="button" onclick="replyrview()" id="${dto.rnbno }replyvbtn" name="${dto.rnbno }replyvbtn" data-rnbno="${dto.rnbno }" value="답글보기" />
					
					</div>
					<!-- </div> -->
	
					<div class="cs_content_section4_replyrview">
						<div id="${dto.rnbno }replyrview"> </div>
		
						<!--숨겨진 div, id 값을 조회한 답글 번호로 지정하여 위의 스크립트에서 버튼을 각각의 div를 따로 적용-->
						<div id="${dto.rnbno }replyform" class="cs_content_section4_replyrview_wrap_inputform">
							<div class="cs_content_section4_replyrview_inputform">
								<input type="hidden" id="rnbno" name="rnbno" value="${dto.rnbno }" />
								<input type="hidden" id="nbno" name="nbno" value="${dto.nbno }" />
								<input type="hidden" id="rnbstep" name="rnbstep" value="${dto.rnbstep }" /> 
								<input type="hidden" id="rnbgroup" name="rnbgroup" value="${dto.rnbgroup }" /> 
								<input type="hidden" id="rnbindent" name="rnbindent" value="${dto.rnbindent }" />
								<input type="hidden" name="rwriter" id="rwriter" value="<%=session.getAttribute("userId")%>" /> 
		
								<textarea id="rcontent" name="rcontent" class=cs_content_section4_replyrview_inputform_ta></textarea>
								<input class="reply_input_btn" type="button" value="입력" onclick="reply()" data-rnbno="${dto.rnbno }" />
							</div>
							<button class="cs_content_section4_wrap_rreply_btn" onclick="replyformclose()" data-rnbno="${dto.rnbno }">접기</button>
						</div>
					</div>
				
			</div>
		</c:forEach>
	</section>

	<script>
		var viewbtn = false;

		// 답글보기 버튼 처리
		function replyrview() {
			var target = event.target;
			var rnbno = $(target).data("rnbno");

			console.log(rnbno);

			var parent = event.target.parentElement;
			var replyArea = document.getElementById(rnbno + "replyrview");
			var replyvbtn = document.getElementById(rnbno + "replyvbtn");

			$.ajax({
				type : "post",
				async : true,
				url : "nreplyview",
				data : {
					"rnbno" : rnbno
				},
				success : function(data) {
					console.log("success");
					console.log(data);

					viewbtn = true;

					var htmlText = "";

					for (var i = 0; i < data.length; i++) {

						console.log(data[i].rnbcontent);
						
						
						htmlText += "<div class='cs_content_section4_wrap_replyrview'>";
						
						
						htmlText += "<div class='cs_content_section4_replyrview_rni'>";
						htmlText += "<c:if test='${empty loginUserDto.profileimg}' > "+
						"<img src='${path }/resources/img/my/user.png' id='OHMainView-photoProfileImage' style='width: 30px; height: 30px;'> "+
						"</c:if> "+
			            "<c:if test='${!empty loginUserDto.profileimg}'> "+
			           	"<img src='${path }/resources/upload/my/${loginUserDto.profileimg}' id='OHMainView-photoProfileImage'> "+
			        	"</c:if>";
						
						htmlText += "<h4 class='cs_content_section4_wrap_rreply_ni_h4'>";
						htmlText += data[i].rnbwriter;
						htmlText += "</h4>";
						htmlText += "</div>";
		
						htmlText += "<p>";
						htmlText += data[i].rnbcontent;
						htmlText += "</p>";
						htmlText += "</div>";
					}

					// div 못 불러오는 거 확인하는 if문
					if (replyArea) {
						$(replyArea).append(htmlText);
					} else {
						console.error("replyArea is null or undefined");
					}

					replyvbtn.remove();
				}
			})
		}
		// 답글 폼 보이게 하는 스크립트 
		function replyform() {
			/* alert("x"); */
			var target = event.target;
			var rnbno = $(target).data("rnbno");
			var hiddenDiv = document.getElementById(rnbno + "replyform");

			hiddenDiv.style.display = "flex";
			/* hiddenDiv.style.margin = "auto"; */
		}

		// 답글 폼 닫는 스크립트
		function replyformclose() {
			/* alert("x"); */
			var target = event.target;
			var rnbno = $(target).data("rnbno");

			var hiddenDiv = document.getElementById(rnbno + "replyform");

			hiddenDiv.style.display = "none";
		}

		function reply() {
			var target = event.target;

			var rnbno = $(target).data("rnbno");
			var parent = event.target.parentElement;
			var replyArea = document.getElementById(rnbno + "replyrview");

			$.ajax({
				type : "post",
				async : true,
				url : "nreply",
				data : {
					"rnbno" : $(parent).find("#rnbno").val(),
					"nbno" : $(parent).find("#nbno").val(),
					"rnbstep" : $(parent).find("#rnbstep").val(),
					"rnbgroup" : $(parent).find("#rnbgroup").val(),
					"rnbindent" : $(parent).find("#rnbindent").val(),
					"rcontent" : $(parent).find("#rcontent").val(),
					"rwriter" : $(parent).find("#rwriter").val()

				},
				success : function(data) {
					console.log("success");
					console.log(data);

					$(parent).find("#rwriter").val('');
					$(parent).find("#rcontent").val('');

					var htmlText = "";
					var lastIndex = data.length - 1;

					console.log('lastindex' + lastIndex);

					console.log(data[lastIndex].rnbcontent);

					console.log(viewbtn);

					if (viewbtn == true) {
						
						htmlText += "<div class='cs_content_section4_wrap_replyrview'>";
						
						htmlText += "<div class='cs_content_section4_replyrview_rni'>";
						htmlText += "<c:if test='${empty loginUserDto.profileimg}' > "+
						"<img src='${path }/resources/img/my/user.png' id='OHMainView-photoProfileImage' style='width: 30px; height: 30px;'> "+
						"</c:if> "+
			            "<c:if test='${!empty loginUserDto.profileimg}'> "+
			           	"<img src='${path }/resources/upload/my/${loginUserDto.profileimg}' id='OHMainView-photoProfileImage'> "+
			        	"</c:if>";
						
						htmlText += "<h4 class='cs_content_section4_wrap_rreply_ni_h4'>";
						htmlText += data[lastIndex].rnbwriter;
						htmlText += "</h4>";
						htmlText += "</div>";
		
						htmlText += "<p>";
						htmlText += data[lastIndex].rnbcontent;
						htmlText += "</p>";
						htmlText += "</div>";
						
						
						// replyArea 요소가 존재하는지 확인
						if (replyArea) {
							// 생성된 HTML을 replyArea에 추가
							$(replyArea).append(htmlText);
						} else {
							console.error("replyArea is null or undefined");
						}

					}
				}
			})
		}
	</script>
</body>
<footer>
	<!-- 푸터 로고 -->
	<div class="footer_logo">logo</div>
	<!-- 푸터 내용 -->
	<div class="footer_content">(주) 카피바라 주소 : 대한민국 서울시 양천구 목동 655-19
		대표 : 조보근 전화번호 : 010-3017-5283</div>
	<!-- sns 아이콘 -->
	<div class="footer_sns">
		<i class="fab fa-facebook fa-lg"></i> <i class="fab fa-youtube fa-lg"></i>
		<i class="fab fa-twitter fa-lg"></i> <i class="fab fa-twitch fa-lg"></i>
		<i class="fab fa-instagram fa-lg"></i>
	</div>
</footer>
</html>