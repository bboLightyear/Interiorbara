<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비회원 견적 조회</title>
</head>
<body>
    <form action="nonmemberEstimateSearch" method="post">
        <label for="estino">비회원 견적조회</label> <br />
        <input type="text" id="estino" name="estino" placeholder="견적예약번호를 입력해주세요" />
        <input type="submit" value="확인" />
    </form>
    <form action="nonmemberOrderSearch" method="post">
    	<label for="orderno">비회원 주문조회</label> <br />
    	<input type="text" id="orderno" name="orderno" placeholder="주문번호를 입력해주세요" />
    	<input type="submit" value="확인" /> 
    </form>

</body>
</html>

