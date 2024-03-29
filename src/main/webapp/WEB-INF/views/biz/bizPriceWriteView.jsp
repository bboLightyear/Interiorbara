<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>bizPriceList.jsp</h3>

<form action="bizPriceWrite" method="post" enctype="multipart/form-data">
<input type="hidden" name="biz_idno" value="40<%-- ${sessionUser_Idno } --%>" />
	<table width="700" border="1">
		<tr>
<!-- 			<td>번호</td> -->
			<td class="">자재사진</td>
			<td class="">자재등급</td>
			<td class="">카테고리</td>
			<td class="">자재명</td>
			<td class="">설명</td>
			<td class="">가격</td>
		</tr>
		
		<c:forEach items="${bizPriceTagList }" var="dto">
		
			<tr>
				<%-- <td>${dto.bp_no }</td> --%>
				<td class="">
					<input type="file" name="file" multiple="multiple"/>
				</td>
				<td class="">
					${dto[0] }
					<input type="hidden" name="bp_type" value="${dto[0] }" />
				</td>
				<td class="">
					${dto[1] }
					<input type="hidden" name="bp_category" value="${dto[1] }" />
				</td>
				<td class="">
					<input type="text" name="bp_name" value="1" />
				</td>
				<td class="">
					<textarea type="text" name="bp_content" rows="3" cols="35">간단한 설명을 입력해 주세요.</textarea>
				</td>
				<td class="">
					<input type="text" name="bp_price" value="1" />원
				</td>
			</tr>		
		
		</c:forEach>
		<tr>
			<td colspan="6">
				<input type="submit" value="등록" />
			</td>
			
		</tr>	
		
	</table>
</form>


</body>
</html>