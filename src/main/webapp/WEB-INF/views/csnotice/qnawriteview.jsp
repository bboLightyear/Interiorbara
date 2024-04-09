<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>qnawriteview</h3>
	<p>userId: <%= session.getAttribute("userId") %></p>

	<form action="qnawrite" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td class="">이름 : <%=session.getAttribute("userId")%> </td>
				<td><input type="hidden" name="qbwriter" value="<%=session.getAttribute("userId")%>"/></td>
			</tr>
			<tr>
				<td>분류</td>
				<td>
					<select name="qnadiv">
						<option value="qq">퀵견적</option>
						<option value="oh">우리집 자랑하기</option>
						<option value="biz">업체 관련</option>
						<option value="pf">로그인/회원정보</option>
						<option value="sh">소품샵</option>
					</select>
				</td>
			</tr>
			<tr>
				<td class="">제목</td>
				<td><input type="text" name="qbtitle" value="" /></td>
			</tr>
			<tr>
				<td class="">내용</td>
				<td><textarea type="text" name="qbcontent" rows="5" cols="65"></textarea></td>
			</tr>
			<tr>
				<td class="">첨부</td>
				<td><input type="file" name="qbfile" multiple="multiple" /></td>
			</tr>
			<tr>
				<td><input type="submit" value="글쓰기" /> <a href="qnalist">목록으로</a>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>