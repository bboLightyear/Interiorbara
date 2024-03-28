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
<body>

<script>
	function redeptlist(target) {
		alert(target.value+"점입니다.")
		$('input[name=br_point]').attr('value', target.value);
	}

</script>


<h3>bizRvWriteView.jsp</h3>

	<div id="data"></div>
    <span class="star">
        ★★★★★
        <span id="star2">★★★★★</span>
        <input type="range" onclick="redeptlist(this);"  oninput="drawStar(this)" value="1" step="1" min="0" max="10">
      </span>    
<form action="bizRvWrite" method="post" enctype="multipart/form-data">
<input type="hidden" name="user_idno" value="1000<%-- ${sessionUser_Idno } --%>" />
<input type="hidden" name="biz_idno" value="1<%-- ${sessionUser_Idno } --%>" />
<input type="hidden" name="br_point" value="" size="20" />
	<table>
		<tr>
			<td class="">이름</td>
			<td><input type="text" name="br_writer" value="닉네임" /><%-- ${sessionNickname } --%></td>
		</tr>
		<tr>
			<td class="">내용</td>
			<td><textarea type="text" name="br_content" rows="5" cols="35">내용을 입력해 주세요.</textarea></td>
		</tr>
		<tr>
			<td class="">첨부</td>
			<td><input type="file" name="file" multiple="multiple"/></td>
		</tr>		
		<tr>
			<td colspan="2">
				<input type="submit" value="입력" />
				<a href="list">목록</a>
			</td>
			
		</tr>			
	</table>
</form>


</body>
</html>