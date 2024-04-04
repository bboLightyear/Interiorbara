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
	<h3>qna edit view</h3>


	<form action="qnaeditproc" method="post" enctype="multipart/form-data">
		<input type="hidden" name="qbno" value="${qna_content.qbno }" />
		<table>
			<tr>
				<td class="left">번호</td>
				<td>${qna_content.qbno }</td>
			</tr>
			<tr>
				<td class="left">조회수</td>
				<td>${qna_content.qbhit }</td>
			</tr>
			<tr>
				<td class="left">작성자</td>
				<td>${qna_content.qbwriter }</td>
			</tr>
			<tr>
				<td class="left">글분류</td>
				<td>
				<select name="qnadiv">
					<option value="all" ${qna_content.qbqnadiv eq 'all' ? 'selected' : '' }>전체</option>
					<option value="qq" ${qna_content.qbqnadiv eq 'qq' ? 'selected' : '' }>퀵견적</option>
					<option value="oh" ${qna_content.qbqnadiv eq 'all' ? 'selected' : '' }>우리집 자랑하기</option>
					<option value="biz" ${qna_content.qbqnadiv eq 'all' ? 'selected' : '' }>업체 관련</option>
					<option value="pf" ${qna_content.qbqnadiv eq 'all' ? 'selected' : '' }>로그인/회원정보</option>
					<option value="sh" ${qna_content.qbqnadiv eq 'all' ? 'selected' : '' }>소품샵</option>
				</select>
				</td>
			</tr>
			<tr>
				<td class="left">제목</td>
				<td><input type="text" name="qbtitle"
					value="${qna_content.qbtitle }" /></td>
			</tr>
			<tr>
				<td class="left">내용</td>
				<td><textarea rows="6" name="qbcontent" cols="60">${qna_content.qbcontent }</textarea></td>
			</tr>
			<tr>
				<td class="left">날짜</td>
				<td>${qna_content.qbdate }</td>
			</tr>
			<tr>
				<td class="left">파일</td>
				<td><input type="file" name="qbfile" multiple="multiple"/></td>
			</tr>
			<tr>
				<td><input type="submit" value="수정" /></td>
			</tr>
		</table>
	</form>

</body>
</html>