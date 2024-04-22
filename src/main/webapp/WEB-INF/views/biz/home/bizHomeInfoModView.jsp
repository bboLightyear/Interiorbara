<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script>
$(document).ready(function(){
	var bh_profromDb = '${bizHome.bh_pro }';
	var bh_proFromPage = document.getElementsByName("bh_pro");
	for(var i=0; i<bh_proFromPage.length; i++) {	
		if(bh_profromDb==bh_proFromPage[i].value){
			bh_proFromPage[i].checked = true;				    	
	    }
	 }
});

$(document).ready(function(){
    // 문서 로드 시 배경색이 자동으로 변경되도록 설정
    changeBackgroundColor('#f9fafb'); // 변경할 배경색
});

// 특정 div의 배경색을 변경하는 함수
function changeBackgroundColor(color) {
    $('.listEnd').css('background-color', color);
}
</script>
</script>

<meta charset="UTF-8">
<title>업체 HOME</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@5.3.3/dist/zephyr/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<%@include file ="../bizHeader.jsp" %>
<link rel="stylesheet" href="${path}/resources/css/biz/biz.css"/>
<link  rel="stylesheet"
  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>
  	<style>
	 .fa-solid{
	 	color: #1034a6;
	 }
	 .fa-solid:hover{
	 	color: #1e90ff;
	 } 
	 a {
	   text-decoration: none;
	   color: #1a1f27;
	}
	
	#topBtn{
   	position: fixed;
  	 right: 4%;
   	bottom: 5%;
   	display: none;
   	/* z-index: 9999; */
	}	
	</style>
