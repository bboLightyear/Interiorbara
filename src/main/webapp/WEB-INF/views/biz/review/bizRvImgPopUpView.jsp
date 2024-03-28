<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>	
	<link rel="stylesheet" href="${path }/resources/js/bizStyle.css" />
	<script src="${path }/resources/js/bizScriptjsp.js"></script>
</head>
<body>
<h3>bizRvImgPopUpView.jsp</h3>

<table>
		<tr class="">
			<td class="">번호</td>
			<td>${bizRvContentView.br_no }</td>
		</tr>
		<tr class="">
			<td class="">이름</td>
			<td>${bizRvContentView.br_writer }</td>
		</tr>		
		<tr class="">
			<td class="">별점</td>
			<td><span style="color: gold;">★</span>${bizRvContentView.br_point }</td>
		</tr>		
		
		
		
		
		
		<tr class="">
			<td colspan="2">
 				<c:forEach items="${imglist }" var="imgdto">
					
					<c:if test="${imgdto.brimg_cgn ne null }">
						<c:set value="${imgdto.brimg_cgn }" var="filename" />
						<c:set value="${fn:toLowerCase(filename) }" var="fileNm" />
						<c:forTokens items="${fileNm }" delims="." var="token" varStatus="status">
						<c:if test="${status.last }">
							<c:choose>
								<c:when test="${token eq 'jpg' || token eq 'png'}">
									<img src="../../resources/upload/biz/review/${imgdto.brimg_cgn }" alt="${imgdto.brimg_cgn }" width="200" />
								</c:when>
							<c:otherwise>그림이 아닌 다른 형식 파일입니다.</c:otherwise>		
							</c:choose>
						</c:if>
						</c:forTokens>
					</c:if>			
				</c:forEach>
			</td>
		</tr>		

		<tr class="">
			<td colspan="2">
				<a href="#" onclick="javascript:window.close()">창닫기</a>
			</td>
		</tr>		
	</table>


</body>
</html>