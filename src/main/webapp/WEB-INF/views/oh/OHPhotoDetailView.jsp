<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>OH - PhotoDetailView.jsp</title>
	<link rel="stylesheet" href="../resources/css/oh.css" />	
</head>
<body>
	
	<!-- 데이터 표시 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<h3>OHPhotoDetailView.jsp</h3>
	<table border="1">
		<tr>
			<th colspan="15">OHPhotoBoard</th>
		</tr>
		<tr>
			<th>pb_no</th>
			<th>pb_user</th>
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
			<td>${pb_dto.pb_user }</td>
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
	

	<div class="container">
	
		<header>
			<h1>header</h1>
		</header>
		
		<div class="contents">
	
			<div class="sideBar">
				<ul >
					<li><a href="OHMainView">우리집 자랑하기</a></li>
					<li><a href="OHPhotoView">집사진</a></li>
					<li><a href="">집영상</a></li>
					<li><a href="">#category</a></li>
				</ul>
			</div>							
						
			<h3>집사진 게시글 상세</h3>
				
			<button><a href="OHPhotoWriteView">글쓰기</a></button>
			
			&nbsp;&nbsp;&nbsp;
			
			<button><a href="OHPhotoEditView?pb_no=${pb_dto.pb_no }">수정</a></button>
			
			&nbsp;&nbsp;&nbsp;
			
			<button><a href="OHPhotoDeleteExecute?pb_no=${pb_dto.pb_no }">삭제</a></button>
				
			<hr />				
			
			<!-- 게시물, 이미지 출력 Start -->
			<c:forEach items="${pa_dto }" var="dto">			
				<div>
					<div>pa_no: ${dto.pa_no }</div>
					<div>pa_attach: ${dto.pa_attach }</div>
					<div>pb_no: ${dto.pb_no }</div>
					<img src="../resources/upload/oh/${dto.pa_attach }" alt="해당 게시글 사진" height="300px" width="300px"/>					
				</div>
			</c:forEach>		
			<!-- 게시물, 이미지 출력 End -->							
			
			<hr />
			
		</div>
			
		<footer>
			<h1>footer</h1>
		</footer>
		
	</div>	
		
</body>
</html>