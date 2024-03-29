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
</head>

<body>
	
	
<h3>bizRvContentView.jsp</h3>

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
			<td class="">내용</td>
			<td>
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
				<br />
			${bizRvContentView.br_content }</td>
		<tr class="">
			<td class="">좋아요</td>
			<td>
<%-- 				<a href="bizRvContentView?br_no=${bizRvContentView.br_no }&user_idno=1000&heartnew=y">
				<img src="../../resources/upload/biz/${heartIs }" id="heartImg" alt="heart" width="16"  /></a> --%>
			 
<%--  			 <form action="bizRvContentView" method="post">
				<!-- 새로고침했을 때 원주소로 돌아가는 방법을 모르겠다. --> 
				<input type="image" src="../../resources/upload/biz/${heartIs }" id="heartImg" alt="heart" width="16"/>
				<input type="hidden" name="br_no" value="${bizRvContentView.br_no }" />
				<input type="hidden" name="user_idno" value="1000${session.user_idno }" />
				<input type="hidden" name="heartnew" value="y" />
			</form> --%>
			
			<!-- heartnew값을 주소창에 보이지 않으면서, 주소창에서 직접 엔터쳐서 새로고침했을 때 해당 게시물로 돌아가게 만듦 --> 
 			 <form action="bizRvContentView?br_no=${bizRvContentView.br_no }&user_idno=1000" method="post">
				<input type="image" src="../../resources/upload/biz/${heartIs }" id="heartImg" alt="heart" width="16"/>
				<input type="hidden" name="heartnew" value="y" />
			</form>			
			 
			 ${allUserLikeTotal } 개
			 
			 
			 
			 
		</tr>		
		</tr>	
		<tr class="">
			<td colspan="2">
				<a href="bizRvModDelView?br_no=${bizRvContentView.br_no }">수정/삭제</a> <br />
				<a href="bizRvReportView?br_no=${bizRvContentView.br_no }">신고하기</a> <br />
				<a href="bizRvList">목록</a> <br />
			</td>
		</tr>		
	</table>


</body>
</html>