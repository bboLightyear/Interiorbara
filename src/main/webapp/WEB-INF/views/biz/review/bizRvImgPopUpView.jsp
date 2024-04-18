<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시공리뷰 작성</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@5.3.3/dist/zephyr/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link  rel="stylesheet"
  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>
  <style>
	 .fa-solid{
	 	color: #1a1f27;
	 }
	 .fa-solid:hover{
	 	color: #1e90ff;
	 } 
	 
	 th{
	 	width: 30%;
	 }
	 
	 th, .center{
    	text-align: center;	 
	 }
	</style>
</head>
<body>
<div class="pt-3 bg-light bg-opacity-75">
	<div class="d-flex justify-content-center">
		<div class="p-3" style="width: 300px; height: 60px;" >
					<ul class="list-inline">
						<li class="list-inline-item">
							<h4 style="--bs-text-opacity: 1; background-color: #1034a6; padding: 3px; !important;">
						    	<strong style="color: white;">시공리뷰</strong>
						   	</h4>
						</li>
						<li class="list-inline-item">
								<small class="text-body-secondary">이미지만 빠르게 보기.</small>
						</li>
					</ul>	
		</div>
		<div class="d-flex align-items-end mb-3">
			<div onclick="window.close()">
				<span class="text-body-secondary pe-3" style="font-size: 12px; cursor:pointer;"> <i class="fa-solid fa-xmark" style="cursor:pointer;"></i></span>
			</div>
		</div>
	</div>
		<div class="text-primary text-opacity-25">
			<hr />
		</div>
	</div>
	
	
	<div class="d-flex justify-content-center">
		<div class="p-0" style="width: 300px">
			<table class="table" style="width: 100%; max-width: 300px">
				<tr class="">
				    <th scope="row" class="table-light border-light-subtle">번호</th>
					<td colspan="3">${bizRvContentView.br_no }</td>
				</tr>	
				<tr class="">
				      <th scope="row" class="table-light border-light-subtle">작성자</th>
					<td colspan="3">${bizRvContentView.br_writer }</td>
				</tr>		
				<tr class="">
				      <th scope="row"  class="table-light border-light-subtle">별점</th>
					<td colspan="3"><span style="color: gold;">★</span>${bizRvContentView.br_point }</td>
				</tr>		
				<tr class="">
					<td colspan="3">
				 		<c:forEach items="${imglist }" var="imgdto">
							<c:if test="${imgdto.brimg_cgn ne null }">
								<c:set value="${imgdto.brimg_cgn }" var="filename" />
								<c:set value="${fn:toLowerCase(filename) }" var="fileNm" />
								<c:forTokens items="${fileNm }" delims="." var="token" varStatus="status">
								<c:if test="${status.last }">
									<c:choose>
										<c:when test="${token eq 'jpg' || token eq 'png' || token eq 'jpeg'}">
											<img src="../../resources/upload/biz/review/${imgdto.brimg_cgn }" alt="${imgdto.brimg_cgn }" width="200" />
										</c:when>
									<c:otherwise>그림이 아닌 다른 형식 파일입니다.</c:otherwise>		
									</c:choose>
								</c:if>
								</c:forTokens>
							</c:if>			
						</c:forEach>
					</td>
				</tr>				
			</table>
		<div class="d-flex justify-content-center">
			<div class="p-0 pb-3" style="width: 300px">
				<div class="d-flex justify-content-end" style="width: 100%; max-width: 300px">			
					<button class="me-1 btn btn-outline-primary btn-sm w-10" onclick="window.close()"><span style="font-size: 14px;">창닫기</span></button>
				</div>
			</div>
		</div>		
	</div>
</div>	



</body>
</html>