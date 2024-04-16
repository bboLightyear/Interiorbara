<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file ="header.jsp" %>
<script>
document.title = "Interior";
</script>
<script defer src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script defer src="${path}/resources/js/my/myinteriorchart.js"></script>
<main class="Site-content" style="margin-top:10px;">
	<div class="mypage_category">
        <div class="mypage_category_list list_1"><a href="#">프로필</a></div>
	    <div class="mypage_category_list list_2"><a href="interiorestimate">견적</a></div> <br />
    </div>
    <div class="mypage_category">
        <div class="mypage_category_list list_1_1"><a href="#">모두보기</a></div>
	    <!-- <div class="mypage_category_list list_1_2">내시공사례</div> -->
        <!-- <div class="mypage_category_list list_1_3">질문과답변</div> -->
        <div class="mypage_category_list list_1_2"><a href="interiorinfoedit">회원정보수정</a></div>
        <div class="mypage_category_list list_1_3"><a href="interiorpasswordedit">비밀번호변경</a></div>
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
        	<li class="fl tc w150">${loginUserDto.nickname}님</li>
        </ul>
        <ul class="board">
        	<li class="fl tc w150">인테리어 업체번호 ${loginUserDto.myinteriordto.inteno }번님</li>
        </ul>
        
    </div>
    
    <div class="interior_container">
		<div class="row">
			<div class="col-md-6">
				<canvas id="myChart1"></canvas>
			</div>
			<%-- <div class="col-md-6">
				<canvas id="myChart2"></canvas>
			</div> --%>
		</div>
	</div>
	</div>
</main>
<%@include file ="footer.jsp" %>