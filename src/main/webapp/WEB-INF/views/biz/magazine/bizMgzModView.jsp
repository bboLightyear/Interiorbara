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

<form action="bizMgzMod" method="post">
<input type="hidden" name="bm_no" value="${bizMgzContentView.bm_no }" />  <!-- 딱히 방법 없을 때 숨겨서 가져오는 법 -->
	<table>
		<tr>
			<td class="">번호</td>
			<td>${bizMgzContentView.bm_no }</td>
		</tr>
		<tr>
			<td class="">히트</td>
			<td>${bizMgzContentView.bm_hit }</td>
		</tr>		
		<tr>
			<td class="">이름</td>
			<td>
			${bizMgzContentView.bm_writer }	
			</td>
		</tr>		
		<tr>
			<td class="">제목</td>
			<td>
			<input type="text" name="bm_title" value="${bizMgzContentView.bm_title }"  />	
			</td>
		</tr>		
		<tr>
			<td class="">내용</td>
			<td>
				<textarea name="bm_content" id="bm_content" cols="35" rows="5">
					${bizMgzContentView.bm_content }
				</textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="modify" /> &nbsp; &nbsp;
				<a href="bizMgzList">목록으로</a>
			</td>
		</tr>		
	</table>
</form>


</body>
</html>