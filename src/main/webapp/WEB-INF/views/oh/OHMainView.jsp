<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

	<meta charset="UTF-8">
	
	<title>OH - OHMainView.jsp</title>
	
	<!-- oh.css -->
	<link rel="stylesheet" href="../resources/css/oh/photo.css?after" />
	
	<!-- https://fontawesome.com/ -->
	<link  rel="stylesheet"
	  	   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>
	  	   
	<!-- https://jquery.com/ -->		
	<script src="https://code.jquery.com/jquery-3.7.1.js" ></script>
	
</head>
<body>
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
						
				<h3>OHMainView.jsp</h3>
				
				<h3>우리집 자랑하기</h3>						
				
				<!-- 회원, 비회원 구분 후 메세지 출력 -->
				<c:choose>
					<c:when test="${sessionScope.userId ne null }">
						<h3>${sessionScope.userId }님 환영합니다! </h3>	
					</c:when>
					<c:otherwise>
						<h3>비회원님 환영합니다!</h3>					
					</c:otherwise>
				</c:choose>
				
				<hr />
				
				<!-- jQuery 작성완료
					     회원: 글쓰기 가능 
					  비회원: 글쓰기 불가능
					  -->
				<button id="toWriteBtn">글쓰기</button> 
				
				<br />
				
				<hr />
				
				<button><a href="OHPhotoView">집사진</a></button>
				<button><a href="OHPhotoView">집사진 더보기</a></button> 
				
				<br />
				
				<hr />
				
				<button>집영상</button>
				<button>집영상 더보기</button> 
				
				<br />
				
				<hr />
				
				<button>#category</button><span>카테고리별로 보고 싶다면 여기!</span>
								
		</div>
		
		<footer>
			<h1>footer</h1>
		</footer>
		
	</div>	
</body>

	<script>
	
		$(document).ready(function() {
			$("#toWriteBtn").click(function() {
				/* 회원인지 확인 */
				if("${sessionScope.userId }" != null) {
					window.location.href = "OHPhotoWriteView";
				} else {
					alert("로그인 페이지로 이동");
				}
			});
		});
		
	</script>

</html>