<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	
	<meta charset="UTF-8">
	
	<title>OH - PhotoDetailView.jsp</title>
	
	<!-- oh.css -->
	<link rel="stylesheet" href="../resources/css/oh/photo.css?after" />
	<!-- OHPhotoDetailView.css -->
	<link rel="stylesheet" href="../resources/css/oh/OHPhotoDetailView.css?after" />		
	
	<!-- https://fontawesome.com/ -->
	<link  rel="stylesheet"
	  	   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>
	  	   
	<!-- https://jquery.com/ -->		
	<script src="https://code.jquery.com/jquery-3.7.1.js" ></script>
		
</head>
<body>
	
	<!-- 데이터 표시 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<table border="1">
		<tr>
			<th colspan="15">OHPhotoBoard</th>
		</tr>
		<tr>
			<th>pb_no</th>
			<th>memno</th>
			<th>pb_title</th>
			<th>pb_content</th>
			<th>pb_date</th>
			<th>pb_like</th>
			<th>pb_scrap</th>
			<th>pb_reply</th>
			<th>pb_link</th>
			<th>pb_hit</th>
			<th>pb_category</th>
			<th>pb_residence</th>
			<th>pb_room</th>
			<th>pb_style</th>
			<th>pb_skill</th>
		</tr>
		<tr>
			<td>${pb_dto.pb_no }</td>
			<td>${pb_dto.memno }</td>
			<td>${pb_dto.pb_title }</td>
			<td>${pb_dto.pb_content }</td>
			<td>${pb_dto.pb_date }</td>
			<td>${pb_dto.pb_like }</td>
			<td>${pb_dto.pb_scrap }</td>
			<td>${pb_dto.pb_reply }</td>
			<td>${pb_dto.pb_link }</td>
			<td>${pb_dto.pb_hit }</td>
			<td>${pb_dto.pb_category }</td>
			<td>${pb_dto.pb_residence }</td>
			<td>${pb_dto.pb_room }</td>
			<td>${pb_dto.pb_style }</td>
			<td>${pb_dto.pb_skill }</td>
		</tr>		
		<tr>
			<th colspan="15">OHPhotoAttach</th>
		</tr>
		<tr>
			<th>pa_no</th>
			<th>pa_attach</th>
			<th>pb_no</th>
		</tr>
		<c:forEach items="${pa_dto }" var="dto">			
			<tr>
				<td>${dto.pa_no }</td>
				<td>${dto.pa_attach }</td>
				<td>${dto.pb_no }</td>
			</tr>
		</c:forEach>			
	</table>
	
	<!-- 데이터 표시 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

	<h3>OHPhotoDetailView.jsp</h3>

	<!-- 회원, 비회원 구분 후 메세지 출력 -->
	<c:choose>
		<c:when test="${loginUserDto ne null }">
			<h3>${loginUserDto.nickname }님</h3>	
		</c:when>
		<c:otherwise>
			<h3>비회원님</h3>					
		</c:otherwise>
	</c:choose>	

	<div class="container">
	
		<header>
			<h1>header</h1>
		</header>
		
		<div class="contents">
	
			<div class="sideBar">
				<ul >
					<li><a href="OHMainView">우리집 자랑하기</a></li>
					<li><a href="OHPhotoView">집사진</a></li>
					<!-- 집영상 -->
					<!-- <li><a href="">집영상</a></li> -->
					<li><a href="#">#category</a></li>
				</ul>
			</div>							
						
			<div id="OHPhotoDetailView-main">
				
				<div>
				
					<h3>집사진 게시글 상세</h3>
					
				<!-- jQuery 작성완료
					     회원: 글쓰기 가능 
					  비회원: 글쓰기 불가능
					  -->
				<button id="toWriteBtn">글쓰기</button> 
	
				<!-- 해당 게시물 작성자일 경우 => 수정, 삭제 버튼 생성 -->
				<c:choose>
					<c:when test="${loginUserDto.memno eq pb_dto.memno }">
						<!-- 수정 버튼 -->
						<button onclick="location.href='OHPhotoEditView?pb_no=${pb_dto.pb_no }'">수정</button>
						<!-- 삭제 버튼 -->
						<button onclick="location.href='OHPhotoDeleteExecute?pb_no=${pb_dto.pb_no }'">삭제</button>					
					</c:when>
					<c:otherwise></c:otherwise>
				</c:choose>				
					
				<hr />				
				
				<!-- 게시물, 이미지 출력 Start -->
				<c:forEach items="${pa_dto }" var="dto">			
					<div>
						<div>pa_no: ${dto.pa_no }</div>
						<div>pa_attach: ${dto.pa_attach }</div>
						<div>pb_no: ${dto.pb_no }</div>
						<img src="../resources/upload/oh/photo/${dto.pa_attach }" alt="해당 게시글 사진" height="300px" width="300px"/>					
					</div>
				</c:forEach>		
				<!-- 게시물, 이미지 출력 End -->							
				
				<hr />
				
				<!-- Start: <div class="sectionReply">
					 Start: 댓글 출력 
				-->
				
				<span>댓글 </span> &nbsp; <span>총 수량 표시</span>
				
				<hr />
				
				<div class="sectionReply">
					<!-- 입력창 -->
					<div id="wrapInputTextReply"
						 style="display:inline-block">
						<input id="inputTextReply"
							   type="text" 
						       placeholder="칭찬과 격려의 댓글은 작성자에게 큰 힘이 됩니다."
						 	   style="height:50px;
						 			  width:600px;
						 			  background-color:#ffc978;
						 			  color:#555"/>
					</div>
					<!-- 입력버튼 -->
					<button id="replyButton" disabled>입력</button>
					
					<br />
					
					<hr />
					
					<br />
					
					<div id=contentReply></div>
					
				</div>
				<!-- End: <div class="sectionReply"> 
					 End: 댓글 출력
				-->			
				

				
										
				
			</div>
			<!-- End: <div class="main"> -->					
			
		</div> 
		<!-- End: <div class="contents"> -->	
			
		<footer>
			<h1>footer</h1>
		</footer>
		
	</div>
	
	</div>
	
	<!-- OHPhotoDetailView.js -->
	<script src="../resources/js/oh/OHPhotoDetailView.js"></script>	
		
</body>

</html>