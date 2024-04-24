<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시공사례</title>
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
	#topBtn{
	   position: fixed;
	   right: 12.5%;
	   bottom: 3%;
	   display: none;
	   /* z-index: 9999; */
	}	
	</style>
	
	<script>
	function redirectLogin() {
		alert('로그인 후 이용하실 수 있습니다. 로그인 화면으로 이동합니다.');
		window.location.href = "../../my/loginform";
	}
	
	function simfunc(div) {
	    var bc_title = div.getAttribute("data-bc-title");
//	    alert("sign!!!" + bc_title);
	    console.log(bc_title);
	    var htmltxt = "";
	    $.ajax({
	        type: "post",
	        //컨트롤러로 보냄
	        url: "/ibara/biz/cases/simcases?bt=" + bc_title,
	        success: function (result) {
	            console.log(result);
	            htmltxt = "<table>";
	            htmltxt += "<tr><td class='ps-1 pe-2 py-2' style='width: 33%; cursor: pointer;'><img class='center align-middle' style='width: 100%; height: 150px; border-radius: 10px;' src='../../resources/upload/biz/cases/" + result[4].simtitle.trim() + " (1).jpg" + "' onclick='location.href=\"bizCasesContentView?bc_no=" + result[4].simtitle.trim() + "\"'></td>";
	            htmltxt += "<td class='ps-3 px-2 py-2'  style='width: 33%; cursor: pointer;'><img class='center align-middle' style='width: 100%; height: 150px;  border-radius: 10px;' src='../../resources/upload/biz/cases/" + result[5].simtitle.trim() + " (1).jpg" + "' onclick='location.href=\"bizCasesContentView?bc_no=" + result[5].simtitle.trim() + "\"'></td>";
	            htmltxt += "<td class='ps-3 py-2'  style='width: 33%; cursor: pointer;'><img class='center align-middle' style='width: 100%; height: 150px;  border-radius: 10px;' src='../../resources/upload/biz/cases/" + result[6].simtitle.trim() + " (1).jpg" + "' onclick='location.href=\"bizCasesContentView?bc_no=" + result[6].simtitle.trim() + "\"'></td></tr>";

	            htmltxt += "<tr><td class='pe-2' style='width: 33%'><button style='width: 100%' class='ms-1 btn btn-outline-primary btn-sm w-10' onclick='location.href=\"bizCasesContentView?bc_no=" + result[4].simtitle.trim() + "\"'><span style='font-size: 14px;'>" + result[0].simtitle + "</span></button></td>";
	            htmltxt += "<td class='px-2'  style='width: 33%'><button style='width: 100%' class='ms-1 btn btn-outline-primary btn-sm w-10' onclick='location.href=\"bizCasesContentView?bc_no=" + result[5].simtitle.trim() + "\"'><span style='font-size: 14px;'>" + result[1].simtitle + "</span></button></td>";
	            htmltxt += "<td class='ps-2'  style='width: 33%'><button style='width: 100%' class='ms-1 btn btn-outline-primary btn-sm w-10' onclick='location.href=\"bizCasesContentView?bc_no=" + result[6].simtitle.trim() + "\"'><span style='font-size: 14px;'>" + result[2].simtitle + "</span></button></td></tr>";
	            htmltxt += "</table>";
	            $("#display").html(htmltxt);
	        }
	    });
	}

	</script>
