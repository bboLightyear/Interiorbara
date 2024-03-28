<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>	
	<link rel="stylesheet" href="${path }/resources/js/bizStyle.css" />
	<script src="${path }/resources/js/bizScriptjsp.js"></script>
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




<body onload="callpoint();">
<h3>bizRvList.jsp</h3>

	<table class="" border="1">
		<tr class="">
			<td class="">썸네일</td>
			<td class="">번호</td>		
			<td class="">내용</td>
			<td class="">닉네임</td>
			<td class="">날짜</td>
			<td class="">별점</td>
			<td class="">좋아요</td>
		</tr>
		
		<c:forEach items="${bizRvList }" var="dto">
		
			<tr class="">
				<td class="">

					${dto.br_no }
	 				 	<c:forEach items="${joinList }" var="rv">
							<c:if test="${rv.bizRvImgDto.brimg_cgn ne null }">
								<c:set value="${rv.bizRvImgDto.brimg_cgn }" var="filename" />
								<c:set value="${fn:toLowerCase(filename) }" var="fileNm" />
								<c:forTokens items="${fileNm }" delims="." var="token" varStatus="status">
								<c:if test="${status.last }">
									<c:choose>
										<c:when test="${token eq 'jpg' || token eq 'png'}">											
											<c:if test="${dto.br_no eq rv.bizRvImgDto.br_no }">
												<img src="../../resources/upload/biz/review/${rv.bizRvImgDto.brimg_cgn }" alt="${rv.bizRvImgDto.brimg_cgn }" width="50" style="cursor:pointer"
												onclick="window.open('bizRvImgPopUpView?br_no=${dto.br_no }',
												'new','scrollbars=yes,width=300,height=500');"/>
											</c:if>
										</c:when>
									<c:otherwise> </c:otherwise>		
									</c:choose>
								</c:if>
								</c:forTokens>
							</c:if>			
						</c:forEach>
				</td>
				<td class="">${dto.br_no }</td>
				<td class="">${dto.br_writer }</td>
				<td class="">
					<a href="bizRvContentView?br_no=${dto.br_no }&user_idno=1000">${dto.br_content }</a>
				</td>
				<td class="">${dto.br_date }</td>
				<td class=""><span style="color: gold;">★</span> ${dto.br_point }</td>
				<td class="">${dto.br_like_cnt }</td>
			</tr>		
		
		</c:forEach>
		
		<tr>
			<td colspan="6"><a href="bizRvWriteView">리뷰쓰기</a> <a href="bizRvList">첫페이지로</a></td>
			
		</tr>				
	</table>
	
	totCnt : ${totRowcnt } <br />
	현재페이지/토탈페이지 : ${searchVO.page }/${searchVO.totPage }
	
	<hr />
	
	<form action="bizRvList" method="post">
		<c:if test="${searchVO.totPage>1}">
			<c:if test="${searchVO.page>1 }">
				<a href="bizRvList?page=1"><i class="fa-solid fa-angles-left"></i></a>
				<a href="bizRvList?page=${searchVO.page-1} "><i class="fa-solid fa-circle-chevron-left"></i></a>
			</c:if>
			
			
			<c:forEach begin="${searchVO.pageStart }" end="${searchVO.pageEnd }" var="i">
				<c:choose>
					<c:when test="${i eq searchVO.page }">
						<span style="color:red;font-weight:bold;">${i } &nbsp;</span>		
					</c:when>
					<c:otherwise>			
						<a href="bizRvList?page=${i }&sk=${resk}&br_content=${br_content==true?'br_content':''}
						&br_writer=${br_writer==true?'br_writer':''}"
						style="text-decoration: none;">${i }</a> &nbsp;		
						
					</c:otherwise>
				</c:choose>
			
			
			</c:forEach>
			
			<c:if test="${searchVO.totPage > searchVO.page}">
				<a href="bizRvList?page=${searchVO.page+1} "><i class="fa-solid fa-angles-right"></i></a>
				<a href="bizRvList?page=${searchVO.totPage}"><i class="fa-solid fa-circle-chevron-right"></i></a>
			</c:if>
		</c:if>
		<div>
			<c:choose>
				<c:when test="${br_content }">
					<input type="checkbox" name="searchType" value="br_content" checked/>
				</c:when>
				<c:otherwise>
					<input type="checkbox" name="searchType" value="br_content"/>
				</c:otherwise>
			</c:choose>
			 내용
			<c:choose>
				<c:when test="${br_writer }">
					<input type="checkbox" name="searchType" value="br_writer" checked/>
				</c:when>
				<c:otherwise>
					<input type="checkbox" name="searchType" value="br_writer"/>
				</c:otherwise>
			</c:choose>			 
			 닉네임			 
			 
			<input type="text" name="sk" value="${resk }"/>
			<input type="submit" value="검색" />
		</div>

	</form>
	
</body>
</html>