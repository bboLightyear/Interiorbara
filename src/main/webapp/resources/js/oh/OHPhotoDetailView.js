/**
 * 
 */
	
$(document).ready(function() {

	$("#toWriteBtn").click(function() {
		/* 회원인지 확인 */
		if("${sessionScope.userId }" != null && "${sessionScope.userId }" != "") {
			window.location.href = "OHPhotoWriteView";
		} else {
			alert("로그인 페이지로 이동");
		}
	});
	
});	


$(document).ready(function() {
	
	// 사용자 id 값을 가져와 변수에 저장
	var userId = "${sessionScope.userId }";
	// 게시글 번호, 변수에 저장
	var pb_no = "${pb_dto.pb_no }";
	
	// 페이지 로드 시 댓글을 불러오는 함수를 실행합니다.
	loadReplys();
	
	// 입력창에 입력하면 입력버튼이 활성화된다.
	$("#inputTextReply").on("input", function() {
		if($(this).val().trim() !== "") {
			$("#replyButton").prop("disabled", false);
		} else {
			$("#replyButton").prop("disabled", true);
		}
	});
	
	// 활성화된 입력버튼 클릭 => DB에 저장
	$("#replyButton").click(function() {
		var inputValue = $("#inputTextReply").val();
		console.log("inputValue: " + inputValue);
		
		$.ajax({
			url: "OHPhotoReplyWriteExecute",
			method: "post",
			data: {
				// 전송할 데이터
				'userId' : userId,
				'pr_content' : inputValue,
				'pb_no' : pb_no	
			},
			success: function(response) {
                // 성공적으로 서버로부터 응답을 받았을 때 실행할 코드
            	console.log("AJAX 요청 성공");		
				// 입력창 값 비우기
				$("#inputTextReply").val(null);
				// 입력버튼 비활성화
				$("#replyButton").prop("disabled", true);
				// 댓글창 값 비우기
				$("#contentReply").empty();
				// 댓글을 불러오는 함수를 실행
				loadReplys();					                
			},
			error: function(xhr, status, error) {
                // AJAX 요청 실패 시 실행할 코드
                console.error("AJAX 요청 실패:", status, error);										
			}								
		});
		
	});
	
	function loadReplys() {
		// AJAX 요청을 보냅니다.
		$.ajax({
			url: "OHPhotoReplyView",
			method: "post",
			dataType: "json",						
			data: {
				// 전송할 데이터
				'pb_no' : pb_no
			},
			success: function(response) {
                // 성공적으로 서버로부터 응답을 받았을 때 실행할 코드
            	console.log("AJAX 요청 성공");
            	console.log(response);
            	// 반복문으로 댓글 출력
            	for(let i = 0; i < response.length; i++) {
            		// 댓글 1개 영역 - 시작
            		let eachReply = '<div class="reply-container">';
            		// 프로필 이미지
            		eachReply += '<div class="reply-profileImage">' + '프로필 이미지' + '</div>';
            		// 사용자 이름
            		eachReply += '<div class="reply-userName">' + response[i].pr_user + '</div>';
            		// 내댓글 표시
            		eachReply += '<div class="reply-checkMyReply">' + '내댓글 표시' + '</div>';
            		// 댓글 내용
            		eachReply += '<div class="reply-content">' + response[i].pr_content + '</div>';
            		// 작성된 시간
            		eachReply += '<div class="reply-writtenTime">' + '작성된 시간' + '</div>';
            		// 좋아요 버튼
            		eachReply += '<div class="reply-likeButton">' + '좋아요 버튼' + '</div>';
            		// 좋아요 횟수
            		eachReply += '<div class="reply-likeHit">' + '좋아요 횟수' + '</div>';
            		// 답글 달기
            		eachReply += '<div class="reply-replyToReplyButton">' + '답글 달기' + '</div>';
            		// 삭제 버튼 or 신고 버튼
            		eachReply += '<div class="reply-deleteOrComplaintButton">' + '삭제 버튼 or 신고 버튼' + '</div>';
            		// 댓글 1개 영역 - 끝
            		eachReply += '</div>';
	            	// 선택한 태그 내부에 추가
	            	$("#contentReply").append(eachReply);					            		
            	}					            	
			},
			error: function(xhr, status, error) {
                // AJAX 요청 실패 시 실행할 코드
                console.error("AJAX 요청 실패:", status, error);										
			}
		}); 
	
	}
	
});
