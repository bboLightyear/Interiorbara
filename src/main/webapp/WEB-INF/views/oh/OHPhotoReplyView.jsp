<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>

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
			
			<!-- 답글 버튼 -->
			<button class="reply-replyToReplyButton">
				답글
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

<script>
//jQuery를 사용하여 문서가 준비되었을 때 실행되는 함수
$(document).ready(function() {

	// 로그인 정보, 변수 저장
	var memno = document.getElementById("memno").value;
	// 로그인 정보, 값 출력
	console.log("memno: " + memno);	
	
	// 게시글 정보, 변수 저장
	var pb_no = document.getElementById("pb_no").value;
	// 게시글 정보, 값 출력	
	console.log("pb_no: " + pb_no);
	
	// 정렬 정보, 변수 저장
	var orderingBy = document.getElementById("orderingBy").value;
	var orderingMethod = document.getElementById("orderingMethod").value;
	// 정렬 정보, 값 출력	
	console.log("orderingBy: " + orderingBy);
	console.log("orderingMethod: " + orderingMethod);
	
	// 필터 정보, 변수 저장
	var pb_residence = document.getElementById("pb_residence").value;
	var pb_room = document.getElementById("pb_room").value;
	var pb_style = document.getElementById("pb_style").value;
	var pb_skill = document.getElementById("pb_skill").value;
	// 필터 정보, 값 출력		
	console.log("pb_residence: " + pb_residence);
	console.log("pb_room: " + pb_room);
	console.log("pb_style: " + pb_style);
	console.log("pb_skill: " + pb_skill);	
	
	// 검색 정보, 변수 저장	
	var searchingType = document.getElementById("searchingType").value;
	var searchingWord = document.getElementById("searchingWord").value;
	// 검색 정보, 값 출력	
	console.log("searchingType: " + searchingType);
	console.log("searchingWord: " + searchingWord);
	
	// 페이지 정보, 변수 저장	
	var pageSelectedNum = document.getElementById("pageSelectedNum").value;
	// 페이지 정보, 값 출력	
	console.log("pageSelectedNum: " + pageSelectedNum);		
	
	// 댓글 좋아요 이미지 => 클릭	
	$(".reply-likeButton").click(function() {
		// Login Check						
		if(memno !== null && memno !== "" && memno !== "/") {
			// 로그인 정보, 값 출력	
			console.log("memno: " + memno);
			// 클릭한 하트 요소의 id 값을 가져와 변수에 저장	
			var clickedId = $(this).attr("id");
			// clickedId 변수에 저장된 id 값 출력
			console.log("clickedId: ", clickedId);	
			// 클릭 => 하트 색상변경
			$(this).toggleClass("clickColor");	
			// 클릭한 요소의 하위 태그에서 i태그를 찾아서 icon 변수에 저장 
			var icon = $(this).find("i");
			// if 조건문, 기본 하트 모양 => True
			if(icon.hasClass("fa-regular")) {
				// <i> 요소의 클래스 변경 => 하트 모양변경 
				icon.removeClass("fa-regular").addClass("fa-solid");			
				// ajax 요청 보내기
				$.ajax({
					url: "OHPhotoReplyLikeExecute",
					method: "post",
					dataType: "json",
					data: {
						// 전송할 데이터
						'memno' : memno,
						'pr_no' : clickedId
					},	
					success: function(response) {
		                // 성공적으로 서버로부터 응답을 받았을 때 실행할 코드
		            	console.log("AJAX 요청 성공");	
		                // 서버에서 받은 게시물의 좋아요 횟수, 변수에 저장
		                var responseReplyLikeNumber = response.likeNumber;		            	
		                // responseReplyLikeNumber 변수, 콘솔 출력
		            	console.log("서버에서 받은 댓글의 좋아요 횟수: ", responseReplyLikeNumber);		            	
		            	// [중요] 선택자를 이용해 요소 지정할 때 id, class 순서로 지정한다. 그 반대는 선택하지 못한다.		            	
		            	var replyLikeNumberSelector = "#" + clickedId + ".reply-likeNumber";
		            	
		            	// replyLikeNumberSelector 변수, 콘솔 출력
		            	console.log("replyLikeNumberSelector: ", replyLikeNumberSelector);
		            	// 서버에서 받은 게시물의 좋아요 횟수 => 숫자 갱신 
		                $(replyLikeNumberSelector).text(responseReplyLikeNumber);		            	
					},
					error: function(xhr, status, error) {
		                // AJAX 요청 실패 시 실행할 코드
		                console.error("AJAX 요청 실패:", status, error);										
					}		            	
				});		            	
			} else {
				// <i> 요소의 클래스 변경 => 하트 모양변경 
				icon.removeClass("fa-solid").addClass("fa-regular");
				// ajax 요청 보내기
				$.ajax({
					url: "OHPhotoReplyLikeExecute",
					method: "post",
					dataType: "json",
					data: {
						// 전송할 데이터
						'memno' : memno,
						'pr_no' : clickedId
					},	
					success: function(response) {
		                // 성공적으로 서버로부터 응답을 받았을 때 실행할 코드
		            	console.log("AJAX 요청 성공");	
		                // 서버에서 받은 게시물의 좋아요 횟수, 변수에 저장
		                var responseReplyLikeNumber = response.likeNumber;		            	
		                // responseReplyLikeNumber 변수, 콘솔 출력
		            	console.log("서버에서 받은 댓글의 좋아요 횟수: ", responseReplyLikeNumber);		            	
		            	// [중요] 선택자를 이용해 요소 지정할 때 id, class 순서로 지정한다. 그 반대는 선택하지 못한다.		            	
		            	var replyLikeNumberSelector = "#" + clickedId + ".reply-likeNumber";
		            	
		            	// replyLikeNumberSelector 변수, 콘솔 출력
		            	console.log("replyLikeNumberSelector: ", replyLikeNumberSelector);
		            	// 서버에서 받은 게시물의 좋아요 횟수 => 숫자 갱신 
		                $(replyLikeNumberSelector).text(responseReplyLikeNumber);		            	
					},
					error: function(xhr, status, error) {
		                // AJAX 요청 실패 시 실행할 코드
		                console.error("AJAX 요청 실패:", status, error);										
					}		            	
				});			            	
			}
		} else {
			// 로그인되어 있지 않으면 경고창 표시
			alert("로그인 페이지로 이동합니다.");
			window.location.href = "../my/loginform";
		}	
	});	
	
});	
</script>
