<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업체 HOME</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@5.3.3/dist/zephyr/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
//footer가 위로 올라오는 것을 방지
	$(document).ready(function () {
		var seventyFivePercentHeight = window.innerHeight * 0.5;
		let changeHeight = document.querySelector('.changeHeight');
		var currentHeight = $('.changeHeight').height();
		console.log("currentHeight: "+currentHeight);
		console.log("seventyFivePercentHeight: "+seventyFivePercentHeight);		
		if(currentHeight<=seventyFivePercentHeight){
		$('.changeHeight').css('height', seventyFivePercentHeight);
		}
	});
</script>
<style>
	 a {
	   text-decoration: none;
	   color: #1a1f27;
	}
</style>
</head>
<body>
<div class="changeHeight">
	<div class="mb-4 d-flex justify-content-evenly">
		<div class="ps-2 pe-3 d-flex justify-content-evenly" style="width: 660px;">
			<div class="card" style="width: 100%; background-color: #e2f0fe; border:#f9fafb">
			  <div class="card-body">
			    <p class="card-text px-5 text-center" style="font-size: 14px;">${bizHome.bh_notice }</p>
			  </div>
			</div>
		</div>
	</div>

	<div class="d-flex justify-content-evenly">
		<div class="px-3 d-flex justify-content-evenly" style="width: 660px;">
			<div class="card" style="width: 100%; background-color: #f9fafb; border:#e2f0fe">
			  <div class="card-body">
			    <p class="card-text px-5 text-center" style="font-size: 14px;">${bizHome.bh_intro }</p>
			  </div>
			</div>
		</div>
	</div>
	
	<div class="d-flex justify-content-evenly">
		<div class="p-3 d-flex justify-content-end" style="width: 660px;">
			<button class="btn btn-outline-primary btn-sm w-10" onclick="location.href='bizHomeInfoModView?inteno=${inteno }'"><span style="font-size: 14px;">수정하기</span></button>
		</div>	
	</div>
</div>	
</body>
</html>