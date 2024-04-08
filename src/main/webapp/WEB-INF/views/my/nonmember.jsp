<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비회원 견적 조회</title>
    <style>
    label{
    	display:inline-block;
		padding: 10px;
		width: 80px;
		height: 20px;
		margin: 10px;
	}
	input{
		padding:10px;
		margin: 10px;
	}
	#btn{
	   	padding: 10px;
	   	width: 380px;
	   	background-color: #e2f0fe;
	}
	#btn:hover{
		background-color: #1e90ff;
		cursor: pointer;
	} 
	h3{
		margin-top: 30px;
	}
	
    </style>
</head>
<body>
    <form action="nonmemberEstimateSearch" method="post">
    	<div align="center">
    		<h3>비회원 견적조회</h3>
	        <label for="estino">견적번호</label>       
	        <input type="text" id="estino" name="estino" size="35" placeholder="견적예약번호를 입력해주세요" /><br />
	        <label for="phone">휴대폰번호</label>
	        <input type="text" id="phone" name="phone" size="35" placeholder="휴대폰번호를 입력해주세요" pattern="^(010)-?[0-9]{3,4}-?[0-9]{4}$" title="휴대폰번호를 입력해주세요"/><br />
	        <input type="submit" id="btn" value="확인" />
    	</div>
    </form>
    <!-- <form action="nonmemberOrderSearch" method="post">
    	<label for="orderno">비회원 주문조회</label> <br />
    	<input type="text" id="orderno" name="orderno" placeholder="주문번호를 입력해주세요" />
    	<input type="submit" value="확인" /> 
    </form> -->
<h2 align="center">견적번호랑 폰번호 말고 폰번호랑 비밀번호로 조회는 어떤지?????</h2>
</body>
</html>