</head>
<body>


	<form action="bizHomeInfoMod" method="post" enctype="multipart/form-data">
	<input type="hidden" name="inteno" value="${inteno }" />  <!-- 딱히 방법 없을 때 숨겨서 가져오는 법 -->
	<input type="hidden" name="bh_no" value="${bizHome.bh_no }" />  <!-- 딱히 방법 없을 때 숨겨서 가져오는 법 -->
	  <fieldset>
			<div class="pt-3 bg-light bg-opacity-75">
					<div class="d-flex justify-content-center">
						<div class="px-3" onclick="location.href='bizHome?inteno=${bizHome.inteno}'" style="width: 750px; cursor:pointer;" >
									<ul class="list-inline">
										<li class="list-inline-item">
											<h4><span style="--bs-text-opacity: 1; background-color: #1034a6; padding: 3px; !important;">
										    	<strong style="color: white;">정보 수정</strong>
										   	</span></h4>
										</li>
										<li class="list-inline-item">
												<small class="text-body-secondary">업체 정보를 수정할까요?</small>
										</li>
									</ul>	
						</div>
						<div class="d-flex align-items-end mb-4" onclick="location.href='/ibara/biz/home/bizHome?inteno=${bizHome.inteno}'">
							<span class="text-body-secondary" style="font-size: 12px; cursor:pointer;">홈으로 <i class="fa-solid fa-rotate-left" style="cursor:pointer;"></i></span>
						</div>
					</div>
			<div class="d-flex justify-content-center">
				<div class="px-3" style="width: 750px" >						
				    <div class="px-3 py-1">
				      <label for="headerImg" class="col-sm-2 col-form-label"><strong>헤더 이미지</strong></label>
				      <div class="px-3 py-1">
				      	<img id="headerImg" src="../../resources/upload/biz/home/${bizHome.bh_img }" width="100%" style="max-width: 750px">
						<input class="mt-4 form-control" type="file" name="fileNew"  />
						<input type="hidden" name="bh_img" value="${bizHome.bh_img }" />
				      	<small id="imgHelp" class="form-text text-muted">가로 700px, 세로 240px로 자동 조정됩니다.</small>						
				      </div>
				    </div>
				    <div class="px-3 py-1">
				      <label for="bh_name" class="form-label mt-4"><strong>업체명</strong></label>
				      <input type="text" class="form-control" name="bh_name" id="bh_name" value="${bizHome.bh_name }"  />
				      <small id="nameHelp" class="form-text text-muted">검색을 위해 정확한 업체명을 기입해 주세요.</small>				      
				    </div>
				    <div class="px-3 pt-4" style="font-size: 16px;"><strong>전문시공영역</strong></div>
				      <div class="form-check pb-1 pe-3 pt-1 ps-4">
				      	<input type="radio" name="bh_pro" value="마루"  />마루시공 <span style="width: 20px; color: transparent;">_</span>
						<input type="radio" name="bh_pro" value="도배·페인트"  />도배·페인트 <span style="width: 20px; color: transparent;">_</span>
						<input type="radio" name="bh_pro" value="장판·타일"  />장판·타일 <span style="width: 20px; color: transparent;">_</span>
						<input type="radio" name="bh_pro" value="욕실"  />욕실시공 <br />
						<input type="radio" name="bh_pro" value="주방"  />주방시공 <span style="width: 20px; color: transparent;">_</span>
						<input type="radio" name="bh_pro" value="문·샷시"  />문·샷시 <span style="width: 20px; color: transparent;">_____</span>
						<input type="radio" name="bh_pro" value="조명"  />조명시공 <span style="width: 20px; color: transparent;">__</span>
						<input type="radio" name="bh_pro" value="시트·필름"  />시트·필름 <br />
				     	 <small id="proHelp" class="form-text text-muted">선택 필수 사항입니다.</small>							
				     </div>
				    <div class="px-3 py-1">
				      <label for="sigungu" class="form-label mt-3"><strong>주소1 (시/군/구)</strong></label>
				      <input class="form-control" id="sigungu" type="text" name="bh_addr1" value="${bizHome.bh_addr1 }"  />
				      <small id="addr1Help" class="form-text text-muted">시/군/구만 정확하게 기입해 주세요. 주소로 검색 시 활용됩니다.</small>					      
				    </div>
				    <div class="px-3 py-1">
				      <label for="detailAddr" class="form-label mt-4"><strong>주소2 (상세주소)</strong></label>
				      <input class="form-control" id="detailAddr" type="text" name="bh_addr2" value="${bizHome.bh_addr2 }"  />
				      <small id="addr2Help" class="form-text text-muted">시/군/구를 제외한 상세주소를 기입해 주세요.</small>					      
				    </div>
				    <div class="px-3 py-1">
				      <label for="bh_notice" class="form-label mt-4"><strong>공지</strong></label>
				      		<textarea class="form-control" name="bh_notice" id="bh_notice" cols="35" rows="5">${bizHome.bh_notice }</textarea>
				      <small id="noticeHelp" class="form-text text-muted">홈 상단에 노출됩니다.</small>
				    </div>
				    <div class="px-3 py-1 pb-3">
				      <label for="bh_intro" class="form-label mt-4"><strong>소개글</strong></label>
				      		<textarea class="form-control"  name="bh_intro" id="bh_intro" cols="35" rows="5">${bizHome.bh_intro }</textarea>
				      <small id="noticeHelp" class="form-text text-muted">업체에 대한 자세한 소개; 홈 정보란에 노출됩니다.</small>
				    </div>
				    <div class="px-3 py-1">
					    <button type="submit" class="btn btn-primary">수정</button>
					    <%-- <button class="btn btn-primary" onclick="location.href='bizHome?inteno=${bizHome.inteno }">돌아가기</button> --%>
					 </div>
				</div>
			</div>		
		</div>	    
	  </fieldset>
	</form>
<div>
      <a id="topBtn" href="#"><img alt="" src="${path}/resources/img/my/fromtop.png"></a>      
      </div>

<script>
$(function() {
   // 보이기 | 숨기기
   $(window).scroll(function() {
      if ($(this).scrollTop() > 250) { //250 넘으면 버튼이 보여짐니다.
            $('#topBtn').fadeIn();
            } else {
            $('#topBtn').fadeOut();
      }
   });
   // 버튼 클릭시
   $("#topBtn").click(function() {   
   $('html, body').animate({
     scrollTop : 0    // 0 까지 animation 이동합니다.
    }, 400);          // 속도 400
    return false;
    });
  });
</script>
</body>
<%@include file ="../bizFooter.jsp" %>
</html>