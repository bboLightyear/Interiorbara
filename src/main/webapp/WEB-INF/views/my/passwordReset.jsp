<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
<script>
	document.title = "Email Check Password Edit";
</script>
<script defer src="${path}/resources/js/my/my_script_pwd.js"></script>
<main class="Site-content textcenter">
<h3 class="mt30">가입한 이메일 주소를 입력해주세요</h3>
	<form action="passReset" id="resetForm" method="post">
		<div align="center">
			<input class="radius10" type="email" id="email" name="email" style="padding:10px;" size="35" placeholder="email address" required />	
			<input class="radius10" id="smbtn" type="submit" value="이메일인증하기" style="padding:10px;" />
		</div>
	</form>
	<br/>
	<span class="returnmsg"><c:out value="${msg}" default=""/></span>
	<br/>
	<c:if test="${nickname !=null }">
	<form action="passeditMC" id="passeditMC" method="post">
		<input type="hidden" name="nickname" id="nickname" value="${nickname}" />
		<table align="center" class="classtable">
		
			<tr>
				<th><h3>${nickname }님 변경하실 비밀번호를 입력해주세요</h3></th>
			</tr>			
			<tr>
				<th>
					<label class="pd8" for="pw1">새 비밀번호</label>	
				</th>
			</tr>
			<tr>
				<td class="password">
					<input class="radius10" type="password" name="pw1" id="pw1" style="padding:10px;" size="50" required />
	        		<span id="togglePwd1"><i class="fa-solid fa-eye"></i></span> <br />
	        		<span id="pw1Result" class="fontbold"></p>					
				</td>
			</tr>
			<tr>
				<th>
					<label class="pd8" for="pw2">새 비밀번호 확인</label>	
				</th>
			</tr>
			<tr>
				<td class="password">
					<input class="radius10" type="password" name="pw2" id="pw2" style="padding:10px;" size="50" required />
	        		<span id="togglePwd2"><i class="fa-solid fa-eye"></i></span> <br />
	        		<span id="pw2Result" class="fontbold"></span>
				
				</td>
			</tr>
			<tr>
				<td><input class="radius10" id="btn" type="submit" value="확인" /></td>
			</tr>
		</table>
    </form>	    
    </c:if>
</main>
<%@include file ="footer.jsp" %>