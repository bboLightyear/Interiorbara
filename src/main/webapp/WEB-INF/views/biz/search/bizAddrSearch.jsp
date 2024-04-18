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
$(document).ready(function () {

    const body = document.body;
    const html = document.documentElement;
    
    let sortResult = document.querySelector('.sortResult');
	//footer에 listend를 집어넣기 이전에 사용
    //$('.sortResult').css('height', sortResult.scrollHeight); // 높이를 변경
    
    let mgzBanner=document.querySelector('#mgzBanner');
	
	// Intersection Observer 설정
	let options = {
	    root: null,
	    rootMargin: '0px',
	    threshold: 0
	};

	
	// 페이지의 끝 요소
	let listEnd = document.querySelector('.listEnd');

	// 추가 데이터를 로드할 공간 요소
	let loadMoreSpace = document.querySelector('.loadMoreSpace');

	// Intersection Observer 생성
	let observer = new IntersectionObserver(callback, options);

	// 페이지의 끝 요소를 관찰
	observer.observe(listEnd);
	
	var sk='${resk }';
	var page=${searchVO.page };	
	var pageEnd=${searchVO.totPage };
	
	// 페이지의 끝 요소가 화면에 진입할 때 실행되는 콜백 함수
	function callback(entries, observer) {
	    entries.forEach(entry => {
	        if (entry.isIntersecting) {
	        	$.ajax({
	        	    url: '/ibara/biz/search/bizAddrSearchMore',
	        	    method: 'POST',
	        	    data: {'page' : page,
	        	    		'sk' : sk}, // 다음 페이지 번호를 서버에 전달할 수 있음
	        	    success: function (data) {
		        		//console.log('sortResult.scrollHeight: '+sortResult.scrollHeight);
		        		//console.log('loadMoreSpace.scrollHeight: '+loadMoreSpace.scrollHeight);
	        	        if(page==pageEnd){
	        	        	observer.unobserve(entry.target);
	        	        }else{
		                	//footer에 listend를 집어넣기 이전에 사용
		                	//$('.loadMoreSpace').css('height', sortResult.scrollHeight+loadMoreSpace.scrollHeight-mgzBanner.scrollHeight); // 높이를 변경 
		        	        // 서버에서 받아온 데이터를 loadMoreSpace에 추가
		        	        loadMoreSpace.innerHTML += data;
		        	        observer.unobserve(entry.target);
		        	        // 새로운 페이지의 끝 요소를 관찰
		        	        let newEnd = document.querySelector('.listEnd');
		        	        observer.observe(newEnd);
				    	    page++;
	        	        }
	        	        
	        	    }, // 이 부분이 수정됨
	        	    error: function (error) { // catch 대신 error를 사용
	        	        console.error('Error fetching page:', error);
	        	    }
	        	});
	            
	            // 이벤트를 한 번만 처리하도록 관찰 해제
	            observer.unobserve(entry.target);
	        }
	    });
	}

        });


	 function popUpAddrSearch() {
		new daum.Postcode({
			 oncomplete: function(data) {
	        	        //data는 사용자가 선택한 주소 정보를 담고 있는 객체이며, 상세 설명은 아래 목록에서 확인하실 수 있습니다.
	        	    	var addrToSearch =data.sigungu;
	        	    	document.getElementById('addrSigungu').value = addrToSearch;
	        	    	/* DB에서 ADDR1에 해당 시/군/구가 LIKE로 비슷하게 들어가는 업체 검색 돌려줄 함수 */
	        	    	console.log('데이터전송 시작');
	        			$.ajax({
	        			      url: '/ibara/biz/search/bizAddrSearchBasic',
	        			      type: 'POST',
	        			      data: { 'addrToSearch': addrToSearch
	        			      },
	        			      success: function (data) {
	        			  			console.log('데이터전송 성공');
	        			  			$('.listEnd').remove();
	        			        	$(".sortResult").html(data);
	        			      }, error: function () {
	        			    	  $(".sortResult").load();
	        			          console.log('오타가 있습니다.')
	        			      }

	        			  });
	        	    }
		
	    }).open({
	        popupKey: 'popup1' //팝업창 Key값 설정 (영문+숫자 추천)
	    });
	    }
	 
	 
	 function returnToBasic() {
		 var addrToSearch=document.getElementById('addrSigungu').value;
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
		 var addrToSearch=document.getElementById('addrSigungu').value;
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
		 var addrToSearch=document.getElementById('addrSigungu').value;
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
		 var addrToSearch=document.getElementById('addrSigungu').value;
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
			<div onclick="location.reload()">
				<span class="text-body-secondary" style="font-size: 12px; cursor:pointer;">검색 초기화 <i class="fa-solid fa-rotate-left" style="cursor:pointer;"></i></span>
			</div>
			<div> &nbsp; &nbsp; </div>
			<div onclick="location.href='/ibara/biz/search/bizProSearch'">
				<span class="text-body-secondary" style="font-size: 12px; cursor:pointer;">전문시공 검색 <i class="fa-solid fa-magnifying-glass" style="cursor:pointer;"></i></span>	
			</div>
		</div>
	</div>
	
	<div class="d-flex justify-content-center">	
		<div class="px-5" style="width: 900px;">
			<div class="input-group pb-4" style="max-width: 1100px">
			      <input type="text" class="form-control" id="addrSigungu" placeholder="시공하실 주소 검색하기" onclick="popUpAddrSearch();" readonly />
		      <button class="btn btn-primary btn-sm" type="button" style="cursor:pointer; " onclick="popUpAddrSearch();">주소변경</button>
		    </div>
		</div>
		<div class="text-primary text-opacity-25">
			<hr />
		</div>
	</div>
</div>


<div class="sortResult">
	<div class="w-100 d-flex justify-content-center">
		<div class="p-3" style="width: 850px;">
			<ul class="w-100 list-inline">
					<div class="float-start">
						<li class="list-inline-item">
							<h5><strong class="align-middle">업체 둘러보기</strong></h5>
						</li>
					</div>
					<div class="float-end">	
						<li class="list-inline-item">
							<div class="px-3">
								<form class="d-flex" action="/ibara/biz/search/bizAddrSearch" method="post">
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

		<div class="px-5 pt-2 container-md" style="max-width: 900px">
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