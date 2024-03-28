<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>bizCasesContentView.jsp</h3>

<table>
		<tr class="">
			<td class="">번호</td>
			<td>${bizCasesContentView.bc_no }</td>
		</tr>
		<tr class="">
			<td class="">히트</td>
			<td>${bizCasesContentView.bc_hit }</td>
		</tr>		
		<tr class="">
			<td class="">이름</td>
			<td>${bizCasesContentView.bc_writer }</td>
		</tr>		
		<tr class="">
			<td class="">제목</td>
			<td>${bizCasesContentView.bc_title }</td>
		</tr>		
		<tr class="">
			<td class="">내용</td>
			<td>
			
 				<c:forEach items="${imglist }" var="imgdto">
					
					<c:if test="${imgdto.bcimg_cgn ne null }">
						<c:set value="${imgdto.bcimg_cgn }" var="filename" />
						<c:set value="${fn:toLowerCase(filename) }" var="fileNm" />
						<c:forTokens items="${fileNm }" delims="." var="token" varStatus="status">
						<c:if test="${status.last }">
							<c:choose>
								<c:when test="${token eq 'jpg' || token eq 'png'}">
									<img src="../../resources/upload/biz/cases/${imgdto.bcimg_cgn }" alt="${imgdto.bcimg_cgn }" width="200" />
								</c:when>
							<c:otherwise>그림이 아닌 다른 형식 파일입니다.</c:otherwise>		
							</c:choose>
						</c:if>
						</c:forTokens>
					</c:if>			
				</c:forEach>	
				<br />
			${bizCasesContentView.bc_content }</td>
		</tr>
		<tr class="">
			<td class="">첨부</td>
			<td>
			<%-- <a href="bizCasesDownload?p=resources/upload/biz/&f=${bizCasesContentView.bc_img }
				&bc_no=${bizCasesContentView.bc_no }">${bizCasesContentView.bc_img }</a> --%>
				<c:forEach items="${imglist }" var="imgdto">
					<a href="bizCasesDownload?p=resources/upload/biz/&f=${imgdto.bcimg_cgn }
					&bc_no=${bizCasesContentView.bc_no }">${imgdto.bcimg_cgn }</a>
				</c:forEach>					
				
			</td>
		</tr>		
		<tr class="">
			<td colspan="2">
				<a href="bizCasesModView?bc_no=${bizCasesContentView.bc_no }">수정</a> <br />
				<a href="bizCasesList">목록</a> <br />
				<a href="bizCasesDelView?bc_no=${bizCasesContentView.bc_no }">삭제</a> <br />
			</td>
		</tr>		
	</table>


</body>
</html>