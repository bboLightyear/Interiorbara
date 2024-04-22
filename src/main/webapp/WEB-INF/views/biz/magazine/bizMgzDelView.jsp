<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매거진 삭제</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@5.3.3/dist/zephyr/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
	 
	td{
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
		<script>
		$(document).ready(function() {
		    // admin이 아니면 메인 페이지로 리다이렉트
		    if (${loginUserDto.memtype ne 'ADMIN'}) {
		    	alert('관리자 이외에는 삭제가 불가능합니다. 이전 화면으로 이동합니다.');
		        window.location.href = "bizMgzContentView?bm_no=${bizMgzDelView.bm_no }"; // 이전 페이지로 이동
		    }else{
		    	console.log('관리자입니다.');
		    }
		    // admin이면 해당 JSP 문서를 로드
		    console.log('문서를 로드합니다.');
		});
		
	    function confirmDelete(bm_no) {
	        var confirmation = confirm("정말로 삭제하시겠습니까?");
	        if (confirmation) {
	            alert("해당 게시물이 삭제되었습니다.");
	            location.href = 'bizMgzDel?bm_no=' + bm_no;
	        } else {
	            // 사용자가 취소를 클릭한 경우 아무 작업도 수행하지 않음
	        }
	    }
	</script>
</head>
<body>
<main class="Site-content">
	<div class="pt-3 bg-light bg-opacity-75">
	<div class="d-flex justify-content-center">
		<div class="p-3" onclick="location.href='bizMgzList'" style="width: 750px; cursor:pointer;" >
					<ul class="list-inline">
						<li class="list-inline-item">
							<h4 style="--bs-text-opacity: 1; background-color: #1034a6; padding: 3px; !important;">
						    	<strong style="color: white;">매거진</strong>
						   	</h4>
						</li>
						<li class="list-inline-item">
								<small class="text-body-secondary">트렌드. 지금.</small>
						</li>
					</ul>	
		</div>
		<div class="d-flex align-items-end mb-5">
			<div onclick="location.href='bizMgzContentView?bm_no=${bizMgzDelView.bm_no }'">
				<span class="text-body-secondary" style="font-size: 12px; cursor:pointer;">이전으로 <i class="fa-solid fa-rotate-left" style="cursor:pointer;"></i></span>
			</div>
		</div>
	</div>
		<div class="text-primary text-opacity-25">
			<hr />
		</div>
	</div>
	
	<div class="d-flex justify-content-center">
		<div class="p-3" style="width: 750px">
			<table class="p-3 table" style="width: 100%; height: 150px; max-width: 750px">
				<tr>
				    <td class="align-middle">
				    	<p style="font-size: 16px;"><span class="px-2" style="color: #ff8d1e"><strong onclick="location.href='bizMgzContentView?bm_no=${bizMgzDelView.bm_no }'" style="cursor:pointer;">${bizMgzDelView.bm_title }</strong></span> 글을 삭제하시겠습니까?</p>
				    </td>
				</tr>			
			</table>
			
								
			<div class="d-flex justify-content-evenly">
				<div class="d-flex justify-content-center" style="width: 750px;">
					<div class="d-flex align-items-start" style="width: 40%; max-width: 300px;">
						<button class="ms-1 btn btn-outline-primary btn-sm w-10"  onclick="location.href='bizMgzContentView?bm_no=${bizMgzDelView.bm_no }'"><span style="font-size: 14px;">이전 화면</span></button>
					</div>
			
			
				<div class="d-flex justify-content-end" style="width: 60%; max-width: 450px;">
					<c:choose>
						<c:when test="${loginUserDto.memtype eq 'ADMIN'}">
							<button class="ms-1 btn btn-outline-primary btn-sm w-10" onclick="confirmDelete('${bizMgzDelView.bm_no }')"><span style="font-size: 14px;">삭제</span></button>
						</c:when>
						<c:otherwise></c:otherwise>							
					</c:choose>
				</div>
				</div>
			</div>

		</div>
	</div>	
</main>
</body>
<%@include file ="../bizFooter.jsp" %>
</html>