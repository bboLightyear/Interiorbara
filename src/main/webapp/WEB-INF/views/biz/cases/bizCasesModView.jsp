<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시공사례 수정</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@5.3.3/dist/zephyr/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<%@include file ="../bizHeader.jsp" %>
<link rel="stylesheet" href="${path}/resources/css/biz/biz.css"/>
<link  rel="stylesheet"
  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>
  	<style>
	 .fa-solid{
	 	color: #1a1f27;
	 }
	 .fa-solid:hover{
	 	color: #1e90ff;
	 } 
	 
	 th{
	 	width: 20%;
	 }
	 
	 th, .center{
    	text-align: center;	 
	 }
	 a {
	   text-decoration: none;
	   color: #1a1f27;
	}
	body {
		display: flex;
		min-height: 100vh;
		flex-direction: column;
	}	
	</style>
	<script>
		$(document).ready(function() {
		    // memno가 없으면 로그인 페이지로 리디렉트
		    if (${loginUserDto.memno eq null}) {
		    	alert('로그인 시 이용 가능합니다. 로그인 페이지로 이동합니다.');
		        window.location.href = "../../my/loginform"; // 로그인 페이지로 이동
		    }else{
		    	if(${loginUserDto.myinteriordto.inteno ne bizCasesContentView.inteno}){
		    		alert('작성자 외에는 수정이 불가능합니다. 이전 페이지로 돌아갑니다.');
		    		window.location.href = "bizCasesContentView?bc_no=${bizCasesContentView.bc_no }";	
		    	}
		    	console.log('로그인유저와 작성자의 inteno가 일치합니다.');
		    }
		    // memno가 있으면 해당 JSP 문서를 로드
		    console.log('문서를 로드합니다.');
		});
	</script>		
	
</head>
<body>
<main class="Site-content">
	<div class="pt-3 bg-light bg-opacity-75">
	<div class="d-flex justify-content-center">
		<div class="p-3"  onclick="location.href='bizCasesList?inteno=${bizCasesContentView.inteno}'" style="width: 750px; cursor:pointer;" >
					<ul class="list-inline">
						<li class="list-inline-item">
							<h4 style="--bs-text-opacity: 1; background-color: #1034a6; padding: 3px; !important;">
						    	<strong style="color: white;">시공사례</strong>
						   	</h4>
						</li>
						<li class="list-inline-item">
								<small class="text-body-secondary">어디에나 예시는 필요하니까.</small>
						</li>
					</ul>	
		</div>
		<div class="d-flex align-items-end mb-5">
			<div onclick="location.href='bizCasesContentView?bc_no=${bizCasesContentView.bc_no }'">
				<span class="text-body-secondary" style="font-size: 12px; cursor:pointer;">뒤로 가기 <i class="fa-solid fa-rotate-left" style="cursor:pointer;"></i></span>
			</div>
		</div>
	</div>
		<div class="text-primary text-opacity-25">
			<hr />
		</div>
	</div>


<form action="bizCasesMod" method="post">
<input type="hidden" name="bc_no" value="${bizCasesContentView.bc_no }" />  <!-- 딱히 방법 없을 때 숨겨서 가져오는 법 -->
<input type="hidden" name="inteno" value="${bizCasesContentView.inteno }" />  <!-- 딱히 방법 없을 때 숨겨서 가져오는 법 -->
	<div class="d-flex justify-content-center">
		<div class="p-3" style="width: 750px">
			<table class="table" style="width: 100%; max-width: 750px">
				<tr>
				    <th scope="row" class="table-light border-light-subtle">번호</th>
					<td  style="width:25%">${bizCasesContentView.bc_no }</td>
					<th scope="row"  class="table-light border-light-subtle">HIT</th>
					<td  style="width:25%">${bizCasesContentView.bc_hit }</td>
				</tr>		
				<tr class="">
				      <th scope="row"  class="table-light border-light-subtle">이름</th>
					<td colspan="3" onclick="javascript_:window.open('${path}/my/memberinfopage?nickname=${dto.bc_writer }','pop','menubar=no,status=no,scrollbars=no,resizable=no,width=560,height=700,top=50,left=50');" style="cursor: pointer;">${bizCasesContentView.bc_writer } <i class="fa-solid fa-user" style="font-size: 11px;"></i></td>
				</tr>		
				<tr>
				    <th scope="row" class="table-light border-light-subtle">제목</th>
					<td colspan="3">
						<input class="form-control" type="text" name="bc_title" value="${bizCasesContentView.bc_title }"/>
					</td>
				</tr>		
				<tr>
				    <th scope="row" class="table-light border-light-subtle">내용</th>
					<td colspan="3">
						<textarea class="form-control" name="bc_content" id="bc_content" rows="10">${bizCasesContentView.bc_content }</textarea>
					</td>
				</tr>	
			</table>
			<div class="d-flex justify-content-evenly">
				<div class="d-flex justify-content-center" style="width: 750px;">			
				<div class="d-flex justify-content-end" style="width: 99%; max-width: 750px;">
					<c:choose>
						<c:when test="${loginUserDto.myinteriordto.inteno eq bizCasesContentView.inteno}">
							<input type="submit" value="수정"  class="ms-1 btn btn-outline-primary btn-sm w-10">
						</c:when>
						<c:otherwise></c:otherwise>							
					</c:choose>
				</div>
				</div>
			</div>
		</div>
	</div>
</form>

</main>
</body>
<%@include file ="../bizFooter.jsp" %>
</html>