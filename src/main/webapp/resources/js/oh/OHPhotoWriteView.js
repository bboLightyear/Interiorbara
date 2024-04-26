/**
 * 
 */

// jQuery를 사용하여 문서가 준비되었을 때 실행되는 함수
$(document).ready(function() {
	console.log("OHPhotoWriteView.jsp is ready!");

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
	
	// 취소하기 버튼
	$("#OHPhotoWriteView-cancelPostButton").click(function() {
		// 이전 페이지의 URI 정보
		const before = document.referrer;
		
		console.log("before: " + before);		
		
		// 'oh/' 다음의 주소 추출
		const ohIndex = before.indexOf('oh/');
		
		console.log("ohIndex: " + ohIndex);
		
		var address = "";
		
		if (ohIndex !== -1) {
			// 'oh/' 다음의 부분을 추출
			const nextPath = before.substring(ohIndex + 'oh/'.length);
			  
			// 필요한 값을 변수에 담기
			address = nextPath;
			  
			// 출력 (테스트용)
			console.log('oh/ 다음의 주소:', address);
		}		
		
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
	
	// 파일 업로드 input 요소 선택
	var fileInput = document.getElementById("OHPhotoWriteView-fileUploadInput");	
	
	// 파일 이름의 최대 길이 제한 (원하는 길이로 설정)
	var maxLength = 25;
	// 파일 이름의 최소 길이 제한 (원하는 길이로 설정)
	var minLength = 1;
	// 파일 - 허용할 확장자 목록
	var allowedExtensions = ["jpg", "jpeg", "png", "gif"];		

	// 파일 업로드 시 검사
	fileInput.addEventListener("change", function() {
		var files = fileInput.files;

		// 파일명 저장 변수
		var file = null;

		// 파일명 길이 검증 결과 저장 변수
		var fileLengthFailed = "";

		// 파일명 확장자명 검증 결과 저장 변수
		var fileExtensionFailed = "";

		// 선택한 파일을 가져옵니다.
		for(var i = 0; i < files.length; i++) {
			file = files[i];
			
			// 파일이 존재할 때
			if(file) {
				// 전체 파일명 변수
				var fileFullName = file.name
				// 확장자명을 제거한 파일명 변수
				var fileName = file.name.slice(0, file.name.lastIndexOf("."));
				
				if(fileName.length > maxLength) {
					// 파일명의 길이가 기준을 벗어나는 경우
					fileLengthFailed += "파일명: " + fileFullName + " / 길이: " + fileName.length + "\n";
				} else if(fileName.length < minLength) {
					// 파일명의 길이가 기준을 벗어나는 경우
					fileLengthFailed += "파일명: " + fileFullName + " / 길이: " + fileName.length + "\n";
				};

				var fileExtension = file.name.split(".").pop().toLowerCase();
				
				if(allowedExtensions.indexOf(fileExtension) === -1) {
					fileExtensionFailed += "파일명: " + fileFullName + " / 확장자명: " + fileExtension + "\n";
				};
			};	
		};

		var fileUploadFailed = "";

		if(fileLengthFailed !== "") {
			fileUploadFailed += "***** 업로드 실패 - 파일명 길이 제한 ***** \n" 
								+ "***** 최소 " + minLength + "자 이상, 최대 " +	maxLength + "자 이하로 제한합니다. *****\n"
								+ fileLengthFailed;
		};

		if(fileExtensionFailed !== "") {
			fileUploadFailed += "***** 업로드 실패 - 파일 형식 제한 ***** \n" 
								+ "***** 파일형식은 jpg, jpeg, png, gif만 가능합니다. *****\n"
								+ fileExtensionFailed;
			
		}

		if(fileUploadFailed !== "") {
			alert(fileUploadFailed);
			// 파일 입력값 초기화
			fileInput.value = "";				
		}

	});		
});	

function validateForm() {
	// 게시글 제목
	var title = document.getElementById("layer1-title").value;
	console.log("title: " + title);
	// 게시글 내용
	var content = document.getElementById("layer2-content").value;
	console.log("content: " + content);
	// 게시글 업로드 할 사진파일
	var fileUploadInput = document.getElementById("OHPhotoWriteView-fileUploadInput");
	var files = fileUploadInput.files;
	console.log("files: " + files);
		
	// 필수 입력 값 확인 
	if(title == "") {
		alert("제목을 입력하세요.");
		console.log("제목 검증 - X")
        return false;		
	} else if(content == "") {
		alert("내용을 입력하세요.");
		console.log("내용 검증 - X")
        return false;		
	} else if(files.length < 1 || files.length > 10) {
		alert("파일 업로드는 1개 이상 10개 이하로 제한됩니다.");
		// 파일 입력값 초기화
		fileUploadInput.value = "";		
		console.log("사진파일 검증 - X")
        return false;	
	} else {
		console.log("제목, 내용, 사진파일 개수 - successful verification");
	}
	return true;
}
