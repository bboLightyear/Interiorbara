<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link  rel="stylesheet"
  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>
  	<style>
	 .fa-solid{
	 	color: #333;
	 }
	 .fa-solid:hover{
	 	color: orange;
	 }	 
	</style>
</head>
<body>
<h3>bizMgzList.jsp</h3>

	<table class="" border="1">
		<tr class="">
			<td class="">번호</td>
			<td class="">제목</td>
			<td class="">이름</td>
			<td class="">날짜</td>
			<td class="">히트</td>
		</tr>
		
		<c:forEach items="${bizMgzList }" var="dto">
		
			<tr class="">
				<td class="">${dto.bm_no }</td>
				<td class="">${dto.bm_writer }</td>
				<td class="">
					<a href="bizMgzContentView?bm_no=${dto.bm_no }">${dto.bm_title }</a>
				</td>
				<td class="">${dto.bm_date }</td>
				<td class="">${dto.bm_hit }</td>
			</tr>		
		
		</c:forEach>
		
		<tr>
			<td colspan="5"><a href="bizMgzWriteView">글쓰기</a> <a href="bizMgzList">첫페이지로</a></td>
			
		</tr>				
	</table>
	
	totCnt : ${totRowcnt } <br />
	현재페이지/토탈페이지 : ${searchVO.page }/${searchVO.totPage }
	
	<hr />
	
	<form action="bizMgzList" method="post">
		<c:if test="${searchVO.totPage>1}">
			<c:if test="${searchVO.page>1 }">
				<a href="bizMgzList?page=1"><i class="fa-solid fa-angles-left"></i></a>
				<a href="bizMgzList?page=${searchVO.page-1} "><i class="fa-solid fa-circle-chevron-left"></i></a>
			</c:if>
			
			
			<c:forEach begin="${searchVO.pageStart }" end="${searchVO.pageEnd }" var="i">
				<c:choose>
					<c:when test="${i eq searchVO.page }">
						<span style="color:red;font-weight:bold;">${i } &nbsp;</span>		
					</c:when>
					<c:otherwise>			
						<a href="bizMgzList?page=${i }&sk=${resk}&bm_title=${bm_title==true?'bm_title':''}
						&bm_content=${bm_content==true?'bm_content':''}"
						style="text-decoration: none;">${i }</a> &nbsp;		
						
					</c:otherwise>
				</c:choose>
			
			
			</c:forEach>
			
			<c:if test="${searchVO.totPage > searchVO.page}">
				<a href="bizMgzList?page=${searchVO.page+1} "><i class="fa-solid fa-angles-right"></i></a>
				<a href="bizMgzList?page=${searchVO.totPage}"><i class="fa-solid fa-circle-chevron-right"></i></a>
			</c:if>
		</c:if>
		<div>
			<c:choose>
				<c:when test="${bm_title }">
					<input type="checkbox" name="searchType" value="bm_title" checked/>
				</c:when>
				<c:otherwise>
					<input type="checkbox" name="searchType" value="bm_title"/>
				</c:otherwise>
			</c:choose>
			 제목
			<c:choose>
				<c:when test="${bm_content }">
					<input type="checkbox" name="searchType" value="bm_content" checked/>
				</c:when>
				<c:otherwise>
					<input type="checkbox" name="searchType" value="bm_content"/>
				</c:otherwise>
			</c:choose>			 
			 내용			 
			 
			<input type="text" name="sk" value="${resk }"/>
			<input type="submit" value="검색" />
		</div>

	</form>
	
</body>
</html>