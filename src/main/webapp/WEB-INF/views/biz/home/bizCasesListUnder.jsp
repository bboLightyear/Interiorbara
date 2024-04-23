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
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
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
	 
	 .left{
		 text-align: left;	 
	 }
	 a {
	   text-decoration: none;
	   color: #1a1f27;
	}	 

	</style>  
<script>  

$(document).ready(function() {
    // 각 버튼 클릭 시 실행될 함수
        $(this).find("#casesSpn").css({
            "font-weight": "bold",
            "color": "#1e90ff"
        });
    
    
    
    $(".btn-link").click(function() {
        // 모든 span 요소에 대해 스타일 적용
        $(this).find("span").css({
            "font-weight": "bold",
            "color": "#1e90ff"
        });
        
        // 다른 버튼의 span 요소의 스타일 초기화
        $(".btn-link").not(this).find("span").css({
            "font-weight": "normal",
            "color": "#1a1f27"
        });
    });
});

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
</head>
<body>
<jsp:include page="../../modal/mMain.jsp" />
<div class="pt-3 bg-light bg-opacity-75">
	<div class="d-flex justify-content-center">
		<div class="px-3 pb-1" style="width: 1050px" >
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
		<div class="px-5" style="width: 1200px;">
			<div class="input-group d-flex justify-content-center" style="max-width: 1100px">
			    <img src="../../resources/upload/biz/home/${bizHome.bh_img }" onclick="location.href='/ibara/biz/home/bizHome?inteno=${bizHome.inteno}'"  style="width: 1000px; height: 240px; border-top-left-radius: 1%; border-top-right-radius: 1%; cursor:pointer;">  
			</div>   
		</div>
	</div>
		
		<div class="d-flex justify-content-center" >
			<div class="ps-2 pe-3 py-3" style="width: 1000px;  background-color: #e2f0fe; border-bottom-left-radius: 3.5%; border-bottom-right-radius: 3.5%;">
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
			<div class="py-2" style="width: 1000px;">		
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
	<div class="ps-2 pe-3 d-flex justify-content-evenly" style="width: 1000px;">
			<button class="btn btn-link" style="border: 0px; text-decoration: none; color: #1a1f27; justify-content: center;" onclick="returnToHome()"><span id="homeSpn">홈</span></button>
			<c:if test="${empty loginUserDto.memno}">
				<button class="btn btn-link" style="border: 0px; text-decoration: none; color: #1a1f27; justify-content: center;" onclick="redirectLogin()"><span id="casesSpn">시공사례</span></button>
				<button class="btn btn-link" style="border: 0px; text-decoration: none; color: #1a1f27; justify-content: center;" onclick="redirectLogin()"><span id="rvSpn">시공리뷰</span></button>
			</c:if>
			<c:if test="${not empty loginUserDto.memno}">
				<button class="btn btn-link" style="border: 0px; text-decoration: none; color: #1a1f27; justify-content: center;" onclick="loadCasesList()"><span id="casesSpn">시공사례</span></button>
				<button class="btn btn-link" style="border: 0px; text-decoration: none; color: #1a1f27; justify-content: center;" onclick="loadRvList()"><span id="rvSpn">시공리뷰</span></button>
			</c:if>
			<button class="btn btn-link" style="border: 0px; text-decoration: none; color: #1a1f27; justify-content: center;" onclick="loadHomeInfo()"><span id="infoSpn">정보</span></button>
	</div>
</div>
<div class="d-flex justify-content-center" style="height: 1px; margin: 1px; padding: 0px;">
	<hr style="height: 1px; width: 960px; margin: 5px;"/>
</div>
<br />


