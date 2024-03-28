<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>	
	<link rel="stylesheet" href="${path }/resources/js/bizStyle.css" />
	<script src="${path }/resources/js/bizScriptjsp.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body onload="callpoint();">

<script>
	function callpoint() {
		$('#star2').css('width','${bizRvContentView.br_point*10}%');
	}

	function dbpoint(target) { 
		alert("target:"+target.value)
		$('input[name=br_point]').attr('value', target.value);
	}
	
	function staypoint() {
		$('${bizRvContentView.br_point}').attr('value', target.value);
	}

</script>


<h3>bizRvModDelView.jsp</h3>
<br />

<form action="bizRvMod" method="post">
<input type="hidden" name="br_no" value="${bizRvContentView.br_no }" />  <!-- 딱히 방법 없을 때 숨겨서 가져오는 법 -->
<input type="hidden" name="br_point" value="" size="20" />
<input type="hidden" name="orgPoint" value="${bizRvContentView.br_point}" size="20" />
	<table>
		<tr>
			<td class="">별점</td>
			
			<td>
				<div id="data"></div>
			    <span class="star">
			        ★★★★★
			        <span id="star2">★★★★★</span>
			        <input type="range" onclick="dbpoint(this);"  oninput="drawStar(this)" value="1" step="1" min="0" max="10">
			    </span>    
			</td>
		</tr>		
		<tr>
		<tr>
			<td class="">번호</td>
			<td>${bizRvContentView.br_no }</td>
		</tr>
			<td class="">이름</td>
			<td>
			${bizRvContentView.br_writer }	
			</td>
		</tr>		
		<tr>
			<td class="">내용</td>
			<td>
				<textarea name="br_content" id="br_content" cols="35" rows="5">
					${bizRvContentView.br_content }
				</textarea>
			</td>
		</tr>
		<tr><td colspan="2"><input type="submit" value="수정" /> &nbsp; &nbsp;</td></tr>		
	</table>
</form>
<a href="bizRvList">목록으로 돌아가기</a> <br />
<a href="bizRvDel?br_no=${bizRvContentView.br_no }">삭제</a> <br />

</body>
</html>