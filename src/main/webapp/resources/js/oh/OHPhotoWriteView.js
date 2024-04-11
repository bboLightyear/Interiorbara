/**
 * 
 */


// jQuery를 사용하여 문서가 준비되었을 때 실행되는 함수
$(document).ready(function() {
	console.log("OHPhotoWriteView.jsp is ready!");

	// 취소하기 버튼
	$("#OHPhotoWriteView-cancelPostButton").click(function() {
		// 이전 페이지의 URI 정보
		const before = document.referrer;
		// 이전 페이지로 이동
		window.location.href = before;
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
		console.log("사진파일 검증 - X")
        return false;	
	} else {
		console.log("제목, 내용, 사진파일 개수 - successful verification");
	}
	
	// 사진파일 - 허용할 확장자 목록
	var allowedExtensions = ["jpg", "jpeg", "png", "gif"];
    console.log("확장자 검사 " + allowedExtensions)
	
	// 파일의 확장자를 확인하여 허용되는 확장자인지 검사
	for(var i = 0; i < files.length; i++) {
		var fileExtension = files[i].name.split(".").pop().toLowerCase();
		if (allowedExtensions.indexOf(fileExtension) === -1) {
			alert("jpg, jpeg, png, gif 확장자만 허용됩니다.");
			console.log(files[i].name + " - failed verification")
			// 파일 입력값 초기화
			fileUploadInput.value = "";
			return false;
		} else {
			console.log(files[i].name + " - successful verification")
		}
	}
	return true;
}