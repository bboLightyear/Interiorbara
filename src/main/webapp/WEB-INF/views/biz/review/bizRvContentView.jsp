<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>

<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<meta charset="UTF-8">
<title>시공리뷰 보기</title>
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
	$(document).ready(function () {
		const br_no = '${br_no }';
		const memno = '${memno }';
		var heartIs = "${heartIs}";
		
		const likeImg = document.getElementById("likeImg");
		
		if (heartIs == "true") {
			likeImg.src = "../../resources/img/bizimg/heart.png";
		}
		else {
			likeImg.src = "../../resources/img/bizimg/heartempty.png";
		}
		
		// 좋아요 버튼을 클릭 시 실행되는 코드
		$(".likeImg").on("click", function () {
			
			console.log('클릭됨');
			
			$.ajax({
		      url: '/ibara/biz/review/bizRvLike',
		      type: 'POST',
		      data: { 'br_no': br_no,
				'memno': memno},
		      success: function (data) {
		  			console.log('데이터전송 성공');
		          if (data == 1) {
		              $(".likeImg").attr("src", "../../resources/img/bizimg/heart.png");
		              location.reload();
		          } else {
		              $(".likeImg").attr("src", "../../resources/img/bizimg/heartempty.png");
		              location.reload();
		          }
		      }, error: function () {
		          $(".likeImg").attr("src", "../../resources/img/bizimg/heartempty.png");
		          console.log('비회원입니다.')
		      }

		  });
		  });
		
		
	  });
	
	
	function redirectLogin() {
		alert('로그인 후 이용하실 수 있습니다. 로그인 화면으로 이동합니다.');
		window.location.href = "../../my/loginform";
	}
	
	function alertNo() {
		alert('일반회원 외에는 리뷰 신고가 불가능합니다.');
	}
	
	function alertNotMatch() {
		alert('작성자 외에는 수정 및 삭제가 불가능합니다.');
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
						    	<strong style="color: white;">시공리뷰</strong>
						   	</h4>
						</li>
						<li class="list-inline-item">
								<small class="text-body-secondary">생생한 실제 이용 후기를 볼까요?</small>
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
	
	<div class="d-flex justify-content-center">
		<div class="p-3" style="width: 750px">
			<table class="table" style="width: 100%; max-width: 750px">
				<tr class="">
				    <th scope="row" class="table-light border-light-subtle">번호</th>
					<td colspan="3">${bizRvContentView.br_no }</td>
				</tr>	
				<tr class="">
				      <th scope="row" class="table-light border-light-subtle">작성자</th>
					<td colspan="3">${bizRvContentView.br_writer }</td>
				</tr>		
				<tr class="">
				      <th scope="row"  class="table-light border-light-subtle">별점</th>
					<td colspan="3"><span style="color: gold;">★</span>${bizRvContentView.br_point }</td>
				</tr>		
				<tr class="">
				      <th scope="row" class="table-light border-light-subtle">내용</th>
					<td colspan="3">
					
		 				<c:forEach items="${imglist }" var="imgdto">
							
							<c:if test="${imgdto.brimg_cgn ne null }">
								<c:set value="${imgdto.brimg_cgn }" var="filename" />
								<c:set value="${fn:toLowerCase(filename) }" var="fileNm" />
								<c:forTokens items="${fileNm }" delims="." var="token" varStatus="status">
								<c:if test="${status.last }">
									<c:choose>
										<c:when test="${token eq 'jpg' || token eq 'png'}">
											<img class="pb-3" src="../../resources/upload/biz/review/${imgdto.brimg_cgn }" alt="${imgdto.brimg_cgn }"  width="60%"  />
										</c:when>
									<c:otherwise>그림이 아닌 다른 형식 파일입니다.</c:otherwise>		
									</c:choose>
								</c:if>
								</c:forTokens>
							</c:if>			
						</c:forEach>
						<br />
					${bizRvContentView.br_content }</td>
				</tr>
				<tr class="">
					<td class="table-light border-light-subtle">좋아요</td>
					<td colspan="3">
						<c:if test="${empty loginUserDto.memno}">
							<span style="font-size: 16px;" onclick="redirectLogin()">
								<img src="../../resources/img/bizimg/heartempty.png" width="24px" height="24px">
								</span>
								</c:if>
							<c:if test="${not empty loginUserDto.memno}">
								<div>
									<img src="../../resources/img/bizimg/heartempty.png" class="likeImg" id="likeImg" 
									width="24px" height="24px">
								</div>
						</c:if>
						 <span>${allUserLikeTotal } 개</span>
					</td>
				</tr>				
			</table>
			
								
			<div class="d-flex justify-content-evenly">
				<div class="d-flex justify-content-center" style="width: 750px;">
					<div class="d-flex align-items-start" style="width: 40%; max-width: 300px;">
						<c:if test="${empty loginUserDto.memno}">
							<button class="ms-1 btn btn-outline-primary btn-sm w-10" onclick="redirectLogin()"><span style="font-size: 14px;">목록</span></button>
						</c:if>
						<c:if test="${not empty loginUserDto.memno}">
							<button class="ms-1 btn btn-outline-primary btn-sm w-10" onclick="location.href='bizRvList?inteno=${inteno}'"><span style="font-size: 14px;">목록</span></button>							
						</c:if>	
					</div>
			
			
				<div class="d-flex justify-content-end" style="width: 60%; max-width: 450px;">
						<c:if test="${empty loginUserDto.memno}">
							<button class="ms-1 btn btn-outline-primary btn-sm w-10" onclick="redirectLogin()"><span style="font-size: 14px;">신고하기</span></button>
						</c:if>
						<c:if test="${not empty loginUserDto.memno}">
							<c:choose>
								<c:when test="${loginUserDto.memtype eq 'PERSON'}">
									<button class="ms-1 btn btn-outline-primary btn-sm w-10" onclick="location.href='bizRvReportView?br_no=${bizRvContentView.br_no }&inteno=${inteno}'"><span style="font-size: 14px;">신고하기</span></button>								
								</c:when>
								<c:otherwise>
									<button class="ms-1 btn btn-outline-primary btn-sm w-10" onclick="alertNo()"><span style="font-size: 14px;">신고하기</span></button>								
								</c:otherwise>							
							</c:choose>
						</c:if>	
							
					
						<c:if test="${empty loginUserDto.memno}">
							<button class="ms-1 btn btn-outline-primary btn-sm w-10" onclick="redirectLogin()"><span style="font-size: 14px;">수정/삭제</span></button>
						</c:if>
						<c:if test="${not empty loginUserDto.memno}">
							<c:choose>
								<c:when test="${loginUserDto.memno eq bizRvContentView.memno}">
									<button class="ms-1 btn btn-outline-primary btn-sm w-10" onclick="location.href='bizRvModDelView?br_no=${bizRvContentView.br_no }&inteno=${inteno}'"><span style="font-size: 14px;">수정/삭제</span></button>
								</c:when>
								<c:otherwise>
										<button class="ms-1 btn btn-outline-primary btn-sm w-10" onclick="alertNotMatch()"><span style="font-size: 14px;">수정/삭제</span></button>
								</c:otherwise>							
							</c:choose>
						</c:if>											
				</div>
				</div>
			</div>

		</div>
	</div>
	
	
	
	



</body>
</html>