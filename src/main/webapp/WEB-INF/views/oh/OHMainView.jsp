<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>

	<meta charset="UTF-8">
	
	<title>OH - OHMainView.jsp</title>
	
	<!-- photo.css -->
	<link rel="stylesheet" href="../resources/css/oh/photo.css?after" />
	<!-- OHMainView.css -->
	<link rel="stylesheet" href="../resources/css/oh/OHMainView.css?after" />
	
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
			<th colspan="16">OHPhotoBoard</th>
		</tr>
		<tr>
			<th>no</th>
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
		<c:forEach items="${ohPhotoView }" var="dto">				
			<tr>
				<td>${dto.no }</td>
				<td>${dto.pb_no }</td>
				<td>${dto.pb_user }</td>
				<td>${dto.pb_title }</td>
				<td>${dto.pb_content }</td>
				<td>${dto.pb_date }</td>
				<td>${dto.pb_like }</td>
				<td>${dto.pb_scrap }</td>
				<td>${dto.pb_reply }</td>
				<td>${dto.pb_link }</td>
				<td>${dto.pb_hit }</td>
				<td>${dto.pb_category }</td>
				<td>${dto.pb_residence }</td>
				<td>${dto.pb_room }</td>
				<td>${dto.pb_style }</td>
				<td>${dto.pb_skill }</td>
			</tr>		
		</c:forEach>			
		<tr>
			<th colspan="3">OHPhotoAttach</th>
		</tr>
		<tr>
			<th>pa_no</th>
			<th>pa_attach</th>
			<th>pb_no</th>
		</tr>
		<c:forEach items="${ohPhotoView }" var="dto">			
			<tr>
				<td>${dto.ohPhotoAttach.pa_no }</td>
				<td>${dto.ohPhotoAttach.pa_attach }</td>
				<td>${dto.ohPhotoAttach.pb_no }</td>
			</tr>
		</c:forEach>							
	</table>
	<!-- 데이터 표시 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->	

	<h3>OHMainView.jsp</h3>

	<!-- 회원, 비회원 구분 후 메세지 출력 -->
	<c:choose>
		<c:when test="${sessionScope.userId ne null && !empty sessionScope.userId }">
			<h3>${sessionScope.userId }님</h3>	
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
					<!-- <li><a href="#">집영상</a></li> -->
					<li><a href="#">#category</a></li>
				</ul>
			</div>
			
			<div id="OHMainView-main">
			
				<div id="OHMainView-main-1">
					<div id="OHMainView-title">우리 집 자랑하기</div>			
					<!-- jQuery 작성완료
						     회원: 글쓰기 가능 
						  비회원: 글쓰기 불가능
						  -->
					<button id="OHMainView-toWriteButtton">글쓰기</button> 				
				</div>
				
				<div id="OHMainView-main-2">					
					<button id="OHMainView-toOHPhotoViewButton">집사진</button>
					<button id="OHMainView-toMoreOHPhotoViewButton">더보기</button> 
				</div>
				
				<div id="OHMainView-main-3">				
					<div id="OHMainView-flexContainer">				
						<!-- 반복문 사용, 게시물 표현 -->
						<c:forEach items="${ohPhotoView }" var="dto" varStatus="status">
							<div class="OHMainView-box">
								<!-- 게시글 대표 이미지 --> 
								<a href="OHPhotoDetailView?pb_no=${dto.pb_no }">
									<img id="OHMainView-photoImage" src="../resources/upload/oh/photo/${dto.ohPhotoAttach.pa_attach }" alt="해당 게시글 대표사진"/>
								</a>			
								<!-- position: relative, 영역구분 추가 -->		
								<div class="OHMainView-boxLayer">		
									<!-- 게시글 제목 -->
									<div id="OHMainView-photoTitle">${dto.pb_title }</div>
									<!-- 게시글 작성자 프로필 이미지 -->
									<div id="OHMainView-photoProfileImage">프로필 이미지</div>	
									<!-- 게시글 작성자 이름 -->
									<div id="OHMainView-photoUserName">${dto.pb_user }</div>
									<!-- 게시글 작성자 조회수 -->
									<div id="OHMainView-photoHit">조회수</div>
									<!-- 게시글 작성자 조회수 횟수 -->
									<div id="OHMainView-photoHitCount">${dto.pb_hit }</div>
									<!-- 게시글 작성자 스크랩 -->
									<div id="OHMainView-photoScrap">좋아요</div>
									<!-- 게시글 작성자 스크랩 횟수 -->
									<div id="OHMainView-photoScrapCount">${dto.pb_like }</div>
								</div>								
							</div>
						</c:forEach>
					</div>				
				</div>
				
				<!-- 집영상 -->
				<!-- 				
				<div id="OHMainView-main-4">
					<button id="OHMainView-toOHVideoViewButton">집영상</button>
					<button id="OHMainView-toMoreOHVideoViewButton">더보기</button> 
				</div>  
				-->
				
				<div id="OHMainView-main-5">
					<button id="OHMainView-toCategoryView">#category</button>
					<span id="OHMainView-toCategoryText">카테고리별로 보고 싶다면 여기!</span>			
				</div>
			
			</div>
								
		</div>
		
		<footer>
			<h1>footer</h1>
		</footer>
		
	</div>	
	
</body>

	<script>
		$(document).ready(function() {
			$("#OHMainView-toWriteButtton").click(function() {
				/* 회원인지 확인 */
				if("${sessionScope.userId }" != null && "${sessionScope.userId }" != "") {	
					window.location.href = "OHPhotoWriteView";
				} else {
					alert("로그인 페이지로 이동");
				}
			});
		});
	</script>

</html>