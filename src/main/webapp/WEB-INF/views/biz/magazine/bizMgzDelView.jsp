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
<h3>bizMgzDelView.jsp</h3>
<br />
<h3><span style="color: orange">${bizMgzDelView.bm_title }</span> 글을 삭제하시겠습니까?</h3>
<a href="bizMgzDel?bm_no=${bizMgzDelView.bm_no }">${bizMgzDelView.bm_no }번글 삭제</a> <br />
<a href="bizMgzList">목록으로 돌아가기</a> <br />

</body>
</html>