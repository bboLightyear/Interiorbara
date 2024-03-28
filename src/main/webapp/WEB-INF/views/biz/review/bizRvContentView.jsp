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

<body onload="callheart();">

<script>
	function callheart() {
		if('${bizRvLikeCnt}'!=0){
			document.getElementById("heartImg").src = "../../resources/upload/biz/heart.png";
		}else{
			alert("NULLLL");
			document.getElementById("heartImg").src = "../../resources/upload/biz/heartempty.png";
		}
	}

	function heartChange() {
			var heartCnt=0;
			if ('${bizRvLikeCnt}'!=0){
				heartCnt=0;
				document.getElementById("heartImg").src = "../../resources/upload/biz/heartempty.png";
				$('input[name=heartCnt]').attr('value', heartCnt);
			}else{
				heartCnt=1;
				document.getElementById("heartImg").src = "../../resources/upload/biz/heart.png";
				$('input[name=heartCnt]').attr('value', heartCnt);
			}
			
		/* 		$('input[name=br_point]').attr('value', target.value); */
	}
	

</script>

	
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
			<img src="" id="heartImg" alt="heart" width="16" onclick="heartChange();"  />
			<input type="hidden" name="br_no" value="${bizRvContentView.br_no }" />
			<input type="hidden" name="user_idno" value="${user_idno }" />
			<input type="hidden" name="heartCnt" value="" size="20" />
			${bizRvLikeCnt } 개			
			${bizRvContentView.br_like_cnt }개</td>
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