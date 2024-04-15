<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<style>
    .br_content {
        margin: 20px;
        display: block;
        color: black;
        width: 400px;
        font-size: 12px;
        font-weight: normal;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: normal;
        line-height: 1.2;
        height: 4.8em;
        text-align: left;
        word-wrap: break-word;
        display: -webkit-box;
        -webkit-line-clamp: 4 ;
        -webkit-box-orient: vertical;
    }
</style>

<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script>
$(document).ready(function () {
	const bh_no = '${bizHome.bh_no }';
	const inteno = '${bizHome.inteno }';
	var memno;
//	memno가 ''이면 로그인하지 않은 사람으로 취급하여 이후 ajax를 통한 게시판 전환 시 수정, 삭제 등 기능에서 로그인 페이지로 넘어가게 하기 위함
    if(${empty loginUserDto.memno}==true){memno='';
 	   }else{memno='${loginUserDto.memno }';}
	
	
	var isBmarked = "${isBmarked}";
	
	const bmarkImg = document.getElementById("bmarkImg");
	
	if (isBmarked == "true") {
		bmarkImg.src = "../../resources/img/bizimg/bookmarked.png";
	}
	else {
		bmarkImg.src = "../../resources/img/bizimg/bookmarkempty.png";
	}
	
	// 좋아요 버튼을 클릭 시 실행되는 코드
	$("#bmarkButton").on("click", function () {
		
		console.log('클릭됨');
		
		$.ajax({
	      url: '/ibara/biz/home/bizHomeBmark',
	      type: 'POST',
	      data: { 'bh_no': bh_no,
			'inteno': inteno,
			'memno': memno},
	      success: function (data) {
	  			console.log('데이터전송 성공');
	          if (data == 1) {
	              $(".bmarkImg").attr("src", "../../resources/img/bizimg/bookmarked.png");
	              location.reload();
	          } else {
	              $(".bmarkImg").attr("src", "../../resources/img/bizimg/bookmarkempty.png");
	              location.reload();
	          }
	      }, error: function () {
	          $(".bmarkImg").attr("src", "../../resources/img/bizimg/bookmarkempty.png");
	          console.log('비회원입니다.')
	      }

	  });
	  });
	
	
  });
  
  
	function returnToHome() {
		var inteno = '${bizHome.inteno }';
	   	/* Home으로 div 업데이트 */
	   	console.log('데이터전송 시작');
			$.ajax({
			      url: '/ibara/biz/home/bizHomeUnder',
			      type: 'POST',
			      data: { 
			    	  'inteno': inteno
			      },
			      success: function (data) {
			  			console.log('데이터전송 성공');
			        	$(".clickResult").html(data);
			      }, error: function () {
			          console.log('오타가 있습니다.')
			      }
	
			  });
	}
	
	
	function loadCasesList() {
		var inteno = '${bizHome.inteno }';
	   	console.log('데이터전송 시작');
			$.ajax({
			      url: '/ibara/biz/cases/bizCasesListUnder',
			      type: 'POST',
			      data: {
			    	  'inteno': inteno
			      },
			      success: function (data) {
			  			console.log('데이터전송 성공');
			        	$(".clickResult").html(data);
			      }, error: function () {
			          console.log('오타가 있습니다.')
			      }
	
			  });
	}
	
	function loadRvList() {
		var inteno = '${bizHome.inteno }';
		var memno='';
	    if(${empty memno}==true){memno='';
	 	   }else{memno='${memno }';}
	   	/* Home으로 div 업데이트 */
	   	console.log('데이터전송 시작');
			$.ajax({
			      url: '/ibara/biz/review/bizRvListUnder',
			      type: 'POST',
			      data: { 
			    	  'inteno': inteno,
			    	  'memno': memno
			      },
			      success: function (data) {
			  			console.log('데이터전송 성공');
			        	$(".clickResult").html(data);
			      }, error: function () {
			          console.log('오타가 있습니다.')
			      }
	
			  });
	}
	
	function loadHomeInfo() {
		var inteno = '${bizHome.inteno }';
		var memno='';
	    if(${empty memno}==true){memno='';
	 	   }else{memno='${memno }';}
	   	/* Home으로 div 업데이트 */
	   	console.log('데이터전송 시작');
			$.ajax({
			      url: '/ibara/biz/home/bizHomeInfoView',
			      type: 'POST',
			      data: { 
			    	  'inteno': inteno,
			    	  'memno': memno
			      },
			      success: function (data) {
			  			console.log('데이터전송 성공');
			        	$(".clickResult").html(data);
			      }, error: function () {
			          console.log('오타가 있습니다.')
			      }
	
			  });
	}


	function redirectLogin() {
		alert('로그인 후 이용하실 수 있습니다. 로그인 화면으로 이동합니다.');
		window.location.href = "../../my/loginform";
	}
	
     </script>

<meta charset="UTF-8">
<title>${bizHome.bh_name } HOME</title>
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
	</style>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>

