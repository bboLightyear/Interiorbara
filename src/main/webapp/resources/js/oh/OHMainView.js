/**
 * 
 */

// jQuery를 사용하여 문서가 준비되었을 때 실행되는 함수
$(document).ready(function() {
	
	console.log("OHMainView.jsp is ready!");
	
	var memno = document.getElementById("memno").value;
	
	console.log("memno: " + memno);
	
	// 글쓰기 버튼 - Click
	$("#OHMainView-toWriteButton").click(function() {
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
	
	// 집사진 - 최신순으로 보기!
	$("#OHMainView-2toOHPhotoViewButton").click(function() {
		window.location.href = "OHPhotoView?orderingBy=" + "pb_date" + "&orderingMethod=" + "desc";
	});
	
	// 더보기 - 최신순
	$("#OHMainView-2toMoreOHPhotoViewButton").click(function() {
		window.location.href = "OHPhotoView?orderingBy=" + "pb_date" + "&orderingMethod=" + "desc";
	});
	
	// 집사진 - 인기순으로 보기!
	$("#OHMainView-4toOHPhotoViewButton").click(function() {
		window.location.href = "OHPhotoView?orderingBy=" + "pb_like" + "&orderingMethod=" + "desc";
	});
	
	// 더보기 - 인기순
	$("#OHMainView-4toMoreOHPhotoViewButton").click(function() {
		window.location.href = "OHPhotoView?orderingBy=" + "pb_like" + "&orderingMethod=" + "desc";
	});	
	
	// 집사진 - 조회순으로 보기!
	$("#OHMainView-6toOHPhotoViewButton").click(function() {
		window.location.href = "OHPhotoView?orderingBy=" + "pb_hit" + "&orderingMethod=" + "desc";
	});
	
	// 더보기 - 조회순
	$("#OHMainView-6toMoreOHPhotoViewButton").click(function() {
		window.location.href = "OHPhotoView?orderingBy=" + "pb_hit" + "&orderingMethod=" + "desc";
	});	
	
});




