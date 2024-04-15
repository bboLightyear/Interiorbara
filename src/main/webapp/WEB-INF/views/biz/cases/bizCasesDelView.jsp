<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시공사례 삭제</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@5.3.3/dist/zephyr/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
	 
	td{
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
		    	if(${loginUserDto.myinteriordto.inteno ne bizCasesDelView.inteno}){
		    		alert('작성자 외에는 삭제가 불가능합니다. 이전 페이지로 돌아갑니다.');
		    		window.location.href='bizCasesContentView?bc_no=${bizCasesDelView.bc_no }';
		    	}
		    	console.log('로그인유저와 작성자의 inteno가 일치합니다.');
		    }
		    // memno가 있으면 해당 JSP 문서를 로드
		    console.log('문서를 로드합니다.');
		});
		
	    function confirmDelete(bc_no) {
	        var confirmation = confirm("정말로 삭제하시겠습니까?");
	        if (confirmation) {
	            alert("해당 게시물이 삭제되었습니다.");
	            location.href = 'bizCasesDel?bc_no=' + bc_no;
	        } else {
	            // 사용자가 취소를 클릭한 경우 아무 작업도 수행하지 않음
	        }
	    }
	</script>
</head>
<body>
	<div class="pt-3 bg-light bg-opacity-75">
	<div class="d-flex justify-content-center">
		<div class="p-3" style="width: 750px" >
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
			<div onclick="location.href='bizCasesContentView?bc_no=${bizCasesDelView.bc_no }'">
				<span class="text-body-secondary" style="font-size: 12px; cursor:pointer;">뒤로 가기 <i class="fa-solid fa-rotate-left" style="cursor:pointer;"></i></span>
			</div>
		</div>
	</div>
		<div class="text-primary text-opacity-25">
			<hr />
		</div>
	</div>
	
	
	
	
	
	
	
		<div class="d-flex justify-content-center">
		<div class="p-3" style="width: 750px">
			<table class="p-3 table" style="width: 100%; height: 150px; max-width: 750px">
				<tr>
				    <td class="align-middle">
				    	<p style="font-size: 16px;"><span class="px-2" style="color: #ff8d1e"><strong>${bizCasesDelView.bc_title }</strong></span> 글을 삭제하시겠습니까?</p>
				    </td>
				</tr>			
			</table>
			
								
			<div class="d-flex justify-content-evenly">
				<div class="d-flex justify-content-center" style="width: 750px;">
					<div class="d-flex align-items-start" style="width: 40%; max-width: 300px;">
						<button class="ms-1 btn btn-outline-primary btn-sm w-10"  onclick="location.href='bizCasesContentView?bc_no=${bizCasesDelView.bc_no }'"><span style="font-size: 14px;">이전 화면</span></button>
					</div>
			
			
				<div class="d-flex justify-content-end" style="width: 60%; max-width: 450px;">
					<button class="ms-1 btn btn-outline-primary btn-sm w-10" onclick="confirmDelete('${bizCasesDelView.bc_no }')"><span style="font-size: 14px;">삭제</span></button>
				</div>
				</div>
			</div>

		</div>
	</div>

</body>
</html>