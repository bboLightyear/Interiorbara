<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가까운 업체 찾기</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@5.3.3/dist/zephyr/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link  rel="stylesheet"
  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>
  	<style>
	 .fa-solid{
	 	color: #1034a6;
	 }
	 .fa-solid:hover{
	 	color: #1e90ff;
	 }
	 a {
	   text-decoration: none;
	   color: black;
	}	 
	</style>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>

	<div class="sortResult">


		<div class="p-5 container-md" style="max-width: 1190px">
			<c:forEach items="${bizHomeSearch }" var="bizHome" varStatus="bizHomeStatus">
							<div style="float: left; margin: 1%; cursor:pointer;" onclick="location.href='/ibara/biz/home/bizHome?inteno=${bizHome.inteno}'" class="home${searchVO.rowEndMore}">
								<div class="card border-light mb-2" style="width: 250px; height: 280px;">
								  <div class="card-header p-0">
								  		<c:if test="${bizHome.bh_img ne null }">
										<c:set value="${bizHome.bh_img }" var="filename" />
										<c:set value="${fn:toLowerCase(filename) }" var="fileNm" />
										<c:forTokens items="${fileNm }" delims="." var="token" varStatus="status">
										<c:if test="${status.last }">
											<c:choose>
												<c:when test="${token eq 'jpg' || token eq 'png' || token eq 'jpeg'}">		
														<img src="../../resources/upload/biz/home/${bizHome.bh_img }" alt="${bizHome.bh_img }" width="250" height="150" style="border-top-left-radius: 3.5%; border-top-right-radius: 3.5%;"/>
												</c:when>
											<c:otherwise> <img src="#" alt="잘못된 파일 형식" value="잘못된 파일 형식" /></c:otherwise>		
											</c:choose>
										</c:if>
										</c:forTokens>
										</c:if>
								  </div>
								  <div class="card-body">
								    <div class="card-title">
									    <strong style="font-size: 16px; color: #1e90ff;">${bizHome.bh_name }</strong> &nbsp; <span style="color: gold;">★</span> <span style="font-size: 13px; color: #b1b8c0;">${bizSearchRvPointAvgList[bizHomeStatus.index] }</span>
								    </div>    
								    <div class="pb-2 card-text"  style="font-size: 13px;"><strong>${bizHome.bh_addr1 }</strong></div>    
								    <p class="card-text" style="font-size: 12px; color: #b1b8c0">${bizRvContentList[bizHomeStatus.index] } ...</p>    
 								 </div>
 								</div>
 							</div>
 			</c:forEach>
		</div>
		
	</div>






</body>
</html>