<div class="pt-3 bg-light bg-opacity-75">
	<div class="d-flex justify-content-center">
		<div class="px-3 pb-1" style="width: 750px" >
					<ul class="list-inline">
						<li class="list-inline-item">
							<h4 style="--bs-text-opacity: 1; background-color: #1034a6; padding: 3px; !important;">
						    	<strong style="color: white;">${bizHome.bh_name }</strong>
						   	</h4>
						</li>
					</ul>	
		</div>
		<div class="d-flex align-items-end mb-4" onclick="location.href='/ibara/biz/search/bizAddrSearch'">
			<span class="text-body-secondary" style="font-size: 12px; cursor:pointer;">다시 검색 <i class="fa-solid fa-rotate-left" style="cursor:pointer;"></i></span>
		</div>
	</div>
	
	<div class="d-flex justify-content-center">	
		<div class="px-5" style="width: 900px;">
			<div class="input-group d-flex justify-content-center" style="max-width: 1100px">
			    <img src="../../resources/upload/biz/home/${bizHome.bh_img }" style="width: 700px; height: 240px; border-top-left-radius: 1%; border-top-right-radius: 1%;">  
			</div>   
		</div>
	</div>
		
		<div class="d-flex justify-content-center" >
			<div class="ps-2 pe-3 py-3" style="width: 700px;  background-color: #e2f0fe; border-bottom-left-radius: 3.5%; border-bottom-right-radius: 3.5%;">
				<div class="px-2">
					<span style="color: gold; font-size: 14px;">★</span> <strong style="font-size: 14px;">${bizHomeRvPointAvg }</strong>
					&nbsp;
					<span style="font-size: 14px;"><i class="fa-regular fa-comment-dots"></i></span> <strong style="font-size: 14px;">${bizHomeRvCnt }+</strong>	
					<br />
					<strong style="font-size: 16px; color: #1e90ff">${bizHome.bh_addr1 }</strong>
					<br />
					<span style="font-size: 14px; color: grey">${bizHome.bh_pro } 시공 전문	</span>							
				</div>	
			</div>
		</div>
		
		<div class="d-flex justify-content-evenly" >
			<div class="py-2" style="width: 700px;">		
				<div class="gap-2 d-flex justify-content-evenly">
					<button class="btn btn-secondary btn-lg w-100" onclick="location.href='../home/bizHomeMap?inteno=${inteno }'"><span style="font-size: 16px;">지도 보기</span> </button>
					<button class="btn btn-secondary btn-lg w-100" id="bmarkButton">
					
						<%-- 	<c:if test="${sessionScope.loginId == null || sessionScope.loginId eq 'guest'}"> --%>
						<c:if test="${empty loginUserDto.memno}">
							<span style="font-size: 16px;" onclick="redirectLogin()">
									북마크
									<img class="bmarkImg" id="bmarkImg" src="../../resources/img/bizimg/bookmarkempty.png"
									width="16px" height="16px" style="margin-bottom: 5px;"></span>
							</c:if>
							<c:if test="${not empty loginUserDto.memno}">
								<span style="font-size: 16px;">
									북마크
									<img class="bmarkImg" id="bmarkImg" src="../../resources/img/bizimg/bookmarkempty.png"
									width="16px" height="16px" style="margin-bottom: 5px;">
								</span>
						</c:if>	
					
					
					
					
					</button>
					<button class="btn btn-primary btn-lg w-100"><span style="font-size: 16px;">퀵 견적</span></button>
				</div>		
			</div>	
		</div>		
		
		<div class="text-primary text-opacity-25">
			<hr />
		</div>
</div>

<div class="d-flex justify-content-evenly">
	<div class="ps-2 pe-3 d-flex justify-content-evenly" style="width: 700px;">
			<button class="btn btn-link" style="border: 0px; text-decoration: none; color: #1a1f27; justify-content: center;" onclick="returnToHome()">홈</button>
			<c:if test="${empty loginUserDto.memno}">
				<button class="btn btn-link" style="border: 0px; text-decoration: none; color: #1a1f27; justify-content: center;" onclick="redirectLogin()">시공사례</button>
				<button class="btn btn-link" style="border: 0px; text-decoration: none; color: #1a1f27; justify-content: center;" onclick="redirectLogin()">시공리뷰</button>
			</c:if>
			<c:if test="${not empty loginUserDto.memno}">
				<button class="btn btn-link" style="border: 0px; text-decoration: none; color: #1a1f27; justify-content: center;" onclick="loadCasesList()">시공사례</button>
				<button class="btn btn-link" style="border: 0px; text-decoration: none; color: #1a1f27; justify-content: center;" onclick="loadRvList()">시공리뷰</button>
			</c:if>
			<button class="btn btn-link" style="border: 0px; text-decoration: none; color: #1a1f27; justify-content: center;" onclick="loadHomeInfo()">정보</button>
	</div>
</div>
<div class="d-flex justify-content-center" style="height: 1px; margin: 1px; padding: 0px;">
	<hr style="height: 1px; width: 680px; margin: 5px;"/>
