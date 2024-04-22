<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전문시공업체 찾기</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@5.3.3/dist/zephyr/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
	.proBtns{
	  /* 상하좌우 정중앙 정렬하기 */
	  display: flex;
	  justify-content: center;
	  align-items: center;
	}
	 
	 .proBtn{
		cursor:pointer;
		padding: 8px;
	}
	
	 a {
	   text-decoration: none;
	   color: #1a1f27;
	}	
	
	#topBtn{
   	position: fixed;
  	 right: 4%;
   	bottom: 5%;
   	display: none;
   	/* z-index: 9999; */
	}	
	</style>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	var bh_pro='${bh_pro }';
</script>  
</head>
<body>
<c:set var="bh_pro" value="${bh_pro }" />
<div id="topDiv" class="pt-3 bg-light bg-opacity-75">
	<div class="d-flex justify-content-center">
		<div class="p-3" style="width: 750px;" >
			<ul class="list-inline">
				<li class="list-inline-item" onclick="location.href='bizProSearch'" style="cursor: pointer;">
					<h4 style="--bs-text-opacity: 1; background-color: #1034a6; padding: 3px; !important;">
				    	<strong style="color: white;">원하는 공간만. 전문가의 터치로</strong>
				   	</h4>
				</li>
				<c:if test="${loginUserDto.memtype ne 'INTERIOR'}">						
					<li class="list-inline-item" onclick="location.href='bizProSearch'" style="cursor: pointer;">
							<small class="text-body-secondary">전문시공업체를 모아 볼까요?</small>
					</li>
				</c:if>						
				<c:if test="${loginUserDto.memtype eq 'INTERIOR'}">
					<li class="list-inline-item">
						<div class="ps-1" onclick="location.href='/ibara/biz/home/bizHome?inteno=${loginUserDto.myinteriordto.inteno}'">
							<span class="text-body-secondary" style="font-size: 16px;"><i class="fa-solid fa-house" style="cursor: pointer;"></i></span>
						</div>
					</li>						
				</c:if>
			</ul>	
		</div>
		<div class="d-flex align-items-end mb-5">
			<div onclick="location.href='/ibara/biz/search/bizProSearch'">
				<span class="text-body-secondary" style="font-size: 12px; cursor:pointer;">검색 초기화 <i class="fa-solid fa-rotate-left" style="cursor:pointer;"></i></span>
			</div>
			<div> &nbsp; &nbsp; </div>
			<div onclick="location.href='/ibara/biz/search/bizAddrSearch'">
				<span class="text-body-secondary" style="font-size: 12px; cursor:pointer;">주소로 검색 <i class="fa-solid fa-magnifying-glass" style="cursor:pointer;"></i></span>	
			</div>
		</div>
	</div>
	
	<div class="d-flex justify-content-center">	
		<div class="px-5" style="width: 900px;">
			<div class="input-group pb-4" style="max-width: 1100px">
			      <div class="d-flex justify-content-center">
						<table style="display: flex; justify-content: center; align-items: center; width: 75%">
							<tr class="proBtns">
								<td class="proBtn"><div onclick="location.href='/ibara/biz/search/bizProSearchBasic?bh_pro=도배·페인트'"><img src="../../resources/img/bizimg/wallpaint.png" alt="wallpaint.png" style="width: 95%;"/></div></td>
								<td class="proBtn"><div onclick="location.href='/ibara/biz/search/bizProSearchBasic?bh_pro=장판·타일'"><img src="../../resources/img/bizimg/tilefloor.png" alt="tilefloor.png" style="width: 95%;"/></div></td>
								<td class="proBtn"><div onclick="location.href='/ibara/biz/search/bizProSearchBasic?bh_pro=욕실'"><img src="../../resources/img/bizimg/bathroom.png" alt="bathroom.png" style="width: 95%;"/></div></td>
								<td class="proBtn"><div onclick="location.href='/ibara/biz/search/bizProSearchBasic?bh_pro=주방'"><img src="../../resources/img/bizimg/kitchen.png" alt="kitchen.png" style="width: 95%;"/></div></td>	
							</tr>
							<tr class="proBtns">
								<td class="proBtn"><div onclick="location.href='/ibara/biz/search/bizProSearchBasic?bh_pro=마루'"><img src="../../resources/img/bizimg/wdfloor.png" alt="wdfloor.png" style="width: 95%;"/></div></td>
								<td class="proBtn"><div onclick="location.href='/ibara/biz/search/bizProSearchBasic?bh_pro=문·샷시'"><img src="../../resources/img/bizimg/door.png" alt="door.png" style="width: 95%;"/></div></td>
								<td class="proBtn"><div onclick="location.href='/ibara/biz/search/bizProSearchBasic?bh_pro=시트·필름'"><img src="../../resources/img/bizimg/sheetfilm.png" alt="sheetfilm.png" style="width: 95%;"/></div></td>
								<td class="proBtn"><div onclick="location.href='/ibara/biz/search/bizProSearchBasic?bh_pro=조명'"><img src="../../resources/img/bizimg/lighting.png" alt="lighting.png" style="width: 95%;"/></div></td>	
							</tr>
						</table>
				</div>
		    </div>
		</div>
		<div class="text-primary text-opacity-25">
			<hr />
		</div>
	</div>
