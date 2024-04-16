<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file ="header.jsp" %>
<script>
document.title = "업체신청";
</script>
<script defer src="${path }/resources/js/my/mypagecompanysignup.js"></script>
<main class="Site-content" style="margin-top:10px;">
	<div class="mypage_category">
        <div class="mypage_category_list list_1"><a href="mypage">프로필</a></div>
	    <!-- <div class="mypage_category_list list_2"><a href="myshopping">나의쇼핑</a></div> -->
	    <div class="mypage_category_list list_3"><a href="#">업체신청</a></div> <br>
    </div>
    
    <form action="signUp" method="post" align="center">
    <input type="hidden" name="memno" id="memno" value="${loginUserDto.memno}" />
    <input type="hidden" name="memtype" id="memtype" value="${loginUserDto.memtype}"/>
    <input type="hidden" name="nickname" id="nickname" value="${loginUserDto.nickname}"/>
    	<span class="returnmsg"><c:out value="${errorMsg}" default="" /></span>
    	<h3>인테리어업체 신청하기</h3>
    	<label class="signuplabel" for="interior">사업자등록번호 </label>
    	<input type="text" name="interior" id="interior" style="padding:10px;" size="35" placeholder="10자리 숫자만 입력해주세요" oninput="oninputNum(this)"/>
    	<button class="signupbutton">신청</button> <br />
    	<span id="interiorResult" class="fontbold"></span> <br />
    	<span class="returnmsg"><c:out value="${inteResultMsg}" default="" /></span>
    	<br /><br />   	
    	<h3>판매업체 신청하기</h3>
    	<label class="signuplabel" for="seller">사업자등록번호</label>
    	<input type="text" name="seller" id="seller" style="padding:10px;" size="35" placeholder="10자리 숫자만 입력해주세요" oninput="oninputNum(this)" />
    	<button class="signupbutton">신청</button> <br />
    	<span id="sellerResult" class="fontbold"></span> <br />
    	<span class="returnmsg"><c:out value="${sellerResultMsg}" default="" /></span>    	 
    </form>
    </main>
<%@include file ="footer.jsp" %>