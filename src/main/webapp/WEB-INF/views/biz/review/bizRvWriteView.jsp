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
<title>시공리뷰 작성</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@5.3.3/dist/zephyr/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<%@include file ="../bizHeader.jsp" %>
<link rel="stylesheet" href="${path}/resources/css/biz/biz.css"/>
<link  rel="stylesheet"
  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>
  	<style>
	 .fa-solid{
	 	color: #1034a6;
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
	
	#topBtn{
   	position: fixed;
  	 right: 4%;
   	bottom: 5%;
   	display: none;
   	/* z-index: 9999; */
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
		    		alert('일반회원 외에는 리뷰 작성이 불가능합니다. 이전 페이지로 돌아갑니다.');
		    		window.location.href = "bizRvList?inteno=${inteno }";
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
		
		function redeptlist(target) {
			console.log(target.value+"점입니다.")
			$('input[name=br_point]').attr('value', target.value);
		}
		
	</script>
</head>
<body>
<main class="Site-content">
	<div class="pt-3 bg-light bg-opacity-75">
	<div class="d-flex justify-content-center">
		<div class="p-3" onclick="location.href='bizRvList?inteno=${inteno}'" style="width: 750px; cursor:pointer;" >
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
			<div onclick="location.href='bizRvList?inteno=${inteno }'">
				<span class="text-body-secondary" style="font-size: 12px; cursor:pointer;">목록으로 <i class="fa-solid fa-rotate-left" style="cursor:pointer;"></i></span>
			</div>
		</div>
	</div>
		<div class="text-primary text-opacity-25">
			<hr />
		</div>
	</div>
	
<div id="data pb-0 mb-0">
	<div class="d-flex justify-content-center mb-0 pb-0">
		<div class="px-3 pb-0 mb-0" style="width: 750px">
			<table class="table" style="width: 100%; max-width: 750px">
				<tr>
				 <th scope="row" class="table-light border-light-subtle align-middle">별점</th>
					<td>
				    	<span class="star">★★★★★
				        	<span id="star2">★★★★★</span>
				        	<input type="range" onclick="redeptlist(this);" oninput="drawStar(this)" value="0.5" step="0.5" min="0" max="5">
				      	</span>
				     </td> 	
	      		</tr>
	      	</table>
	      </div>
	</div>       
	<form action="bizRvWrite" method="post" enctype="multipart/form-data">
	<input type="hidden" name="memno" value="${loginUserDto.memno }" />
	<input type="hidden" name="inteno" value="${inteno }" />
	<input type="hidden" name="br_point" value="" size="20" />
	<input type="hidden" name="br_writer" value="${loginUserDto.nickname }" />

	<div class="d-flex justify-content-center">
		<div class="p-3 pt-0 mt-0" style="width: 750px">
			<table class="table" style="width: 100%; max-width: 750px">
				<tr>
				    <th scope="row" class="table-light border-light-subtle">이름</th>
					<td colspan="3">
						<input type="text" name="br_writer" value="${loginUserDto.nickname }" disabled />
					</td>
				</tr>
				<tr>
				    <th scope="row" class="table-light border-light-subtle">내용</th>
					<td colspan="3">
						<textarea class="form-control" name="br_content" id="br_content" rows="10" onfocus="this.value='';">내용을 입력해 주세요.</textarea>
					</td>
				</tr>
				<tr>
					<th scope="row" class="table-light border-light-subtle">첨부</th>
					<td colspan="3">
						<input type="file" name="file" multiple="multiple"/>
					</td>
				</tr>	
			</table>
			
						
			<div class="d-flex justify-content-evenly">
				<div class="d-flex justify-content-center" style="width: 750px;">
				<div class="d-flex justify-content-end" style="width: 99%; max-width: 720px;">
					<c:choose>
						<c:when test="${loginUserDto.memtype eq 'PERSON'}">
							<input type="submit" value="글쓰기"  class="ms-1 btn btn-outline-primary btn-sm w-10">
						</c:when>
						<c:otherwise></c:otherwise>							
					</c:choose>
				</div>
				</div>
			</div>
			
			
		</div>
	</div>	
</form>
</div>
</main>

<div>
      <a id="topBtn" href="#"><img alt="" src="${path}/resources/img/my/fromtop.png"></a>      
      </div>

<script>
$(function() {
   // 보이기 | 숨기기
   $(window).scroll(function() {
      if ($(this).scrollTop() > 250) { //250 넘으면 버튼이 보여짐니다.
            $('#topBtn').fadeIn();
            } else {
            $('#topBtn').fadeOut();
      }
   });
   // 버튼 클릭시
   $("#topBtn").click(function() {   
   $('html, body').animate({
     scrollTop : 0    // 0 까지 animation 이동합니다.
    }, 400);          // 속도 400
    return false;
    });
  });
</script>
</body>
<%@include file ="../bizFooter.jsp" %>
</html>