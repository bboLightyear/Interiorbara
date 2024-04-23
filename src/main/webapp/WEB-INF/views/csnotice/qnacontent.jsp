<%@page import="com.tech.ibara.csnotice.dto.QnaDto"%>
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="resources/css/cs/csboard.css" />
<script>
	function reta() {
		
		var nickname = ${loginUserDto.nickname};
		
			if (nickname === null) {
				alert("로그인 후 작성해주세요");
				document.getElementById("retarea").blur();			
			}
	}
</script>
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
			 <h3 class="cs_list_head_h">${qna_content.qbtitle }</h3></div>


			<div class="cs_list_head_wrap_span">
				<span class="cs_list_head_span">작성자 : ${qna_content.qbwriter }&nbsp;</span>
				<span class="cs_list_head_span">조회수 : ${qna_content.qbhit }&nbsp;</span>  
				<c:if test="${qna_content.qbqnadiv eq 'qq'}">
					<span class="cs_list_head_span">퀵견적 관련 &nbsp;</span>
				</c:if> 
				<c:if test="${qna_content.qbqnadiv eq 'oh'}">
					<span class="cs_list_head_span">우리집 자랑 관련 &nbsp;</span>
				</c:if> 
				<c:if test="${qna_content.qbqnadiv eq 'pf'}">
					<span class="cs_list_head_span">로그인/회원정보 &nbsp;</span>
				</c:if> 
				<c:if test="${qna_content.qbqnadiv eq 'sh'}">
					<span class="cs_list_head_span">소품샵 관련 &nbsp;</span>
				</c:if> 
				<span class="cs_list_head_span">
					<fmt:formatDate value="${qna_content.qbdate}" pattern="yy/MM/dd" />&nbsp;
				</span>
			</div>

		</div>
	</section>
	<div class="cs_qnaboard_whitespace">
		<!--여백-->
	</div>
	<div class="cs_qnaboard_whitespace">
		<!--여백-->
	</div>

	<section class="cs_content_section2">

		<div class="cs_content_section2_content">
			<p style="margin: 0" class="cs_content_section2_content_p">${qna_content.qbcontent }</p>
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
		<c:if test="${loginUserDto.nickname eq qna_content.qbwriter}">
			<div class="cs_content_edbtn">
				<div class="cs_content_editbtn">
					<a href="qnaeditview?qbno=${qna_content.qbno }" class="cs_content_editbtn_a">수정하기</a>
				</div>
				
				<div class="cs_content_delbtn">
					<a href="qnadelete?qbno=${qna_content.qbno }" class="cs_content_delbtn_a">삭제하기</a>
				</div>
			</div>
		</c:if>
	</div>

	<section class="cs_content_section3">

		<div class="cs_content_section3_rcnt">
			<h3 style="margin: 0">답글 <span class="cs_content_section3_rcnt_span">${replycnt}</span>개</h3>
		</div>

		<form action="qnareply?qbno=${qna_content.qbno }" method="post">
			<div class="cs_content_section3_replyform">
				<span>
					
	           		<c:if test="${empty loginUserDto.profileimg}" >
	              	<img src="${path }/resources/img/my/user.png" id="OHMainView-photoProfileImage" style="width: 35px; height: 35px;">
	              	</c:if>
	              	
	              	<c:if test="${!empty loginUserDto.profileimg}" >
	              	<img src="${path }/resources/upload/my/${loginUserDto.profileimg}" id="OHMainView-photoProfileImage" style="width: 25px; height: 25px;">
	              	</c:if>   
				</span>
				
				<div class="cs_content_section3_replyform_ti">
					<textarea class="cs_content_section3_replyform_textarea" id="retarea" onfocus="reta()" name="qnareply"></textarea>
					<input type="hidden" name="qnarewriter" value="${loginUserDto.nickname }" /> 
					<input class="reply_input_btn" type="submit" value="답변" />
				</div>
			</div>
		</form>
	</section>


	<section class="cs_content_section4">
		<!--전체 글에 대한 답글 조회  -->
		<c:forEach items="${replylist }" var="dto">
			<div class="cs_content_section4_wrap_rreply">
				<div class="cs_content_section4_wrap_rreply_c">
					<div class="cs_content_section4_wrap_rreply_ni">
						<c:if test="${empty dto.memberInfo.profileimg}" >
				        	<img src="${path }/resources/img/my/user.png" id="OHMainView-photoProfileImage" style="width: 30px; height: 30px;">
				            </c:if>
				            <%-- 프로필 이미지가 있으면 있는 이미지 --%>
				            <c:if test="${!empty dto.memberInfo.profileimg}" >
				           	<img src="${path }/resources/upload/my/${dto.memberInfo.profileimg}" id="OHMainView-photoProfileImage" style="width: 25px; height: 25px;">
				        </c:if> 
				        <h4 class="cs_content_section4_wrap_rreply_ni_h4">${dto.rqbwriter }</h4>
				        </div>
					<div class="cs_content_section4_wrap_rreply_content">${dto.rqbcontent }</div>
	
					<!--답글 달기 버튼을 클릭 시에 아래에 입력 창이 나타나도록 하는 스크립트-->
