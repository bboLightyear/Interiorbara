<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매거진 수정</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@5.3.3/dist/zephyr/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
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
	
	#topBtn{
   	position: fixed;
	   right: 12.5%;
	   bottom: 3%;
   	display: none;
   	/* z-index: 9999; */
	}		
	</style>
	<script>
		$(document).ready(function() {
		    // admin이 아니면 메인 페이지로 리다이렉트
		    if (${loginUserDto.memtype ne 'ADMIN'}) {
		    	alert('관리자 이외에는 수정이 불가능합니다. 이전 화면으로 이동합니다.');
		        window.location.href = "bizMgzContentView?bm_no=${bizMgzContentView.bm_no }"; // 이전 페이지로 이동
		    }else{
		    	console.log('관리자입니다.');
		    }
		    // admin이면 해당 JSP 문서를 로드
		    console.log('문서를 로드합니다.');
		});
	</script>
</head>
<body>
<main class="Site-content">
	<div class="pt-3 bg-light bg-opacity-75">
	<div class="d-flex justify-content-center">
		<div class="p-3" onclick="location.href='bizMgzList'" style="width: 1150px; cursor:pointer;" >
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
			<div onclick="location.href='bizMgzContentView?bm_no=${bizMgzContentView.bm_no }'">
				<span class="text-body-secondary" style="font-size: 12px; cursor:pointer;">이전으로 <i class="fa-solid fa-rotate-left" style="cursor:pointer;"></i></span>
			</div>
		</div>
	</div>
		<div class="text-primary text-opacity-25">
			<hr />
		</div>
	</div>
	
	
<form action="bizMgzMod" method="post">
<input type="hidden" name="bm_no" value="${bizMgzContentView.bm_no }" />
	<div class="d-flex justify-content-center">
		<div class="p-3" style="width: 1050px">
			<table class="table" style="width: 100%; max-width: 1050px">
				<tr>
				    <th scope="row" class="table-light border-light-subtle">번호</th>
					<td class="center" style="width:25%">${bizMgzContentView.bm_no }</td>
					<th scope="row"  class="table-light border-light-subtle">HIT</th>
					<td class="center" style="width:25%">${bizMgzContentView.bm_hit }</td>
				</tr>		
				<tr class="">
				      <th scope="row"  class="table-light border-light-subtle">이름</th>
					<td colspan="3">${bizMgzContentView.bm_writer }</td>
				</tr>		
				<tr>
				    <th scope="row" class="table-light border-light-subtle">제목</th>
					<td colspan="3">
						<input class="form-control" type="text" name="bm_title" value="${bizMgzContentView.bm_title }"/>
					</td>
				</tr>		
				<tr>
				    <th scope="row" class="table-light border-light-subtle">내용</th>
					<td colspan="3">
						<textarea class="form-control" name="bm_content" id="bm_content" rows="10">${bizMgzContentView.bm_content }</textarea>
					</td>
				</tr>	
			</table>
			<div class="d-flex justify-content-evenly">
				<div class="d-flex justify-content-center" style="width: 1150px;">			
				<div class="d-flex justify-content-end" style="width: 99%; max-width: 1120px;">
								<c:choose>
									<c:when test="${loginUserDto.memtype eq 'ADMIN'}">
										<input type="submit" value="수정"  class="ms-1 btn btn-outline-primary btn-sm w-10">
									</c:when>
									<c:otherwise></c:otherwise>							
								</c:choose>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
</main>
<div>
      <a id="topBtn" href="#"><img alt="" src="${path}/resources/img/my/fromtop.png"></a>      
      </div>

<script>
$(function() {
   // 보이기 | 숨기기
   $(window).scroll(function() {
      if ($(this).scrollTop() > 250) { //250 넘으면 버튼이 보여짐니다.
            $('#topBtn').fadeIn();
            } else {
            $('#topBtn').fadeOut();
      }
   });
   // 버튼 클릭시
   $("#topBtn").click(function() {   
   $('html, body').animate({
     scrollTop : 0    // 0 까지 animation 이동합니다.
    }, 400);          // 속도 400
    return false;
    });
  });
</script>
</body>
<%@include file ="../bizFooter.jsp" %>
</html>