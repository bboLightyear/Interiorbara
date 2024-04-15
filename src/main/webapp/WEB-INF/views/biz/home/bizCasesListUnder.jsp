<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시공사례 목록</title>
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
	
	 th, tr{
    	text-align: center;	 
	 }
	</style>
</head>
<body>

<%-- 	<div class="d-flex justify-content-center">
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
				
					<tr class="" >
						<td class="">${dto.bc_no }</td>
						<td class="">${dto.bc_writer }</td>
						<td class="">
							<a href="bizCasesContentView?bc_no=${dto.bc_no }" style="text-decoration: none; color: #1a1f27;">${dto.bc_title }</a>
						</td>
						<td class=""><fmt:formatDate value="${dto.bc_date }" type="both" dateStyle="short" pattern="YYYY-MM-dd"/></td>
						<td class="">${dto.bc_hit }</td>
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
						<button class="ms-1 btn btn-outline-primary btn-sm w-10"  onclick="location.href='../home/bizHome?inteno=${inteno }'"><span style="font-size: 14px;">뒤로 가기</span></button>
					</div>
				<div class="d-flex justify-content-end" style="width: 60%; max-width: 450px;">
							<button class="btn btn-outline-primary btn-sm w-10 me-1" onclick="location.href='bizCasesList?inteno=${inteno }'"><span style="font-size: 14px;">초기화</span></button>
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
	</div>	 --%>





	<table class="" border="1">
		<tr class="">
			<td class="">번호</td>
			<td class="">제목</td>
			<td class="">이름</td>
			<td class="">날짜</td>
			<td class="">히트</td>
		</tr>
		
		<c:forEach items="${bizCasesList }" var="dto">
		
			<tr class="">
				<td class="">${dto.bc_no }</td>
				<td class="">${dto.bc_writer }</td>
				<td class="">
					<a href="bizCasesContentView?bc_no=${dto.bc_no }&inteno=${inteno }">${dto.bc_title }</a>
				</td>
				<td class="">${dto.bc_date }</td>
				<td class="">${dto.bc_hit }</td>
			</tr>		
		
		</c:forEach>
		
		<tr>
			<td colspan="5"><a href="bizCasesWriteView?inteno=${inteno }">글쓰기</a> <a href="bizCasesListUnder">첫페이지로</a></td>
			
		</tr>				
	</table>
	
	totCnt : ${totRowcnt } <br />
	현재페이지/토탈페이지 : ${searchVO.page }/${searchVO.totPage }
	
	<hr />
	
		<c:if test="${searchVO.totPage>1}">
			<c:if test="${searchVO.page>1 }">
				<a href="../cases/bizCasesList?page=1&inteno=${inteno }"><i class="fa-solid fa-angles-left"></i></a>
				<a href="../cases/bizCasesList?page=${searchVO.page-1}&inteno=${inteno }"><i class="fa-solid fa-circle-chevron-left"></i></a>
			</c:if>
			
			
			<c:forEach begin="${searchVO.pageStart }" end="${searchVO.pageEnd }" var="i">
				<c:choose>
					<c:when test="${i eq searchVO.page }">
						<span style="color:red;font-weight:bold;">${i } &nbsp;</span>		
					</c:when>
					<c:otherwise>			
						<a href="../cases/bizCasesList?page=${i }&inteno=${inteno }"
						style="text-decoration: none;">${i }</a> &nbsp;		
						
					</c:otherwise>
				</c:choose>
			
			
			</c:forEach>
			
			<c:if test="${searchVO.totPage > searchVO.page}">
				<a href="../cases/bizCasesList?page=${searchVO.page+1}&inteno=${inteno }"><i class="fa-solid fa-angles-right"></i></a>
				<a href="../cases/bizCasesList?page=${searchVO.totPage}&inteno=${inteno }"><i class="fa-solid fa-circle-chevron-right"></i></a>
			</c:if>
		</c:if>

	
</body>
</html>