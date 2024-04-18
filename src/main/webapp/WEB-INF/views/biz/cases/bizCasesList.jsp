<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시공사례 목록</title>
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
			alert('해당 업체 외에는 글쓰기가 불가능합니다.');
		}
		
	</script>	
</head>
<body>
<main class="Site-content">
	<div class="pt-3 bg-light bg-opacity-75">
	<div class="d-flex justify-content-center">
		<div class="p-3" onclick="location.href='bizCasesList?inteno=${inteno}'" style="width: 750px; cursor:pointer;" >
					<ul class="list-inline">
						<li class="list-inline-item">
							<h4 style="--bs-text-opacity: 1; background-color: #1034a6; padding: 3px; !important;">
						    	<strong style="color: white;">시공사례</strong>
						   	</h4>
						</li>
						<li class="list-inline-item">
								<small class="text-body-secondary">어디에나 예시는 필요하니까.</small>
						</li>
					</ul>	
		</div>
		<div class="d-flex align-items-end mb-5">
			<div onclick="location.href='../home/bizHome?inteno=${inteno}'">
				<span class="text-body-secondary" style="font-size: 12px; cursor:pointer;">HOME <i class="fa-solid fa-rotate-left" style="cursor:pointer;"></i></span>
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
				
				<c:forEach items="${bizCasesList }" var="dto">
				
					<tr class="">
						<td class="" onclick="location.href='bizCasesContentView?bc_no=${dto.bc_no }'" style="cursor:pointer;">${dto.bc_no }</td>
						<td class="" onclick="javascript_:window.open('${path}/my/memberinfopage?nickname=${dto.bc_writer }','pop','menubar=no,status=no,scrollbars=no,resizable=no,width=560,height=700,top=50,left=50');" style="cursor: pointer;">${dto.bc_writer } <i class="fa-solid fa-user" style="font-size: 11px;"></i></td>
						<td class="left">
							<a href="bizCasesContentView?bc_no=${dto.bc_no }" style="text-decoration: none; color: #1a1f27;">${dto.bc_title }</a>
						</td>
						<td class="" onclick="location.href='bizCasesContentView?bc_no=${dto.bc_no }'" style="cursor:pointer;"><fmt:formatDate value="${dto.bc_date }" type="both" dateStyle="short" pattern="YYYY-MM-dd"/></td>
						<td class="" onclick="location.href='bizCasesContentView?bc_no=${dto.bc_no }'" style="cursor:pointer;">${dto.bc_hit }</td>
					</tr>		
				
				</c:forEach>			
			</table>
		<div class="d-flex justify-content-evenly">
			<form action="bizCasesList" method="get" style="width: 750px;">
				<input type="hidden" name="inteno" value="${inteno }" />
					<div class="d-flex justify-content-center">
						<div class="d-flex align-items-start" style="width: 57%; max-width: 428px;">
								<div>
									<c:choose>
										<c:when test="${bc_title }">
											<input class="form-check-input"  type="checkbox" name="searchType" value="bc_title" checked/>
										</c:when>
										<c:otherwise>
											<input class="form-check-input"  type="checkbox" name="searchType" value="bc_title"/>
										</c:otherwise>
									</c:choose>
										<span style="font-size: 14px;">제목</span>
									<c:choose>
										<c:when test="${bc_content }">
											<input class="form-check-input"  type="checkbox" name="searchType" value="bc_content" checked/>
										</c:when>
										<c:otherwise>
											<input class="form-check-input"  type="checkbox" name="searchType" value="bc_content"/>
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
								<input type="hidden" name="inteno" value="${inteno }" />
									<c:if test="${searchVO.totPage>1}">
										<c:if test="${searchVO.page>1 }">
											<a href="bizCasesList?inteno=${inteno }&page=1"><i class="fa-solid fa-angles-left"></i></a>
											<a href="bizCasesList?inteno=${inteno }&page=${searchVO.page-1} "><i class="fa-solid fa-circle-chevron-left"></i></a>
										</c:if>
										
										
										<c:forEach begin="${searchVO.pageStart }" end="${searchVO.pageEnd }" var="i">
											<c:choose>
												<c:when test="${i eq searchVO.page }">
													<span style="color:#1e90ff; font-weight:bold;">${i } &nbsp;</span>		
												</c:when>
												<c:otherwise>			
													<a href="bizCasesList?inteno=${inteno }&page=${i }&sk=${resk}&bc_title=${bc_title==true?'bc_title':''}
													&bc_content=${bc_content==true?'bc_content':''}"
													style="text-decoration: none;">${i }</a> &nbsp;		
													
												</c:otherwise>
											</c:choose>
										
										
										</c:forEach>
										
										<c:if test="${searchVO.totPage > searchVO.page}">
											<a href="bizCasesList?inteno=${inteno }&page=${searchVO.page+1} "><i class="fa-solid fa-circle-chevron-right"></i></a>
											<a href="bizCasesList?inteno=${inteno }&page=${searchVO.totPage}"><i class="fa-solid fa-angles-right"></i></a>
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
						<button class="ms-1 btn btn-outline-primary btn-sm w-10"  onclick="location.href='../home/bizCasesListUnder?inteno=${inteno}'"><span style="font-size: 14px;">홈에서 보기</span></button>
					</div>
				<div class="d-flex justify-content-end" style="width: 60%; max-width: 450px;">
							<button class="btn btn-outline-primary btn-sm w-10 me-1" onclick="location.href='bizCasesList?inteno=${inteno }'"><span style="font-size: 14px;">검색 초기화</span></button>
							<c:if test="${empty loginUserDto.memno}">
		 						<button class="btn btn-outline-primary btn-sm w-10 me-1"  onclick="redirectLogin()"><span style="font-size: 14px;">글쓰기</span></button>
							</c:if>
							<c:if test="${not empty loginUserDto.memno}">
								<c:choose>
									<c:when test="${loginUserDto.myinteriordto.inteno eq inteno}">
										<button class="btn btn-outline-primary btn-sm w-10" onclick="location.href='bizCasesWriteView?inteno=${inteno }'"><span style="font-size: 14px;">글쓰기</span></button>
									</c:when>
									<c:otherwise>
										<button class="btn btn-outline-primary btn-sm w-10" onclick="alertNo()"><span style="font-size: 14px;">글쓰기</span></button>
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