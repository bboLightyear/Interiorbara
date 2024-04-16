/**
 * 
 */
	
// jQuery를 사용하여 문서가 준비되었을 때 실행되는 함수
$(document).ready(function() {
	
	console.log("OHPhotoDetailView.jsp is ready!");	
	
	// 로그인 정보, 변수 저장
	var memno = document.getElementById("memno").value;
	// 로그인 정보, 값 출력
	console.log("memno: " + memno);	
	
	// 게시글 정보, 변수 저장
	var pb_no = document.getElementById("pb_no").value;
	// 게시글 정보, 값 출력	
	console.log("pb_no: " + pb_no);
	
	// 글쓰기 버튼 - Click	
	$("#OHPhotoDetailView-main-1toWriteButton").click(function() {
		// Login Check
		if(memno !== null && memno !== "" && memno !== "/") {	
			// 로그인 되어 있으면 OHPhotoWriteView 페이지로 이동
			window.location.href = "OHPhotoWriteView";
		} else {
			// 로그인되어 있지 않으면 경고창 표시
			alert("로그인 페이지로 이동합니다.");
			window.location.href = "../my/loginform";
		}
	});	

	// 좋아요 이미지 => 클릭	
	$("#OHPhotoDetailView-main-6like").click(function() {
		// Login Check						
		if(memno !== null && memno !== "" && memno !== "/") {
			// 로그인 정보, 값 출력	
			console.log("memno: " + memno);	
			// 게시글 정보, 값 출력	
			console.log("pb_no: " + pb_no);			
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
					url: "OHPhotoLikeExecute",
					method: "post",
					dataType: "json",
					data: {
						// 전송할 데이터
						'memno' : memno,
						'pb_no' : pb_no
					},
					success: function(response) {
		                // 성공적으로 서버로부터 응답을 받았을 때 실행할 코드
		            	console.log("AJAX 요청 성공");
		                // 서버에서 받은 게시물의 좋아요 횟수, 변수에 저장
		                var responseLikeNumber = response.likeNumber;
		                // responseLikeNumber 변수, 콘솔 출력
		            	console.log("서버에서 받은 게시물의 좋아요 횟수: ", responseLikeNumber);
		            	// [중요] 선택자를 이용해 요소 지정할 때 id, class 순서로 지정한다. 그 반대는 선택하지 못한다.
		            	var likeNumberSelector = "#OHPhotoDetailView-main-6likeNumber";
		            	// likeNumberSelector 변수, 콘솔 출력
		            	console.log("likeNumberSelector: ", likeNumberSelector);
		            	// 서버에서 받은 게시물의 좋아요 횟수 => 숫자 갱신 
		                $(likeNumberSelector).text(responseLikeNumber);
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
					url: "OHPhotoLikeExecute",
					method: "post",
					dataType: "json",
					data: {
						// 전송할 데이터
						'memno' : memno,
						'pb_no' : pb_no
					},				
					success: function(response) {
		                // 성공적으로 서버로부터 응답을 받았을 때 실행할 코드
		            	console.log("AJAX 요청 성공");		
		                // 서버에서 받은 게시물의 좋아요 횟수, 변수에 저장
		                var responseLikeNumber = response.likeNumber;
		                // responseLikeNumber 변수, 콘솔 출력
		            	console.log("서버에서 받은 게시물의 좋아요 횟수: ", responseLikeNumber);
		            	// [중요] 선택자를 이용해 요소 지정할 때 id, class 순서로 지정한다. 그 반대는 선택하지 못한다.
		            	var likeNumberSelector = "#OHPhotoDetailView-main-6likeNumber";
		            	// likeNumberSelector 변수, 콘솔 출력
		            	console.log("likeNumberSelector: ", likeNumberSelector);
		            	// 서버에서 받은 게시물의 좋아요 횟수 => 숫자 갱신 
		                $(likeNumberSelector).text(responseLikeNumber);						                
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
	
	// 스크랩 이미지 => 클릭	
	$("#OHPhotoDetailView-main-6scrap").click(function() {	
		// Login Check						
		if(memno !== null && memno !== "" && memno !== "/") {
			// 로그인 정보, 값 출력	
			console.log("memno: " + memno);	
			// 게시글 정보, 값 출력	
			console.log("pb_no: " + pb_no);			
			// 클릭 => 하트 색상변경
			$(this).toggleClass("clickColor");			
			// 클릭한 요소의 하위 태그에서 i태그를 찾아서 icon 변수에 저장 
			var icon = $(this).find("i");		
			// if 조건문, 기본 스크랩 모양 => True
			if(icon.hasClass("fa-regular")) {
				// <i> 요소의 클래스 변경 => 스크랩 모양변경 
				icon.removeClass("fa-regular").addClass("fa-solid");
				// ajax 요청 보내기
				$.ajax({
					url: "OHPhotoScrapExecute",
					method: "post",
					dataType: "json",
					data: {
						// 전송할 데이터
						'memno' : memno,
						'pb_no' : pb_no
					},
					success: function(response) {
		                // 성공적으로 서버로부터 응답을 받았을 때 실행할 코드
		            	console.log("AJAX 요청 성공");
		                // 서버에서 받은 게시물의 스크랩 횟수, 변수에 저장
		                var responseScrapNumber = response.scrapNumber;
		                // responseScrapNumber 변수, 콘솔 출력
		            	console.log("서버에서 받은 게시물의 좋아요 횟수: ", responseScrapNumber);
		            	// [중요] 선택자를 이용해 요소 지정할 때 id, class 순서로 지정한다. 그 반대는 선택하지 못한다.
		            	var scrapNumberSelector = "#OHPhotoDetailView-main-6scrapNumber";
		            	// scrapNumberSelector 변수, 콘솔 출력
		            	console.log("scrapNumberSelector: ", scrapNumberSelector);
		            	// 서버에서 받은 게시물의 스크랩 횟수 => 숫자 갱신 
		                $(scrapNumberSelector).text(responseScrapNumber);
					},
					error: function(xhr, status, error) {
		                // AJAX 요청 실패 시 실행할 코드
		                console.error("AJAX 요청 실패:", status, error);										
					}
				});	
			} else {
				// <i> 요소의 클래스 변경 => 스크랩 모양변경 
				icon.removeClass("fa-solid").addClass("fa-regular");
				// ajax 요청 보내기
				$.ajax({
					url: "OHPhotoScrapExecute",
					method: "post",
					dataType: "json",
					data: {
						// 전송할 데이터
						'memno' : memno,
						'pb_no' : pb_no
					},
					success: function(response) {
		                // 성공적으로 서버로부터 응답을 받았을 때 실행할 코드
		            	console.log("AJAX 요청 성공");		
		                // 서버에서 받은 게시물의 스크랩 횟수, 변수에 저장
		                var responseScrapNumber = response.scrapNumber;
		                // responseScrapNumber 변수, 콘솔 출력
		            	console.log("서버에서 받은 게시물의 좋아요 횟수: ", responseScrapNumber);
		            	// [중요] 선택자를 이용해 요소 지정할 때 id, class 순서로 지정한다. 그 반대는 선택하지 못한다.
		            	var scrapNumberSelector = "#OHPhotoDetailView-main-6scrapNumber";
		            	// scrapNumberSelector 변수, 콘솔 출력
		            	console.log("scrapNumberSelector: ", scrapNumberSelector);
		            	// 서버에서 받은 게시물의 스크랩 횟수 => 숫자 갱신 
		                $(scrapNumberSelector).text(responseScrapNumber);					                
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
	
    // 페이지 로드 시 기본적으로 버튼을 비활성화합니다.
    document.getElementById("OHPhotoDetailView-main-9inputReplyButton").disabled = true;	
	
	// 활성화된 입력버튼 클릭 => DB에 저장
	$("#OHPhotoDetailView-main-9inputReplyButton").click(function() {
		// Login Check						
		if(memno !== null && memno !== "" && memno !== "/") {
			// 로그인 정보, 값 출력	
			console.log("memno: " + memno);			
		
			var inputValue = $("#OHPhotoDetailView-main-9inputReply").val();
			
			console.log("inputValue: " + inputValue);
			
			$.ajax({
				url: "OHPhotoReplyWriteExecute",
				method: "post",
				data: {
					// 전송할 데이터
					'memno' : memno,
					'pr_content' : inputValue,
					'pb_no' : pb_no	
				},
				success: function(response) {
	                // 성공적으로 서버로부터 응답을 받았을 때 실행할 코드
	            	console.log("AJAX 요청 성공");		
					// 입력창 값 비우기
					$("#OHPhotoDetailView-main-9inputReply").val(null);
					// 입력버튼 비활성화
					$("#OHPhotoDetailView-main-9inputReplyButton").prop("disabled", true);
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
		} else {
			// 로그인되어 있지 않으면 경고창 표시
			alert("로그인 페이지로 이동합니다.");
			window.location.href = "../my/loginform";
		}			
	});
	
});

//입력창에 입력하면 입력버튼이 활성화된다.
function checkTextarea() {
    // textarea 요소와 버튼 요소를 선택합니다.
    var textarea = document.getElementById("OHPhotoDetailView-main-9inputReply");
    var button = document.getElementById("OHPhotoDetailView-main-9inputReplyButton");
    // textarea에 입력된 값이 있는지 확인합니다.
    if (textarea.value.trim() !== "") {
        // 입력된 값이 있을 경우 버튼을 활성화합니다.
        button.disabled = false;
    } else {
        // 입력된 값이 없을 경우 버튼을 비활성화합니다.
        button.disabled = true;
    }
}

//function loadReplys() {
//	
//	// 로그인 정보, 변수 저장
//	var memno = document.getElementById("memno").value;
//	// 로그인 정보, 값 출력
//	console.log("memno: " + memno);	
//	
//	// 게시글 정보, 변수 저장
//	var pb_no = document.getElementById("pb_no").value;
//	// 게시글 정보, 값 출력	
//	console.log("pb_no: " + pb_no);	
//	
//	// AJAX 요청을 보냅니다.
//	$.ajax({
//		url: "OHPhotoReplyView",
//		method: "post",
//		dataType: "json",						
//		data: {
//			// 전송할 데이터
//			'pb_no' : pb_no
//		},
//		success: function(response) {
//            // 성공적으로 서버로부터 응답을 받았을 때 실행할 코드
//        	console.log("AJAX 요청 성공");
//        	console.log(response);
//        	
//        	// 반복문으로 댓글 출력
//        	for(let i = 0; i < response.length; i++) {
//        		
//        		// 댓글 1개 영역 - 시작
//        		let eachReply = '<div class="reply-container">';
//        		
//        		eachReply += '<div class="reply-container-layer1">';
//        		
//	        		// 프로필 이미지
//	        		eachReply += '<img class="reply-profileImage">' + '프로필 이미지' + '</img>';
//	        		// 사용자 이름
//	        		eachReply += '<div class="reply-userName">' + response[i].nickname + '</div>';
//	        		// 내댓글 표시
//	        		eachReply += '<div class="reply-checkMyReply">' + '내 댓글' + '</div>';
//        		
//        		eachReply += '</div>';
//        		
//        		eachReply += '<div class="reply-container-layer2">';
//        			
//	        		// 댓글 내용
//	        		eachReply += '<span class="reply-content">' + response[i].pr_content + '</span>';
//        		
//	        	eachReply += '</div>'; 
//        		
//	        	eachReply += '<div class="reply-container-layer3">';
//	        		
//	        		// 작성된 시간
//	        		eachReply += '<div class="reply-writtenTime">' + response[i].pr_date + '</div>';
//	        		
//	        		// 좋아요 버튼
//	        		eachReply += '<div class="reply-likeButton">' + '하트' + '</div>';
//	        		
//	        		// 좋아요 횟수
//	        		eachReply += '<div class="reply-likeNumber">' + '999' + '</div>';
//	        		
//	        		// 답글 달기
//	        		eachReply += '<button class="reply-replyToReplyButton">' + '답글 달기' + '</button>';
//	        		
//	        		// 삭제 버튼
//	        		eachReply += '<button class="reply-deleteButton">' + '삭제' + '</button>';
//	        		
//	        		// 신고 버튼
//	        		eachReply += '<button class="reply-complaintButton">' + '신고' + '</button>';
//        		
//        		eachReply += '</div>';
//        		
//        		// 댓글 1개 영역 - 끝
//        		eachReply += '</div>';
//        		
//            	// 선택한 태그 내부에 추가
//            	$("#contentReply").append(eachReply);					            		
//        	}					            	
//		},
//		error: function(xhr, status, error) {
//            // AJAX 요청 실패 시 실행할 코드
//            console.error("AJAX 요청 실패:", status, error);										
//		}
//	}); 
//}