<%-- 					<%
						if ( == null) {
					%> --%>
					<c:if test="${empty loginUserDto.email}"> 
						<div class="cs_content_section4_wrap_rreply_btn">
					</c:if>
<%-- 					<%
					} else {
					%> --%>
					<c:if test="${!empty loginUserDto.email}"> 
						<div class="cs_content_section4_wrap_rreply_wrap_btn">
					
						<button  class="cs_content_section4_wrap_rreply_btn" onclick="replyform()" data-rqbno="${dto.rqbno }">답글달기</button>
					</c:if>
<%-- 					<%
						}
					%> --%>
	
					<input class="cs_content_section4_wrap_rreply_btn" type="button" onclick="replyrview()" id="${dto.rqbno }replyvbtn" name="${dto.rqbno }replyvbtn" data-rqbno="${dto.rqbno }" value="답글보기" />
					
					</div>
					<!-- </div> -->
	
					<div class="cs_content_section4_replyrview">
						<div id="${dto.rqbno }replyrview"> </div>
		
						<!--숨겨진 div, id 값을 조회한 답글 번호로 지정하여 위의 스크립트에서 버튼을 각각의 div를 따로 적용-->
						<div id="${dto.rqbno }replyform" class="cs_content_section4_replyrview_wrap_inputform">
							<div class="cs_content_section4_replyrview_inputform">
								<input type="hidden" id="rqbno" name="rqbno" value="${dto.rqbno }" />
								<input type="hidden" id="qbno" name="qbno" value="${dto.qbno }" />
								<input type="hidden" id="rqbstep" name="rqbstep" value="${dto.rqbstep }" /> 
								<input type="hidden" id="rqbgroup" name="rqbgroup" value="${dto.rqbgroup }" /> 
								<input type="hidden" id="rqbindent" name="rqbindent" value="${dto.rqbindent }" />
								<input type="hidden" name="rwriter" id="rwriter" value="${loginUserDto.nickname }" /> 
		
								<textarea id="rcontent" name="rcontent" class=cs_content_section4_replyrview_inputform_ta></textarea>
								<input class="reply_input_btn" type="button" value="입력" onclick="reply()" data-rqbno="${dto.rqbno }" />
							</div>
							<button class="cs_content_section4_wrap_rreply_btn" onclick="replyformclose()" data-rqbno="${dto.rqbno }">접기</button>
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
			var rqbno = $(target).data("rqbno");

			console.log(rqbno);

			var parent = event.target.parentElement;
			var replyArea = document.getElementById(rqbno + "replyrview");
			var replyvbtn = document.getElementById(rqbno + "replyvbtn");

			$.ajax({
				type : "post",
				async : true,
				url : "replyview",
				data : {
					"rqbno" : rqbno
				},
				success : function(data) {
					console.log("success");
					console.log(data);

					viewbtn = true;

					var htmlText = "";

					for (var i = 0; i < data.length; i++) {

						var profileImgUrl = data[i].profileimg || '/resources/img/my/user.png';  // 기본 이미지 사용
		                var writer = data[i].rqbwriter;
		                var content = data[i].rqbcontent;
		                
						console.log(data[i].rqbcontent);
						
						
						htmlText += "<div class='cs_content_section4_wrap_replyrview'>";
						
						
						htmlText += "<div class='cs_content_section4_replyrview_rni'>";
						htmlText += "<c:if test='${empty loginUserDto.profileimg}' > "+
						"<img src='${path }/resources/img/my/user.png' id='OHMainView-photoProfileImage' style='width: 30px; height: 30px;'> "+
						"</c:if> "+
			            "<c:if test='${!empty loginUserDto.profileimg}'> "+
			           	"<img src='${path }/resources/upload/my/${loginUserDto.profileimg}' id='OHMainView-photoProfileImage'> "+
			        	"</c:if>";
						
						htmlText += "<h4 class='cs_content_section4_wrap_rreply_ni_h4'>";
						htmlText += data[i].rqbwriter;
						htmlText += "</h4>";
						htmlText += "</div>";
		
						htmlText += "<p>";
						htmlText += data[i].rqbcontent;
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
			var rqbno = $(target).data("rqbno");
			var hiddenDiv = document.getElementById(rqbno + "replyform");

			hiddenDiv.style.display = "flex";
			/* hiddenDiv.style.margin = "auto"; */
		}

		// 답글 폼 닫는 스크립트
		function replyformclose() {
			/* alert("x"); */
			var target = event.target;
			var rqbno = $(target).data("rqbno");

			var hiddenDiv = document.getElementById(rqbno + "replyform");

			hiddenDiv.style.display = "none";
		}

		function reply() {
			var target = event.target;

			var rqbno = $(target).data("rqbno");
			var parent = event.target.parentElement;
			var replyArea = document.getElementById(rqbno + "replyrview");

			$.ajax({
				type : "post",
				async : true,
				url : "reply",
				data : {
					"rqbno" : $(parent).find("#rqbno").val(),
					"qbno" : $(parent).find("#qbno").val(),
					"rqbstep" : $(parent).find("#rqbstep").val(),
					"rqbgroup" : $(parent).find("#rqbgroup").val(),
					"rqbindent" : $(parent).find("#rqbindent").val(),
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

					console.log(data[lastIndex].rqbcontent);

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
						htmlText += data[lastIndex].rqbwriter;
						htmlText += "</h4>";
						htmlText += "</div>";
		
						htmlText += "<p>";
						htmlText += data[lastIndex].rqbcontent;
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
<%@include file ="footer.jsp" %>
</html>