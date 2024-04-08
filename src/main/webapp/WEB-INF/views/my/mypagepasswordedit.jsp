<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link rel="stylesheet" href="${path}/resources/css/my/mypageinfoedit.css" />
	<script defer src="${path}/resources/js/my/jquery-3.7.1.min.js"></script>
	<script defer src="${path}/resources/js/my/mypagepasswordedit.js"></script>
	<script defer src="${path}/resources/js/my/my_script_pwd.js"></script> 
	<style>
		body{
			text-align: center;
		}
		table {
			text-align: left;
			margin-top: 30px; 
		}
		th,td {
			line-height: 2.5em;
		}
		label{
			padding: 5px;
		}
		#btn{
	    	padding: 10px;
	    	width: 405px;
	    	background-color: #e2f0fe;
	    }
	    #btn:hover{
			background-color: #1e90ff;
			cursor: pointer;
		}
		.password{
			position: relative;
		}
		.password i{
			cursor:pointer;
			position: absolute;
			left: 90%;
			top: 14px;
		}
		.password i:hover{
			color: #b1b8c0;
		}
	</style>
</head>
<body>
<h3>mypagepasswordedit.jsp</h3>
	<div class="mypage_category">
        <div class="mypage_category_list list_1"><a href="mypage">프로필</a></div>
	    <div class="mypage_category_list list_2">나의쇼핑</div>
	    <div class="mypage_category_list list_3"><a href="mypagecompanysignup">업체신청</a></div> <br>
    </div>
    <div class="mypage_category">
        <div class="mypage_category_list list_1_1"><a href="mypage">모두보기</a></div>
	    <div class="mypage_category_list list_1_2">내사진</div>
        <div class="mypage_category_list list_1_3">내동영상</div>
        <div class="mypage_category_list list_1_4"><a href="mypageinfoedit">회원정보수정</a></div>
        <div class="mypage_category_list list_1_5">비밀번호변경</div>
    </div>
    <div id="pwForm">
    <form action="passedit" id="passedit" method="post">
		<input type="hidden" name="nickname" id="nickname" value="${loginUserDto.nickname}" />
		<input type="hidden" name="mypwd" id="mypwd" value="${mypwd }" />
	    <table align="center">
		    <tr>
		    	<th>
		    		<label for="inputpwd">현재비밀번호</label>		    	
		    	</th>
		    </tr>
		    <tr>
		    	<td class="password">
		    		<input type="password" name="inputpwd" id="inputpwd" style="padding:10px;" size="50" required />
	        		<span id="toggleMyPwd"><i class="fa-solid fa-eye"></i></span><br />
	        		<span id="pwdMatchResule"></span>		    	
		    	</td>
		    </tr>
		    <tr>
		    	<th>
		    		<label for="pw1">새 비밀번호</label>	
		    	</th>
		    </tr>
		    <tr>
		    	<td class="password">
		    		<input type="password" name="pw1" id="pw1" style="padding:10px;" size="50" required />
			        <span id="togglePwd1"><i class="fa-solid fa-eye"></i></span> <br />
			        <span id="pw1Result"></span>
		    		
		    	</td>
		    </tr>
		    <tr>
		    	<th>
		    		<label for="pw2">새 비밀번호 확인</label>	
		    	</th>
		    </tr>
		    <tr>
		    	<td class="password">
		    		<input type="password" name="pw2" id="pw2" style="padding:10px;" size="50" required />
	        		<span id="togglePwd2"><i class="fa-solid fa-eye"></i></span> <br />
	        		<span id="pw2Result"></span>		    		
		    	</td>
		    </tr>
		    <tr>
		    	<td>
		    		<input id="btn" type="submit" value="확인" /><br />	
		    	</td>
		    </tr>
	    </table>
	    <c:out value="${msg }" default="" />
    </form>	   
    </div>    

</body>
</html>