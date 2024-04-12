/**
 * 
 */

// jQuery를 사용하여 문서가 준비되었을 때 실행되는 함수
$(document).ready(function() {
	console.log("OHPhotoEditView.jsp is ready!");
	
	// 취소하기 버튼
	$("#OHPhotoEditView-cancelPostButton").click(function() {
		// 이전 페이지의 URI 정보
		const before = document.referrer;
		// 이전 페이지로 이동
		window.location.href = before;
	});
	
	// 파일 업로드 input 요소 선택
	var fileInput = document.getElementById("OHPhotoEditView-fileUploadInput");	
	
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
	var fileUploadInput = document.getElementById("OHPhotoEditView-fileUploadInput");
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
