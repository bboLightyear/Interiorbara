<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가까운 업체 찾기</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@5.3.3/dist/zephyr/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<%@include file ="../bizHeader.jsp"%>	
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
	 a {
	   text-decoration: none;
	   color: black;
	}
	</style>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>	 
	 
	 function returnToBasic() {
		 var addrToSearch='${addrToSearch}';
	    	/* DB에서 ADDR1에 해당 시/군/구가 LIKE로 비슷하게 들어가는 업체 검색 돌려줄 함수 */
	    	console.log('데이터전송 시작');
			$.ajax({
			      url: '/ibara/biz/search/bizAddrSearchBasic',
			      type: 'POST',
			      data: { 'addrToSearch': addrToSearch
			      },
			      success: function (data) {
			  			console.log('데이터전송 성공');
			        	$(".sortResult").html(data);
			      }, error: function () {
			    	  $(document).load();
			          console.log('오타가 있습니다.')
			      }

			  });
	 }
	 
	 function sortByStar() {
		 var addrToSearch='${addrToSearch}';
	    	/* DB에서 ADDR1에 해당 시/군/구가 LIKE로 비슷하게 들어가는 업체 검색 돌려줄 함수 */
	    	console.log('데이터전송 시작');
			$.ajax({
			      url: '/ibara/biz/search/bizAddrSearchStar',
			      type: 'POST',
			      data: { 'addrToSearch': addrToSearch
			      },
			      success: function (data) {
			  			console.log('데이터전송 성공');
			        	$(".sortResult").html(data);
			      }, error: function () {
			    	  $(document).load();
			          console.log('오타가 있습니다.')
			      }

			  });
	 }
	 
	 function sortByRvCnt() {
		 var addrToSearch='${addrToSearch}';
	    	/* DB에서 ADDR1에 해당 시/군/구가 LIKE로 비슷하게 들어가는 업체 검색 돌려줄 함수 */
	    	console.log('데이터전송 시작');
			$.ajax({
			      url: '/ibara/biz/search/bizAddrSearchRvCnt',
			      type: 'POST',
			      data: { 'addrToSearch': addrToSearch
			      },
			      success: function (data) {
			  			console.log('데이터전송 성공');
			        	$(".sortResult").html(data);
			      }, error: function () {
			    	  $(document).load();
			          console.log('오타가 있습니다.')
			      }

			  });
	 }
	 
	 function sortByContCnt() {
		 var addrToSearch='${addrToSearch}';
	    	/* DB에서 ADDR1에 해당 시/군/구가 LIKE로 비슷하게 들어가는 업체 검색 돌려줄 함수 */
	    	console.log('데이터전송 시작');
			$.ajax({
			      url: '/ibara/biz/search/bizAddrSearchContCnt',
			      type: 'POST',
			      data: { 'addrToSearch': addrToSearch
			      },
			      success: function (data) {
			  			console.log('데이터전송 성공');
			        	$(".sortResult").html(data);
			      }, error: function () {
			    	  $(document).load();
			          console.log('오타가 있습니다.')
			      }

			  });
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
						    	<strong style="color: white;">가볍게. 가까운 곳부터</strong>
						   	</h4>
						</li>
						<li class="list-inline-item">
								<small class="text-body-secondary">우리집 주변 시공업체를 모아 볼까요?</small>
						</li>
					</ul>	
		</div>
		<div class="d-flex align-items-end mb-5">
			<div onclick="location.href='/ibara/biz/home/bizHome?inteno=${inteno}'">
				<span class="text-body-secondary" style="font-size: 12px; cursor:pointer;">홈으로 돌아가기 <i class="fa-solid fa-rotate-left" style="cursor:pointer;"></i></span>
			</div>
			<div> &nbsp; &nbsp; </div>
			<div onclick="location.href='/ibara/biz/search/bizProSearch'">
				<span class="text-body-secondary" style="font-size: 12px; cursor:pointer;">전문시공 검색 <i class="fa-solid fa-magnifying-glass" style="cursor:pointer;"></i></span>	
			</div>
		</div>
	</div>

</div>


<div class="sortResult">
<c:set var="addrToSearch" value="${addrToSearch}" />

	<div class="w-100 d-flex justify-content-center">
		<div class="p-3" style="width: 850px;">
			<ul class="w-100 list-inline">
					<div class="float-start">
						<li class="list-inline-item">
							<h5><strong class="align-middle">${addrToSearch} 주변 업체</strong></h5>
						</li>
					</div>
					<div class="float-end">	
						<li class="list-inline-item">
							<div class="px-3">
								<div class="btn-group" role="group">
								  <button type="button" class="btn btn-outline-primary btn-sm" onclick="returnToBasic()">기본순</button>
								  <button type="button" class="btn btn-outline-primary btn-sm" onclick="sortByStar()">별점높은순</button>
								  <button type="button" class="btn btn-outline-primary btn-sm" onclick="sortByRvCnt()">리뷰많은순</button>
								  <button type="button" class="btn btn-outline-primary btn-sm"  onclick="sortByContCnt()">계약많은순</button>
								</div>												
							</div>
						</li>
					</div>
			</ul>	
		</div>
	</div>

	<div class="px-5 container-md" style="max-width: 900px">
 		<c:forEach items="${bizHomeSearch }" var="bizHome" varStatus="bizHomeStatus">
			<div style="float: left; margin: 1%; cursor: pointer;"
				onclick="location.href='/ibara/biz/home/bizHome?inteno=${bizHome.inteno}'">
				<div class="card border-light mb-2"
					style="width: 250px; height: 280px;">
					<div class="card-header p-0">
						<c:if test="${bizHome.bh_img ne null }">
							<c:set value="${bizHome.bh_img }" var="filename" />
							<c:set value="${fn:toLowerCase(filename) }" var="fileNm" />
							<c:forTokens items="${fileNm }" delims="." var="token"
								varStatus="status">
								<c:if test="${status.last }">
									<c:choose>
										<c:when test="${token eq 'jpg' || token eq 'png' || token eq 'jpeg'}}">
											<img src="../../resources/upload/biz/home/${bizHome.bh_img }"
												alt="${bizHome.bh_img }" width="250" height="150"
												style="border-top-left-radius: 3.5%; border-top-right-radius: 3.5%;" />
										</c:when>
										<c:otherwise>
											<img src="#" alt="엑스박스" value="엑스박스" />
										</c:otherwise>
									</c:choose>
								</c:if>
							</c:forTokens>
						</c:if>
					</div>
					<div class="card-body">
						<div class="card-title">
							<strong style="font-size: 16px; color: #1e90ff;">
								${bizHome.bh_name }</strong> &nbsp; <span style="color: gold;">★</span> <span
								style="font-size: 13px; color: #b1b8c0;">${bizSearchRvPointAvgList[bizHomeStatus.index] }</span>
						</div>
						<div class="pb-2 card-text" style="font-size: 13px;">
							<strong>${bizHome.bh_addr1 }</strong>
						</div>
						<p class="card-text" style="font-size: 12px; color: #b1b8c0">${bizRvContentList[bizHomeStatus.index] }
							...</p>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
		
	<div class="p-3 container-md" style="width: 99%">	
		<div class="w-100 d-flex justify-content-center">
				<img class="w-75 px-4" id="mgzBanner" style="max-width: 840px; border-radius: 5%; cursor:pointer; " src="../../resources/img/bizimg/mgz_banner.jpg" alt="mgz_banner" onclick="location.href='/ibara/biz/magazine/bizMgzContentView?bm_no=1'" />
		</div>
	</div>
	</div>
	
	<div class="loadMoreSpace"></div>

</body>
<%@include file ="../bizFooter.jsp" %>
</html>