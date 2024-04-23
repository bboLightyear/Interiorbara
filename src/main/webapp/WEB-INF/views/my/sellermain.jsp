<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file ="header.jsp" %>
<script>
document.title = "판매자 마이페이지";
</script>
<script defer src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script defer src="${path}/resources/js/my/mysellerchart.js"></script>
<main class="Site-content" style="margin-top:10px;">
	<!-- <div class="mypage_category">
        <div class="mypage_category_list list_1"><a href="#">프로필</a></div>
	    <div class="mypage_category_list list_2"><a href="sellersale">판매</a></div> <br />
    </div> -->
    <div class="mypage_category">
        <div class="mypage_category_list list_1_1 pointcolor">프로필</div>
	    <div class="mypage_category_list list_1_2"><a href="sellerinfoedit">회원정보수정</a></div>
        <div class="mypage_category_list list_1_3"><a href="sellerpasswordedit">비밀번호변경</a></div>
    </div>
    <div class="mypage_area">
    <div id="mypage_profile">
    	<ul class="board">
    		<li class="fl tc box w150">
    			<c:if test="${empty loginUserDto.profileimg}" >
	            <img class="profile" src="../resources/img/my/user.png" id="profileimg">
	        </c:if>
	        <%-- 프로필 이미지가 있으면 있는 이미지 --%>
	        <c:if test="${!empty loginUserDto.profileimg}" >
	            <img class="profile" src="../resources/upload/my/${loginUserDto.profileimg}" id="profileimg">
	        </c:if>	
    			<%-- <img class="profile" src="../resources/upload/my/${loginUserDto.profileimg}" alt=""> --%>
    		</li>
    	</ul>
        <ul class="board">
        	<li class="fl tc w150"><b>${loginUserDto.nickname}</b>님</li>
        </ul>
        <ul class="board">
        	<li class="fl tc w150">판매자회원번호 ${loginUserDto.mysellerdto.sellerno}번 님</li>
        </ul>
   
    </div>
    <div class="company_container">
		<div class="row">
			<!-- <div class="col-md-6">
				<canvas id="myChart1"></canvas>
			</div> -->
			<%-- <div class="col-md-6">
				<canvas id="myChart2"></canvas>
			</div> --%>
		</div>
	</div>    
    </div>
    
</main>    
<%@include file ="footer.jsp" %>