<div class="clickResult">
	<div class="d-flex justify-content-center">
		<div class="p-3 pt-1" style="width: 950px">
			<table class="table table-hover" style="width: 100%; max-width: 950px">
				<thead>
				    <tr class="table-light">
				      <th scope="col">NO.</th>
				      <th scope="col">작성자</th>
				      <th scope="col">제목</th>
				      <th scope="col">날짜</th>
				      <th scope="col">HIT</th>
				    </tr>
				  </thead>
				
				<c:forEach items="${bizCasesList }" var="dto">
				
					<tr class="" >
						<td class="" onclick="location.href='bizCasesContentView?bc_no=${dto.bc_no }'" style="cursor:pointer;">${dto.bc_no }</td>
						<td class="" onclick="javascript_:window.open('${path}/my/memberinfopage?nickname=${dto.bc_writer }','pop','menubar=no,status=no,scrollbars=no,resizable=no,width=560,height=700,top=50,left=50');" style="cursor: pointer;">${dto.bc_writer } <i class="fa-solid fa-user" style="font-size: 10px;"></i></td>
						<td class="left" >
							<a href="../cases/bizCasesContentView?bc_no=${dto.bc_no }" style="text-align: left; text-decoration: none; color: #1a1f27;">${dto.bc_title }</a>
						</td>
						<td class="" onclick="location.href='bizCasesContentView?bc_no=${dto.bc_no }'" style="cursor:pointer;"><fmt:formatDate value="${dto.bc_date }" type="both" dateStyle="short" pattern="YYYY-MM-dd"/></td>
						<td class="" onclick="location.href='bizCasesContentView?bc_no=${dto.bc_no }'" style="cursor:pointer;">${dto.bc_hit }</td>
					</tr>		
				
				</c:forEach>			
			</table>
		<div class="d-flex justify-content-evenly">
			<form action="bizCasesListUnder" method="get" style="width: 950px;">
				<input type="hidden" name="inteno" value="${inteno }" />
					<div class="d-flex justify-content-center">
						<div class="d-flex align-items-start" style="width: 75%; max-width: 455px;">
								<div>
									<c:choose>
										<c:when test="${bc_title }">
											<input class="form-check-input"  type="checkbox" name="searchType" value="bc_title" checked/>
										</c:when>
										<c:otherwise>
											<input class="form-check-input"  type="checkbox" name="searchType" value="bc_title"/>
										</c:otherwise>
									</c:choose>
										<span style="font-size: 14px;">제목</span>
									<c:choose>
										<c:when test="${bc_content }">
											<input class="form-check-input"  type="checkbox" name="searchType" value="bc_content" checked/>
										</c:when>
										<c:otherwise>
											<input class="form-check-input"  type="checkbox" name="searchType" value="bc_content"/>
										</c:otherwise>
									</c:choose>			 
									 <span style="font-size: 14px;">내용</span>			 
									 
									<input class="mx-2 rounded border border-ddark-subtle" type="text" name="sk" value="${resk }"/>
									<input class="btn btn-outline-primary btn-sm w-10" type="submit" value="검색" />
								</div>
						</div>
					</div>
					
					<div class="p-3 pb-0 mb-0 container-md" style="width: 99%">	
					<div class="w-100 d-flex justify-content-center">
							<div id="bottomDiv">
								<input type="hidden" name="inteno" value="${inteno }" />
									<c:if test="${searchVO.totPage>1}">
										<c:if test="${searchVO.page>1 }">
											<a style="display:inline" href="bizCasesListUnder?inteno=${inteno }&page=1"><i class="fa-solid fa-angles-left"></i></a>
											<a style="display:inline" href="bizCasesListUnder?inteno=${inteno }&page=${searchVO.page-1} "><i class="fa-solid fa-circle-chevron-left"></i></a>
										</c:if>
										
										
										<c:forEach begin="${searchVO.pageStart }" end="${searchVO.pageEnd }" var="i">
											<c:choose>
												<c:when test="${i eq searchVO.page }">
													<span style="color:#1e90ff; font-weight:bold;">${i } &nbsp;</span>		
												</c:when>
												<c:otherwise>			
													<a style="display:inline" href="bizCasesListUnder?inteno=${inteno }&page=${i }&sk=${resk}&bc_title=${bc_title==true?'bc_title':''}
													&bc_content=${bc_content==true?'bc_content':''}"
													style="text-decoration: none;">${i }</a> &nbsp;		
													
												</c:otherwise>
											</c:choose>
										
										
										</c:forEach>
										
										<c:if test="${searchVO.totPage > searchVO.page}">
											<a style="display:inline" href="bizCasesListUnder?inteno=${inteno }&page=${searchVO.page+1} "><i class="fa-solid fa-circle-chevron-right"></i></a>
											<a style="display:inline" href="bizCasesListUnder?inteno=${inteno }&page=${searchVO.totPage}"><i class="fa-solid fa-angles-right"></i></a>
										</c:if>
									</c:if>
								</div>
							</div>
					</div>			
				</form>
			</div>
			<div class="d-flex justify-content-evenly">
				<div class="d-flex justify-content-center" style="width: 950px;">
					<div class="d-flex align-items-start" style="width: 40%; max-width: 380px;">
						<button class="ms-1 btn btn-outline-primary btn-sm w-10"  onclick="location.href='../cases/bizCasesList?inteno=${inteno }'"><span style="font-size: 14px;">크게 보기</span></button>
					</div>
				<div class="d-flex justify-content-end" style="width: 60%; max-width: 570px;">
							<button class="btn btn-outline-primary btn-sm w-10" onclick="location.href='bizCasesListUnder?inteno=${inteno }'"><span style="font-size: 14px;">검색 초기화</span></button>
							<c:if test="${empty loginUserDto.memno}">
		 						<button class="btn btn-outline-primary btn-sm w-10"  onclick="redirectLogin()"><span style="font-size: 14px;">글쓰기</span></button>
							</c:if>
							<c:if test="${not empty loginUserDto.memno}">
								<c:choose>
									<c:when test="${loginUserDto.myinteriordto.inteno eq inteno}">
										<button class="btn btn-outline-primary btn-sm w-10 ms-1" onclick="location.href='../cases/bizCasesWriteView?inteno=${inteno }'"><span style="font-size: 14px;">글쓰기</span></button>
									</c:when>
									<c:otherwise>
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