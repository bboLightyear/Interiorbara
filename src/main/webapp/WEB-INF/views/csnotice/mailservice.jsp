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
<%@include file ="header.jsp" %>

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
		
		<form action="mailsend" method="POST" enctype="multipart/form-data">
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
				<input type="file" class="cs_write_wrap_form_filebtn" name="mailfile1" style="display: none;" multiple="multiple" />
			</div>
					
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
<%@include file ="footer.jsp" %>
</html>