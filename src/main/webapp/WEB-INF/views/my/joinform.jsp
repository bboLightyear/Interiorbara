<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
<script defer src="${path}/resources/js/my/my_script_pwd.js"></script>
<script defer src="${path}/resources/js/my/my_script_nickname.js"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script>
	document.title = "회원가입";
</script>

<main class="Site-content textcenter">
	<h3>회원가입</h3>
	<form id="myjoin" action="join" method="post">
		<table class="classtable" align="center">
			<tr>
				<th class="classth" id="line1"><label for="user_email">이메일</label></th>
			</tr>
			<tr>
				<td class="classtd"><input class="radius10" type="text" id="user_email" name="user_email"
					style="padding: 10px;" size="20" required> <span
					id="middle">@</span> <input class="radius10" type="text" id="email_address"
					name="email_address" style="padding: 10px;" size="19"
					list="user_email_address"> <datalist
						id="user_email_address">
						<option value="naver.com"></option>
						<option value="gmail.com"></option>
						<option value="직접입력"></option>
					</datalist></td>
			</tr>
			<tr>
				<th class="classth"><label for="pw1">비밀번호</label></th>
			</tr>
			<tr>
				<td class="classtd password"><input class="radius10" type="password" id="pw1" name="pw1"
					style="padding: 10px;" size="50" placeholder="영문숫자특수문자를 포함한 8자리 이상"
					required> <span id="togglePwd1"><i
						class="fa-solid fa-eye"></i></span> <br /> <span id="pw1Result" class="fontbold"></span>
				</td>
			</tr>
			<tr>
				<th class="classth"><label for="pw2">비밀번호확인</label></th>
			</tr>
			<tr>
				<td class="classtd password"><input class="radius10" type="password" id="pw2" name="pw2"
					style="padding: 10px;" size="50" required> <span
					id="togglePwd2"><i class="fa-solid fa-eye"></i></span> <br /> <span
					id="pw2Result" class="fontbold"></span></td>
			</tr>
			<tr>
				<th class="classth"><label for="nickname">닉네임</label></th>
			</tr>
			<tr>
				<td class="classtd"><input class="radius10" type="text" id="nickname" name="nickname"
					style="padding: 10px;" size="50" placeholder="2~15자 사이의 한글영문숫자"
					required> <br /> <span id="nicknameResult" class="fontbold"></span></td>
			</tr>
			<tr>
				<td class="classtd"><input class="radius10" type="submit" id="btnstyle" value="회원가입"></td>
			</tr>
		</table>
	</form>
	<span class="returnmsg"><c:out value="${joinmsg }" default="" /></span><br />
	<span class="fs12px">이미 아이디가 있으신가요?&nbsp;&nbsp;&nbsp;&nbsp;<a href="${path}/my/loginform"><b>로그인</b></a></span>
</main>
<%@include file ="footer.jsp" %>
