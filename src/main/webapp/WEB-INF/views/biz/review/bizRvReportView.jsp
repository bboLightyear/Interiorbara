<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시공리뷰 신고</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@5.3.3/dist/zephyr/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
	</style>
<script>
	$(document).ready(function() {
	    // memno가 없으면 로그인 페이지로 리디렉트
	    if (${loginUserDto.memno eq null}) {
	    	alert('로그인 시 이용 가능합니다. 로그인 페이지로 이동합니다.');
	        window.location.href = "../../my/loginform"; // 로그인 페이지로 이동
	    }else{
	    	if(${loginUserDto.memtype ne 'PERSON'}){
	    		alert('일반회원 외에는 리뷰 신고가 불가능합니다. 이전 페이지로 돌아갑니다.');
	    		window.location.href = "bizRvContentView?br_no=${bizRvContentView.br_no }";
	    	}
	    	console.log('일반회원입니다.');
	    }
	    // memno가 있으면 해당 JSP 문서를 로드
	    console.log('문서를 로드합니다.');
	});
	
	function redirectLogin() {
		alert('로그인 후 이용하실 수 있습니다.');
		window.location.href = "../../my/loginform";
	}
	
	function alertNo() {
		alert('일반회원 외에는 글쓰기가 불가능합니다.');
	}
</script>
</head>
<body>
<body>
	<div class="pt-3 bg-light bg-opacity-75">
	<div class="d-flex justify-content-center">
		<div class="p-3" style="width: 750px" >
					<ul class="list-inline">
						<li class="list-inline-item">
							<h4 style="--bs-text-opacity: 1; background-color: #1034a6; padding: 3px; !important;">
						    	<strong style="color: white;">시공리뷰 신고</strong>
						   	</h4>
						</li>
						<li class="list-inline-item">
								<small class="text-body-secondary">커뮤니티를 내 손으로 깨끗하게.</small>
						</li>
					</ul>	
		</div>
		<div class="d-flex align-items-end mb-5">
			<div onclick="location.href='bizRvList?inteno=${inteno}'">
				<span class="text-body-secondary" style="font-size: 12px; cursor:pointer;">뒤로 가기 <i class="fa-solid fa-rotate-left" style="cursor:pointer;"></i></span>
			</div>
		</div>
	</div>
		<div class="text-primary text-opacity-25">
			<hr />
		</div>
	</div>
	
<form action="bizRvReport" method="post">
<input type="hidden" name="br_no" value="${bizRvContentView.br_no }" />
<input type="hidden" name="memno" value="${bizRvContentView.memno }" />
<input type="hidden" name="inteno" value="${bizRvContentView.inteno }" />
	<div class="d-flex justify-content-center">
		<div class="p-3" style="width: 750px">
			<table class="table" style="width: 100%; max-width: 750px">
				<tr>
				    <th scope="row" class="table-light border-light-subtle">신고할 리뷰 번호</th>
					<td colspan="3">
						${bizRvContentView.br_no }
					</td>
				</tr>
				<tr>
				    <th scope="row" class="table-light border-light-subtle">신고대상</th>
					<td colspan="3">
						${bizRvContentView.br_writer }
					</td>
				</tr>
				<tr>
				    <th scope="row" class="table-light border-light-subtle">신고사유</th>
					<td colspan="3">
						<textarea class="form-control"  name="cause" id="cause" rows="10" onfocus="this.value='';">신고 사유를 입력해 주세요. 허위 신고 시, 불이익이 주어질 수 있습니다.</textarea>
					</td>
				</tr>		
			</table>
			
						
			<div class="d-flex justify-content-evenly">
				<div class="d-flex justify-content-center" style="width: 750px;">
					<div class="d-flex justify-content-end" style="width: 99%; max-width: 740px;">
						<input type="submit" value="제출"  class="btn btn-outline-primary btn-sm w-10">
					</div>
				</div>
			</div>
		</div>
	</div>	
</form>

</body>
</html>