</div>




<div id="midDiv" class="w-100 d-flex justify-content-center">
		<div class="p-3" style="width: 900px;">
			<ul class="w-100 list-inline">
					<div class="float-start">
						<li class="list-inline-item">
							<h5><strong class="align-middle">업체 둘러보기</strong></h5>
						</li>
					</div>
					<div class="float-end">	
						<li class="list-inline-item">
							<div class="px-3">
								<form class="d-flex" action="/ibara/biz/search/bizProSearch" method="post">
									<input class="form-control me-sm-2" type="text" name="sk" value="${resk }"/
										placeholder="업체명으로 검색">
									<button class="btn btn-secondary my-2 my-sm-0" type="submit" value="검색">Search</button>
								</form>
							</div>
						</li>
					</div>
			</ul>	
		</div>
	</div>
	
	<div class="sortResult">

		<div ID="sortResultDiv" class="px-5 pt-2 container-md" style="max-width: 900px">
			<c:forEach items="${bizHomeSearch }" var="bizHome" varStatus="bizHomeStatus">
							<div style="float: left; margin: 1%; cursor:pointer;" onclick="location.href='/ibara/biz/home/bizHome?inteno=${bizHome.inteno}'" class="home${searchVO.rowEndMore}">
								<div class="card border-light mb-2" style="width: 250px; height: 280px;">
								  <div class="card-header p-0">
								  		<c:if test="${bizHome.bh_img ne null }">
										<c:set value="${bizHome.bh_img }" var="filename" />
										<c:set value="${fn:toLowerCase(filename) }" var="fileNm" />
										<c:forTokens items="${fileNm }" delims="." var="token" varStatus="status">
										<c:if test="${status.last }">
											<c:choose>
												<c:when test="${token eq 'jpg' || token eq 'png' || token eq 'jpeg'}">		
														<img src="../../resources/upload/biz/home/${bizHome.bh_img }" alt="${bizHome.bh_img }" width="250" height="150" style="border-top-left-radius: 3.5%; border-top-right-radius: 3.5%;"/>
												</c:when>
											<c:otherwise> <img src="#" alt="엑스박스" value="엑스박스" /></c:otherwise>		
											</c:choose>
										</c:if>
										</c:forTokens>
										</c:if>
								  </div>
								  <div class="card-body">
								    <div class="card-title">
									    <strong style="font-size: 16px; color: #1e90ff;">${bizHome.bh_name }</strong> &nbsp; <span style="color: gold;">★</span> <span style="font-size: 13px; color: #b1b8c0;">${bizSearchRvPointAvgList[bizHomeStatus.index] }</span>
								    </div>    
								    <div class="pb-2 card-text"  style="font-size: 13px;"><strong>${bizHome.bh_addr1 }</strong></div>    
								    <p class="card-text" style="font-size: 12px; color: #b1b8c0">${bizRvContentList[bizHomeStatus.index] } ...</p>    
 								 </div>
 								</div>
 							</div>
 			</c:forEach>
		</div>	
	</div>
	
	
		<div class="p-3 container-md" style="width: 99%">	
			<div class="w-100 d-flex justify-content-center">
							 	<div id="bottomDiv">
				<form action="/biz/search/bizProSearch" method="post" class="p-3 container-md">
					<c:if test="${searchVO.totPage>1}">
						<c:if test="${searchVO.page>1 }">
							<a href="/ibara/biz/search/bizProSearch?page=1"><i class="fa-solid fa-angles-left"></i></a>
							<a href="/ibara/biz/search/bizProSearch?page=${searchVO.page-1} "><i class="fa-solid fa-circle-chevron-left"></i></a>
						</c:if>
						
						
						<c:forEach begin="${searchVO.pageStart }" end="${searchVO.pageEnd }" var="i">
							<c:choose>
								<c:when test="${i eq searchVO.page }">
									<span style="color:#1e90ff; font-weight:bold;">${i } &nbsp;</span>		
								</c:when>
								<c:otherwise>			
									<a href="/ibara/biz/search/bizProSearch?page=${i }&sk=${resk}"
									style="text-decoration: none;">${i }</a> &nbsp;		
									
								</c:otherwise>
							</c:choose>
						</c:forEach>
					
						<c:if test="${searchVO.totPage > searchVO.page}">
							<a href="/ibara/biz/search/bizProSearch?page=${searchVO.page+1} "><i class="fa-solid fa-circle-chevron-right"></i></a>
							<a href="/ibara/biz/search/bizProSearch?page=${searchVO.totPage}"><i class="fa-solid fa-angles-right"></i></a>
						</c:if>
					</c:if>
				</form>
			</div>
			</div>
		</div>
		
	

		<div class="p-3 container-md" style="width: 99%">	
			<div class="w-100 d-flex justify-content-center">
					<img class="w-75 px-4" id="mgzBanner" style="max-width: 840px; border-radius: 5%; cursor:pointer; " src="../../resources/img/bizimg/mgz_banner.jpg" alt="mgz_banner" onclick="location.href='/ibara/biz/magazine/bizMgzContentView?bm_no=1'" />
			</div>
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