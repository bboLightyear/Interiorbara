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
<h3>bizCasesDelView.jsp</h3>
<br />
<h3><span style="color: orange">${bizCasesDelView.bc_title }</span> 글을 삭제하시겠습니까?</h3>
<a href="bizCasesDel?bc_no=${bizCasesDelView.bc_no }">${bizCasesDelView.bc_no }번글 삭제</a> <br />
<a href="bizCasesList">목록으로 돌아가기</a> <br />

</body>
</html>