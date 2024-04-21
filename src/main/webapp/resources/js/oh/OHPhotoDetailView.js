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
	
    // 페이지 로드 시 기본적으로 버튼을 비활성화합니다.
    document.getElementById("OHPhotoDetailView-main-9inputReplyButton").disabled = true;	
	
	// 글쓰기 버튼 - Click	
	$("#OHPhotoDetailView-main-1toWriteButton").click(function() {
		// Login Check
		if(memno !== null && memno !== "" && memno !== "/") {	
			// 로그인 되어 있으면 OHPhotoWriteView 페이지로 이동
			address = "OHPhotoWriteView";
			
		    const formData = new FormData();
		    formData.append("pb_no", pb_no);
		    formData.append("orderingBy", orderingBy);
		    formData.append("orderingMethod", orderingMethod);
		    formData.append("pb_residence", pb_residence);
		    formData.append("pb_room", pb_room);
		    formData.append("pb_style", pb_style);
		    formData.append("pb_skill", pb_skill);
		    formData.append("searchingType", searchingType);
		    formData.append("searchingWord", searchingWord);
		    formData.append("pageSelectedNum", pageSelectedNum);	
			
		    // 동적으로 폼 생성
		    const form = document.createElement('form');	
			
		    // 폼 속성 설정
		    form.action = address;
		    form.method = 'POST';	
		    
		    // formData 객체의 각 키-값 쌍을 폼에 추가
		    for (const [key, value] of formData.entries()) {
		        const input = document.createElement('input');
		        input.type = 'hidden';
		        input.name = key;
		        input.value = value;
		        form.appendChild(input);
		    }    
		    
		    // 폼을 문서에 추가
		    document.body.appendChild(form);    
		    
		    // 폼 제출
		    form.submit(); 			
			
		} else {
			// 로그인되어 있지 않으면 경고창 표시
			alert("로그인 페이지로 이동합니다.");
			window.location.href = "../my/loginform";
		}
	});	

	// 수정 버튼 - Click, 게시글 작성자만 가능	
	$("#OHPhotoDetailView-main-1toEditButton").click(function() {
		
		address = "OHPhotoEditView";
		
	    const formData = new FormData();
	    formData.append("pb_no", pb_no);
	    formData.append("orderingBy", orderingBy);
	    formData.append("orderingMethod", orderingMethod);
	    formData.append("pb_residence", pb_residence);
	    formData.append("pb_room", pb_room);
	    formData.append("pb_style", pb_style);
	    formData.append("pb_skill", pb_skill);
	    formData.append("searchingType", searchingType);
	    formData.append("searchingWord", searchingWord);
	    formData.append("pageSelectedNum", pageSelectedNum);	
		
	    // 동적으로 폼 생성
	    const form = document.createElement('form');	
		
	    // 폼 속성 설정
	    form.action = address;
	    form.method = 'POST';	
	    
	    // formData 객체의 각 키-값 쌍을 폼에 추가
	    for (const [key, value] of formData.entries()) {
	        const input = document.createElement('input');
	        input.type = 'hidden';
	        input.name = key;
	        input.value = value;
	        form.appendChild(input);
	    }    
	    
	    // 폼을 문서에 추가
	    document.body.appendChild(form);    
	    
	    // 폼 제출
	    form.submit(); 				
		
	});		
		
	// 삭제 버튼 - Click, 게시글 작성자만 가능	
	$("#OHPhotoDetailView-main-1toDeleteButton").click(function() {
	
		address = "OHPhotoDeleteExecute";	

	    const formData = new FormData();
	    formData.append("pb_no", pb_no);
	    formData.append("orderingBy", orderingBy);
	    formData.append("orderingMethod", orderingMethod);
	    formData.append("pb_residence", pb_residence);
	    formData.append("pb_room", pb_room);
	    formData.append("pb_style", pb_style);
	    formData.append("pb_skill", pb_skill);
	    formData.append("searchingType", searchingType);
	    formData.append("searchingWord", searchingWord);
	    formData.append("pageSelectedNum", pageSelectedNum);	
		
	    // 동적으로 폼 생성
	    const form = document.createElement('form');	
		
	    // 폼 속성 설정
	    form.action = address;
	    form.method = 'POST';	
	    
	    // formData 객체의 각 키-값 쌍을 폼에 추가
	    for (const [key, value] of formData.entries()) {
	        const input = document.createElement('input');
	        input.type = 'hidden';
	        input.name = key;
	        input.value = value;
	        form.appendChild(input);
	    }    
	    
	    // 폼을 문서에 추가
	    document.body.appendChild(form);    
	    
	    // 폼 제출
	    form.submit(); 					
	
	});		
		
	// 이 JavaScript 코드 스니펫은 URL에 특정 쿼리 매개변수가 포함되어 있을 때,
	// 웹페이지의 특정 섹션으로 스크롤을 부드럽게 이동하도록 해줍니다.
	// OHPhotoView.jsp - 댓글 이미지를 클릭하면 실행된다.
    $(function () {
        const url = new URL(window.location);
        const urlParams = url.searchParams;
        if(urlParams.get('s')) {
            const scrollTop = $('#'+urlParams.get('s')).offset().top;
          
          	// 1) 부드럽게 이동
//            $('html, body').animate({scrollTop: scrollTop - 300}, 500);
          	
          	// 또는
          
          	// 2) 바로 이동
             $(window).scrollTop(scrollTop - 300);
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
    
	// 활성화된 입력버튼 클릭 => DB에 저장
	$("#OHPhotoDetailView-main-9inputReplyButton").click(function() {
		// Login Check						
		if(memno !== null && memno !== 	"" && memno !== "/") {
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
	            	console.log("OHPhotoReplyWriteExecute AJAX 요청 성공");		
					// 입력창 값 비우기
					$("#OHPhotoDetailView-main-9inputReply").val(null);
					// 입력버튼 비활성화
					$("#OHPhotoDetailView-main-9inputReplyButton").prop("disabled", true);
					// 댓글창 값 비우기
					$("#contentReply").empty();
					
	                // 서버에서 받은 게시물의 댓글수, 변수에 저장
	                var responseReplyNumber = response.replyNumber;
	                // responseReplyNumber 변수, 콘솔 출력
	            	console.log("서버에서 받은 게시물의 댓글수: ", responseReplyNumber);
	            	
	            	// [중요] 선택자를 이용해 요소 지정할 때 id, class 순서로 지정한다. 그 반대는 선택하지 못한다.
	            	var replyNumberSelector = "#OHPhotoDetailView-main-8replyTotal";
	            	// replyNumberSelector 변수, 콘솔 출력
	            	console.log("replyNumberSelector: ", replyNumberSelector);
	            	
	            	// 서버에서 받은 게시물의 댓글수 => 숫자 갱신 
	                $(replyNumberSelector).text(responseReplyNumber);  
	                
	    	        $.ajax({
	    	            url: 'OHPhotoReplyView',
	    	            type: 'POST',
	    				dataType: "html",	            
	    	            data: {
	    					// 전송할 데이터
	    					'pb_no' : pb_no,
	    	            },
	    	            success: function(response) {
	    	                // 성공적으로 서버로부터 응답을 받았을 때 실행할 코드
	    	            	console.log("OHPhotoReplyView AJAX 요청 성공");
	    	            	
	    	            	// 새로 고침할 div 요소의 ID
	    	            	$(".contentReply").empty();
	    	            	$(".contentReply").append(response);
	    	            },
	    	            error: function(xhr, status, error) {
	    	                // 요청이 실패했을 때 실행됩니다.
	    	                console.error('요청 오류 error: ', xhr);
	    	                console.error('요청 오류 error: ', status);
	    	                console.error('요청 오류 error: ', error);
	    	                // 오류 처리를 추가할 수 있습니다.
	    	            }
	    	        });	 	                
	                
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

// 입력창에 입력하면 입력버튼이 활성화된다.
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

function moveToPhotoView(event) {
	
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
	
	const photoViewURL = "OHPhotoView";
	
    const formData = new FormData();
    formData.append("pb_no", pb_no);
    formData.append("orderingBy", orderingBy);
    formData.append("orderingMethod", orderingMethod);
    formData.append("pb_residence", pb_residence);
    formData.append("pb_room", pb_room);
    formData.append("pb_style", pb_style);
    formData.append("pb_skill", pb_skill);
    formData.append("searchingType", searchingType);
    formData.append("searchingWord", searchingWord);
    formData.append("pageSelectedNum", pageSelectedNum);	
	
    // 동적으로 폼 생성
    const form = document.createElement('form');	
	
    // 폼 속성 설정
    form.action = photoViewURL;
    form.method = 'POST';	
    
    // formData 객체의 각 키-값 쌍을 폼에 추가
    for (const [key, value] of formData.entries()) {
        const input = document.createElement('input');
        input.type = 'hidden';
        input.name = key;
        input.value = value;
        form.appendChild(input);
    }    
    
    // 폼을 문서에 추가
    document.body.appendChild(form);    
    
    // 폼 제출
    form.submit();     
    
}




