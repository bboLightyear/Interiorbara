<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.clause{
	width: 50%;
	background-color: lightgray;
}
a{
	text-decoration: none;
	color: black;
}
</style>
</head>
<body>
<h3>탈퇴하기</h3>
	<div class="clause">
		<pre>
		회원탈퇴 신청시 1~2일 후 탈퇴회원으로 변경됩니다. 
		업체등록회원은 탈퇴됨과 동시에 업체회원 자격이 상실됩니다. 
		복구를 요청하셔도 일반회원으로 재가입되므로 다시 업체등록을 해주셔야 합니다.		
		</pre>
	</div>	
	<form action="demandwithdrawal" method="post">
		<span>${loginUserDto.nickname }님</span> <br />
		<span>탈퇴하려는 이유가 무엇인가요?(하나만 선택해주세요)</span> <br />
		<input type="radio" name="withdrawalCheck" value="이용빈도 낮음" />이용빈도 낮음 <br />
		<input type="radio" name="withdrawalCheck" value="재가입" />재가입 <br />
		<input type="radio" name="withdrawalCheck" value="콘텐트/제품정보/상품 부족" />콘텐트/제품정보/상품 부족 <br />
		<input type="radio" name="withdrawalCheck" value="개인정보보호" />개인정보보호 <br />
		<input type="radio" name="withdrawalCheck" value="회원특혜/쇼핑혜택 부족" />회원특혜/쇼핑혜택 부족 <br />
		<input type="radio" name="withdrawalCheck" value="기타" />기타 <br />
		<input type="submit" value="탈퇴신청" /> <button><a href="mypagemain">취소하기</a></button>
		<input type="hidden" name="memno" value="${loginUserDto.memno} " />
		<input type="hidden" name="memtype" value="${loginUserDto.memtype }" />
	</form>
	<c:out value="${msg }" default=""/>	

</body>
</html>