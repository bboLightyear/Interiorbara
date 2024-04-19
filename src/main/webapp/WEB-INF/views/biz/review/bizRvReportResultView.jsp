<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시공리뷰 신고</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@5.3.3/dist/zephyr/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<%@include file ="../bizHeader.jsp" %>
<link rel="stylesheet" href="${path}/resources/css/biz/biz.css"/>
<link  rel="stylesheet"
  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>
  	<style>
	 .fa-solid{
	 	color: #1034a6;
	 }
	 .fa-solid:hover{
	 	color: #1e90ff;
	 }	
	 
	 th{
	 	width: 20%;
	 }
	 
	 th, .center{
    	text-align: center;	 
	 }
	 a {
	   text-decoration: none;
	   color: #1a1f27;
	}
	
	body {
	display: flex;
	min-height: 100vh;
	flex-direction: column;
	}
	</style>
</head>
<body>
<main class="Site-content">
	<div class="pt-3 bg-light bg-opacity-75">
	<div class="d-flex justify-content-center">
		<div class="p-3" onclick="location.href='bizRvList?inteno=${inteno}'" style="width: 750px; cursor:pointer;" >
					<ul class="list-inline">
						<li class="list-inline-item">
							<h4 style="--bs-text-opacity: 1; background-color: #1034a6; padding: 3px; !important;">
						    	<strong style="color: white;">시공리뷰 신고</strong>
						   	</h4>
						</li>
						<li class="list-inline-item">
								<small class="text-body-secondary">커뮤니티를 내 손으로 깨끗하게.</small>
						</li>
					</ul>	
		</div>
		<div class="d-flex align-items-end mb-5">
			<div onclick="location.href='bizRvList?inteno=${inteno}'">
				<span class="text-body-secondary" style="font-size: 12px; cursor:pointer;">뒤로 가기 <i class="fa-solid fa-rotate-left" style="cursor:pointer;"></i></span>
			</div>
		</div>
	</div>
		<div class="text-primary text-opacity-25">
			<hr />
		</div>
	</div>
	
	<div class="d-flex justify-content-center">
		<div class="p-3 pb-0" style="width: 750px">
			<table class="p-3 pb-1 table" style="width: 100%; height: 150px; max-width: 750px">
				<tr>
				    <td class="align-middle">
				    	<p class="p-3 pt-4" style="font-size: 16px; text-align: center;">하기 요청하신 리뷰가 신고되었습니다.</p>
				    	<p style="font-size: 14px; text-align: center;"><span style="color: #ff8d1e">${bizRvReportResultView.br_content }</span></p>
				    	<p class="p-3"  style="font-size: 16px; text-align: center;">소중한 의견 감사합니다.</p>
				    </td> 
				</tr>			
			</table>
		</div>
	</div>	
	<div class="d-flex justify-content-evenly">
		<div class="d-flex justify-content-center" style="width: 750px;">			
		<div class="d-flex justify-content-end" style="width: 99%; max-width: 720px;">
			<button class="ms-1 btn btn-outline-primary btn-sm w-10" onclick="location.href='bizRvList?inteno=${inteno}'"><span style="font-size: 14px;">목록으로 돌아가기</span></button>
		</div>
		</div>
	</div>
</main>
</body>
<%@include file ="../bizFooter.jsp" %>
</html>