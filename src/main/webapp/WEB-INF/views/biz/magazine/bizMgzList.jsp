<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매거진 목록</title>
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
	 
	 th, tr{
    	text-align: center;	 
	 }
	 
	 .left{
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
			<div onclick="location.href='../search/bizAddrSearch'">
				<span class="text-body-secondary" style="font-size: 12px; cursor:pointer;">업체검색 <i class="fa-solid fa-rotate-left" style="cursor:pointer;"></i></span>
			</div>
		</div>
	</div>
		<div class="text-primary text-opacity-25">
			<hr />
		</div>
	</div>

	<div class="d-flex justify-content-center">
		<div class="p-3" style="width: 750px">
			<table class="table table-hover" style="width: 100%; max-width: 750px">
				<thead>
				    <tr class="table-light">
				      <th scope="col">NO.</th>
				      <th scope="col">작성자</th>
				      <th scope="col">제목</th>
				      <th scope="col">날짜</th>
				      <th scope="col">HIT</th>
				    </tr>
				  </thead>
		
		<c:forEach items="${bizMgzList }" var="dto">
		
			<tr class="">
				<td class="" onclick="location.href='bizMgzContentView?bm_no=${dto.bm_no }'" style="cursor:pointer;">${dto.bm_no }</td>
				<td class="">${dto.bm_writer }</td>
				<td class="left">
					<a href="bizMgzContentView?bm_no=${dto.bm_no }" style="text-decoration: none; color: #1a1f27;">${dto.bm_title }</a>
				</td>
				<td class="" onclick="location.href='bizMgzContentView?bm_no=${dto.bm_no }'" style="cursor:pointer;"><fmt:formatDate value="${dto.bm_date }" type="both" dateStyle="short" pattern="YYYY-MM-dd"/></td>
				<td onclick="location.href='bizMgzContentView?bm_no=${dto.bm_no }'" style="cursor:pointer;">${dto.bm_hit }</td>
			</tr>		
		</c:forEach>		
	</table>
	
		<div class="d-flex justify-content-evenly">
			<form action="bizMgzList"  method="post" style="width: 750px;">
					<div class="d-flex justify-content-center">
						<div class="d-flex align-items-start" style="width: 57%; max-width: 428px;">
								<div>
									<c:choose>
										<c:when test="${bm_title }">
											<input class="form-check-input"  type="checkbox" name="searchType" value="bm_title" checked/>
										</c:when>
										<c:otherwise>
											<input class="form-check-input"  type="checkbox" name="searchType" value="bm_title"/>
										</c:otherwise>
									</c:choose>
										<span style="font-size: 14px;">제목</span>
									<c:choose>
										<c:when test="${bm_content }">
											<input class="form-check-input"  type="checkbox" name="searchType" value="bm_content" checked/>
										</c:when>
										<c:otherwise>
											<input class="form-check-input"  type="checkbox" name="searchType" value="bm_content"/>
										</c:otherwise>
									</c:choose>			 
									 <span style="font-size: 14px;">내용</span>			 
									 
									<input class="mx-2 rounded border border-ddark-subtle" type="text" name="sk" value="${resk }"/>
									<input class="btn btn-outline-primary btn-sm w-10" type="submit" value="검색" />
								</div>
						</div>
					</div>
					
					<div class="p-3 pb-0 mb-0 container-md" style="width: 99%">	
					<div class="w-100 d-flex justify-content-center">
							<div id="bottomDiv">
									<c:if test="${searchVO.totPage>1}">
										<c:if test="${searchVO.page>1 }">
											<a href="bizMgzList?page=1"><i class="fa-solid fa-angles-left"></i></a>
											<a href="bizMgzList?page=${searchVO.page-1} "><i class="fa-solid fa-circle-chevron-left"></i></a>
										</c:if>
										
										
										<c:forEach begin="${searchVO.pageStart }" end="${searchVO.pageEnd }" var="i">
											<c:choose>
												<c:when test="${i eq searchVO.page }">
													<span style="color:#1e90ff; font-weight:bold;">${i } &nbsp;</span>		
												</c:when>
												<c:otherwise>			
													<a href="bizMgzList?page=${i }&sk=${resk}&bm_title=${bm_title==true?'bm_title':''}
													&bm_content=${bm_content==true?'bm_content':''}"
													style="text-decoration: none;">${i }</a> &nbsp;
												</c:otherwise>
											</c:choose>
										</c:forEach>
										
										<c:if test="${searchVO.totPage > searchVO.page}">
											<a href="bizMgzList?page=${searchVO.page+1} "><i class="fa-solid fa-circle-chevron-right"></i></a>
											<a href="bizMgzList?page=${searchVO.totPage}"><i class="fa-solid fa-angles-right"></i></a>
										</c:if>
									</c:if>
								</div>
							</div>
					</div>			
				</form>
			</div>
			<div class="d-flex justify-content-evenly">
				<div class="d-flex justify-content-center" style="width: 750px;">
					<div class="d-flex align-items-start" style="width: 40%; max-width: 300px;">
						<button class="ms-1 btn btn-outline-primary btn-sm w-10"  onclick="location.href='../search/bizAddrSearch'"><span style="font-size: 14px;">업체검색</span></button>
					</div>
				<div class="d-flex justify-content-end" style="width: 60%; max-width: 450px;">
							<button class="btn btn-outline-primary btn-sm w-10 me-1" onclick="location.href='bizMgzList'"><span style="font-size: 14px;">검색 초기화</span></button>
							<c:if test="${empty loginUserDto.memno}">
		 					</c:if>
							<c:if test="${not empty loginUserDto.memno}">
								<c:choose>
									<c:when test="${loginUserDto.memtype eq 'ADMIN'}">
										<button class="btn btn-outline-primary btn-sm w-10" onclick="location.href='bizMgzWriteView'"><span style="font-size: 14px;">글쓰기</span></button>
									</c:when>
									<c:otherwise></c:otherwise>							
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