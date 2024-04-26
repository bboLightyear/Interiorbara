<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
<script defer src="${path}/resources/js/my/my_loginform.js"></script>
<script>
	document.title = "Login";
</script>
<main class="Site-content textcenter">
    <form action="login" method="post">
    <input type="hidden" name="ref" id="ref" value="${ref}" />
    	<table align="center" class="classtable" style="margin-top:50px;">
    		<tr>
    			<td class="tdheight">
    				<input class="radius10" type="text" name="email" style="padding:10px;" size="50" placeholder="이메일" required>
    			</td>
    		</tr>
    		<tr>
    			<td class="password tdheight">
    				<input class="radius10" type="password" name="pw" id="pw" style="padding:10px;" size="50" placeholder="비밀번호" required>
    				<span id="togglePwd"><i class="fa-solid fa-eye"></i></span>	<br />
    				<span id="pwResult" class="fontbold"></span><br />
    			</td>
    		</tr>
    		<tr>
    			<td class="tdheight">
    				<input class="radius10" id="btn" type="submit" value="로그인">
    			</td>
    		</tr>
    	</table>
    </form>
    <span class="returnmsg"><c:out value="${msg}" default="" /></span><br />
    <span class="fs12px"><a href="passwordReset"><b>비밀번호재설정&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="joinform">회원가입</a></span><br />
    <span class="fs12px"><a href="nonmember">내 견적 조회하기</b></a></span>
</main>
<%@include file ="footer.jsp" %>