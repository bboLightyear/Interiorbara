<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>

<html>

<head>
	
	<meta charset="UTF-8">
	
	<title>OH - PhotoDetailView.jsp</title>
	
	<!-- oh.css -->
	<link rel="stylesheet" href="../resources/css/oh/photo.css?after" />
	<!-- OHPhotoDetailView.css -->
	<link rel="stylesheet" href="../resources/css/oh/OHPhotoDetailView.css?after" />		
	
	<!-- https://fontawesome.com/ -->
	<link  rel="stylesheet"
	  	   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>
	  	   
	<!-- https://jquery.com/ -->		
	<script src="https://code.jquery.com/jquery-3.7.1.js" ></script>
		
</head>

<body>
	
	<!-- 데이터 표시 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<table border="1">
		<tr>
			<th colspan="15">OHPhotoBoard</th>
		</tr>
		<tr>
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
		<tr>
			<td>${pb_dto.pb_no }</td>
			<td>${pb_dto.memno }</td>
			<td>${pb_dto.pb_title }</td>
			<td>${pb_dto.pb_content }</td>
			<td>${pb_dto.pb_date }</td>
			<td>${pb_dto.pb_like }</td>
			<td>${pb_dto.pb_scrap }</td>
			<td>${pb_dto.pb_reply }</td>
			<td>${pb_dto.pb_link }</td>
			<td>${pb_dto.pb_hit }</td>
			<td>${pb_dto.pb_residence }</td>
			<td>${pb_dto.pb_room }</td>
			<td>${pb_dto.pb_style }</td>
			<td>${pb_dto.pb_skill }</td>
		</tr>		
		<tr>
			<th colspan="15">OHPhotoAttach</th>
		</tr>
		<tr>
			<th>pa_no</th>
			<th>pa_attach</th>
			<th>pb_no</th>
		</tr>
		<c:forEach items="${pa_dto }" var="dto">			
			<tr>
				<td>${dto.pa_no }</td>
				<td>${dto.pa_attach }</td>
				<td>${dto.pb_no }</td>
			</tr>
		</c:forEach>	
		<tr>
			<th colspan="4">OHPhotoLike</th>
		</tr>	
		<tr>
			<th>pl_no</th>
			<th>memno</th>
			<th>pl_date</th>
			<th>pb_no</th>
		</tr>
		<tr>
			<td>${ohPhotoDetailLike.pl_no }</td>
			<td>${ohPhotoDetailLike.memno }</td>
			<td>${ohPhotoDetailLike.pl_date }</td>
			<td>${ohPhotoDetailLike.pb_no }</td>
		</tr>
		<tr>
			<th colspan="4">OHPhotoScrap</th>
		</tr>	
		<tr>
			<th>ps_no</th>
			<th>memno</th>
			<th>ps_date</th>
			<th>pb_no</th>
		</tr>
		<tr>
			<td>${ohPhotoDetailScrap.ps_no }</td>
			<td>${ohPhotoDetailScrap.memno }</td>
			<td>${ohPhotoDetailScrap.ps_date }</td>
			<td>${ohPhotoDetailScrap.pb_no }</td>
		</tr>		
	
	</table>
	<!-- 데이터 표시 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

	<h3>OHPhotoDetailView.jsp</h3>

	<!-- 회원, 비회원 구분 후 메세지 출력 -->
	<c:choose>
		<c:when test="${loginUserDto ne null }">
			<h3>${loginUserDto.nickname }님</h3>	
		</c:when>
		<c:otherwise>
			<h3>비회원님</h3>					
		</c:otherwise>
	</c:choose>	

	<!-- 로그인 정보 -->
 	<input type="hidden" id="memno" value=${loginUserDto.memno } />
	<!-- 게시글 정보 -->
	<input type="hidden" id="pb_no" value=${pb_dto.pb_no } />

	<div class="container">
	
		<header>
			<h1>header</h1>
		</header>
		
		<div class="contents">
	
			<div class="sideBar">
				<ul >
					<li><a href="OHMainView">우리 집 자랑하기</a></li>
					<li><a href="OHPhotoView">집사진</a></li>
					<!-- 집영상 -->
					<!-- <li><a href="">집영상</a></li> -->
					<!-- <li><a href="#">#category</a></li> -->
				</ul>
			</div>							

			<div id="OHPhotoDetailView-main">
				
				<div id="OHPhotoDetailView-main-1">
				
					<div id="OHPhotoDetailView-main-1Title">${pb_dto.pb_title }</div>
					
					<!-- 비회원 불가 -->
					<button id="OHPhotoDetailView-main-1toWriteButton">글쓰기</button> 
					
					<!-- 해당 게시물 작성자일 경우 => 수정, 삭제 버튼 생성 -->
					
					<c:choose>
						<c:when test="${loginUserDto.memno eq pb_dto.memno }">					
							<!-- 수정 버튼 -->
							<button id="OHPhotoDetailView-main-1toEditButton" onclick="location.href='OHPhotoEditView?pb_no=${pb_dto.pb_no }'">수정</button>
							<!-- 삭제 버튼 -->
							<button id="OHPhotoDetailView-main-1toDeleteButton" onclick="location.href='OHPhotoDeleteExecute?pb_no=${pb_dto.pb_no }'">삭제</button>					
						</c:when>
						<c:otherwise></c:otherwise>
					</c:choose>	
										
				</div>				
				
				<c:if test="${pb_dto.pb_residence ne null || pb_dto.pb_room ne null || pb_dto.pb_style ne null || pb_dto.pb_skill ne null }">
					<div id="OHPhotoDetailView-main-2">
						<c:if test="${pb_dto.pb_residence ne null }">
							<span id="OHPhotoDetailView-main-2residence">
								주거형태 <br>
								${pb_dto.pb_residence }
							</span>
						</c:if>
						<c:if test="${pb_dto.pb_room ne null }">
							<span id="OHPhotoDetailView-main-2room">
								공간 <br>
								${pb_dto.pb_room }
							</span>
						</c:if>
						<c:if test="${pb_dto.pb_style ne null }">
							<span id="OHPhotoDetailView-main-2style">
								스타일 <br>
								${pb_dto.pb_style }
							</span>
						</c:if>
						<c:if test="${pb_dto.pb_skill ne null }">
							<span id="OHPhotoDetailView-main-2skill">
								셀프/전문가 <br>
								${pb_dto.pb_skill }
							</span>
						</c:if>
					</div>					
				</c:if>

				<div id="OHPhotoDetailView-main-3">
					<!-- 게시물, 이미지 출력 -->
					<c:forEach items="${pa_dto }" var="dto">	
						<div class="OHPhotoDetailView-main-3photoSector">
							<img src="../resources/upload/oh/photo/${dto.pa_attach }" alt="해당 게시글 사진"/>					
						</div>
					</c:forEach>	
				</div>				
				
				<div id="OHPhotoDetailView-main-4">
					<span id="OHPhotoDetailView-main-4photoContent">
						${pb_dto.pb_content }											
					</span>					
				</div>

				<div id="OHPhotoDetailView-main-5">
					<span id="OHPhotoDetailView-main-5dateLable">
						작성일 
					</span>
					<span id="OHPhotoDetailView-main-5date">
						<fmt:formatDate value="${pb_dto.pb_date }" pattern="yyyy.MM.dd" />					
					</span>
				</div>

				<div id="OHPhotoDetailView-main-6">
				
					<!-- 좋아요, 이미지 -->
					<c:choose>
						<c:when test="${ohPhotoDetailLike ne null }">
							<span id="OHPhotoDetailView-main-6like" class="clickColor">
								<i class="fa-solid fa-heart"></i>
							</span>																				
						</c:when>
						<c:otherwise>
							<span id="OHPhotoDetailView-main-6like">
								<i class="fa-regular fa-heart"></i>
							</span>													
						</c:otherwise>
					</c:choose>
					<!-- 좋아요, 이미지 End -->						
					
					<!-- 좋아요, 숫자 -->
					<span id="OHPhotoDetailView-main-6likeNumber">
						${pb_dto.pb_like }
					</span>
					<!-- 좋아요, 숫자 End -->						
					
					<!-- 스크랩, 이미지 -->
					<c:choose>					
						<c:when test="${ohPhotoDetailScrap ne null }">
							<span id="OHPhotoDetailView-main-6scrap" class="clickColor">
								<i class="fa-solid fa-bookmark"></i>
							</span>
						</c:when>
						<c:otherwise>
							<span id="OHPhotoDetailView-main-6scrap">
								<i class="fa-regular fa-bookmark"></i>
							</span>
						</c:otherwise>
					</c:choose>
					<!-- 스크랩, 이미지 End -->
								
					<!-- 스크랩, 숫자 -->										
					<span id="OHPhotoDetailView-main-6scrapNumber">
						${pb_dto.pb_scrap }
					</span>
					<!-- 스크랩, 숫자 End -->						
					
					<span id="OHPhotoDetailView-main-6views">
						조회수
					</span>
					
					<span id="OHPhotoDetailView-main-6viewsNumber">
						${pb_dto.pb_hit }
					</span>
					
					<button id="OHPhotoDetailView-main-6complaintButton">
						신고하기
					</button>
					
				</div>

				<div id="OHPhotoDetailView-main-7">
									
					<!-- 게시글 작성자 프로필 이미지 -->
								
					<%-- 프로필 이미지가 없으면 기본 이미지 --%>
					<c:if test="${empty pb_dto.myMemberInfoDto.profileimg}" >
						<a href="../my/memberinfopage?memno=${pb_dto.myMemberInfoDto.memno }">
							<img src="../resources/img/my/user.png" id="OHPhotoDetailView-main-7profileImage">
			        	</a>
			        </c:if>
			        
			        <%-- 프로필 이미지가 있으면 있는 이미지 --%>
			        <c:if test="${!empty pb_dto.myMemberInfoDto.profileimg}" >
			        	<a href="../my/memberinfopage?memno=${pb_dto.myMemberInfoDto.memno }">
			            	<img src="../resources/upload/my/${pb_dto.myMemberInfoDto.profileimg }" id="OHPhotoDetailView-main-7profileImage">
			        	</a>
			        </c:if>						
					
					<!-- 게시글 작성자명 -->
					<div id="OHPhotoDetailView-main-7writerName">
						<a href="../my/memberinfopage?memno=${pb_dto.myMemberInfoDto.memno }">
							${pb_dto.myMemberInfoDto.nickname }
						</a>
					</div>

				</div>

				<div id="OHPhotoDetailView-main-8">
					<span id="OHPhotoDetailView-main-8replyLable">댓글</span>
					<span id="OHPhotoDetailView-main-8replyTotal">${replyNumber }</span>
				</div>

				<div id="OHPhotoDetailView-main-9">
					<!-- 입력창 -->
					<textarea id="OHPhotoDetailView-main-9inputReply" oninput="checkTextarea()" maxlength="60" cols="30" rows="10" placeholder="칭찬과 격려의 댓글은 작성자에게 큰 힘이 됩니다. &#13;&#10;최대 60자 까지 작성할 수 있습니다."></textarea>
					<!-- 입력버튼 -->
					<button id="OHPhotoDetailView-main-9inputReplyButton" disabled>입력</button>								
				</div>				
				
				<div id="OHPhotoDetailView-main-10">

					<div id=contentReply>				
					
						<!-- 댓글 추가 영역 -->					
					
						<c:forEach items="${dtoReplyList }" var="dto">	
						
							<!-- 댓글 1개 영역 - 시작 -->
							<div class="reply-container">
	
								<div class="reply-container-layer1">
								
 									<!-- 댓글 작성자 프로필 이미지 -->
									<!-- 프로필 이미지가 없으면 기본 이미지 -->
									<c:if test="${empty dto.myMemberInfoDto.profileimg}" >		
										<a href="../my/memberinfopage?memno=${dto.memno }">					
											<img src="../resources/img/my/user.png" class="reply-profileImage">
										</a>
									</c:if>
									<!-- 프로필 이미지가 있으면 있는 이미지 -->
									<c:if test="${!empty dto.myMemberInfoDto.profileimg}" >
										<a href="../my/memberinfopage?memno=${dto.memno }">
											<img src="../resources/img/my/${dto.myMemberInfoDto.profileimg }" class="reply-profileImage">
							        	</a>
							        </c:if>	
								
									<!-- 사용자 이름 -->
									<div class="reply-userName">
										<a href="../my/memberinfopage?memno=${dto.memno }">
											${dto.myMemberInfoDto.nickname }
										</a>
									</div>
								
									<!-- 내댓글 표시 -->
									<c:if test="${loginUserDto.memno eq dto.memno }">
										<div class="reply-checkMyReply">내 댓글</div>
									</c:if>
									
								</div>
	
								<div class="reply-container-layer2">
									<!-- 댓글 내용 -->
									<span class="reply-content">${dto.pr_content }</span>
								</div>
	
								<div class="reply-container-layer3">
									<!-- 작성된 시간 -->
									<div class="reply-writtenDate">${dto.pr_date }</div>
									<!-- 좋아요 버튼 -->
									<div class="reply-likeButton">하트</div>
									<!-- 좋아요 횟수 -->
									<div class="reply-likeNumber">999</div>
									<!-- 답글 달기 -->
									<button class="reply-replyToReplyButton">답글 달기</button>
									<!-- 삭제 버튼 -->
									<button class="reply-deleteButton">삭제</button>
									<!-- 신고 버튼 -->
									<button class="reply-complaintButton">신고</button>
								</div>
	
							</div>
							<!-- 댓글 1개 영역 - 끝 -->						
						
						</c:forEach>		
				
					</div>
				
				</div>						
				
			</div> 
			
		</div>
				
		<footer>
			<h1>footer</h1>
		</footer>
		
	</div>

	<!-- OHPhotoDetailView.js -->
	<script src="../resources/js/oh/OHPhotoDetailView.js"></script>	
		
</body>

</html>
