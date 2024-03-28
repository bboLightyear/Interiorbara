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
			<td colspan="2"><a href="qnaeditview?nbno=${qna_content.nbno }">수정</a>
				<a href="qnadelete?nbno=${qna_content.nbno }">삭제</a> <a
				href="qnalist">목록으로</a> <br /></td>
		</tr>
	</table>

	<hr />


	<form action="qnareply?nbno=${qna_content.nbno }" method="post">
		<table border="1px">
			<tr>
				<td class="">답글 달기</td>
				<td class="">작성자</td>
			</tr>
			<tr>
				<td><textarea rows="6" cols="65" name="qnareply"></textarea></td>
				<td><input type="text" name="qnarewriter" /></td>
				<td><input type="submit" value="답변" /></td>
			</tr>
		</table>
	</form>
<hr />
<h3>답글  개</h3>

<%-- 	<table border="1px">
		<tr>
			<td class="left">작성자</td>
			<td class="left">답글</td>
		</tr>
		<c:forEach items="${replylist }" var="dto">
			<tr>
				<td>${dto.rnbwriter }</td>
				<td>${dto.rnbcontent }</td>
				<td><input type="button" value="답글달기" /></td>
			</tr>
		</c:forEach>
	</table> --%>
	
	<c:forEach items="${replylist }" var="dto">
	<div>
		<span><h3> 작성자 : ${dto.rnbwriter }</h3></span>
		<p> 답글 : ${dto.rnbcontent }</p>
		<button>답글달기</button>
	</div>
	<form action="">
		<div contenteditable="true" style="padding: 15px; background: #eee; border-radius: 5px; width: 600px;">
			<p>@${dto.rnbwriter }&nbsp;</p> 
		</div>
		<input type="submit" value="입력" />
	</form>
	</c:forEach>
</body>
</html>