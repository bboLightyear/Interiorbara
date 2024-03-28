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
<h3>content_update.jsp</h3>

<form action="bizCasesMod" method="post">
<input type="hidden" name="bc_no" value="${bizCasesContentView.bc_no }" />  <!-- 딱히 방법 없을 때 숨겨서 가져오는 법 -->
	<table>
		<tr>
			<td class="">번호</td>
			<td>${bizCasesContentView.bc_no }</td>
		</tr>
		<tr>
			<td class="">히트</td>
			<td>${bizCasesContentView.bc_hit }</td>
		</tr>		
		<tr>
			<td class="">이름</td>
			<td>
			${bizCasesContentView.bc_writer }	
			</td>
		</tr>		
		<tr>
			<td class="">제목</td>
			<td>
			<input type="text" name="bc_title" value="${bizCasesContentView.bc_title }"  />	
			</td>
		</tr>		
		<tr>
			<td class="">내용</td>
			<td>
				<textarea name="bc_content" id="bc_content" cols="35" rows="5">
					${bizCasesContentView.bc_content }
				</textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="modify" /> &nbsp; &nbsp;
				<a href="bizCasesList">목록으로</a>
			</td>
		</tr>		
	</table>
</form>


</body>
</html>