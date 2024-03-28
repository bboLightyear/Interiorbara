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

<h3>bizRvModDelView.jsp</h3>
<br />

<form action="bizRvReport" method="post">
<input type="hidden" name="br_no" value="${bizRvContentView.br_no }" />  <!-- 딱히 방법 없을 때 숨겨서 가져오는 법 -->
<input type="hidden" name="user_idno" value="${bizRvContentView.user_idno }" />  <!-- 딱히 방법 없을 때 숨겨서 가져오는 법 -->
<!-- <input type="hidden" name="memno" value="session.user_idno" size="20" /> -->
	<table>
		<tr>
			<td class="">신고할 리뷰 번호</td>
			<td>${bizRvContentView.br_no }</td>
		</tr>
			<td class="">신고대상</td>
			<td>
			${bizRvContentView.br_writer }	
			</td>
		</tr>		
		<tr>
			<td class="">신고사유</td>
			<td>
				<textarea name="cause" id="cause" cols="35" rows="5">
					신고 사유를 입력해 주세요. 허위 신고 시, 불이익이 주어질 수 있습니다.
				</textarea>
			</td>
		</tr>
		<tr><td colspan="2"><input type="submit" value="신고하기" /> &nbsp; &nbsp;</td></tr>		
	</table>
</form>
<a href="bizRvList">목록으로 돌아가기</a> <br />

</body>
</html>