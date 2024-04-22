<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
<script>
	document.title = "메일인증 완료";
</script>

<script>
window.onload = function (){
	alert("메일 인증이 완료되었습니다.");
}
</script>
<main class="Site-content textcenter">
<img class="mt30" src="${path}/resources/img/my/3.png" alt="" /> <br /><br />
<h3><a class="aaa mt30" href="${path}/my/loginform">로그인하러가기</a></h3>
</main>
<%@include file ="footer.jsp" %>