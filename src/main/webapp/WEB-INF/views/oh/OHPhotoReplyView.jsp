<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>

<html>

<head>

	<meta charset="UTF-8">
	
</head>

<body>

	<!-- 댓글 추가 영역 -->					

	<c:forEach items="${dtoReplyList }" var="dto">	
	
		<!-- 댓글 1개 영역 - 시작 -->
		<div class="reply-container">

			<div class="reply-container-layer1">
			
					<!-- 댓글 작성자 프로필 이미지 -->
				<!-- 프로필 이미지가 없으면 기본 이미지 -->
				<c:if test="${empty dto.myMemberInfoDto.profileimg}" >		
					<a href="#" onclick="javascript_:window.open('../my/memberinfopage?memno=${dto.memno }','pop','menubar=no,status=no,scrollbars=no,resizable=no,width=560,height=700,top=50,left=50');">				
						<img src="../resources/img/my/user.png" class="reply-profileImage">
					</a>
				</c:if>
				<!-- 프로필 이미지가 있으면 있는 이미지 -->
				<c:if test="${!empty dto.myMemberInfoDto.profileimg}" >
					<a href="#" onclick="javascript_:window.open('../my/memberinfopage?memno=${dto.memno }','pop','menubar=no,status=no,scrollbars=no,resizable=no,width=560,height=700,top=50,left=50');">
						<img src="../resources/upload/my/${dto.myMemberInfoDto.profileimg }" class="reply-profileImage">
		        	</a>
		        </c:if>	
			
				<!-- 사용자 이름 -->
				<div class="reply-userName">
					<a href="#" onclick="javascript_:window.open('../my/memberinfopage?memno=${dto.memno }','pop','menubar=no,status=no,scrollbars=no,resizable=no,width=560,height=700,top=50,left=50');">
						${dto.myMemberInfoDto.nickname }
					</a>
				</div>
			
				<!-- 내댓글 표시 -->
				<c:if test="${loginUserDto.memno eq dto.memno }">
					<div class="reply-checkMyReply">
						내 댓글
					</div>
				</c:if>
				
			</div>

			<div class="reply-container-layer2">
				<!-- 댓글 내용 -->
				<span class="reply-content">
					${dto.pr_content }
				</span>
			</div>

			<div class="reply-container-layer3">
				<!-- 작성된 시간 -->
				<div class="reply-writtenDate">
					${dto.pr_date }
				</div>
				
				<!-- 좋아요, 이미지 -->
				<c:set var="likeLoopFlag" value="false" />
				<c:forEach items="${ohPhotoReplyLike }" var="like" varStatus="status">
					<c:if test="${not likeLoopFlag }">
						<c:if test="${dto.pr_no eq like.pr_no }">																			
							<span class="reply-likeButton clickColor" id="${dto.pr_no }">
								<i class="fa-solid fa-heart"></i>
							</span>
							<c:set var="likeLoopFlag" value="true" />
						</c:if>							
					</c:if>	
				</c:forEach>
				<c:if test="${likeLoopFlag eq false }">
					<span class="reply-likeButton" id="${dto.pr_no }">
						<i class="fa-regular fa-heart"></i>
					</span>						
				</c:if>																		
				
				<!-- 좋아요 횟수 -->
				<div class="reply-likeNumber" id="${dto.pr_no }">
					${dto.pr_like }
				</div>
				
				<!-- 답글 달기 -->
				<button class="reply-replyToReplyButton">
					답글 달기
				</button>
				
				<!-- 삭제 버튼 -->
				<button class="reply-deleteButton">
					삭제
				</button>
				
				<!-- 신고 버튼 -->
				<button class="reply-complaintButton">
					신고
				</button>
			</div>

		</div>
		<!-- 댓글 1개 영역 - 끝 -->						
	
	</c:forEach>			

</body>

</html>