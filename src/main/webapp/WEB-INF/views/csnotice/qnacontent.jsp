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
<h3>qna content</h3>

<table>
	<tr>
		<td class="left">번호</td>
		<td>${qna_content.nbno }</td>
	</tr>
	<tr>
		<td class="left">조회수</td>
		<td>${qna_content.nbhit }</td>
	</tr>
	<tr>
		<td class="left">글분류</td>
		<td>${qna_content.nbqnadiv }</td>
	</tr>
	<tr>
		<td class="left">작성자</td>
		<td>${qna_content.nbwriter }</td>
	</tr>
	<tr>
		<td class="left">제목</td>
		<td>${qna_content.nbtitle }</td>
	</tr>
	<tr>
		<td class="left">내용</td>
		<td>${qna_content.nbcontent }</td>
	</tr>
	<tr>
		<td class="left">날짜</td>
		<td>${qna_content.nbdate }</td>
	</tr>
	<tr>
		<td class="left">파일</td>
		<td>${qna_content.nbfilecode }</td>
	</tr>
	<tr>
		<td colspan="2">
		<a href="qnaeditview?nbno=${qna_content.nbno }">수정</a>
		<a href="qnadelete?nbno=${qna_content.nbno }">삭제</a> 
		<a href="qnalist">목록으로</a> <br />
		</td> 
	</tr>
</table>

</body>
</html>