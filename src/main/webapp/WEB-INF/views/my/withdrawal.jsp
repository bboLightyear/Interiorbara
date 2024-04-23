<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
<script>
	document.title = "Withdrawal Demand";
</script>
<main class="Site-content">
<div class="withdrawal_area">
	<div class="withdrawal_textarea classtable">
	<h3>탈퇴하기</h3>
		<pre class="withdrawal_clause classtable">
		
	회원탈퇴 신청시 평일 2일이 지난 후 탈퇴회원으로 변경됩니다.
	탈퇴 신청을 취소하시려면 탈퇴신청 후 2일 안에 취소해주세요. 
	업체등록회원은 탈퇴됨과 동시에 업체회원 자격이 상실됩니다.
	원래 계정을 복구하시려면 관리자에게 문의 해 주세요.
	복구요청이 승인되어도 일반회원으로 재가입되고 
	탈퇴 후 복구된 회원님이 다시 업체등록을 하시려면
	증빙서류를 첨부하시고 관리자에게 문의해주세요.
		</pre>
	</div>	
	<div class="withdrawal_form classtable">
	<form action="demandwithdrawal" method="post">
		<p class="m0"><h3>${loginUserDto.nickname}님</h3></p> <br />
		<p class="m0">탈퇴하려는 이유가 무엇인가요?(하나만 선택해주세요)</p> <br />
		<input type="radio" name="withdrawalCheck" class="radio_align" value="이용빈도 낮음" />이용빈도 낮음 <br />
		<input type="radio" name="withdrawalCheck" class="radio_align" value="재가입" />재가입 <br />
		<input type="radio" name="withdrawalCheck" class="radio_align" value="콘텐트/제품정보/상품 부족" />콘텐트/제품정보/상품 부족 <br />
		<input type="radio" name="withdrawalCheck" class="radio_align" value="개인정보보호" />개인정보보호 <br />
		<input type="radio" name="withdrawalCheck" class="radio_align" value="회원특혜/쇼핑혜택 부족" />회원특혜/쇼핑혜택 부족 <br />
		<input type="radio" name="withdrawalCheck" class="radio_align" value="기타" />기타 <br />
		<input class="withdrawal_btn mt30 radius10" type="submit" value="탈퇴신청" /> 
		<a class="withdrawal_btn textcenter radius10" href="cancelwithdrawal?memno=${loginUserDto.memno}">취소하기</a>
		<input type="hidden" name="memno" value="${loginUserDto.memno}" />
		<input type="hidden" name="memtype" value="${loginUserDto.memtype}" />
	</form>
	<span class="returnmsg mt10"><c:out value="${msg }" default=""/></span>
	
	</div>

	
</div>	
</main>
<%@include file ="footer.jsp" %>