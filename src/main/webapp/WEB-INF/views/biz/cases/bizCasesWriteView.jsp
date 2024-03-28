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
<h3>bizCasesWriteView.jsp</h3>

<form action="bizCasesWrite" method="post" enctype="multipart/form-data">
<input type="hidden" name="user_idno" value="1000<%-- ${sessionUser_Idno } --%>" />
	<table>
		<tr>
			<td class="">이름</td>
			<td><input type="text" name="bc_writer" value="닉네임" /><%-- ${sessionNickname } --%></td>
		</tr>
		<tr>
			<td class="">제목</td>
			<td><input type="text" name="bc_title" value="제목을 입력해 주세요" /></td>
		</tr>
		<tr>
			<td class="">내용</td>
			<td><textarea type="text" name="bc_content" rows="5" cols="35">내용을 입력해 주세요.</textarea></td>
		</tr>
		<tr>
			<td class="">첨부</td>
			<td><input type="file" name="file" multiple="multiple"/></td>
		</tr>		
		<tr>
			<td colspan="2">
				<input type="submit" value="입력" />
				<a href="list">목록</a>
			</td>
			
		</tr>			
	</table>
</form>


</body>
</html>