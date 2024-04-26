<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>

<html>

<head>

	<meta charset="UTF-8">
	
	<title>우리 집 자랑하기</title>
	
	<!-- photo.css -->
	<link rel="stylesheet" href="../resources/css/oh/photo.css?after" />
	<!-- OHMainView.css -->
	<link rel="stylesheet" href="../resources/css/oh/OHMainView.css?after" />
	
	<!-- https://fontawesome.com/ -->
	<link  rel="stylesheet"
	  	   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>
	  	   
	<!-- https://jquery.com/ -->		
	<script src="https://code.jquery.com/jquery-3.7.1.js" ></script>
	
	<!-- ----------------------------------------------------- -->
	
	<!-- header, footer -->
	<link rel="stylesheet" 
		  href="${path}/resources/css/header_footer.css" />
	<link rel="stylesheet" 
	      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	
</head>

<body>

<!-- 데이터 표시 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
<%-- 	
	<table border="1">
		<tr>
			<th colspan="16">OHPhotoBoard - OrderDate</th>
		</tr>
		<tr>
			<th>no</th>
			<th>pb_no</th>
			<th>memno</th>
			<th>pb_title</th>
			<th>pb_content</th>
			<th>pb_date</th>
			<th>pb_like</th>
			<th>pb_scrap</th>
			<th>pb_reply</th>
			<th>pb_link</th>
			<th>pb_hit</th>
			<th>pb_residence</th>
			<th>pb_room</th>
			<th>pb_style</th>
			<th>pb_skill</th>
		</tr>
		<c:forEach items="${ohPhotoViewOrderDate }" var="dto">				
			<tr>
				<td>${dto.no }</td>
				<td>${dto.pb_no }</td>
				<td>${dto.memno }</td>
				<td>${dto.pb_title }</td>
				<td>${dto.pb_content }</td>
				<td>${dto.pb_date }</td>
				<td>${dto.pb_like }</td>
				<td>${dto.pb_scrap }</td>
				<td>${dto.pb_reply }</td>
				<td>${dto.pb_link }</td>
				<td>${dto.pb_hit }</td>
				<td>${dto.pb_residence }</td>
				<td>${dto.pb_room }</td>
				<td>${dto.pb_style }</td>
				<td>${dto.pb_skill }</td>
			</tr>		
		</c:forEach>			
		<tr>
			<th colspan="3">OHPhotoAttach - OrderDate</th>
		</tr>
		<tr>
			<th>pa_no</th>
			<th>pa_attach</th>
			<th>pb_no</th>
		</tr>
		<c:forEach items="${ohPhotoViewOrderDate }" var="dto">			
			<tr>
				<td>${dto.ohPhotoAttach.pa_no }</td>
				<td>${dto.ohPhotoAttach.pa_attach }</td>
				<td>${dto.ohPhotoAttach.pb_no }</td>
			</tr>
		</c:forEach>							
	</table>
	
	<table border="1">
		<tr>
			<th colspan="16">OHPhotoBoard - OrderLike</th>
		</tr>
		<tr>
			<th>no</th>
			<th>pb_no</th>
			<th>memno</th>
			<th>pb_title</th>
			<th>pb_content</th>
			<th>pb_date</th>
			<th>pb_like</th>
			<th>pb_scrap</th>
			<th>pb_reply</th>
			<th>pb_link</th>
			<th>pb_hit</th>
			<th>pb_residence</th>
			<th>pb_room</th>
			<th>pb_style</th>
			<th>pb_skill</th>
		</tr>
		<c:forEach items="${ohPhotoViewOrderLike }" var="dto">				
			<tr>
				<td>${dto.no }</td>
				<td>${dto.pb_no }</td>
				<td>${dto.memno }</td>
				<td>${dto.pb_title }</td>
				<td>${dto.pb_content }</td>
				<td>${dto.pb_date }</td>
				<td>${dto.pb_like }</td>
				<td>${dto.pb_scrap }</td>
				<td>${dto.pb_reply }</td>
				<td>${dto.pb_link }</td>
				<td>${dto.pb_hit }</td>
				<td>${dto.pb_residence }</td>
				<td>${dto.pb_room }</td>
				<td>${dto.pb_style }</td>
				<td>${dto.pb_skill }</td>
			</tr>		
		</c:forEach>			
		<tr>
			<th colspan="3">OHPhotoAttach - OrderLike</th>
		</tr>
		<tr>
			<th>pa_no</th>
			<th>pa_attach</th>
			<th>pb_no</th>
		</tr>
		<c:forEach items="${ohPhotoViewOrderLike }" var="dto">			
			<tr>
				<td>${dto.ohPhotoAttach.pa_no }</td>
				<td>${dto.ohPhotoAttach.pa_attach }</td>
				<td>${dto.ohPhotoAttach.pb_no }</td>
			</tr>
		</c:forEach>							
	</table>	
	
	<table border="1">
		<tr>
			<th colspan="16">OHPhotoBoard - OrderHit</th>
		</tr>
		<tr>
			<th>no</th>
			<th>pb_no</th>
			<th>memno</th>
			<th>pb_title</th>
			<th>pb_content</th>
			<th>pb_date</th>
			<th>pb_like</th>
			<th>pb_scrap</th>
			<th>pb_reply</th>
			<th>pb_link</th>
			<th>pb_hit</th>
			<th>pb_residence</th>
			<th>pb_room</th>
			<th>pb_style</th>
			<th>pb_skill</th>
		</tr>
		<c:forEach items="${ohPhotoViewOrderHit }" var="dto">				
			<tr>
				<td>${dto.no }</td>
				<td>${dto.pb_no }</td>
				<td>${dto.memno }</td>
				<td>${dto.pb_title }</td>
				<td>${dto.pb_content }</td>
				<td>${dto.pb_date }</td>
				<td>${dto.pb_like }</td>
				<td>${dto.pb_scrap }</td>
				<td>${dto.pb_reply }</td>
				<td>${dto.pb_link }</td>
				<td>${dto.pb_hit }</td>
				<td>${dto.pb_residence }</td>
				<td>${dto.pb_room }</td>
				<td>${dto.pb_style }</td>
				<td>${dto.pb_skill }</td>
			</tr>		
		</c:forEach>			
		<tr>
			<th colspan="3">OHPhotoAttach - OrderHit</th>
		</tr>
		<tr>
			<th>pa_no</th>
			<th>pa_attach</th>
			<th>pb_no</th>
		</tr>
		<c:forEach items="${ohPhotoViewOrderHit }" var="dto">			
			<tr>
				<td>${dto.ohPhotoAttach.pa_no }</td>
				<td>${dto.ohPhotoAttach.pa_attach }</td>
				<td>${dto.ohPhotoAttach.pb_no }</td>
			</tr>
		</c:forEach>							
	</table>		
