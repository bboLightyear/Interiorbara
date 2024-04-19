<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>	
	<link rel="stylesheet" href="${path }/resources/js/bizStyle.css" />
	<script src="${path }/resources/js/bizScriptjsp.js"></script>
<meta charset="UTF-8">
<title>시공사례 목록</title>
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
		 
		 th, tr{
	    	text-align: center;	 
		 }
	 
		 #left{
			 text-align: left;	 
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
		    // memno가 없으면 로그인 페이지로 리디렉트
		    if (${loginUserDto.memno eq null}) {
		    	alert('로그인 시 이용 가능합니다. 로그인 페이지로 이동합니다.');
		        window.location.href = "../../my/loginform"; // 로그인 페이지로 이동
		    }
		    // memno가 있으면 해당 JSP 문서를 로드
		});
		

		function redirectLogin() {
			alert('로그인 후 이용하실 수 있습니다.');
			window.location.href = "../../my/loginform";
		}
		
		function alertNo() {
			alert('일반회원 외에는 리뷰 작성이 불가능합니다.');
		}
		
	</script>	
</head>
<body>
<main class="Site-content">
	<div class="pt-3 bg-light bg-opacity-75">
	<div class="d-flex justify-content-center">
		<div class="p-3" onclick="location.href='bizRvList?inteno=${inteno}'" style="width: 750px; cursor:pointer;" >
					<ul class="list-inline">
						<li class="list-inline-item">
							<h4 style="--bs-text-opacity: 1; background-color: #1034a6; padding: 3px; !important;">
						    	<strong style="color: white;">시공리뷰</strong>
						   	</h4>
						</li>
						<li class="list-inline-item">
								<small class="text-body-secondary">생생한 실제 이용 후기를 볼까요?</small>
						</li>
					</ul>	
		</div>
		<div class="d-flex align-items-end mb-5">
			<div onclick="location.href='../home/bizRvListUnder?inteno=${inteno}'">
				<span class="text-body-secondary" style="font-size: 12px; cursor:pointer;">HOME <i class="fa-solid fa-rotate-left" style="cursor:pointer;"></i></span>
			</div>
		</div>
	</div>
		<div class="text-primary text-opacity-25">
			<hr />
		</div>
	</div>

	<div class="d-flex justify-content-center">
		<div class="p-3 pb-0" style="width: 750px">
			<table class="table table-hover" style="width: 100%; max-width: 750px">
				<thead>
				    <tr class="table-light">
				      <th scope="col" class="align-middle">이미지</th>
				      <th scope="col" class="align-middle">작성자</th>
				      <th scope="col" class="align-middle">내용</th>
				      <th scope="col" class="align-middle">날짜</th>
				      <th scope="col" class="align-middle">별점</th>
				      <th scope="col" class="align-middle">LIKE</th>
				    </tr>
				  </thead>
				<c:forEach items="${bizRvList }" var="dto">
					<tr class="">
						<td class="align-middle">
			 				 	<c:forEach items="${joinList }" var="rv">
									<c:if test="${rv.bizRvImgDto.brimg_cgn ne null }">
										<c:set value="${rv.bizRvImgDto.brimg_cgn }" var="filename" />
										<c:set value="${fn:toLowerCase(filename) }" var="fileNm" />
										<c:forTokens items="${fileNm }" delims="." var="token" varStatus="status">
										<c:if test="${status.last }">
											<c:choose>
												<c:when test="${token eq 'jpg' || token eq 'png' || token eq 'jpeg'}">											
													<c:if test="${dto.br_no eq rv.bizRvImgDto.br_no }">
														<img src="../../resources/upload/biz/review/${rv.bizRvImgDto.brimg_cgn }" alt="${rv.bizRvImgDto.brimg_cgn }" width="52" height="29" style="cursor:pointer"
														onclick="window.open('bizRvImgPopUpView?br_no=${dto.br_no }',
														'new','scrollbars=yes,width=400,height=500');"/>
													</c:if>
												</c:when>
											<c:otherwise> </c:otherwise>		
											</c:choose>
										</c:if>
										</c:forTokens>
									</c:if>			
								</c:forEach>
						</td>
						<td class="align-middle" onclick="javascript_:window.open('${path}/my/memberinfopage?nickname=${dto.br_writer }','pop','menubar=no,status=no,scrollbars=no,resizable=no,width=560,height=700,top=50,left=50');" style="cursor: pointer;">${dto.br_writer } <i class="fa-solid fa-user" style="font-size: 11px;"></i></td>
						
						
						
						
						<td class="align-middle" id="left">
							<a href="bizRvContentView?br_no=${dto.br_no }" style="text-decoration: none; color: #1a1f27;">${dto.br_content }</a>
						</td>
						<td class="align-middle" onclick="location.href='bizRvContentView?br_no=${dto.br_no }'" style="cursor:pointer;"><fmt:formatDate value="${dto.br_date }" type="both" dateStyle="short" pattern="YY-MM-dd"/></td>
						<td class="align-middle" onclick="location.href='bizRvContentView?br_no=${dto.br_no }'" style="cursor:pointer;"><span style="color: gold;">★</span> ${dto.br_point }</td>
						<td class="align-middle" onclick="location.href='bizRvContentView?br_no=${dto.br_no }'" style="cursor:pointer;">${dto.br_like_cnt }</td>
					</tr>		
				</c:forEach>			
			</table>

	
	<div class="d-flex justify-content-center">
		<div style="width: 750px">				
			<form action="bizRvList" method="get" style="width: 750px;">
				<input type="hidden" name="inteno" value="${inteno }" />
					<div class="p-3 container-md" style="width: 99%">	
					<div class="w-100 d-flex justify-content-center">
							<div id="bottomDiv">
								<c:if test="${searchVO.totPage>1}">
										<c:if test="${searchVO.page>1 }">
											<a href="bizRvList?inteno=${inteno }&page=1"><i class="fa-solid fa-angles-left"></i></a>
											<a href="bizRvList?inteno=${inteno }&page=${searchVO.page-1} "><i class="fa-solid fa-circle-chevron-left"></i></a>
										</c:if>
										<c:forEach begin="${searchVO.pageStart }" end="${searchVO.pageEnd }" var="i">
											<c:choose>
												<c:when test="${i eq searchVO.page }">
													<span style="color:#1e90ff; font-weight:bold;">${i } &nbsp;</span>		
												</c:when>
												<c:otherwise>			
												<a href="bizRvList?inteno=${inteno}&page=${i }&sk=${resk}&br_content=${br_content==true?'br_content':''}
												&br_writer=${br_writer==true?'br_writer':''}"
													style="text-decoration: none;">${i }</a> &nbsp;		
												</c:otherwise>
											</c:choose>
										</c:forEach>
										<c:if test="${searchVO.totPage > searchVO.page}">
											<a href="bizRvList?page=${searchVO.page+1}&inteno=${inteno} "><i class="fa-solid fa-circle-chevron-right"></i></a>
											<a href="bizRvList?page=${searchVO.totPage}&inteno=${inteno}"><i class="fa-solid fa-angles-right"></i></a>
										</c:if>
									</c:if>
								</div>
							</div>
					</div>				
				</form>
			</div>
		</div>	
	
		<div class="d-flex justify-content-evenly">
			<div class="d-flex justify-content-center" style="width: 750px;">
				<div class="d-flex align-items-start" style="width: 40%; max-width: 300px;">
					<button class="ms-1 btn btn-outline-primary btn-sm w-10"  onclick="location.href='../home/bizRvListUnder?inteno=${inteno }'"><span style="font-size: 14px;">홈에서 보기</span></button>
				</div>
				<div class="d-flex justify-content-end pe-1" style="width: 60%; max-width: 450px;">
					<c:if test="${empty loginUserDto.memno}">
 						<button class="btn btn-outline-primary btn-sm w-10"  onclick="redirectLogin()"><span style="font-size: 14px;">리뷰쓰기</span></button>
					</c:if>
					<c:if test="${not empty loginUserDto.memno}">
						<c:choose>
							<c:when test="${loginUserDto.memtype eq 'PERSON'}">
								<button class="btn btn-outline-primary btn-sm w-10" onclick="location.href='bizRvWriteView?inteno=${inteno }'"><span style="font-size: 14px;">리뷰쓰기</span></button>
							</c:when>
							<c:otherwise>
								<button class="btn btn-outline-primary btn-sm w-10" onclick="alertNo()"><span style="font-size: 14px;">리뷰쓰기</span></button>
							</c:otherwise>							
						</c:choose>
					</c:if>	
				</div>
			</div>
		</div>			
	</div>
</div>
</main>
</body>
<%@include file ="../bizFooter.jsp" %>
</html>