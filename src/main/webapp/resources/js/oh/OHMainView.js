/**
 * 
 */

// jQuery를 사용하여 문서가 준비되었을 때 실행되는 함수
$(document).ready(function() {
	
	console.log("OHMainView.jsp is ready!");
	
	var memno = document.getElementById("memno").value;
	var nickname = document.getElementById("nickname").value;
	
	console.log("memno: " + memno);
	console.log("nickname: " + nickname);
	
	// 글쓰기 버튼 - Click
	$("#OHMainView-toWriteButtton").click(function() {
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
	
	// 집사진 버튼 - Click 
	$("#OHMainView-toOHPhotoViewButton").click(function() {
		window.location.href = "OHPhotoView";
	});
	
	// 더보기 버튼 - Click
	$("#OHMainView-toMoreOHPhotoViewButton").click(function() {
		window.location.href = "OHPhotoView";
	});
	
});




