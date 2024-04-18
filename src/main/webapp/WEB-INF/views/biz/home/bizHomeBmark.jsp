<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<meta charset="UTF-8">
<title>${bizHome.bh_name } HOME</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@5.3.3/dist/zephyr/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${path}/resources/css/biz/biz.css"/>
<link  rel="stylesheet"
  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>
  	<style>
	 .fa-solid{
	 	color: #1a1f27;
	 }
	 .fa-solid:hover{
	 	color: #1e90ff;
	 } 
	 a {
	   text-decoration: none;
	   color: #1a1f27;
	}
	</style>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
					<div class="bmarkIcon" style="display:inline;">
						<button class="btn btn-secondary btn-lg w-100" onclick="bmarkChange()">
						
							<%-- 	<c:if test="${sessionScope.loginId == null || sessionScope.loginId eq 'guest'}"> --%>
							<c:if test="${empty loginUserDto.memno}">
									<span style="font-size: 16px;" onclick="redirectLogin()">
											북마크 <i class="fa-regular fa-bookmark"></i>
									</span>
								</c:if>
								<c:if test="${not empty loginUserDto.memno}">
									<span style="font-size: 16px;">
										북마크
											<c:if test="${isBmarked eq true}">
												<span style="font-size: 16px;">
														<i class="fa-solid fa-bookmark" style="color: gold;"></i></span>
												</c:if>
												<c:if test="${isBmarked eq false}">
													<span style="font-size: 16px;">
														<i class="fa-regular fa-bookmark"></i>
													</span>
											</c:if>
									</span>
							</c:if>	
						</button>
					</div>
</body>
</html>