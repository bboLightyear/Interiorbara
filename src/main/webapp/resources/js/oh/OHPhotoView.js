/**
 * 
 */

// jQuery를 사용하여 문서가 준비되었을 때 실행되는 함수
$(document).ready(function() {
	console.log("OHMainView.jsp is ready!");
	
	// 로그인 정보, 변수 저장
	var memno = document.getElementById("memno").value;
	// 로그인 정보, 값 출력	
	console.log("memno: " + memno);
	
	// 정렬 정보, 변수 저장
	var keepOrderingBy = document.getElementById("keepOrderingBy").value;
	var keepOrderingMethod = document.getElementById("keepOrderingMethod").value;
	// 정렬 정보, 값 출력	
	console.log("keepOrderingBy: " + keepOrderingBy);
	console.log("keepOrderingMethod: " + keepOrderingMethod);
	
	// 필터 정보, 변수 저장
	var keepPb_residence = document.getElementById("keepPb_residence").value;
	var keepPb_room = document.getElementById("keepPb_room").value;
	var keepPb_style = document.getElementById("keepPb_style").value;
	var keepPb_skill = document.getElementById("keepPb_skill").value;
	// 필터 정보, 값 출력		
	console.log("keepPb_residence: " + keepPb_residence);
	console.log("keepPb_room: " + keepPb_room);
	console.log("keepPb_style: " + keepPb_style);
	console.log("keepPb_skill: " + keepPb_skill);
	
	// 검색 정보, 변수 저장	
	var keepSearchingType = document.getElementById("keepSearchingType").value;
	var keepSearchingWord = document.getElementById("keepSearchingWord").value;
	// 검색 정보, 값 출력	
	console.log("keepSearchingType: " + keepSearchingType);
	console.log("keepSearchingWord: " + keepSearchingWord);
	
	// 페이지 정보, 변수 저장	
	var pageSelectedNum = document.getElementById("pageSelectedNum").value;
	var pageTotalNum = document.getElementById("pageTotalNum").value;
	// 페이지 정보, 값 출력	
	console.log("pageSelectedNum: " + pageSelectedNum);
	console.log("pageTotalNum: " + pageTotalNum);	
	
	// 정렬 정보, 선택 유지
	$("#OHPhotoView-main-2-sorting-orderingBy").val(keepOrderingBy).prop("selected", true);
	$("#OHPhotoView-main-2-sorting-orderingMethod").val(keepOrderingMethod).prop("selected", true);	
	
	// 필터 정보, 선택 유지
	$("#OHPhotoView-main-2-filtering-pb_residence").val(keepPb_residence).prop("selected", true);
	$("#OHPhotoView-main-2-filtering-pb_room").val(keepPb_room).prop("selected", true);
	$("#OHPhotoView-main-2-filtering-pb_style").val(keepPb_style).prop("selected", true);
	$("#OHPhotoView-main-2-filtering-pb_skill").val(keepPb_skill).prop("selected", true);

	// 검색 정보, 선택 유지
	$("#OHPhotoView-main-2-searching-searchingType").val(keepSearchingType).prop("selected", true);
	/* keepSearchingWord 값은  OHPhotoView-main-2-searching-searchingWord에 value 값으로 입력 */
	
	// 글쓰기 버튼 - Click
	$("#OHPhotoView-toWriteButton").click(function() {
		// Login Check
		if(memno !== null && memno !== "" && memno !== "/") {	
			// 로그인 되어 있으면 OHPhotoWriteView 페이지로 이동
			var address = "OHPhotoWriteView";
			
		    const formData = new FormData();
		    formData.append("orderingBy", keepOrderingBy);
		    formData.append("orderingMethod", keepOrderingMethod);
		    formData.append("pb_residence", keepPb_residence);
		    formData.append("pb_room", keepPb_room);
		    formData.append("pb_style", keepPb_style);
		    formData.append("pb_skill", keepPb_skill);
		    formData.append("searchingType", keepSearchingType);
		    formData.append("searchingWord", keepSearchingWord);
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
	
	// 좋아요 이미지 => 클릭
	$(".OHPhotoView-likeImage").click(function() {
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
					url: "OHPhotoLikeExecute",
					method: "post",
					dataType: "json",
					data: {
						// 전송할 데이터
						'memno' : memno,
						'pb_no' : clickedId
					},
					success: function(response) {
		                // 성공적으로 서버로부터 응답을 받았을 때 실행할 코드
		            	console.log("AJAX 요청 성공");
		                // 서버에서 받은 게시물의 좋아요 횟수, 변수에 저장
		                var responseLikeNumber = response.likeNumber;
		                // responseLikeNumber 변수, 콘솔 출력
		            	console.log("서버에서 받은 게시물의 좋아요 횟수: ", responseLikeNumber);
		            	// [중요] 선택자를 이용해 요소 지정할 때 id, class 순서로 지정한다. 그 반대는 선택하지 못한다.
		            	var likeNumberSelector = "#" + clickedId + ".OHPhotoView-likeNumber";
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
						'pb_no' : clickedId
					},
					success: function(response) {
		                // 성공적으로 서버로부터 응답을 받았을 때 실행할 코드
		            	console.log("AJAX 요청 성공");		
		                // 서버에서 받은 게시물의 좋아요 횟수, 변수에 저장
		                var responseLikeNumber = response.likeNumber;
		                // responseLikeNumber 변수, 콘솔 출력
		            	console.log("서버에서 받은 게시물의 좋아요 횟수: ", responseLikeNumber);
		            	// [중요] 선택자를 이용해 요소 지정할 때 id, class 순서로 지정한다. 그 반대는 선택하지 못한다.
		            	var likeNumberSelector = "#" + clickedId + ".OHPhotoView-likeNumber";
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
	$(".OHPhotoView-scrapImage").click(function() {
		// Login Check						
		if(memno !== null && memno !== "" && memno !== "/") {
			// 로그인 정보, 값 출력	
			console.log("memno: " + memno);
			// 클릭한 스크랩 요소의 id 값을 가져와 변수에 저장
			var clickedId = $(this).attr("id");
			// clickedId 변수에 저장된 id 값 출력
			console.log("clickedId: ", clickedId);
			// 클릭 => 스크랩 색상변경
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
						'pb_no' : clickedId
					},
					success: function(response) {
		                // 성공적으로 서버로부터 응답을 받았을 때 실행할 코드
		            	console.log("AJAX 요청 성공");
		                // 서버에서 받은 게시물의 스크랩 횟수, 변수에 저장
		                var responseScrapNumber = response.scrapNumber;
		                // responseScrapNumber 변수, 콘솔 출력
		            	console.log("서버에서 받은 게시물의 좋아요 횟수: ", responseScrapNumber);
		            	// [중요] 선택자를 이용해 요소 지정할 때 id, class 순서로 지정한다. 그 반대는 선택하지 못한다.
		            	var scrapNumberSelector = "#" + clickedId + ".OHPhotoView-scrapNumber";
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
						'pb_no' : clickedId
					},
					success: function(response) {
		                // 성공적으로 서버로부터 응답을 받았을 때 실행할 코드
		            	console.log("AJAX 요청 성공");		
		                // 서버에서 받은 게시물의 스크랩 횟수, 변수에 저장
		                var responseScrapNumber = response.scrapNumber;
		                // responseScrapNumber 변수, 콘솔 출력
		            	console.log("서버에서 받은 게시물의 좋아요 횟수: ", responseScrapNumber);
		            	// [중요] 선택자를 이용해 요소 지정할 때 id, class 순서로 지정한다. 그 반대는 선택하지 못한다.
		            	var scrapNumberSelector = "#" + clickedId + ".OHPhotoView-scrapNumber";
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
	
});			

function moveToPhotoDetailView(event) {

	// 정렬 정보, 변수 저장
	var keepOrderingBy = document.getElementById("keepOrderingBy").value;
	var keepOrderingMethod = document.getElementById("keepOrderingMethod").value;
	// 정렬 정보, 값 출력	
	console.log("keepOrderingBy: " + keepOrderingBy);
	console.log("keepOrderingMethod: " + keepOrderingMethod);
	
	// 필터 정보, 변수 저장
	var keepPb_residence = document.getElementById("keepPb_residence").value;
	var keepPb_room = document.getElementById("keepPb_room").value;
	var keepPb_style = document.getElementById("keepPb_style").value;
	var keepPb_skill = document.getElementById("keepPb_skill").value;
	// 필터 정보, 값 출력		
	console.log("keepPb_residence: " + keepPb_residence);
	console.log("keepPb_room: " + keepPb_room);
	console.log("keepPb_style: " + keepPb_style);
	console.log("keepPb_skill: " + keepPb_skill);
	
	// 검색 정보, 변수 저장	
	var keepSearchingType = document.getElementById("keepSearchingType").value;
	var keepSearchingWord = document.getElementById("keepSearchingWord").value;
	// 검색 정보, 값 출력	
	console.log("keepSearchingType: " + keepSearchingType);
	console.log("keepSearchingWord: " + keepSearchingWord);
	
	// 페이지 정보, 변수 저장	
	var pageSelectedNum = document.getElementById("pageSelectedNum").value;
	// 페이지 정보, 값 출력	
	console.log("pageSelectedNum: " + pageSelectedNum);
	
    // 클릭된 요소의 하위 태그를 찾음
    const clickedLink = event.currentTarget;
    // 클래스 이름으로 하위 태그 선택
    const childTag = clickedLink.querySelector('.OHPhotoViewPbNo'); 	
	
    // input 태그의 value 값을 콘솔에 출력
    const hiddenValue = childTag.value;    
    
    // 하위 태그의 값을 콘솔에 출력
    if (childTag) {
        console.log('하위 태그의 값:', hiddenValue);
    }
    
    const photoDetailViewURL = "OHPhotoDetailView";
    
    const formData = new FormData();
    formData.append("pb_no", hiddenValue);
    formData.append("orderingBy", keepOrderingBy);
    formData.append("orderingMethod", keepOrderingMethod);
    formData.append("pb_residence", keepPb_residence);
    formData.append("pb_room", keepPb_room);
    formData.append("pb_style", keepPb_style);
    formData.append("pb_skill", keepPb_skill);
    formData.append("searchingType", keepSearchingType);
    formData.append("searchingWord", keepSearchingWord);
    formData.append("pageSelectedNum", pageSelectedNum);
    
    // 동적으로 폼 생성
    const form = document.createElement('form');

    // 폼 속성 설정
    form.action = photoDetailViewURL;
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

function moveToPhotoDetailViewReply(event) {

	// 정렬 정보, 변수 저장
	var keepOrderingBy = document.getElementById("keepOrderingBy").value;
	var keepOrderingMethod = document.getElementById("keepOrderingMethod").value;
	// 정렬 정보, 값 출력	
	console.log("keepOrderingBy: " + keepOrderingBy);
	console.log("keepOrderingMethod: " + keepOrderingMethod);
	
	// 필터 정보, 변수 저장
	var keepPb_residence = document.getElementById("keepPb_residence").value;
	var keepPb_room = document.getElementById("keepPb_room").value;
	var keepPb_style = document.getElementById("keepPb_style").value;
	var keepPb_skill = document.getElementById("keepPb_skill").value;
	// 필터 정보, 값 출력		
	console.log("keepPb_residence: " + keepPb_residence);
	console.log("keepPb_room: " + keepPb_room);
	console.log("keepPb_style: " + keepPb_style);
	console.log("keepPb_skill: " + keepPb_skill);
	
	// 검색 정보, 변수 저장	
	var keepSearchingType = document.getElementById("keepSearchingType").value;
	var keepSearchingWord = document.getElementById("keepSearchingWord").value;
	// 검색 정보, 값 출력	
	console.log("keepSearchingType: " + keepSearchingType);
	console.log("keepSearchingWord: " + keepSearchingWord);
	
	// 페이지 정보, 변수 저장	
	var pageSelectedNum = document.getElementById("pageSelectedNum").value;
	// 페이지 정보, 값 출력	
	console.log("pageSelectedNum: " + pageSelectedNum);
	
    // 클릭된 요소의 하위 태그를 찾음
    const clickedLink = event.currentTarget;
    // 클래스 이름으로 하위 태그 선택
    const childTag = clickedLink.querySelector('.OHPhotoViewPbNo'); 	
	
    // input 태그의 value 값을 콘솔에 출력
    const hiddenValue = childTag.value;    
    
    // 하위 태그의 값을 콘솔에 출력
    if (childTag) {
        console.log('하위 태그의 값:', hiddenValue);
    }
    
    const photoDetailViewURL = "OHPhotoDetailView?s=OHPhotoDetailView-main-8";
    
    const formData = new FormData();
    formData.append("pb_no", hiddenValue);
    formData.append("orderingBy", keepOrderingBy);
    formData.append("orderingMethod", keepOrderingMethod);
    formData.append("pb_residence", keepPb_residence);
    formData.append("pb_room", keepPb_room);
    formData.append("pb_style", keepPb_style);
    formData.append("pb_skill", keepPb_skill);
    formData.append("searchingType", keepSearchingType);
    formData.append("searchingWord", keepSearchingWord);
    formData.append("pageSelectedNum", pageSelectedNum);
    
    // 동적으로 폼 생성
    const form = document.createElement('form');

    // 폼 속성 설정
    form.action = photoDetailViewURL;
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

// 처음 페이지로 이동하는 함수
function firstPage(num) {
		var pageNum = num
		var inputHidden = $('<input>', {
		type: 'hidden',
		name: 'pageSelectedNum',
		value: pageNum
	}); 
	$("#transPage").after(inputHidden);
	document.getElementById("pageForm").submit();
};			

// 이전 페이지로 이동하는 함수
function beforePage(num) {
		var pageNum = num
		var inputHidden = $('<input>', {
		type: 'hidden',
		name: 'pageSelectedNum',
		value: pageNum
	}); 
	$("#transPage").after(inputHidden);
	document.getElementById("pageForm").submit();
};		

// 원하는 페이지로 이동하는 함수
function movePage(num) {
	var pageNum = num
	var inputHidden = $('<input>', {
		type: 'hidden',
		name: 'pageSelectedNum',
		value: pageNum
	});
	$("#transPage").after(inputHidden);
	document.getElementById("pageForm").submit();
}

// 다음 페이지로 이동하는 함수
function nextPage(num) {
		var pageNum = num
		var inputHidden = $('<input>', {
		type: 'hidden',
		name: 'pageSelectedNum',
		value: pageNum
	}); 
	$("#transPage").after(inputHidden);
	document.getElementById("pageForm").submit();
};

// 마지막 페이지로 이동하는 함수
function lastPage(num) {
		var pageNum = num
		var inputHidden = $('<input>', {
		type: 'hidden',
		name: 'pageSelectedNum',
		value: pageNum
	}); 
	$("#transPage").after(inputHidden);
	document.getElementById("pageForm").submit();
};	
	
