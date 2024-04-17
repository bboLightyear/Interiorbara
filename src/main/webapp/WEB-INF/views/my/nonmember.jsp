<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
<script>
	document.title = "내 견적 조회";
</script>
<main class="Site-content">
   <div>
      <form action="${path}/modal/mBoard" method="post">
         <div align="center">
            <h3 class="mt30">내 견적조회</h3>
            <label class="nonmemberlabel" for="email">이메일</label>
            <input class="nonmemberinput" type="email" id="email" name="email" size="35" placeholder="이메일을 입력해주세요" /><br /> 
            <label class="nonmemberlabel" for="pw">비밀번호</label>
            <input class="nonmemberinput" type="password" id="pw" name="pw" size="35" placeholder="비밀번호를 입력해주세요" title="비밀번호를 입력해주세요" /><br />
            <input class="nonmemberinput" type="submit" id="nonmemberbtn" value="확인" />
         </div>
      </form>
      <c:if test="${not empty error}">
         <p style="color: red;">${error}</p>
      </c:if>
   </div>
</main>
<%@include file ="footer.jsp" %>