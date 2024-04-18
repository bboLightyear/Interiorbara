<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${bizHome.bh_name } HOME</title>
<link rel="stylesheet" href="${path}/resources/css/modal.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@5.3.3/dist/zephyr/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<%@include file ="../bizHeader.jsp" %>
<link rel="stylesheet" href="${path}/resources/css/biz/biz.css"/>
<link  rel="stylesheet"
  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>
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
  	
	 .fa-solid{
	 	color: #1034a6;
	 }
	 .fa-solid:hover{
	 	color: #1e90ff;
	 }	 
	 
	 th, tr{
    	text-align: center;	 
	 }
	 
	 #left{
		 text-align: left;	 
	 }
	 
	 a {
	   text-decoration: none;
	   color: #1a1f27;
	}	 
	</style>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script>  
  
	// 좋아요 버튼을 클릭 시 실행되는 코드
	function bmarkChange() {
		const bh_no = '${bizHome.bh_no }';
		const inteno = '${bizHome.inteno }';
		
//		memno가 ''이면 로그인하지 않은 사람으로 취급하여 이후 ajax를 통한 게시판 전환 시 수정, 삭제 등 기능에서 로그인 페이지로 넘어가게 하기 위함
	    if(${empty loginUserDto.memno}==true){memno='';
	 	   }else{memno='${loginUserDto.memno }';}

		console.log('클릭됨');
		
		$.ajax({
	      url: '/ibara/biz/home/bizHomeBmark',
	      type: 'POST',
	      data: { 'bh_no': bh_no,
			'inteno': inteno,
			'memno': memno},
	      success: function (data) {
	  			console.log('데이터전송 성공');
	  			$(".bmarkIcon").html(data);
	      }, error: function () {
	          console.log('비회원입니다.')
	      }
	
	  });
		
	  };
  
  
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
/* 		var inteno = '${bizHome.inteno }';
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
	
			  }); */
		window.location.href = 'bizCasesListUnder?inteno=${inteno }';
	}
	
	function loadRvList() {
/*  		var inteno = '${bizHome.inteno }';
		var memno='';
	    if(${empty memno}==true){memno='';
	 	   }else{memno='${memno }';}
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
	
			  }); */
		window.location.href = 'bizRvListUnder?inteno=${inteno }';
	}
	
	function loadRvListLikeCnt() {
		window.location.href = 'bizRvListUnderLikeCnt?inteno=${inteno }';
			}	

	function loadRvListStarCnt() {
		window.location.href = 'bizRvListUnderStarCnt?inteno=${inteno }';
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
	

	function alertNo() {
		alert('일반회원 외에는 리뷰 작성이 불가능합니다.');
	}
	
     </script>
  </head>
<body>
<jsp:include page="../../modal/mMain.jsp" />
<div class="pt-3 bg-light bg-opacity-75">
	<div class="d-flex justify-content-center">
		<div class="px-3 pb-1" style="width: 750px" >
					<ul class="list-inline">
						<li class="list-inline-item">
							<h4 style="--bs-text-opacity: 1; background-color: #1034a6; padding: 3px; !important;">
						    	<strong onclick="location.href='/ibara/biz/home/bizHome?inteno=${bizHome.inteno}'" style="color: white; cursor:pointer;">${bizHome.bh_name }</strong>
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
			    <img src="../../resources/upload/biz/home/${bizHome.bh_img }" onclick="location.href='/ibara/biz/home/bizHome?inteno=${bizHome.inteno}'"  style="width: 700px; height: 240px; border-top-left-radius: 1%; border-top-right-radius: 1%; cursor:pointer;">  
			</div>   
		</div>
	</div>
		
		<div class="d-flex justify-content-center" >
			<div class="ps-2 pe-3 py-3" style="width: 700px;  background-color: #e2f0fe; border-bottom-left-radius: 3.5%; border-bottom-right-radius: 3.5%;">
				<div class="px-2">
					<div onclick="location.href='/ibara/biz/home/bizRvListUnder?inteno=${bizHome.inteno}'" style="display: inline; cursor: pointer;"><span style="color: gold; font-size: 14px;">★</span> <strong style="font-size: 14px;">${bizHomeRvPointAvg }</strong></div>
					&nbsp;
					<div onclick="location.href='/ibara/biz/home/bizRvListUnder?inteno=${bizHome.inteno}'" style="display: inline; cursor: pointer;"><span style="font-size: 14px;"><i class="fa-regular fa-comment-dots"></i></span> <strong style="font-size: 14px;">${bizHomeRvCnt }+</strong></div>	
					<br />
					<div onclick="location.href='/ibara/biz/search/bizAddrSearchFromHome?inteno=${bizHome.inteno}&addrToSearch=${bizHome.bh_addr1 }'" style="display: inline; cursor: pointer;"><strong style="font-size: 16px; color: #1e90ff">${bizHome.bh_addr1 }</strong></div>
					<br />
					<div onclick="location.href='/ibara/biz/search/bizProSearchBasic?bh_pro=${bizHome.bh_pro }'" style="display: inline; cursor: pointer;"><span style="font-size: 14px; color: grey">${bizHome.bh_pro } 시공 전문	</span></div>						
				</div>	
			</div>
		</div>
		
		<div class="d-flex justify-content-evenly" >
			<div class="py-2" style="width: 700px;">		
				<div class="gap-2 d-flex justify-content-evenly">
					<div style="display: inline; width: 33%">
						<button class="btn btn-secondary btn-lg w-100" onclick="location.href='../home/bizHomeMap?inteno=${inteno }'"><span style="font-size: 16px;">지도 보기</span> </button>
					</div>	
					<div class="bmarkIcon" style="display:inline; width: 33%">
						<button class="btn btn-secondary btn-lg w-100"onclick="bmarkChange()">
						
							<%-- 	<c:if test="${sessionScope.loginId == null || sessionScope.loginId eq 'guest'}"> --%>
							<c:if test="${empty loginUserDto.memno}">
									<span style="font-size: 16px;" onclick="redirectLogin()">
											북마크 <i class="fa-regular fa-bookmark"></i>
									</span>
								</c:if>
								<c:if test="${not empty loginUserDto.memno}">
									<span style="font-size: 16px;">
										북마크
											<c:if test="${isBmarked eq true}">
												<span style="font-size: 16px;">
														<i class="fa-solid fa-bookmark" style="color: gold;"></i></span>
												</c:if>
												<c:if test="${isBmarked eq false}">
													<span style="font-size: 16px;">
														<i class="fa-regular fa-bookmark"></i>
													</span>
											</c:if>
									</span>
							</c:if>	
						</button>
					</div>
					<div style="display:inline; width: 33%">					
						<button class="openModal btn btn-primary btn-lg w-100"><span style="font-size: 16px;">퀵 견적</span></button>
					</div>
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
	<div class="d-flex justify-content-center">
		<div class="p-3 pt-1 pb-0" style="width: 650px">
			<table class="table table-hover" style="width: 100%; max-width: 650px">
				<thead>
				    <tr class="table-light">
				      <th scope="col" class="align-middle" style="cursor:pointer;" onclick="location.href='bizRvListUnderStarCnt?inteno=${inteno}'"><i class="fa-solid fa-star"></i></th>
				      <th scope="col" class="align-middle">이미지</th>
				      <th scope="col" class="align-middle">작성자</th>
				      <th scope="col" class="align-middle">내용</th>
				      <th scope="col" class="align-middle" style="cursor:pointer;" onclick="location.href='bizRvListUnder?inteno=${inteno}'" width="12%">날짜↓</th>
				      <th scope="col" class="align-middle" style="cursor:pointer;" onclick="location.href='bizRvListUnderLikeCnt?inteno=${inteno}'"><i class="fa-solid fa-heart"></i></th>
				    </tr>
				  </thead>
				<c:forEach items="${bizRvList }" var="dto">
					<tr class="">
						<td class="align-middle" width="10%"  onclick="location.href='../review/bizRvContentView?br_no=${dto.br_no }'" style="cursor:pointer;"><span style="color: gold;">★</span> ${dto.br_point }</td>
						<td class="align-middle">
			 				 	<c:forEach items="${joinList }" var="rv">
									<c:if test="${rv.bizRvImgDto.brimg_cgn ne null }">
										<c:set value="${rv.bizRvImgDto.brimg_cgn }" var="filename" />
										<c:set value="${fn:toLowerCase(filename) }" var="fileNm" />
										<c:forTokens items="${fileNm }" delims="." var="token" varStatus="status">
										<c:if test="${status.last }">
											<c:choose>
												<c:when test="${token eq 'jpg' || token eq 'png'}">											
													<c:if test="${dto.br_no eq rv.bizRvImgDto.br_no }">
														<img src="../../resources/upload/biz/review/${rv.bizRvImgDto.brimg_cgn }" alt="${rv.bizRvImgDto.brimg_cgn }" width="48" height="27" style="cursor:pointer"
														onclick="window.open('../review/bizRvImgPopUpView?br_no=${dto.br_no }',
														'new','scrollbars=yes,width=400,height=500');"/>
													</c:if>
												</c:when>
											<c:otherwise> </c:otherwise>		
											</c:choose>
										</c:if>
										</c:forTokens>
									</c:if>			
								</c:forEach>
						</td>
						<td class="align-middle" width=15%; onclick="javascript_:window.open('${path}/my/memberinfopage?nickname=${dto.br_writer }','pop','menubar=no,status=no,scrollbars=no,resizable=no,width=560,height=700,top=50,left=50');" style="cursor: pointer;">${dto.br_writer } <i class="fa-solid fa-user" style="font-size: 10px;"></i></td>
						<td class="align-middle" id="left">
							<a href="../review/bizRvContentView?br_no=${dto.br_no }" style="text-align: left; text-decoration: none; color: #1a1f27;">${dto.br_content }</a>
						</td>
						<td class="align-middle" onclick="location.href='../review/bizRvContentView?br_no=${dto.br_no }'" style="cursor:pointer;"><fmt:formatDate value="${dto.br_date }" type="both" dateStyle="short" pattern="MM-dd"/></td>
						<td class="align-middle" width=7% onclick="location.href='../review/bizRvContentView?br_no=${dto.br_no }'" style="cursor:pointer;">${dto.br_like_cnt }</td>
					</tr>		
				</c:forEach>			
			</table>
		<div class="d-flex justify-content-center">
		<div style="width: 650px">				
			<form action="bizRvListUnder" method="get" style="width: 650px;">
				<input type="hidden" name="inteno" value="${inteno }" />
					<div class="p-3 container-md pt-1 pb-0 mb-0" style="width: 99%">	
					<div class="w-100 d-flex justify-content-center">
							<div id="bottomDiv">
								<c:if test="${searchVO.totPage>1}">
										<c:if test="${searchVO.page>1 }">
											<a style="display:inline" href="bizRvListUnder?inteno=${inteno }&page=1"><i class="fa-solid fa-angles-left"></i></a>
											<a style="display:inline" href="bizRvListUnder?inteno=${inteno }&page=${searchVO.page-1} "><i class="fa-solid fa-circle-chevron-left"></i></a>
										</c:if>
										<c:forEach begin="${searchVO.pageStart }" end="${searchVO.pageEnd }" var="i">
											<c:choose>
												<c:when test="${i eq searchVO.page }">
													<span style="color:#1e90ff; font-weight:bold;">${i } &nbsp;</span>		
												</c:when>
												<c:otherwise>			
												<a style="display:inline" href="bizRvListUnder?inteno=${inteno}&page=${i }"
													style="text-decoration: none;">${i }</a> &nbsp;		
												</c:otherwise>
											</c:choose>
										</c:forEach>
										<c:if test="${searchVO.totPage > searchVO.page}">
											<a style="display:inline" href="bizRvListUnder?page=${searchVO.page+1}&inteno=${inteno} "><i class="fa-solid fa-circle-chevron-right"></i></a>
											<a style="display:inline" href="bizRvListUnder?page=${searchVO.totPage}&inteno=${inteno}"><i class="fa-solid fa-angles-right"></i></a>
										</c:if>
									</c:if>
								</div>
							</div>
					</div>				
				</form>
			</div>
		</div>
	
			<div class="d-flex justify-content-evenly mb-3">
				<div class="d-flex justify-content-center" style="width: 650px;">
					<div class="d-flex align-items-start" style="width: 40%; max-width: 260px;">
						<button class="ms-1 btn btn-outline-primary btn-sm w-10"  onclick="location.href='../review/bizRvList?inteno=${inteno }'"><span style="font-size: 14px;">크게 보기</span></button>
					</div>
					<div class="d-flex justify-content-end pe-1" style="width: 60%; max-width: 390px;">
						<c:if test="${empty loginUserDto.memno}">
	 						<button class="btn btn-outline-primary btn-sm w-10"  onclick="redirectLogin()"><span style="font-size: 14px;">리뷰쓰기</span></button>
						</c:if>
						<c:if test="${not empty loginUserDto.memno}">
							<c:choose>
								<c:when test="${loginUserDto.memtype eq 'PERSON'}">
									<button class="btn btn-outline-primary btn-sm w-10" onclick="location.href='../review/bizRvWriteView?inteno=${inteno }'"><span style="font-size: 14px;">리뷰쓰기</span></button>
								</c:when>
								<c:otherwise>
									<button class="btn btn-outline-primary btn-sm w-10" onclick="alertNo()"><span style="font-size: 14px;">리뷰쓰기</span></button>
								</c:otherwise>							
							</c:choose>
						</c:if>	
					</div>
				</div>
			</div>
		</div>
	</div>			
</div>
		
</body>
<%@include file ="../bizFooter.jsp" %>
</html>