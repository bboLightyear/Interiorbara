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
<%@include file ="header.jsp" %>

<body>

	<div class="cs_qnaboard_whitespace">
		<!--여백-->
	</div>

	<section class="cs_content_section1">
		<div class="cs_content_head">
			                            <!-- 게시글 작성자 프로필 이미지 -->         
			<div class="cs_list_head_wrap_h">
            <%-- 프로필 이미지가 없으면 기본 이미지 --%>
            <c:if test="${empty profileimg}" >
              <img src="${path }/resources/img/my/user.png" id="OHMainView-photoProfileImage" style="width: 25px; height: 25px;">
              </c:if>
              <%-- 프로필 이미지가 있으면 있는 이미지 --%>
              <c:if test="${!empty profileimg}" >
              <img src="${path }/resources/upload/my/${profileimg}" id="OHMainView-photoProfileImage" style="width: 25px; height: 25px;">
              </c:if>   
			 <h3 class="cs_list_head_h">${notice_content.nbtitle }</h3></div>


			<div class="cs_list_head_wrap_span">
				<span class="cs_list_head_span">작성자 : ${notice_content.nbwriter }&nbsp;</span> 
				<span class="cs_list_head_span">조회수 : ${notice_content.nbhit }&nbsp;</span> 
				<c:if test="${notice_content.nbqnadiv eq 'qq'}">
					<span class="cs_list_head_span">퀵견적 관련 &nbsp;</span>
				</c:if> 
				<c:if test="${notice_content.nbqnadiv eq 'oh'}">
					<span class="cs_list_head_span">우리집 자랑 관련 &nbsp;</span>
				</c:if> 
				<c:if test="${notice_content.nbqnadiv eq 'pf'}">
					<span class="cs_list_head_span">로그인/회원정보 &nbsp;</span>
				</c:if> 
				<c:if test="${notice_content.nbqnadiv eq 'sh'}">
					<span class="cs_list_head_span">소품샵 관련 &nbsp;</span>
				</c:if>  
				<span class="cs_list_head_span">
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
			<p style="margin: 0" class="cs_content_section2_content_p">${notice_content.nbcontent }</p>
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
	<div class="cs_qnaboard_whitespace">
		<!--여백-->
	</div>

	
	<div class="cs_content_wrap_edbtn">
		<c:if test="${loginUserDto.nickname eq 'admin'}">
		<div class="cs_content_edbtn">
			<div class="cs_content_editbtn">
				<a href="noticeeditview?nbno=${notice_content.nbno }" class="cs_content_editbtn_a">수정하기</a>
			</div>
			
			<div class="cs_content_delbtn">
				<a href="noticedelete?nbno=${notice_content.nbno }" class="cs_content_delbtn_a">삭제하기</a>
			</div>
		</div>
		</c:if>
	</div>

	<!-- <script>
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
	</script> -->
</body>
<%@include file ="footer.jsp" %>
</html>