<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>	
	<link rel="stylesheet" href="${path }/resources/js/biz/bizStyle.css" />
	<script src="${path }/resources/js/biz/bizScriptjsp.js"></script>
<meta charset="UTF-8">
<title>시공리뷰 수정/삭제</title>
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
		    	if(${loginUserDto.memno ne bizRvContentView.memno}){
		    		alert('작성자 외에는 수정이 불가능합니다. 이전 페이지로 돌아갑니다.');
		    		window.location.href = "bizRvContentView?br_no=${bizRvContentView.br_no }";	
		    	}
		    	console.log('로그인유저와 작성자의 memno가 일치합니다.');
		    }
		    // memno가 있으면 해당 JSP 문서를 로드
		    console.log('문서를 로드합니다.');
		});
		
		function callpoint() {
			$('#star2').css('width','${bizRvContentView.br_point*20}%');
		}

		function dbpoint(target) { 
			$('input[name=br_point]').attr('value', target.value);
		}
		
		function staypoint() {
			$('${bizRvContentView.br_point}').attr('value', target.value);
		}
		
	    function confirmDelete(br_no, inteno) {
	        var confirmation = confirm("정말로 삭제하시겠습니까?");
	        if (confirmation) {
	            alert("해당 게시물이 삭제되었습니다.");
	            location.href='bizRvDel?br_no=' + br_no+'&inteno='+inteno;
	        } else {
	            // 사용자가 취소를 클릭한 경우 아무 작업도 수행하지 않음
	        }
	    }
	</script>		
	
</head>
<body onload="callpoint();">
<main class="Site-content">
	<div class="pt-3 bg-light bg-opacity-75">
	<div class="d-flex justify-content-center">
		<div class="p-3" style="width: 750px" >
					<ul class="list-inline">
						<li class="list-inline-item">
							<h4 style="--bs-text-opacity: 1; background-color: #1034a6; padding: 3px; !important;">
						    	<strong style="color: white;">시공리뷰</strong>
						   	</h4>
						</li>
						<li class="list-inline-item">
								<small class="text-body-secondary">생생한 실제 이용 후기를 들려주시겠어요?</small>
						</li>
					</ul>	
		</div>
		<div class="d-flex align-items-end mb-5">
			<div onclick="location.href='bizRvContentView?br_no=${bizRvContentView.br_no }'">
				<span class="text-body-secondary" style="font-size: 12px; cursor:pointer;">뒤로 가기 <i class="fa-solid fa-rotate-left" style="cursor:pointer;"></i></span>
			</div>
		</div>
	</div>
		<div class="text-primary text-opacity-25">
			<hr />
		</div>
	</div>

	<form action="bizRvMod" method="post">
	<input type="hidden" name="br_no" value="${bizRvContentView.br_no }" />
	<input type="hidden" name="inteno" value="${bizRvContentView.inteno }" />
	<input type="hidden" name="br_point" value="" size="20" />
	<input type="hidden" name="orgPoint" value="${bizRvContentView.br_point}" size="20" />
	<div class="d-flex justify-content-center">
		<div class="p-3 pt-0 mt-0" style="width: 750px">
			<table class="table" style="width: 100%; max-width: 750px">
				<tr>
					<th scope="row" class="table-light border-light-subtle align-middle">별점</th>
						<td>
							<div id="data"></div>
					    	<span class="star">★★★★★
					        	<span id="star2">★★★★★</span>
					        	<input type="range" onclick="dbpoint(this);" oninput="drawStar(this)" value="0.5" step="0.5" min="0" max="5">
					      	</span>
					     </td> 	
	      		</tr>
				<tr>
				    <th scope="row" class="table-light border-light-subtle">이름</th>
					<td colspan="3">
						<input type="text" name="br_writer" value="${loginUserDto.nickname }" disabled />
					</td>
				</tr>
				<tr>
				    <th scope="row" class="table-light border-light-subtle">내용</th>
					<td colspan="3">
						<textarea class="form-control" name="br_content" id="br_content" rows="10"">${bizRvContentView.br_content }</textarea>
					</td>
				</tr>
<!-- 				<tr>
					<th scope="row" class="table-light border-light-subtle">첨부</th>
					<td colspan="3">
						<input type="file" name="file" multiple="multiple"/>
					</td>
				</tr>	 -->
			</table>

		<div class="d-flex justify-content-evenly">
			<div class="d-flex justify-content-center" style="width: 750px;">
				<div class="d-flex align-items-start" style="width: 40%; max-width: 300px;">
					<c:choose>
						<c:when test="${loginUserDto.memno eq bizRvContentView.memno}">
							<button class="ms-1 btn btn-outline-primary btn-sm w-10" onclick="confirmDelete('${bizRvContentView.br_no }', '${inteno }')"><span style="font-size: 14px;">삭제</span></button>
						</c:when>
						<c:otherwise></c:otherwise>							
					</c:choose>
				</div>
			<div class="d-flex justify-content-end" style="width: 60%; max-width: 450px;">
					<c:choose>
						<c:when test="${loginUserDto.memno eq bizRvContentView.memno}">
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