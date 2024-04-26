<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file ="header.jsp" %>
<script>
document.title = "회원정보수정";
</script>
<script defer src="${path}/resources/js/my/mypage.js"></script>
<script defer src="${path}/resources/js/my/mypagemodify.js"></script>
<script defer src="${path}/resources/js/my/my_script_nickname.js"></script>	

<main class="Site-content" style="margin-top:10px;">
    <div class="mypage_category">
        <div class="mypage_category_list list_1_1"><a href="mypage">프로필</a></div>
	    <div class="mypage_category_list list_1_2"><a href="myphoto">내사진</a></div>
        <div class="mypage_category_list list_1_3"><a href="myscrap">스크랩</a></div>
        <div class="mypage_category_list list_1_4"><a href="mylike">좋아요</a></div>
        <div class="mypage_category_list list_1_5"><a href="mypagecompanysignup">업체신청</a></div>
        <div class="mypage_category_list list_1_6 pointcolor">회원정보수정</div>
        <div class="mypage_category_list list_1_7"><a href="mypagepasswordedit">비밀번호변경</a></div>
    </div>
    
    <div id="mypageedit" align="center">
    	<form action="profile" method="POST" name="myPageFrm" id="profileFrm" enctype="multipart/form-data">
	    	<input type="hidden" name="memno" id="memno" value="${loginUserDto.memno}"/>
	    	<input type="hidden" name="myimg" id="myimg" value="${loginUserDto.profileimg}" />
		    <div class="profile-image-area">
		        <%-- 프로필 이미지가 없으면 기본 이미지 --%>
		        <c:if test="${empty loginUserDto.profileimg}" >
		            <img src="${path}/resources/img/my/user.png" id="profileimg">
		        </c:if>
		        <%-- 프로필 이미지가 있으면 있는 이미지 --%>
		        <c:if test="${!empty loginUserDto.profileimg}" >
		            <img src="${path}/resources/upload/my/${loginUserDto.profileimg}" id="profileimg">
		        </c:if>	
		    </div>
		    <span id="deleteimg"><i class="fa-regular fa-circle-xmark"></i></span>
		    <div class="profile-btn-area">
		        <label class="radius10" style="margin:15px;" for="imgInput">이미지 선택</label>
		        <input type="file" name="profileimg" id="imgInput" accept="image/*">
		        <button class="radius10">변경하기</button>
		    </div>
		</form>
		<form action="modify" id="modify" method="post">
			<input type="hidden" name="memno" id="memno" value="${loginUserDto.memno}"/>
		    <div class="myPage-row">
		        <label>이메일</label>
		        <p><input class="radius10" type="text" name="email" id="email" style="padding:10px;width:220px;" value="${loginUserDto.email}" readonly /></p>	        
		    </div>
		    
		    <div class="myPage-row">
		        <label for="nickname">닉네임<br /></label>
		        <p><input class="radius10" type="text" name="nickname" id="nickname" style="padding:10px;width:220px;" value="${loginUserDto.nickname}" /> <br />
		        <span id="nicknameResult" class="fontbold"></span></p>
		    </div>
		    <div class="myPage-row">
		        <label for="phone">휴대폰번호<br /></label>
		        <p><input class="radius10" type="number" name="phone" id="phone" style="padding:10px;width:220px;" value="${loginUserDto.phone}" /><br />
		        <span id="phoneResult" class="fontbold"></span></p>
		    </div>
		    <div class="myPage-row">
		        <label for="birth">생년월일<br /></label>
		        <p><input class="radius10" type="number" name="birth" id="birth" style="padding:10px;width:220px;" value="${loginUserDto.birth}" /><br />
		        <span id="birthResult" class="fontbold"></span>
		        </p>
		    </div>
		    <div class="myPage-row">
		        <label>성별<br /></label>
		        <p>
		        	<c:choose>
		        		<c:when test="${loginUserDto.gender eq 'm' }">
		        			<input type="radio" name="gender" style="width:23px;" value="m" checked/>남
		        			<input type="radio" name="gender" style="width:23px;" value="fm" />여
			        		<input type="radio" name="gender" style="width:23px;" value="notCheck" />선택하지않음
		        		</c:when>
		        		<c:when test="${loginUserDto.gender eq 'fm' }">
		        			<input type="radio" name="gender" style="width:23px;" value="m" />남
		        			<input type="radio" name="gender" style="width:23px;" value="fm" checked/>여
			        		<input type="radio" name="gender" style="width:23px;" value="notCheck" />선택하지않음
		        		</c:when>
		        		<c:otherwise>
		        			<input type="radio" name="gender" style="width:23px;" value="m" />남
		        			<input type="radio" name="gender" style="width:23px;" value="fm" />여
			        		<input type="radio" name="gender" style="width:23px;" value="notCheck" checked/>선택하지않음	        		
		        		</c:otherwise>        	
		        	</c:choose>		        		        
		        </p>
		    </div>
		    <div class="myPage-row">
		        <a class="XXX" id="withdrawal" href="${path}/my/withdrawal">탈퇴하기 ></a>
		    </div>
		    <div align="center">
		    	<p><input class="radius10" id="btn" type="submit" value="확인" /></p> <br />
		    </div>
	    </form>
	    <span class="returnmsg"><c:out value="${msg }" default="" /></span>
    </div>	    
</main>
<%@include file ="footer.jsp" %>