</head>
<body>
	<div class="pt-3 bg-light bg-opacity-75">
	<div class="d-flex justify-content-center">
		<div class="p-3"  onclick="location.href='bizCasesList?inteno=${bizCasesContentView.inteno}'" style="width: 1150px; cursor:pointer;" >
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
			<div onclick="location.href='../home/bizCasesListUnder?inteno=${bizCasesContentView.inteno}'">
				<span class="text-body-secondary" style="font-size: 12px; cursor:pointer;">HOME <i class="fa-solid fa-rotate-left" style="cursor:pointer;"></i></span>
			</div>
		</div>
	</div>
		<div class="text-primary text-opacity-25">
			<hr />
		</div>
	</div>

	<div class="d-flex justify-content-center">
		<div class="p-3" style="width: 1050px">
			<table class="table" style="width: 100%; max-width: 1050px">

	
				<tr class="">
				    <th scope="row" class="table-light border-light-subtle align-middle">번호</th>
					<td  class="center" style="width:25%">${bizCasesContentView.bc_no }</td>
					<th scope="row"  class="table-light border-light-subtle align-middle">HIT</th>
					<td  class="center" style="width:25%">${bizCasesContentView.bc_hit }</td>
				</tr>	
				<tr class="">
				      <th scope="row"  class="table-light border-light-subtle align-middle">작성자</th>
					<td colspan="3" onclick="javascript_:window.open('${path}/my/memberinfopage?nickname=${bizCasesContentView.bc_writer }','pop','menubar=no,status=no,scrollbars=no,resizable=no,width=560,height=700,top=50,left=50');" style="cursor: pointer;">${bizCasesContentView.bc_writer } <i class="fa-solid fa-user" style="font-size: 11px;"></i></td>
				</tr>		
				<tr class="">
				      <th scope="row" class="table-light border-light-subtle align-middle">제목</th>
					<td colspan="3">${bizCasesContentView.bc_title }</td>
				</tr>		
				<tr class="">
				      <th scope="row" class="table-light border-light-subtle">내용</th>
					<td colspan="3">
					
		 				<c:forEach items="${imglist }" var="imgdto">
							
							<c:if test="${imgdto.bcimg_cgn ne null }">
								<c:set value="${imgdto.bcimg_cgn }" var="filename" />
								<c:set value="${fn:toLowerCase(filename) }" var="fileNm" />
								<c:forTokens items="${fileNm }" delims="." var="token" varStatus="status">
								<c:if test="${status.last }">
									<c:choose>
										<c:when test="${token eq 'jpg' || token eq 'png' || token eq 'jpeg'}">
											<img class="pb-3" src="../../resources/upload/biz/cases/${imgdto.bcimg_cgn }" alt="${imgdto.bcimg_cgn }" width="60%" />
										</c:when>
									<c:otherwise>그림이 아닌 다른 형식 파일입니다.</c:otherwise>		
									</c:choose>
								</c:if>
								</c:forTokens>
							</c:if>			
						</c:forEach>	
						<br />
					${bizCasesContentView.bc_content }</td>
				</tr>
				<tr class="">
					<td class="center table-light border-light-subtle align-middle">첨부</td>
					<td colspan="3">
					<%-- <a href="bizCasesDownload?p=resources/upload/biz/cases/&f=${bizCasesContentView.bc_img }
						&bc_no=${bizCasesContentView.bc_no }">${bizCasesContentView.bc_img }</a> --%>
						<c:forEach items="${imglist }" var="imgdto">
							<a style="color: #1e90ff" href="bizCasesDownload?p=resources/upload/biz/cases/&f=${imgdto.bcimg_cgn }
							&bc_no=${bizCasesContentView.bc_no }">${imgdto.bcimg_cgn }</a>
							&nbsp; &nbsp;
						</c:forEach>					
						
					</td>
				</tr>				
			</table>
			
								
			<div class="d-flex justify-content-evenly">
				<div class="d-flex justify-content-center" style="width: 1150px;">
					<div class="d-flex align-items-start" style="width: 40%; max-width: 440px;">
						<c:if test="${empty loginUserDto.memno}">
							<button class="ms-1 btn btn-outline-primary btn-sm w-10" onclick="redirectLogin()"><span style="font-size: 14px;">목록</span></button>
						</c:if>
						<c:if test="${not empty loginUserDto.memno}">
							<button class="ms-1 btn btn-outline-primary btn-sm w-10" onclick="location.href='bizCasesList?inteno=${bizCasesContentView.inteno}'"><span style="font-size: 14px;">목록</span></button>							
						</c:if>	
					</div>
			
			
				<div class="d-flex justify-content-end" style="width: 60%; max-width: 660px;">
						<c:if test="${empty loginUserDto.memno}">
							<button class="ms-1 btn btn-outline-primary btn-sm w-10" onclick="redirectLogin()"><span style="font-size: 14px;">수정</span></button>
						</c:if>
						<c:if test="${not empty loginUserDto.memno}">
							<c:choose>
								<c:when test="${loginUserDto.myinteriordto.inteno eq bizCasesContentView.inteno}">
									<button class="ms-1 btn btn-outline-primary btn-sm w-10" onclick="location.href='bizCasesModView?bc_no=${bizCasesContentView.bc_no }'"><span style="font-size: 14px;">수정</span></button>								
								</c:when>
								<c:otherwise>
									<button class="ms-1 btn btn-outline-primary btn-sm w-10" onclick="alertNo()"><span style="font-size: 14px;">수정</span></button>								
								</c:otherwise>							
							</c:choose>
						</c:if>	
							
					
						<c:if test="${empty loginUserDto.memno}">
							<button class="ms-1 btn btn-outline-primary btn-sm w-10" onclick="redirectLogin()"><span style="font-size: 14px;">삭제</span></button>
						</c:if>
						<c:if test="${not empty loginUserDto.memno}">
							<c:choose>
								<c:when test="${loginUserDto.myinteriordto.inteno eq bizCasesContentView.inteno}">
									<button class="ms-1 btn btn-outline-primary btn-sm w-10" onclick="location.href='bizCasesDelView?bc_no=${bizCasesContentView.bc_no }'"><span style="font-size: 14px;">삭제</span></button>
								</c:when>
								<c:otherwise>
										<button class="ms-1 btn btn-outline-primary btn-sm w-10" onclick="alertNo()"><span style="font-size: 14px;">삭제</span></button>
									<script>
										function alertNo() {
											alert('작성자 외에는 수정 및 삭제가 불가능합니다.');
										}
									</script>
								</c:otherwise>							
							</c:choose>
						</c:if>											
				</div>
				</div>
			</div>

		</div>
	</div>
	
		<div class="text-primary text-opacity-25">
			<hr />
		</div>		
	
<div class="d-flex justify-content-evenly" style="cursor: pointer;">
	<div class="d-flex justify-content-center" style="width: 1150px;">	
		<div class="clickable-div text-primary" onclick="simfunc(this);" data-bc-title="${bizCasesContentView.bc_title}">
		    <span style="color: #1e90ff"><strong>${bizCasesContentView.bc_title}</strong></span> 시공사례와 비슷한 케이스가 궁금하다면? &nbsp; <i class="fa-solid fa-angles-down"></i>
		</div>
</div>
</div>

		<div class="text-primary text-opacity-25">
			<hr />
		</div>		

<div class="d-flex justify-content-evenly">
	<div class="d-flex justify-content-center" style="width: 1010px;">			
		<div id="display">
		</div>
	</div>
</div>	
	
<div>
      <a id="topBtn" href="#"><img alt="" src="${path}/resources/img/my/fromtop.png"></a>      
      </div>
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