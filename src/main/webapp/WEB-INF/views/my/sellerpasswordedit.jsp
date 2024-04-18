<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file ="header.jsp" %>
<script>
document.title = "비밀번호 변경";
</script>
<script defer src="${path}/resources/js/my/jquery-3.7.1.min.js"></script>
<script defer src="${path}/resources/js/my/mypagepasswordedit.js"></script>
<script defer src="${path}/resources/js/my/my_script_pwd.js"></script>
<main class="Site-content" style="margin-top:10px;">

    <div class="mypage_category">
        <div class="mypage_category_list list_1_1"><a href="mypage">프로필</a></div>
	    <div class="mypage_category_list list_1_2"><a href="sellerinfoedit">회원정보수정</a></div>
        <div class="mypage_category_list list_1_3 pointcolor">비밀번호변경</div>
    </div>
    <div id="pwForm" align="center">
    <h3>비밀번호 변경하기</h3>
    <form action="sellerpassedit" id="passedit" method="post">
		<input type="hidden" name="nickname" id="nickname" value="${loginUserDto.nickname}" />
	    <table align="center" class="classtable mt30">
		    <tr>
		    	<th class="lh2">
		    		<label class="pd8" for="inputpwd">현재비밀번호</label>
		    	</th>
		    </tr>
		    <tr>
		    	<td class="password lh2">
		    		<input class="radius10" type="password" name="inputpwd" id="inputpwd" style="padding:10px;" size="50" required />
	        		<span id="toggleMyPwd"><i class="fa-solid fa-eye"></i></span><br />
	        		<span id="pwdMatchResule" class="fontbold"></span>		    	
		    	</td>
		    </tr>
		    <tr>
		    	<th class="lh2">
		    		<label class="pd8" for="pw1">새 비밀번호</label>
		    	</th>
		    </tr>
		    <tr>
		    	<td class="password lh2">
		    		<input class="radius10" type="password" name="pw1" id="pw1" style="padding:10px;" size="50" required />
			        <span id="togglePwd1"><i class="fa-solid fa-eye"></i></span> <br />
			        <span id="pw1Result" class="fontbold"></span>
		    		
		    	</td>
		    </tr>
		    <tr>
		    	<th class="lh2">
		    		<label class="pd8" for="pw2">새 비밀번호 확인</label>	
		    	</th>
		    </tr>
		    <tr>
		    	<td class="password lh2">
		    		<input class="radius10" type="password" name="pw2" id="pw2" style="padding:10px;" size="50" required />
	        		<span id="togglePwd2"><i class="fa-solid fa-eye"></i></span> <br />
	        		<span id="pw2Result" class="fontbold"></span>		    		
		    	</td>
		    </tr>
		    <tr>
		    	<td class="lh2">
		    		<input class="radius10" id="btn" type="submit" value="확인" /><br />	
		    	</td>
		    </tr>
	    </table>
	    <span class="returnmsg"><c:out value="${msg }" default="" /></span>
    </form>	   
    </div>    
</main>
<%@include file ="footer.jsp" %>