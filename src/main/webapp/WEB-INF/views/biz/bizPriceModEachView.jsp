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
<h3>bizPriceModEachView.jsp</h3>

<form action="bizPriceModEach" method="post" enctype="multipart/form-data">
<input type="hidden" name="inteno" value="40<%-- ${sessionUser_Idno } --%>" />
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
		
			<tr>
				<%-- <td>${eachDto.bp_no }</td> --%>
				<td class="">
				<input type="hidden" name="bp_no" value="${eachDto.bp_no }" />
				<img src="../../../ibara/resources/upload/biz/price/${eachDto.bp_img }" alt="${eachDto.bp_img }" width="100"/>
					<input type="file" name="fileNew" />
					<input type="hidden" name="bp_img" value="${eachDto.bp_img }" />
				</td>
				<td class="">
					<input type="text" name="bp_type" value="${eachDto.bp_type }" />
				</td>
				<td class="">
					<input type="text" name="bp_category" value="${eachDto.bp_category }" />
				</td>
				<td class="">
					<input type="text" name="bp_name" value="${eachDto.bp_name }" />
				</td>
				<td class="">
					<textarea type="text" name="bp_content" rows="3" cols="35">${eachDto.bp_content }</textarea>
				</td>
				<td class="">
					<input type="text" name="bp_price" value="${eachDto.bp_price }" />원
				</td>
			</tr>		
		<tr>
			<td colspan="6">
				<input type="submit" value="등록" />
			</td>
			
		</tr>	
		
	</table>
</form>


</body>
</html>