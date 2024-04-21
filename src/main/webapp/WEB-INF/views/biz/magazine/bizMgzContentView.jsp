<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매거진 보기</title>
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
	.proBtns{
	  /* 상하좌우 정중앙 정렬하기 */
	  display: flex;
	  justify-content: center;
	  align-items: center;
	}
	 
	 .proBtn{
		cursor:pointer;
		padding: 8px;
	}
	 
	 th, .center{
    	text-align: center;	 
	 }
	 a {
	   text-decoration: none;
	   color: #1a1f27;
	}
	
	#topBtn{
   	position: fixed;
  	 right: 4%;
   	bottom: 5%;
   	display: none;
   	/* z-index: 9999; */
	}	
	</style>
</head>
<body>
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
			<div onclick="window.history.back()">
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
			<table class="table" style="width: 100%; max-width: 750px">
				<tr class="">
				    <th style="width:25%" scope="row" class="table-light border-light-subtle">번호</th>
					<td class="center" style="width:25%">${bizMgzContentView.bm_no }</td>
					<th style="width:25%" scope="row"  class="table-light border-light-subtle">HIT</th>
					<td class="center" style="width:25%">${bizMgzContentView.bm_hit }</td>
				</tr>	
				<tr class="">
				     <th scope="row"  class="table-light border-light-subtle">작성자</th>
					<td colspan="3">${bizMgzContentView.bm_writer } </td>
				</tr>		
				<tr class="">
				      <th scope="row" class="table-light border-light-subtle">제목</th>
					<td colspan="3">${bizMgzContentView.bm_title }</td>
				</tr>		
				<tr class="">
				      <th scope="row" class="table-light border-light-subtle">내용</th>
					<td colspan="3">
						<c:forEach items="${imglist }" var="imgdto">
							<c:if test="${imgdto.bmimg_cgn ne null }">
								<c:set value="${imgdto.bmimg_cgn }" var="filename" />
								<c:set value="${fn:toLowerCase(filename) }" var="fileNm" />
								<c:forTokens items="${fileNm }" delims="." var="token" varStatus="status">
								<c:if test="${status.last }">
									<c:choose>
										<c:when test="${token eq 'jpg' || token eq 'png' || token eq 'jpeg'}">
											<img class="pb-3" src="../../resources/upload/biz/mgz/${imgdto.bmimg_cgn }" alt="${imgdto.bmimg_cgn }" width="60%" />
										</c:when>
									<c:otherwise>그림이 아닌 다른 형식 파일입니다.</c:otherwise>		
									</c:choose>
								</c:if>
								</c:forTokens>
							</c:if>			
						</c:forEach>	
						<br />
					${bizMgzContentView.bm_content }</td>
				</tr>
				<tr class="">
					<td class="table-light border-light-subtle">첨부</td>
					<td colspan="3">
					<%-- <a href="bizCasesDownload?p=resources/upload/biz/cases/&f=${bizCasesContentView.bc_img }
						&bc_no=${bizCasesContentView.bc_no }">${bizCasesContentView.bc_img }</a> --%>
						<c:forEach items="${imglist }" var="imgdto">
							<a style="color: #1e90ff" href="bizMgzDownload?p=resources/upload/biz/&f=${imgdto.bmimg_cgn }
					&bm_no=${bizMgzContentView.bm_no }">${imgdto.bmimg_cgn }</a>
							&nbsp; &nbsp;
						</c:forEach>					
					</td>
				</tr>				
			</table>
			
									
			<div class="d-flex justify-content-evenly">
				<div class="d-flex justify-content-center" style="width: 750px;">
					<div class="d-flex align-items-start" style="width: 40%; max-width: 300px;">
							<button class="ms-1 btn btn-outline-primary btn-sm w-10" onclick="location.href='bizMgzList'"><span style="font-size: 14px;">목록</span></button>	
					</div>
			
			
				<div class="d-flex justify-content-end" style="width: 60%; max-width: 450px;">
						<c:if test="${empty loginUserDto.memno}">
						</c:if>
						<c:if test="${not empty loginUserDto.memno}">
							<c:choose>
								<c:when test="${loginUserDto.memtype eq 'ADMIN'}">
									<button class="ms-1 btn btn-outline-primary btn-sm w-10" onclick="location.href='bizMgzModView?bm_no=${bizMgzContentView.bm_no }'"><span style="font-size: 14px;">수정</span></button>								
								</c:when>
								<c:otherwise>							
								</c:otherwise>							
							</c:choose>
						</c:if>	
							
					
						<c:if test="${empty loginUserDto.memno}">
						</c:if>
						<c:if test="${not empty loginUserDto.memno}">
							<c:choose>
								<c:when test="${loginUserDto.memtype eq 'ADMIN'}">
									<button class="ms-1 btn btn-outline-primary btn-sm w-10" onclick="location.href='bizMgzDelView?bm_no=${bizMgzContentView.bm_no }'"><span style="font-size: 14px;">삭제</span></button>
								</c:when>
								<c:otherwise>
								</c:otherwise>							
							</c:choose>
						</c:if>											
					</div>
				</div>
			</div>
		</div>
	</div>

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