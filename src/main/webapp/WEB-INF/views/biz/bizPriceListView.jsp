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
<h3>전체 수정하기</h3>

	<table width="800" border="1">
		<tr>
<!-- 			<td>번호</td> -->
			<td class="">자재사진</td>
			<td class="">자재등급</td>
			<td class="">카테고리</td>
			<td class="">이름</td>
			<td class="">설명</td>
			<td class="">가격</td>
			<td class="">개별수정</td>
		</tr>
		
		<c:forEach items="${bizPriceListView }" var="dto">
		
			<tr>
				<%-- <td>${dto.bp_no }</td> --%>
				<td class="">
					<img src="../../../ibara/resources/upload/biz/price/${dto.bp_img }" alt="${dto.bp_img }" width="100"/>
				</td>
				<td class="">${dto.bp_type }</td>
				<td class="">${dto.bp_category }</td>
				<td class="">${dto.bp_name }</td>
				<td class="">${dto.bp_content }</td>
				<td class="">${dto.bp_price }</td>
				<td class=""><a href="bizPriceModEachView?inteno=${dto.inteno }&bp_no=${dto.bp_no }">수정하기</a></td>
			</tr>		
		
		</c:forEach>
		
		<tr>
			<td colspan="8"><a href="bizPriceModAllView?inteno=${inteno }">한꺼번에 수정하기</a></td>
		</tr>		
		
		
		
	</table>

</body>
</html>