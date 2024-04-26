<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="resources/css/cs/csboard.css" />
<link rel="stylesheet" type="text/css" href="mainCSS/main.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
</head>
<%@include file ="header.jsp" %>

<body>

<div class="cs_write_wrap_all">
	<div class="cs_write_wrap_form">
		<div class="cs_write_wrap_form_back"><a class="cs_write_wrap_form_back_a" href="qnalist">&lt;목록으로</a></div>
	
		<div class="cs_write_wrap_form_head"><h3 style="margin: 0;">수정하기</h3></div>
		
		<form action="qnaeditproc" method="post" enctype="multipart/form-data">
			<input type="hidden" name="qbno" value="${qna_content.qbno }" />
			
			<div class="cs_write_wrap_form_ni">
					<%-- 프로필 이미지가 없으면 기본 이미지 --%>
	    			<c:if test="${empty loginUserDto.profileimg}" >
	       			<img src="${path }/resources/img/my/user.png" id="OHMainView-photoProfileImage" style="width: 25px; height: 25px;">
	       			</c:if>
	       			<%-- 프로필 이미지가 있으면 있는 이미지 --%>
	       			<c:if test="${!empty loginUserDto.profileimg}" >
	       			<img src="${path }/resources/upload/my/${loginUserDto.profileimg}" id="OHMainView-photoProfileImage">
	       			</c:if>
					<span style="margin-left: 11px;">${loginUserDto.nickname }</span>
					<input type="hidden" name="qbwriter" value="${loginUserDto.nickname }" />
			</div><!--cs_write_wrap_form_ni-->
				
				
			<div class="cs_write_wrap_form_wrap_div">
				<div class="cs_write_wrap_form_div">
					<p style="margin: 0;">글 분류 바꾸기</p>
					<select class="cs_write_wrap_form_div_selbox" name="qnadiv">
						<option value="qq" ${qna_content.qbqnadiv eq 'qq' ? 'selected' : '' }>퀵견적</option>
						<option value="oh" ${qna_content.qbqnadiv eq 'all' ? 'selected' : '' }>우리집 자랑하기</option>
						<option value="biz" ${qna_content.qbqnadiv eq 'all' ? 'selected' : '' }>업체 관련</option>
						<option value="pf" ${qna_content.qbqnadiv eq 'all' ? 'selected' : '' }>로그인/회원정보</option>
						<option value="sh" ${qna_content.qbqnadiv eq 'all' ? 'selected' : '' }>소품샵</option>
					</select>
				</div><!--cs_write_wrap_form_div-->
			</div><!--cs_write_wrap_form_wrap_div-->
				
			<div class="cs_write_wrap_form_title">
				<p style="margin: 0; width: 630px;">제목 수정</p>
				<input type="text" class="cs_write_wrap_form_title_it" name="qbtitle" value="${qna_content.qbtitle }" onfocus="clearInput(this)"/>
			</div><!--cs_write_wrap_form_title-->
				
			<div class="cs_write_wrap_form_wrap_content">
				<div class="cs_write_wrap_form_content">
					<p style="margin: 0;">내용 수정</p>
					<textarea type="text" class="cs_write_wrap_form_content_ta" name="qbcontent">${qna_content.qbcontent }</textarea>
				</div><!--cs_write_wrap_form_content-->
			</div><!--cs_write_wrap_form_wrap_content-->
			
			
			<div class="cs_write_wrap_form_wrap_filebtn">
				<label for="file-upload" class="custom-file-upload">
	    			<i class="fa fa-cloud-upload"></i> 파일 첨부하기
				</label>
				<input id="file-upload" type="file" class="cs_write_wrap_form_filebtn" name="qbfile" multiple="multiple" style="display: none;" onchange="displayFileName(this)"/>
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
				
				<input type="submit" class="cs_write_wrap_form_writebtn" value="수정" />
			</div><!--cs_write_wrap_form_wrap_writebtn-->
		</form>
	</div>
</div><!--cs_write_wrap_all-->

</body>
<%@include file ="footer.jsp" %>

</html>