--%>	
<%-- 	
	<h3>OHMainView.jsp</h3>

	<!-- 회원, 비회원 구분 후 메세지 출력 -->
	<c:choose>
		<c:when test="${loginUserDto ne null }">
			<h3>${loginUserDto.nickname }님</h3>	
		</c:when>
		<c:otherwise>
			<h3>비회원님</h3>					
		</c:otherwise>
	</c:choose> 
--%>	
<!-- 데이터 표시 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->	

	<!-- 로그인 정보 -->
 	<input type="hidden" id="memno" value=${loginUserDto.memno } />

	<div class="container">
	
		<!-- header -->
		<%@ include file="header.jsp" %>
		
		<div class="contents">
		
			<div class="sideBar">
				<ul >
					<a href="OHMainView"><li class="sideBar-OHMainView">우리 집 자랑하기</li></a>
					<a href="OHPhotoView"><li class="sideBar-OHPhotoView">집사진</li></a>
					<!-- 집영상 -->
					<!-- <li><a href="#">집영상</a></li> -->
					<!-- <li><a href="#">#category</a></li> -->
				</ul>
			</div>
			
			<div id="OHMainView-main">
			
				<div id="OHMainView-main-1">
					<div id="OHMainView-title">우리 집 자랑하기</div>			
					<!-- jQuery 작성완료
						     회원: 글쓰기 가능 
						  비회원: 글쓰기 불가능
						  -->
					<button id="OHMainView-toWriteButton">글쓰기</button> 				
				</div>

				<div id="OHMainView-main-2">					
					<button id="OHMainView-2toOHPhotoViewButton">집사진 - 최신순으로 보기!</button>
					<button id="OHMainView-2toMoreOHPhotoViewButton">더보기 - 최신순</button> 
				</div>
				
				<div id="OHMainView-main-3">				
					<div id="OHMainView-3flexContainer">				
						<!-- 반복문 사용, 게시물 표현 -->
						<c:forEach items="${ohPhotoViewOrderDate }" var="dto" varStatus="status">
							<div class="OHMainView-3box">
								<!-- 게시글 대표 이미지 --> 
								<a href="OHPhotoDetailView?pb_no=${dto.pb_no }&orderingBy=pb_date&orderingMethod=desc">
									<img id="OHMainView-3photoImage" src="../resources/upload/oh/photo/${dto.ohPhotoAttach.pa_attach }" alt="해당 게시글 대표사진"/>
								</a>			
								<div class="OHMainView-3boxLayer">		
									<!-- 게시글 제목 -->
									<div id="OHMainView-3photoTitle">
										<a href="OHPhotoDetailView?pb_no=${dto.pb_no }&orderingBy=pb_date&orderingMethod=desc">
											${dto.pb_title }
										</a>
									</div>
									
									<!-- 게시글 작성자 프로필 이미지 -->	
									
									<%-- 프로필 이미지가 없으면 기본 이미지 --%>
									<c:if test="${empty dto.myMemberInfoDto.profileimg}" >
										<a href="#" onclick="javascript_:window.open('../my/memberinfopage?memno=${dto.myMemberInfoDto.memno }','pop','menubar=no,status=no,scrollbars=no,resizable=no,width=560,height=700,top=50,left=50');">
											<img src="../resources/img/my/user.png" id="OHMainView-3photoProfileImage">
										</a>
							        </c:if>
							        <%-- 프로필 이미지가 있으면 있는 이미지 --%>
							        <c:if test="${!empty dto.myMemberInfoDto.profileimg}" >
							        	<a href="#" onclick="javascript_:window.open('../my/memberinfopage?memno=${dto.myMemberInfoDto.memno }','pop','menubar=no,status=no,scrollbars=no,resizable=no,width=560,height=700,top=50,left=50');">
							            	<img src="../resources/upload/my/${dto.myMemberInfoDto.profileimg }" id="OHMainView-3photoProfileImage">
							            </a>
							        </c:if>	
							        
									<!-- 게시글 작성자 이름 -->
									<div id="OHMainView-3photoUserName">
										<a href="#" onclick="javascript_:window.open('../my/memberinfopage?memno=${dto.myMemberInfoDto.memno }','pop','menubar=no,status=no,scrollbars=no,resizable=no,width=560,height=700,top=50,left=50');">
											${dto.myMemberInfoDto.nickname }
										</a>
									</div>
									
									<!-- 게시글 작성자 조회수 -->
									<div id="OHMainView-3photoHit">조회수</div>
									<!-- 게시글 작성자 조회수 횟수 -->
									<div id="OHMainView-3photoHitCount">${dto.pb_hit }</div>
									<!-- 게시글 작성자 스크랩 -->
									<div id="OHMainView-3photoScrap">좋아요</div>
									<!-- 게시글 작성자 스크랩 횟수 -->
									<div id="OHMainView-3photoScrapCount">${dto.pb_like }</div>
								</div>								
							</div>
						</c:forEach>
					</div>				
				</div>
				
				<div id="OHMainView-main-4">					
					<button id="OHMainView-4toOHPhotoViewButton">집사진 - 인기순으로 보기!</button>
					<button id="OHMainView-4toMoreOHPhotoViewButton">더보기 - 인기순</button> 
				</div>				
				
				<div id="OHMainView-main-5">				
					<div id="OHMainView-5flexContainer">				
						<!-- 반복문 사용, 게시물 표현 -->
						<c:forEach items="${ohPhotoViewOrderLike }" var="dto" varStatus="status">
							<div class="OHMainView-5box">
								<!-- 게시글 대표 이미지 --> 
								<a href="OHPhotoDetailView?pb_no=${dto.pb_no }&orderingBy=pb_like&orderingMethod=desc">
									<img id="OHMainView-5photoImage" src="../resources/upload/oh/photo/${dto.ohPhotoAttach.pa_attach }" alt="해당 게시글 대표사진"/>
								</a>			
								<div class="OHMainView-5boxLayer">		
									<!-- 게시글 제목 -->
									<div id="OHMainView-5photoTitle">
										<a href="OHPhotoDetailView?pb_no=${dto.pb_no }&orderingBy=pb_like&orderingMethod=desc">
											${dto.pb_title }
										</a>
									</div>
									
									<!-- 게시글 작성자 프로필 이미지 -->	
											
									<%-- 프로필 이미지가 없으면 기본 이미지 --%>
									<c:if test="${empty dto.myMemberInfoDto.profileimg}" >
										<a href="#" onclick="javascript_:window.open('../my/memberinfopage?memno=${dto.myMemberInfoDto.memno }','pop','menubar=no,status=no,scrollbars=no,resizable=no,width=560,height=700,top=50,left=50');">
											<img src="../resources/img/my/user.png" id="OHMainView-5photoProfileImage">
										</a>
							        </c:if>
							        
							        <%-- 프로필 이미지가 있으면 있는 이미지 --%>
							        <c:if test="${!empty dto.myMemberInfoDto.profileimg}" >
							        	<a href="#" onclick="javascript_:window.open('../my/memberinfopage?memno=${dto.myMemberInfoDto.memno }','pop','menubar=no,status=no,scrollbars=no,resizable=no,width=560,height=700,top=50,left=50');">
							            	<img src="../resources/upload/my/${dto.myMemberInfoDto.profileimg }" id="OHMainView-5photoProfileImage">
							            </a>
							        </c:if>	
							        
									<!-- 게시글 작성자 이름 -->
									<div id="OHMainView-5photoUserName">
										<a href="#" onclick="javascript_:window.open('../my/memberinfopage?memno=${dto.myMemberInfoDto.memno }','pop','menubar=no,status=no,scrollbars=no,resizable=no,width=560,height=700,top=50,left=50');">
											${dto.myMemberInfoDto.nickname }
										</a>
									</div>
									
									<!-- 게시글 작성자 조회수 -->
									<div id="OHMainView-5photoHit">조회수</div>
									<!-- 게시글 작성자 조회수 횟수 -->
									<div id="OHMainView-5photoHitCount">${dto.pb_hit }</div>
									<!-- 게시글 작성자 스크랩 -->
									<div id="OHMainView-5photoScrap">좋아요</div>
									<!-- 게시글 작성자 스크랩 횟수 -->
									<div id="OHMainView-5photoScrapCount">${dto.pb_like }</div>
								</div>								
							</div>
						</c:forEach>
					</div>				
				</div>				
				
				<div id="OHMainView-main-6">					
					<button id="OHMainView-6toOHPhotoViewButton">집사진 - 조회순으로 보기!</button>
					<button id="OHMainView-6toMoreOHPhotoViewButton">더보기 - 조회순</button> 
				</div>					
				
				<div id="OHMainView-main-7">				
					<div id="OHMainView-7flexContainer">				
						<!-- 반복문 사용, 게시물 표현 -->
						<c:forEach items="${ohPhotoViewOrderHit }" var="dto" varStatus="status">
							<div class="OHMainView-7box">
								<!-- 게시글 대표 이미지 --> 
								<a href="OHPhotoDetailView?pb_no=${dto.pb_no }&orderingBy=pb_hit&orderingMethod=desc">
									<img id="OHMainView-7photoImage" src="../resources/upload/oh/photo/${dto.ohPhotoAttach.pa_attach }" alt="해당 게시글 대표사진"/>
								</a>			
								<div class="OHMainView-7boxLayer">		
									<!-- 게시글 제목 -->
									<div id="OHMainView-7photoTitle">
										<a href="OHPhotoDetailView?pb_no=${dto.pb_no }&orderingBy=pb_hit&orderingMethod=desc">
											${dto.pb_title }
										</a>
									</div>
									
									<!-- 게시글 작성자 프로필 이미지 -->	
											
									<%-- 프로필 이미지가 없으면 기본 이미지 --%>
									<c:if test="${empty dto.myMemberInfoDto.profileimg}" >
										<a href="#" onclick="javascript_:window.open('../my/memberinfopage?memno=${dto.myMemberInfoDto.memno }','pop','menubar=no,status=no,scrollbars=no,resizable=no,width=560,height=700,top=50,left=50');">
											<img src="../resources/img/my/user.png" id="OHMainView-7photoProfileImage">
										</a>
							        </c:if>
							        
							        <%-- 프로필 이미지가 있으면 있는 이미지 --%>
							        <c:if test="${!empty dto.myMemberInfoDto.profileimg}" >
							        	<a href="#" onclick="javascript_:window.open('../my/memberinfopage?memno=${dto.myMemberInfoDto.memno }','pop','menubar=no,status=no,scrollbars=no,resizable=no,width=560,height=700,top=50,left=50');">
							            	<img src="../resources/upload/my/${dto.myMemberInfoDto.profileimg }" id="OHMainView-7photoProfileImage">
							            </a>
							        </c:if>	
							        
									<!-- 게시글 작성자 이름 -->
									<div id="OHMainView-7photoUserName">
										<a href="#" onclick="javascript_:window.open('../my/memberinfopage?memno=${dto.myMemberInfoDto.memno }','pop','menubar=no,status=no,scrollbars=no,resizable=no,width=560,height=700,top=50,left=50');">
											${dto.myMemberInfoDto.nickname }
										</a>
									</div>
									
									<!-- 게시글 작성자 조회수 -->
									<div id="OHMainView-7photoHit">조회수</div>
									<!-- 게시글 작성자 조회수 횟수 -->
									<div id="OHMainView-7photoHitCount">${dto.pb_hit }</div>
									<!-- 게시글 작성자 스크랩 -->
									<div id="OHMainView-7photoScrap">좋아요</div>
									<!-- 게시글 작성자 스크랩 횟수 -->
									<div id="OHMainView-7photoScrapCount">${dto.pb_like }</div>
								</div>								
							</div>
						</c:forEach>
					</div>				
				</div>								
				
				<!-- 집영상 -->
				<!-- 				
				<div id="OHMainView-main-8">
					<button id="OHMainView-8toOHVideoViewButton">집영상</button>
					<button id="OHMainView-8toMoreOHVideoViewButton">더보기</button> 
				</div>  
				-->
				
				<!-- 			
				<div id="OHMainView-main-9">
					<button id="OHMainView-9toCategoryView">#category</button>
					<span id="OHMainView-9toCategoryText">카테고리별로 보고 싶다면 여기!</span>			
				</div> 
				-->

			</div>
								
		</div>
		
		<!-- footer -->
		<%@ include file="footer.jsp" %>
		
	</div>	
	
	<!-- OHMainView.js -->
	<script src="../resources/js/oh/OHMainView.js"></script>
	
</body>

</html>