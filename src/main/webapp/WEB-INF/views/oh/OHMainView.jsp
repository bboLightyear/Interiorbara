<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>OH - OHMainView.jsp</title>
	<link rel="stylesheet" href="../resources/css/oh/oh.css?after" />	
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
							
				<button><a href="OHPhotoWriteView">글쓰기</a></button> <br />
				<button><a href="OHPhotoView">집사진</a></button>
				<button>집사진 더보기</button> <br />
				<button>집영상</button>
				<button>집영상 더보기</button> <br />
				<button>#category</button><span>카테고리별로 보고 싶다면 여기!</span>
								
		</div>
		
		<footer>
			<h1>footer</h1>
		</footer>
		
	</div>	
</body>
</html>