</div>
<br />
<div class="clickResult">
	
	<div class="d-flex justify-content-evenly">
		<div class="ps-2 pe-3 d-flex justify-content-evenly" style="width: 660px;">
			<div class="card" style="width: 100%; background-color: #e2f0fe; border:#f9fafb">
			  <div class="card-body">
			    <p class="card-text px-5 text-center" style="font-size: 14px;">${bizHome.bh_notice }</p>
			  </div>
			</div>
		</div>
	</div>
	
	<div class="d-flex justify-content-evenly">
		<div class="p-3 d-flex" style="width: 660px;">
			<span style="font-size: 14px;"><strong>시공사례 (${bizHomeCasesCnt })</strong></span>
		</div>
	</div>
	
	<div class="d-flex justify-content-evenly">
		<div class="p-3 d-flex justify-content-evenly" style="width: 700px;">
			<div width="100%">
				<c:forEach items="${bizHomeCasesImgList }" var="hc_img">
					<c:if test="${hc_img.bcimg_cgn ne null }">
						<c:set value="${hc_img.bcimg_cgn }" var="filename" />
						<c:set value="${fn:toLowerCase(filename) }" var="fileNm" />
						<c:forTokens items="${fileNm }" delims="." var="token" varStatus="status">
						<c:if test="${status.last }">
							<c:choose>
								<c:when test="${token eq 'jpg' || token eq 'png'}">											
									<img src="../../resources/upload/biz/cases/${hc_img.bcimg_cgn }" alt="${hc_img.bcimg_cgn }" width="29%" height="102px" style="cursor:pointer;"
									onclick="location.href='../cases/bizCasesContentView?bc_no=${hc_img.bc_no }'"/>
								</c:when>
								<c:otherwise> </c:otherwise>		
								</c:choose>
							</c:if>
							</c:forTokens>
					</c:if>			
				</c:forEach>	
				<span>
					<c:if test="${empty loginUserDto.memno}">
						<button class="btn btn-outline-primary" style="width:9%; height: 100%" onclick="redirectLogin()">+</button>
					</c:if>
					<c:if test="${not empty loginUserDto.memno}">
						<button class="btn btn-outline-primary" style="width:9%; height: 100%" onclick="location.href='../cases/bizCasesList?inteno=${inteno }'">+</button>
					</c:if>	
				</span>
			</div>		
		</div>
	</div>
	
	<div class="d-flex justify-content-evenly">
		<div class="p-3 d-flex" style="width: 660px;">
			<span style="font-size: 14px;"><strong>시공리뷰 (${bizHomeRvCnt })</strong></span>
		</div>
	</div>
	
	<div class="d-flex justify-content-evenly">
		<div class="px-3 pb-3 d-flex justify-content-evenly" style="width: 700px;">
			<div style="width: 83%">
				<table style="border-collapse: separate; border-spacing: 10px;">
					<c:forEach items="${bizHomeRvImgList }" var="hr_img">
						<tr>
								<td width="25%">
									<c:if test="${hr_img.bizRvImgDto.brimg_cgn ne null }">
										<c:set value="${hr_img.bizRvImgDto.brimg_cgn }" var="filename" />
										<c:set value="${fn:toLowerCase(filename) }" var="fileNm" />
										<c:forTokens items="${fileNm }" delims="." var="token" varStatus="status">
										<c:if test="${status.last }">
											<c:choose>
												<c:when test="${token eq 'jpg' || token eq 'png'}">											
													<span onclick="location.href='../review/bizRvContentView?br_no=${hr_img.br_no }'" style="cursor:pointer;">
															<img src="../../resources/upload/biz/review/${hr_img.bizRvImgDto.brimg_cgn }" alt="${hr_img.bizRvImgDto.brimg_cgn }" style="cursor:pointer; width: 100%; height:100px"/>
													</span>
												</c:when>
											<c:otherwise> </c:otherwise>	
											</c:choose>
										</c:if>
										</c:forTokens>
									</c:if>	
								</td>
								<td width="75%">
									<span onclick="location.href='../review/bizRvContentView?br_no=${hr_img.br_no }'" style="cursor:pointer; height: 100%;">
										<span class="br_content" style="width: 90%;">
											${hr_img.br_content }
										</span>
									</span>	
								</td>
						</tr>
					</c:forEach>
				</table>
				<span class="d-flex justify-content-evenly" width="100%">
					<c:if test="${empty loginUserDto.memno}">
						<button class="btn btn-outline-primary" style="width: 95%; height: 10%;" onclick="redirectLogin()">+</button>
					</c:if>
					<c:if test="${not empty loginUserDto.memno}">
						<button class="btn btn-outline-primary" style="width: 95%; height: 10%;" onclick="location.href='../review/bizRvList?inteno=${inteno }'">+</button>
					</c:if>					
				</span>
			</div>
		</div>
	</div>
</div>
		
</body>
</html>